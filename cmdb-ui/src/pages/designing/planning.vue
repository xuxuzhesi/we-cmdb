<template>
  <div>
    <Row class="resource-design-select-row">
      <span>{{ $t("select_idc") }}：</span>
      <Select
        :placeholder="$t('select_idc')"
        v-model="selectedIdc"
        class="graph-select"
        @on-change="onIdcDataChange"
      >
        <Option v-for="item in allIdcs" :value="item.guid" :key="item.guid">
          {{ item.name }}
        </Option>
      </Select>
    </Row>
    <Row class="resource-design-tab-row">
      <Spin fix v-if="spinShow">
        <Icon type="ios-loading" size="44" class="spin-icon-load"></Icon>
        <div>{{ $t("loading") }}</div>
      </Spin>
      <Tabs
        v-if="idcDesignData"
        type="card"
        :value="currentTab"
        :closable="false"
        @on-click="handleTabClick"
      >
        <TabPane :label="$t('planning_design_diagram')" name="resource-design">
          <Alert show-icon closable v-if="isDataChanged">
            Data has beed changed, click Reload button to reload graph.
            <Button slot="desc" @click="reloadHandler">Reload</Button>
          </Alert>
          <div class="graph-container-big" id="graph"></div>
        </TabPane>
        <TabPane
          v-for="ci in tabList"
          :key="ci.id"
          :name="ci.id"
          :label="ci.name"
        >
          <WeCMDBTable
            :tableData="ci.tableData"
            :tableOuterActions="ci.outerActions"
            :tableInnerActions="ci.innerActions"
            :tableColumns="ci.tableColumns"
            :pagination="ci.pagination"
            :ascOptions="ci.ascOptions"
            :showCheckbox="needCheckout"
            :isRefreshable="true"
            @actionFun="actionFun"
            @sortHandler="sortHandler"
            @handleSubmit="handleSubmit"
            @getSelectedRows="onSelectedRowsChange"
            @pageChange="pageChange"
            @pageSizeChange="pageSizeChange"
            tableHeight="650"
            :ref="'table' + ci.id"
          ></WeCMDBTable>
        </TabPane>
      </Tabs>
    </Row>
  </div>
</template>

<script>
import * as d3 from "d3-selection";
import * as d3Graphviz from "d3-graphviz";
import {
  getPlanningDesignsCiData,
  getCiTypeAttributes,
  deleteCiDatas,
  createCiDatas,
  updateCiDatas,
  getEnumCodesByCategoryId,
  getPlanningDesignTabs,
  getAllIdcDesignData,
  getIdcDesignTreeByGuid,
  getAllZoneLinkDesignGroupByIdcDesign,
  operateCiState
} from "@/api/server";
import {
  outerActions,
  innerActions,
  pagination,
  components
} from "@/const/actions.js";

import { formatData } from "../util/format.js";
import { getExtraInnerActions } from "../util/state-operations.js";

const colors = [
  "#bbdefb",
  "#90caf9",
  "#64b5f6",
  "#42a5f5",
  "#2196f3",
  "#1e88e5",
  "#1976d2"
];

