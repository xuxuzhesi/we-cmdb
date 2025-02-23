const CompressionPlugin = require("compression-webpack-plugin");
module.exports = {
  devServer: {
    // hot: true,
    // inline: true,
    open: true,
    port: 3000,
    proxy: {
      "/process": {
        target: " http://localhost:9080"
      },
      "/admin": {
        target: " http://localhost:9080"
      },
      "/wecmdb": {
        target: "http://localhost:9080"
      },
      "/logout": {
        target: "http://localhost:9080"
      },
      "/plugin": {
        target: "http://localhost:9080"
      },
      "/artifact": {
        target: "http://localhost:9080"
      },
      "/batch-job": {
        target: "http://localhost:9080"
      }
    }
  },
  runtimeCompiler: true,
  publicPath: "/wecmdb/",
  chainWebpack: config => {
    if (process.env.PLUGIN === "plugin") {
      const img = config.module.rule("images");
      img.uses.clear();
      img
        .use("url-loader")
        .loader("url-loader")
        .options({ limit: 1000000 });

      const svg = config.module.rule("svg");
      svg.uses.clear();
      svg.uses.clear();
      svg
        .use("url-loader")
        .loader("url-loader")
        .options({ limit: 1000000 });
    } else {
      // remove the old loader
      const img = config.module.rule("images");
      img.uses.clear();
      // add the new one
      img
        .use("file-loader")
        .loader("file-loader")
        .options({
          outputPath: "img"
        });
    }

    config.when(process.env.PLUGIN === "plugin", config => {
      config
        .entry("app")
        .clear()
        .add("./src/main-plugin.js"); //作为插件时
    });
    config.when(!process.env.PLUGIN, config => {
      config
        .entry("app")
        .clear()
        .add("./src/main.js"); //独立运行时
    });
  },
  productionSourceMap: process.env.PLUGIN !== "plugin",
  configureWebpack: config => {
    if (process.env.PLUGIN === "plugin") {
      return;
    }
    if (process.env.NODE_ENV === "production") {
      return {
        plugins: [
          new CompressionPlugin({
            algorithm: "gzip",
            test: /\.js$|\.html$|.\css/, //匹配文件名
            threshold: 10240, //对超过10k的数据压缩
            deleteOriginalAssets: false //不删除源文件
          })
        ]
      };
    }
  }
};