export default {
  data() {
    return {
      allIdcs: [],
      selectedIdc: "",
      tabList: [],
      payload: {
        filters: [],
        pageable: {
          pageSize: 10,
          startIndex: 0
        },
        paging: true
      },
      graph: new Map(),
      graphBig: "",
      idcDesignData: null,
      zoneLinkDesignData: new Map(),
      currentTab: "resource-design",
      currentGraph: "",
      spinShow: false,
      isDataChanged: false
    };
  },
  computed: {
    tableRef() {
      return "table" + this.currentTab;
    },
    needCheckout() {
      return this.$route.name === "ciDataEnquiry" ? false : true;
    }
  },
  methods: {
    async onIdcDataChange(guid) {
      this.handleTabClick(this.currentTab);
      this.spinShow = true;
      const { data, message, status } = await getIdcDesignTreeByGuid([guid]);
      if (status === "OK") {
        this.idcDesignData = data[0];
        this.getZoneLink();
      }
    },
    async reloadHandler() {
      this.onIdcDataChange(this.selectedIdc);
      this.isDataChanged = false;
    },
    initGraph(filters = {}) {
      let graph;
      graph = d3.select("#graph");
      graph
        .on("dblclick.zoom", null)
        .on("wheel.zoom", null)
        .on("mousewheel.zoom", null);

      let graphZoom = graph
        .graphviz()
        .width(window.innerWidth * 0.96)
        .height(window.innerHeight * 1.2)
        .zoom(true);
      if (this.graph.has(this.idcDesignData.guid)) {
        this.graph[this.idcDesignData.guid] = graphZoom;
      } else {
        this.graph.set(this.idcDesignData.guid, graphZoom);
      }
      this.renderGraph(this.idcDesignData);
      this.spinShow = false;
    },
    genDOT(idcData, linkData) {
      let children = idcData.children || [];
      let links = linkData || [];
      let fsize = 16;
      let width = 16;
      let height = 12;
      let dots = [
        "digraph G {",
        "rankdir=TB nodesep=0.5;",
        `node [shape="box", fontsize="${fsize}", labelloc="t", penwidth="2"];`,
        `subgraph cluster_${idcData.data.guid} {`,
        `style="filled";color="${colors[0]}";`,
        `label="${idcData.data.name ||
          idcData.data.description ||
          idcData.data.code}";`,
        `size="${width},${height}";`,
        this.genChildren(idcData),
        this.genLink(links),
        "}}"
      ];
      return dots.join("");
    },
    genChildren(idcData) {
      const width = 16;
      const height = 12;
      let dots = [];
      const children = idcData.children || [];
      let layers = new Map();
      children.forEach(zone => {
        if (layers.has(zone.data.zone_layer.value)) {
          layers.get(zone.data.zone_layer.value).push(zone);
        } else {
          let layer = [];
          layer.push(zone);
          layers.set(zone.data.zone_layer.value, layer);
        }
      });
      if (layers.size) {
        layers.forEach(layer => {
          dots.push('{rank = "same";');
          let n = layers.size;
          let lg = (height - 3) / n;
          let ll = (width - 0.5 * layer.length) / layer.length;
          layer.forEach(zone => {
            let label;
            if (
              zone.data.code &&
              zone.data.code !== null &&
              zone.data.code !== ""
            ) {
              label = zone.data.code;
            } else {
              label = zone.data.key_name;
            }
            dots.push(
              `g_${zone.guid}[id="g_${
                zone.guid
              }", label="${label}", width=${ll},height=${lg}];`
            );
          });
          dots.push("}");
        });
      } else {
        dots.push(
          `g_${idcData.data.guid}[label=" ";color="${
            colors[0]
          }";width="${width - 0.5}";height="${height - 3}"]`
        );
      }
      return dots.join("");
    },
    genLink(links) {
      let result = "";
      links.forEach(link => {
        result += `${link.azone}->${link.bzone}[arrowhead="none"];`;
      });
      return result;
    },
    renderGraph(idcData) {
      let nodesString = this.genDOT(
        idcData,
        this.zoneLinkDesignData.get(idcData.guid)
      );
      this.graph.get(idcData.guid).renderDot(nodesString);
      let fsize = 16;
      let divWidth = window.innerWidth,
        divHeight = window.innerHeight;
      let children = idcData.children || [];
      let svg = d3.select("#graph").select("svg");
      svg.attr("width", divWidth).attr("height", divHeight);
      svg.attr("viewBox", "0 0 " + divWidth + " " + divHeight);

      children.forEach(zone => {
        d3.select(`#g_${zone.guid}`)
          .select("polygon")
          .attr("fill", colors[0]);
        if (Array.isArray(zone.children)) {
          let points = d3
            .select("#g_" + zone.guid)
            .select("polygon")
            .attr("points")
            .split(" ");
          let p = {
            x: parseInt(points[1].split(",")[0]),
            y: parseInt(points[1].split(",")[1])
          };
          let pw = parseInt(points[0].split(",")[0] - points[1].split(",")[0]);
          let ph = parseInt(points[2].split(",")[1] - points[1].split(",")[1]);
          this.setChildren(zone, p, pw, ph, fsize, 1, idcData.guid);
        }
      });
    },
    setChildren(node, p1, pw, ph, tfsize, deep, idcName) {
      let graph;
      if (idcName === "graphBig") {
        graph = d3.select("#graphBig").select("#g_" + node.guid);
      } else {
        graph = d3.select("#graph").select("#g_" + node.guid);
      }
      let n = node.children.length;
      let w, h, mgap, fontsize, strokewidth;
      let rx, ry, tx, ty, g;
      let color = colors[deep];
      if (pw > ph * 1.2) {
        if (pw / n > ph - tfsize) {
          mgap = (ph - tfsize) * 0.04;
          fontsize =
            tfsize * 0.8 > (ph - tfsize) * 0.1
              ? (ph - tfsize) * 0.1
              : tfsize * 0.8;
          strokewidth = (ph - tfsize) * 0.005;
        } else {
          mgap = (pw / n) * 0.04;
          fontsize =
            tfsize * 0.8 > (pw / n) * 0.1 ? (pw / n) * 0.1 : tfsize * 0.8;
          strokewidth = (pw / n) * 0.005;
        }
        w = (pw - mgap) / n - mgap;
        h = ph - tfsize - 2 * mgap;
        for (var i = 0; i < n; i++) {
          rx = p1.x + (w + mgap) * i + mgap;
          ry = p1.y + tfsize + mgap;
          tx = p1.x + (w + mgap) * i + w * 0.5 + mgap;
          if (Array.isArray(node.children[i].children)) {
            ty = p1.y + tfsize + mgap + fontsize;
          } else {
            ty = p1.y + tfsize + mgap + h * 0.5;
          }

          g = graph
            .append("g")
            .attr("class", "node")
            .attr("id", "g_" + node.children[i].guid);
          g.append("rect")
            .attr("x", rx)
            .attr("y", ry)
            .attr("width", w)
            .attr("height", h)
            .attr("stroke", "black")
            .attr("fill", color)
            .attr("stroke-width", strokewidth);
          g.append("text")
            .attr("x", tx)
            .attr("y", ty)
            .text(
              node.children[i].data.code
                ? node.children[i].data.code
                : node.children[i].data.key_name
            )
            .attr("style", "text-anchor:middle")
            .attr("font-size", fontsize);
          if (Array.isArray(node.children[i].children)) {
            this.setChildren(
              node.children[i],
              { x: rx, y: ry },
              w,
              h,
              fontsize,
              deep + 1,
              idcName
            );
          }
        }
      } else {
        if ((ph - tfsize) / n > pw) {
          mgap = pw * 0.04;
          fontsize = tfsize * 0.8 > pw * 0.1 ? pw * 0.1 : tfsize * 0.8;
          strokewidth = pw * 0.005;
        } else {
          mgap = ((ph - tfsize) / n) * 0.04;
          fontsize =
            tfsize * 0.8 > ((ph - tfsize) / n) * 0.1
              ? ((ph - tfsize) / n) * 0.1
              : tfsize * 0.8;
          strokewidth = ((ph - tfsize) / n) * 0.005;
        }

        w = pw - 2 * mgap;
        h = (ph - tfsize - mgap) / n - mgap;
        for (var i = 0; i < n; i++) {
          rx = p1.x + mgap;
          ry = p1.y + tfsize + (h + mgap) * i + mgap;
          tx = p1.x + w * 0.5 + mgap;
          if (Array.isArray(node.children[i].children)) {
            ty = p1.y + tfsize + (h + mgap) * i + fontsize + mgap;
          } else {
            ty = p1.y + tfsize + (h + mgap) * i + h * 0.5 + mgap;
          }

          g = graph
            .append("g")
            .attr("class", "node")
            .attr("id", "g_" + node.children[i].guid);
          g.append("rect")
            .attr("x", rx)
            .attr("y", ry)
            .attr("width", w)
            .attr("height", h)
            .attr("stroke", "black")
            .attr("fill", color)
            .attr("stroke-width", strokewidth);
          g.append("text")
            .attr("x", tx)
            .attr("y", ty)
            .text(
              node.children[i].data.code
                ? node.children[i].data.code
                : node.children[i].data.key_name
            )
            .attr("style", "text-anchor:middle")
            .attr("font-size", fontsize);
          if (Array.isArray(node.children[i].children)) {
            this.setChildren(
              node.children[i],
              { x: rx, y: ry },
              w,
              h,
              fontsize,
              deep + 1,
              idcName
            );
          }
        }
      }
    },
    handleTabClick(name) {
      this.payload.filters = [];
      this.currentTab = name;
      if (this.currentTab !== "resource-design") {
        this.getCurrentData();
      }
    },
    setCurrentGraph(name) {
      this.currentGraph = name;
    },
    onSelectedRowsChange(rows, checkoutBoxdisable) {
      if (rows.length > 0) {
        this.tabList.forEach(ci => {
          if (ci.id === this.currentTab) {
            ci.outerActions.forEach(_ => {
              _.props.disabled = _.actionType === "add";
            });
          }
        });
      } else {
        this.tabList.forEach(ci => {
          if (ci.id === this.currentTab) {
            ci.outerActions.forEach(_ => {
              _.props.disabled = !(
                _.actionType === "add" ||
                _.actionType === "export" ||
                _.actionType === "cancel"
              );
            });
          }
        });
      }
    },
    actionFun(type, data) {
      switch (type) {
        case "export":
          this.exportHandler();
          break;
        case "add":
          this.addHandler();
          break;
        case "edit":
          this.editHandler();
          break;
        case "save":
          this.saveHandler(data);
          break;
        case "delete":
          this.deleteHandler(data);
          break;
        case "cancel":
          this.cancelHandler();
          break;
        case "innerCancel":
          this.$refs[this.tableRef][0].rowCancelHandler(data.weTableRowId);
          break;
        default:
          this.defaultHandler(type, data);
          break;
      }
    },
    async defaultHandler(type, row) {
      const { data, status, message } = await operateCiState(
        this.currentTab,
        row.guid,
        type
      );
      if (status === "OK") {
        this.$Notice.success({
          title: type,
          desc: message
        });
        this.queryCiData();
      }
    },
    sortHandler(data) {
      if (data.order === "normal") {
        delete this.payload.sorting;
      } else {
        this.payload.sorting = {
          asc: data.order === "asc",
          field: data.key
        };
      }
      this.queryCiData();
    },

    handleSubmit(data) {
      this.payload.filters = data;
      this.queryCiData();
    },
    addHandler() {
      this.tabList.forEach(ci => {
        if (ci.id === this.currentTab) {
          let emptyRowData = {};
          ci.tableColumns.forEach(_ => {
            if (_.inputType === "multiSelect" || _.inputType === "multiRef") {
              emptyRowData[_.inputKey] = [];
            } else {
              emptyRowData[_.inputKey] = "";
            }
          });
          emptyRowData["isRowEditable"] = true;
          emptyRowData["isNewAddedRow"] = true;
          emptyRowData["weTableRowId"] = 1;
          emptyRowData["nextOperations"] = [];
          ci.tableData.unshift(emptyRowData);
          this.$nextTick(() => {
            this.$refs[this.tableRef][0].pushNewAddedRowToSelections();
            this.$refs[this.tableRef][0].setCheckoutStatus(true);
          });
          ci.outerActions.forEach(_ => {
            _.props.disabled = _.actionType === "add";
          });
        }
      });
    },
    cancelHandler() {
      this.$refs[this.tableRef][0].setAllRowsUneditable();
      this.$refs[this.tableRef][0].setCheckoutStatus();
      this.tabList.forEach(ci => {
        if (ci.id === this.currentTab) {
          ci.outerActions.forEach(_ => {
            _.props.disabled = !(
              _.actionType === "add" ||
              _.actionType === "export" ||
              _.actionType === "cancel"
            );
          });
        }
      });
    },
    deleteHandler(deleteData) {
      this.$Modal.confirm({
        title: this.$t("delete_confirm"),
        "z-index": 1000000,
        onOk: async () => {
          const payload = {
            id: this.currentTab,
            deleteData: deleteData.map(_ => _.guid)
          };
          const { status, message, data } = await deleteCiDatas(payload);
          if (status === "OK") {
            this.$Notice.success({
              title: "Delete data Success",
              desc: message
            });
            this.isDataChanged = true;
            this.tabList.forEach(ci => {
              if (ci.id === this.currentTab) {
                ci.outerActions.forEach(_ => {
                  _.props.disabled =
                    _.actionType === "save" ||
                    _.actionType === "edit" ||
                    _.actionType === "delete";
                });
              }
            });
            this.queryCiData();
          }
        },
        onCancel: () => {}
      });
      document.querySelector(".ivu-modal-mask").click();
    },
    editHandler() {
      this.$refs[this.tableRef][0].swapRowEditable(true);
      this.tabList.forEach(ci => {
        if (ci.id === this.currentTab) {
          ci.outerActions.forEach(_ => {
            if (_.actionType === "save") {
              _.props.disabled = false;
            }
          });
        }
      });
      this.$nextTick(() => {
        this.$refs[this.tableRef][0].setCheckoutStatus(true);
      });
    },
    deleteAttr() {
      let attrs = [];
      const found = this.tabList.find(_ => _.id === this.currentTab);
      found.tableColumns.forEach(i => {
        if (i.isAuto) {
          attrs.push(i.propertyName);
        }
      });
      return attrs;
    },
    async saveHandler(data) {
      let setBtnsStatus = () => {
        this.tabList.forEach(ci => {
          if (ci.id === this.currentTab) {
            ci.outerActions.forEach(_ => {
              _.props.disabled = !(
                _.actionType === "add" || _.actionType === "export"
              );
            });
          }
        });
        this.$refs[this.tableRef][0].setAllRowsUneditable();
        this.$nextTick(() => {
          /* to get iview original data to set _ischecked flag */
          let objData = this.$refs[this.tableRef][0].$refs.table.$refs.tbody
            .objData;
          for (let obj in objData) {
            objData[obj]._isChecked = false;
            objData[obj]._isDisabled = false;
          }
        });
      };
      let d = JSON.parse(JSON.stringify(data));
      let addAry = d.filter(_ => _.isNewAddedRow);
      let editAry = d.filter(_ => !_.isNewAddedRow);
      if (addAry.length > 0) {
        const deleteAttrs = this.deleteAttr();
        addAry.forEach(_ => {
          deleteAttrs.forEach(attr => {
            delete _[attr];
          });
          delete _.isRowEditable;
          delete _.weTableForm;
          delete _.weTableRowId;
          delete _.isNewAddedRow;
          delete _.nextOperations;
        });
        let payload = {
          id: this.currentTab,
          createData: addAry
        };
        const { status, message, data } = await createCiDatas(payload);
        if (status === "OK") {
          this.$Notice.success({
            title: "Add data Success",
            desc: message
          });
          this.isDataChanged = true;
          setBtnsStatus();
          this.queryCiData();
        }
      }
      if (editAry.length > 0) {
        editAry.forEach(_ => {
          delete _.isRowEditable;
          delete _.weTableForm;
          delete _.weTableRowId;
          delete _.isNewAddedRow;
          delete _.nextOperations;
        });
        let payload = {
          id: this.currentTab,
          updateData: editAry
        };
        const { status, message, data } = await updateCiDatas(payload);
        if (status === "OK") {
          this.$Notice.success({
            title: "Update data Success",
            desc: message
          });
          this.isDataChanged = true;
          setBtnsStatus();
          this.queryCiData();
        }
      }
    },
    async exportHandler() {
      const found = this.tabList.find(_ => _.code === this.currentTab);
      const { status, message, data } = await getPlanningDesignsCiData({
        idcGuid: this.selectedIdc,
        id: found.codeId,
        queryObject: this.payload
      });
      if (status === "OK") {
        this.$refs[this.tableRef][0].export({
          filename: "Ci Data",
          data: formatData(data.contents.map(_ => _.data))
        });
      }
    },
    pageChange(current) {
      this.tabList.forEach(ci => {
        if (ci.id === this.currentTab) {
          ci.pagination.currentPage = current;
        }
      });
      this.queryCiData();
    },
    pageSizeChange(size) {
      this.tabList.forEach(ci => {
        if (ci.id === this.currentTab) {
          ci.pagination.pageSize = size;
        }
      });
      this.queryCiData();
    },
    async queryCiData() {
      this.getAllIdcDesignData();
      this.payload.pageable.pageSize = 10;
      this.payload.pageable.startIndex = 0;
      this.tabList.forEach(ci => {
        if (ci.id === this.currentTab) {
          this.payload.pageable.pageSize = ci.pagination.pageSize;
          this.payload.pageable.startIndex =
            (ci.pagination.currentPage - 1) * ci.pagination.pageSize;
        }
      });
      const found = this.tabList.find(_ => _.code === this.currentTab);
      const { status, message, data } = await getPlanningDesignsCiData({
        idcGuid: this.selectedIdc,
        id: found.codeId,
        queryObject: this.payload
      });
      if (status === "OK") {
        this.tabList.forEach(ci => {
          if (ci.id === this.currentTab) {
            ci.tableData = data.contents.map(_ => {
              return {
                ..._.data,
                ..._.meta
              };
            });
            ci.pagination.total = data.pageInfo.totalRows;
          }
        });
      }
    },
    async queryCiAttrs(id) {
      const { status, message, data } = await getCiTypeAttributes(id);
      let columns = [];
      const disabledCol = [
        "created_date",
        "updated_date",
        "created_by",
        "updated_by",
        "key_name",
        "guid"
      ];
      if (status === "OK") {
        let columns = [];
        data.forEach(_ => {
          const disEditor = disabledCol.find(i => i === _.propertyName);
          let renderKey = _.propertyName;
          if (_.status !== "decommissioned" && _.status !== "notCreated") {
            columns.push({
              ..._,
              title: _.name,
              key: renderKey,
              inputKey: _.propertyName,
              inputType: _.inputType,
              referenceId: _.referenceId,
              disEditor: !_.isEditable,
              disAdded: !_.isEditable,
              placeholder: _.name,
              component: "Input",
              ciType: { id: _.referenceId, name: _.name },
              type: "text",
              ...components[_.inputType]
            });
          }
        });
        this.tabList.forEach(ci => {
          if (ci.id === this.currentTab) {
            ci.tableColumns = this.getSelectOptions(columns);
          }
        });
      }
    },
    getSelectOptions(columns) {
      columns.forEach(async _ => {
        if (_.inputType === "select") {
          const { status, message, data } = await getEnumCodesByCategoryId(
            0,
            _.referenceId
          );
          _["options"] = data
            .filter(j => j.status === "active")
            .map(i => {
              return {
                label: i.value,
                value: i.codeId
              };
            });
        }
      });
      return columns;
    },
    getCurrentData() {
      this.queryCiAttrs(this.currentTab);
      this.queryCiData();
    },
    async getZoneLink() {
      this.zoneLinkDesignData = new Map();
      const {
        status,
        message,
        data
      } = await getAllZoneLinkDesignGroupByIdcDesign();
      if (status === "OK") {
        const idcLink = data.find(_ => _.idcGuid === this.selectedIdc);
        if (idcLink && idcLink.linkList) {
          idcLink.linkList.forEach(_ => {
            let zoneLink = {};
            if (
              _.data.zone_design1.idc_design === this.selectedIdc &&
              _.data.zone_design2.idc_design === this.selectedIdc
            ) {
              zoneLink.azone = `g_${_.data.zone_design1.guid}`;
              zoneLink.bzone = `g_${_.data.zone_design2.guid}`;
              const guid = this.idcDesignData.data.guid;
              if (this.zoneLinkDesignData.has(guid)) {
                this.zoneLinkDesignData.get(guid).push(zoneLink);
              } else {
                this.zoneLinkDesignData.set(guid, [zoneLink]);
              }
            }
          });
        }
      }
      this.initGraph();
    },
    async getTabLists() {
      const { status, message, data } = await getPlanningDesignTabs();
      if (status === "OK") {
        let allInnerActions = await getExtraInnerActions();
        this.tabList = data.map(_ => {
          return {
            ..._,
            name: _.value,
            id: _.code,
            tableData: [],
            tableColumns: [],
            outerActions: JSON.parse(JSON.stringify(outerActions)),
            innerActions: JSON.parse(
              JSON.stringify(innerActions.concat(allInnerActions))
            ),
            pagination: JSON.parse(JSON.stringify(pagination)),
            ascOptions: {}
          };
        });
        this.tabList = this.tabList.filter(tab => tab);
      }
    },
    async getAllIdcDesignData() {
      const { status, message, data } = await getAllIdcDesignData();
      if (status === "OK") {
        this.allIdcs = data.map(_ => _.data);
      }
    }
  },
  mounted() {
    this.getTabLists();
    this.getAllIdcDesignData();
  }
};
</script>

<style lang="scss" scoped>
.resource-design-select-row {
  margin-bottom: 10px;
  display: flex;
  align-items: center;
}
.resource-design-tab-row {
  min-height: 50vh;
}
.graph-select {
  width: 400px;
}
.ivu-card-head p {
  height: 30px;
  line-height: 30px;
}
.filter-title {
  margin-right: 10px;
}
.graph-list {
  overflow-x: scroll;
  display: flex;
}
.graph-list > div {
  cursor: pointer;
}
.graph-container {
  width: 160px;
  height: 120px;
  float: left;
  margin-right: 5px;
  text-align: center;
}
.graph-container-big {
  margin-top: 20px;
}
</style>
