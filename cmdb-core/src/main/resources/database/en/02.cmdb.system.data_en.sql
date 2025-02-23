SET FOREIGN_KEY_CHECKS=0;
INSERT INTO `adm_basekey_cat` (`id_adm_basekey_cat`, `cat_name`, `description`, `id_adm_role`, `id_adm_basekey_cat_type`, `group_type_id`) VALUES
	(1, 'ci_layer', 'Layer', NULL, 1, NULL),
	(2, 'ci_catalog', 'Catalog', NULL, 1, NULL),
	(3, 'ci_zoom_level', 'Zoom', NULL, 1, NULL),
	(4, 'ci_attr_type', 'Attribute Type', NULL, 1, NULL),
	(5, 'ci_attr_enum_type', 'Enum Type', NULL, 1, NULL),
	(6, 'ci_attr_ref_type', 'Reference Type', NULL, 1, NULL),
	(7, 'ci_state_design', 'Design CI State', NULL, 1, NULL),
	(8, 'ci_state_create', 'Create CI State', NULL, 1, NULL),
	(9, 'ci_state_start_stop', 'Start Stop CI State', NULL, 1, NULL),
	(10, 'state_transition_operation', 'State Transition Operation', NULL, 1, NULL),
	(11, 'state_transition_action', 'State Transition Action', NULL, 1, NULL),
	(12, 'tab_of_planning_design', 'Planning Designing CI Tabs', NULL, 1, NULL),
	(13, 'tab_query_of_planning_design', 'Planning Designing CI Tabs Enquiry', NULL, 1, 12),
	(14, 'tab_of_resourse_planning', 'Resource Planning CI Tabs', NULL, 1, NULL),
	(15, 'tab_query_of_resourse_planning', 'Resource Planning CI Tabs Enquiry', NULL, 1, 14),
	(16, 'tab_of_architecture_design', 'Architecture Design CI Tabs', NULL, 1, NULL),
	(17, 'tab_query_of_architecture_design', 'Architecture Design CI Tabs Enquiry', NULL, 1, 16),
	(18, 'tab_of_deploy_design', 'Deployment Design CI Tabs', NULL, 1, NULL),
	(19, 'tab_query_of_deploy_design', 'Deployment Design CI Tabs Enquiry', NULL, 1, 18),
	(20, 'business_group', 'Business Group', NULL, 2, NULL),
	(21, 'unit_type', 'Deployment Unit Type', NULL, 2, NULL),
	(22, 'env_type', 'Environment Type', NULL, 2, NULL),
	(23, 'env', 'Environment', NULL, 2, 22),
	(24, 'charge_type', 'Charge Mode', NULL, 2, NULL),
	(25, 'zone_design_type', 'Security Zone Design Type', NULL, 2, NULL),
	(26, 'zone_layer', 'Security Zone Design Layer', NULL, 2, NULL),
	(27, 'dcn_design_type', 'DCN Design Type', NULL, 2, NULL),
	(28, 'resource_set_design_type', 'Resource Set Design Type', NULL, 2, NULL),
	(29, 'ha_type', 'High Availability Type', NULL, 2, NULL),
	(30, 'diff_conf', 'Differential configuration', NULL, 2, NULL),
	(31, 'orchestration', 'Orchestration', NULL, 3, NULL),
	(32, 'orchestration', 'Orchestration', NULL, 4, NULL),
	(33, 'orchestration', 'Orchestration', NULL, 5, NULL),
	(34, 'across_idc', 'Cross-IDC Deployment Model', NULL, 5, NULL),
	(35, 'orchestration', 'Orchestration', NULL, 6, NULL),
	(36, 'service_type', 'Service Type', NULL, 6, NULL),
	(37, 'orchestration', 'Orchestration', NULL, 7, NULL),
	(38, 'invoke_type', 'Invoke Type', NULL, 7, NULL),
	(39, 'orchestration', 'Orchestration', NULL, 8, NULL),
	(40, 'orchestration', 'Orchestration', NULL, 9, NULL),
	(41, 'orchestration', 'Orchestration', NULL, 10, NULL),
	(42, 'orchestration', 'Orchestration', NULL, 11, NULL),
	(43, 'service_dns_domain', 'DNS Type', NULL, 11, NULL),
	(44, 'orchestration', 'Orchestration', NULL, 12, NULL),
	(45, 'orchestration', 'Orchestration', NULL, 13, NULL),
	(46, 'deploy_user', 'Deploy User', NULL, 13, NULL),
	(47, 'orchestration', 'Orchestration', NULL, 14, NULL),
	(48, 'host_type', 'Host Type', NULL, 14, NULL),
	(49, 'host_os_type', 'Host OS Type', NULL, 14, NULL),
	(50, 'host_sys_disk', 'Host System Disk', NULL, 14, NULL),
	(51, 'orchestration', 'Orchestration', NULL, 15, NULL),
	(52, 'block_storage_type', 'Storage Type', NULL, 15, NULL),
	(53, 'orchestration', 'Orchestration', NULL, 16, NULL),
	(54, 'ip_addr_type', 'IP Address Type', NULL, 16, NULL),
	(55, 'orchestration', 'Orchestration', NULL, 17, NULL),
	(56, 'Instance_type', 'Instance Type', NULL, 17, 21),
	(57, 'orchestration', 'Orchestration', NULL, 18, NULL),
	(58, 'orchestration', 'Orchestration', NULL, 19, NULL),
	(59, 'orchestration', 'Orchestration', NULL, 20, NULL),
	(60, 'orchestration', 'Orchestration', NULL, 21, NULL),
	(61, 'orchestration', 'Orchestration', NULL, 22, NULL),
	(62, 'network_segment_type', 'Network Segment Type', NULL, 23, NULL),
	(63, 'orchestration', 'Orchestration', NULL, 23, NULL),
	(64, 'orchestration', 'Orchestration', NULL, 24, NULL),
	(65, 'orchestration', 'Orchestration', NULL, 25, NULL),
	(66, 'orchestration', 'Orchestration', NULL, 26, NULL),
	(67, 'orchestration', 'Orchestration', NULL, 27, NULL),
	(68, 'orchestration', 'Orchestration', NULL, 28, NULL),
	(69, 'seed', 'Seed', NULL, 1, NULL),
	(70, 'deploy_tree_layer', 'Deployment Tree', NULL, 2, 1);

INSERT INTO `adm_basekey_cat_type` (`id_adm_basekey_cat_type`, `name`, `description`, `ci_type_id`, `type`) VALUES
	(1, 'sys', NULL, NULL, 1),
	(2, 'common', NULL, NULL, 2),
	(3, 'system_design', NULL, 1, 3),
	(4, 'subsys_design', NULL, 2, 3),
	(5, 'unit_design', NULL, 3, 3),
	(6, 'service_design', NULL, 4, 3),
	(7, 'invoke_design', NULL, 5, 3),
	(8, 'invoke_sequence_design', NULL, 6, 3),
	(9, 'subsys', NULL, 7, 3),
	(10, 'unit', NULL, 8, 3),
	(11, 'service', NULL, 9, 3),
	(12, 'invoke', NULL, 10, 3),
	(13, 'package', NULL, 11, 3),
	(14, 'host', NULL, 12, 3),
	(15, 'block_storage', NULL, 13, 3),
	(16, 'ip_used', NULL, 14, 3),
	(17, 'running_instance', NULL, 15, 3),
	(18, 'IDC', NULL, 16, 3),
	(19, 'zone', NULL, 17, 3),
	(20, 'zone_link', NULL, 18, 3),
	(21, 'DCN', NULL, 19, 3),
	(22, 'resource_set', NULL, 20, 3),
	(23, 'network_segment', NULL, 21, 3),
	(24, 'IDC_design', NULL, 22, 3),
	(25, 'zone_design', NULL, 23, 3),
	(26, 'zone_link_design', NULL, 24, 3),
	(27, 'DCN_desgin', NULL, 25, 3),
	(28, 'resource_set_design', NULL, 26, 3);

INSERT INTO `adm_basekey_code` (`id_adm_basekey`, `id_adm_basekey_cat`, `code`, `value`, `group_code_id`, `code_description`, `seq_no`, `status`) VALUES
	(1, 1, 'AAL', 'App Arch', NULL, NULL, 1, 'active'),
	(2, 1, 'ADL', 'App Impl', NULL, NULL, 2, 'active'),
	(3, 1, 'SRL', 'Instance', NULL, NULL, 3, 'active'),
	(4, 1, 'RPL', 'Infra Impl', NULL, NULL, 4, 'active'),
	(5, 1, 'PDL', 'Infra Arch', NULL, NULL, 5, 'active'),
	(6, 2, 'AAL', 'App Arch', NULL, NULL, 1, 'active'),
	(7, 2, 'ADL', 'App Impl', NULL, NULL, 2, 'active'),
	(8, 2, 'SRL', 'Instance', NULL, NULL, 3, 'active'),
	(9, 2, 'RPL', 'Infra Impl', NULL, NULL, 4, 'active'),
	(10, 2, 'PDL', 'Infra Arch', NULL, NULL, 5, 'active'),
	(11, 3, '1', '1', NULL, NULL, 1, 'active'),
	(12, 3, '2', '2', NULL, NULL, 2, 'active'),
	(13, 3, '3', '3', NULL, NULL, 3, 'active'),
	(14, 3, '4', '4', NULL, NULL, 4, 'active'),
	(15, 3, '5', '5', NULL, NULL, 5, 'active'),
	(16, 4, 'text', 'Text', NULL, NULL, 1, 'active'),
	(17, 4, 'area', 'Text Area', NULL, NULL, 2, 'active'),
	(18, 4, 'number', 'Number', NULL, NULL, 3, 'active'),
	(19, 4, 'regular_text', 'RegExp Validate Text', NULL, NULL, 4, 'active'),
	(20, 4, 'datetime', 'Datetime', NULL, NULL, 5, 'active'),
	(21, 4, 'select', 'Select', NULL, NULL, 6, 'active'),
	(22, 4, 'multiSelect', 'Multi Select', NULL, NULL, 7, 'active'),
	(23, 4, 'ref', 'Reference', NULL, NULL, 8, 'active'),
	(24, 4, 'multiRef', 'Multi Reference', NULL, NULL, 9, 'active'),
	(25, 4, 'orchestration_ref', 'Orchestration Reference', NULL, NULL, 10, 'active'),
	(26, 4, 'orchestration_multi_ref', 'Orchestration Multi Reference', NULL, NULL, 11, 'active'),
	(27, 5, 'common', 'Public Enum', NULL, NULL, 1, 'active'),
	(28, 5, 'private', 'Private Enum', NULL, NULL, 2, 'active'),
	(29, 6, 'belong', 'Belong', NULL, NULL, 1, 'active'),
	(30, 6, 'running', 'Running', NULL, NULL, 2, 'active'),
	(31, 6, 'composition', 'Composition', NULL, NULL, 3, 'active'),
	(32, 6, 'relation', 'Association', NULL, NULL, 4, 'active'),
	(33, 6, 'realize', 'Realization', NULL, NULL, 5, 'active'),
	(34, 7, 'new', 'New', NULL, NULL, 1, 'active'),
	(35, 7, 'update', 'Update', NULL, NULL, 2, 'active'),
	(36, 7, 'delete', 'Delete', NULL, NULL, 3, 'active'),
	(37, 8, 'created', 'Created', NULL, NULL, 6, 'active'),
	(38, 8, 'change', 'Change', NULL, NULL, 7, 'active'),
	(39, 8, 'destroyed', 'Destroyed', NULL, NULL, 8, 'active'),
	(40, 9, 'created', 'Created', NULL, NULL, 1, 'active'),
	(41, 9, 'startup', 'Startup', NULL, NULL, 2, 'active'),
	(42, 9, 'change', 'Change', NULL, NULL, 3, 'active'),
	(43, 9, 'stoped', 'Stoped', NULL, NULL, 4, 'active'),
	(44, 9, 'destroyed', 'Destroyed', NULL, NULL, 5, 'active'),
	(45, 10, 'insert', 'Insert', NULL, NULL, 1, 'active'),
	(46, 10, 'update', 'Update', NULL, NULL, 2, 'active'),
	(47, 10, 'discard', 'Discard', NULL, NULL, 3, 'active'),
	(48, 10, 'delete', 'Delete', NULL, NULL, 4, 'active'),
	(49, 10, 'confirm', 'Confirm', NULL, NULL, 5, 'active'),
	(50, 10, 'startup', 'Startup', NULL, NULL, 6, 'active'),
	(51, 10, 'stop', 'Stop', NULL, NULL, 7, 'active'),
	(52, 11, 'insert', 'Insert', NULL, NULL, 1, 'active'),
	(53, 11, 'insert-update', 'Insert And Update', NULL, NULL, 2, 'active'),
	(54, 11, 'delete', 'Delete', NULL, NULL, 3, 'active'),
	(55, 11, 'update-delete', 'Update And Delete', NULL, NULL, 4, 'active'),
	(56, 11, 'update', 'Update', NULL, NULL, 5, 'active'),
	(57, 11, 'confirm', 'Confirm', NULL, NULL, 6, 'active'),
	(58, 12, '22', 'IDC Design', NULL, NULL, 1, 'active'),
	(59, 13, 'guid_of_IDC_design', NULL, 58, NULL, 1, 'active'),
	(60, 12, '23', 'Security Area Design', NULL, NULL, 2, 'active'),
	(61, 13, 'guid_of_zone_design', '[{"ciTypeId":23},{"ciTypeId":22,"parentRs":{"attrId":442,"isReferedFromParent":1}}]', 60, NULL, 2, 'active'),
	(62, 12, '24', 'Security Area Connection Design', NULL, NULL, 3, 'active'),
	(63, 13, 'guid_of_zone_link_design', '[{"ciTypeId":24},{"ciTypeId":23,"parentRs":{"attrId":459,"isReferedFromParent":1}},{"ciTypeId":22,"parentRs":{"attrId":442,"isReferedFromParent":1}}]', 62, NULL, 3, 'active'),
	(64, 12, '25', 'IDC design', NULL, NULL, 4, 'active'),
	(65, 13, 'guid_of_set_design', '[{"ciTypeId":25},{"ciTypeId":23,"parentRs":{"attrId":475,"isReferedFromParent":1}},{"ciTypeId":22,"parentRs":{"attrId":442,"isReferedFromParent":1}}]', 64, NULL, 5, 'active'),
	(66, 12, '26', 'Resource Set design', NULL, NULL, 5, 'active'),
	(67, 13, 'guid_of_DCN_design', '[{"ciTypeId":26},{"ciTypeId":25,"parentRs":{"attrId":492,"isReferedFromParent":1}},{"ciTypeId":23,"parentRs":{"attrId":475,"isReferedFromParent":1}},{"ciTypeId":22,"parentRs":{"attrId":442,"isReferedFromParent":1}}]', 66, NULL, 4, 'active'),
	(68, 14, '16', 'IDC', NULL, NULL, 1, 'active'),
	(69, 15, 'guid_of_IDC', NULL, 68, NULL, 1, 'active'),
	(70, 14, '17', 'Security Area', NULL, NULL, 2, 'active'),
	(71, 15, 'guid_of_zone', '[{"ciTypeId":17},{"ciTypeId":16,"parentRs":{"attrId":328,"isReferedFromParent":1}}]', 70, NULL, 2, 'active'),
	(72, 14, '18', 'Security Area Connection', NULL, NULL, 3, 'active'),
	(73, 15, 'guid_of_zone_link', '[{"ciTypeId":18},{"ciTypeId":17,"parentRs":{"attrId":351,"isReferedFromParent":1}},{"ciTypeId":16,"parentRs":{"attrId":328,"isReferedFromParent":1}}]', 72, NULL, 3, 'active'),
	(74, 14, '19', 'Data Center Node', NULL, NULL, 4, 'active'),
	(75, 15, 'guid_of_DCN', '[{"ciTypeId":19},{"ciTypeId":17,"parentRs":{"attrId":369,"isReferedFromParent":1}},{"ciTypeId":16,"parentRs":{"attrId":328,"isReferedFromParent":1}}]', 74, NULL, 4, 'active'),
	(76, 14, '20', 'Resource Set', NULL, NULL, 5, 'active'),
	(77, 15, 'guid_of_set', '[{"ciTypeId":20},{"ciTypeId":19,"parentRs":{"attrId":386,"isReferedFromParent":1}},{"ciTypeId":17,"parentRs":{"attrId":369,"isReferedFromParent":1}},{"ciTypeId":16,"parentRs":{"attrId":328,"isReferedFromParent":1}}]', 76, NULL, 5, 'active'),
	(78, 14, '21', 'Network Segment', NULL, NULL, 5, 'active'),
	(79, 15, 'guid_of_network_segment', NULL, 78, NULL, 6, 'active'),
	(80, 16, '2', 'Subsystem Design', NULL, NULL, 2, 'active'),
	(81, 17, 'guid_of_subsys_design', '[{"ciTypeId":2},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 80, NULL, 2, 'active'),
	(82, 16, '3', 'Unit Design', NULL, NULL, 3, 'active'),
	(83, 17, 'guid_of_unit_design', '[{"ciTypeId":3},{"ciTypeId":2,"parentRs":{"attrId":49,"isReferedFromParent":1}},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 82, NULL, 3, 'active'),
	(84, 16, '4', 'Service Design', NULL, NULL, 4, 'active'),
	(85, 17, 'guid_of_service_design', '[{"ciTypeId":4},{"ciTypeId":3,"parentRs":{"attrId":69,"isReferedFromParent":1}},{"ciTypeId":2,"parentRs":{"attrId":49,"isReferedFromParent":1}},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 84, NULL, 4, 'active'),
	(86, 16, '5', 'Invocation Design', NULL, NULL, 5, 'active'),
	(87, 17, 'guid_of_invoke_design', '[{"ciTypeId":5},{"ciTypeId":3,"parentRs":{"attrId":87,"isReferedFromParent":1}},{"ciTypeId":2,"parentRs":{"attrId":49,"isReferedFromParent":1}},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 86, NULL, 5, 'active'),
	(88, 16, '6', 'Invocation Seq Design', NULL, NULL, 6, 'active'),
	(89, 17, 'guid_of_invoke_sequence_design', '[{"ciTypeId":6},{"ciTypeId":4,"parentRs":{"attrId":104,"isReferedFromParent":1}},{"ciTypeId":3,"parentRs":{"attrId":69,"isReferedFromParent":1}},{"ciTypeId":2,"parentRs":{"attrId":49,"isReferedFromParent":1}},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 88, NULL, 6, 'active'),
	(90, 18, '7', 'Subsystem', NULL, NULL, 1, 'active'),
	(91, 19, 'guid_of_subsys', '[{"ciTypeId":7},{"ciTypeId":2,"parentRs":{"attrId":121,"isReferedFromParent":1}},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 90, NULL, 1, 'active'),
	(92, 18, '8', 'Unit', NULL, NULL, 2, 'active'),
	(93, 19, 'guid_of_unit', '[{"ciTypeId":8},{"ciTypeId":7,"parentRs":{"attrId":138,"isReferedFromParent":1}},{"ciTypeId":2,"parentRs":{"attrId":121,"isReferedFromParent":1}},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 92, NULL, 2, 'active'),
	(94, 18, '9', 'Service', NULL, NULL, 3, 'active'),
	(95, 19, 'guid_of_service', ' [{"ciTypeId":9},{"ciTypeId":8,"parentRs":{"attrId":157,"isReferedFromParent":1}},{"ciTypeId":7,"parentRs":{"attrId":138,"isReferedFromParent":1}},{"ciTypeId":2,"parentRs":{"attrId":121,"isReferedFromParent":1}},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 94, NULL, 3, 'active'),
	(96, 18, '10', 'Invoke', NULL, NULL, 4, 'active'),
	(97, 19, 'guid_of_invoke', '[{"ciTypeId":10},{"ciTypeId":8,"parentRs":{"attrId":178,"isReferedFromParent":1}},{"ciTypeId":7,"parentRs":{"attrId":138,"isReferedFromParent":1}},{"ciTypeId":2,"parentRs":{"attrId":121,"isReferedFromParent":1}},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 96, NULL, 4, 'active'),
	(98, 18, '12', 'Host', NULL, NULL, 5, 'active'),
	(99, 19, 'guid_of_host', '[{"ciTypeId":12},{"ciTypeId":20,"parentRs":{"attrId":222,"isReferedFromParent":1}},{"ciTypeId":8,"parentRs":{"attrId":142,"isReferedFromParent":0}},{"ciTypeId":7,"parentRs":{"attrId":138,"isReferedFromParent":1}},{"ciTypeId":2,"parentRs":{"attrId":121,"isReferedFromParent":1}},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 98, NULL, 5, 'active'),
	(100, 18, '13', 'Block Storage', NULL, NULL, 6, 'active'),
	(101, 19, 'guid_of_block_storage', '[{"ciTypeId":13},{"ciTypeId":12,"parentRs":{"attrId":246,"isReferedFromParent":1}},{"ciTypeId":20,"parentRs":{"attrId":222,"isReferedFromParent":1}},{"ciTypeId":8,"parentRs":{"attrId":142,"isReferedFromParent":0}},{"ciTypeId":7,"parentRs":{"attrId":138,"isReferedFromParent":1}},{"ciTypeId":2,"parentRs":{"attrId":121,"isReferedFromParent":1}},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 100, NULL, 6, 'active'),
	(102, 18, '15', 'Running Instance', NULL, NULL, 7, 'active'),
	(103, 19, 'guid_of_instance', '[{"ciTypeId":15},{"ciTypeId":8,"parentRs":{"attrId":285,"isReferedFromParent":1}},{"ciTypeId":7,"parentRs":{"attrId":138,"isReferedFromParent":1}},{"ciTypeId":2,"parentRs":{"attrId":121,"isReferedFromParent":1}},{"ciTypeId":1,"parentRs":{"attrId":31,"isReferedFromParent":1}}]', 102, NULL, 7, 'active'),
	(104, 20, 'loan_group', 'Loan Business Group', NULL, NULL, 1, 'active'),
	(105, 20, 'deposit_group', 'Deposit Business Group', NULL, NULL, 2, 'active'),
	(106, 21, 'TOMCAT', 'Tomcat', NULL, NULL, 2, 'active'),
	(107, 21, 'MYSQL', 'MySQL', NULL, NULL, 1, 'active'),
	(108, 21, 'REDIS', 'Redis', NULL, NULL, 3, 'active'),
	(109, 22, 'PRD', 'Production', NULL, NULL, 1, 'active'),
	(110, 22, 'STG', 'Staging', NULL, NULL, 2, 'active'),
	(111, 23, 'PRD', 'PROD', 109, NULL, 1, 'active'),
	(112, 23, 'STGi', 'STGi ', 110, NULL, 2, 'active'),
	(113, 23, 'STGk', 'STGk', 110, NULL, 3, 'active'),
	(114, 24, 'PREPAID', 'Prepaid', NULL, NULL, 1, 'active'),
	(115, 24, 'POSTPAID_BY_HOUR', 'Billing By Quantity', NULL, NULL, 2, 'active'),
	(116, 25, 'INTERNET', 'Internet', NULL, NULL, 1, 'active'),
	(117, 25, 'PARTNERNET', 'Partner Network', NULL, NULL, 2, 'active'),
	(118, 25, 'INTRANET', 'Intranet', NULL, NULL, 3, 'active'),
	(119, 25, 'DMZ', 'DMZ', NULL, NULL, 4, 'active'),
	(120, 25, 'ECN', 'ECN', NULL, NULL, 5, 'active'),
	(121, 25, 'MGMT', 'MGMT', NULL, NULL, 6, 'active'),
	(122, 25, 'SF', 'SF', NULL, NULL, 7, 'active'),
	(123, 26, 'client_layer', 'Client Layer', NULL, NULL, 1, 'active'),
	(124, 26, 'link_layer', 'Access layer', NULL, NULL, 2, 'active'),
	(125, 26, 'buss_layer', 'Business Layer', NULL, NULL, 3, 'active'),
	(126, 27, 'h5', 'H5', NULL, NULL, 1, 'active'),
	(127, 27, 'API', 'API', NULL, NULL, 2, 'active'),
	(128, 27, 'APP', 'APP', NULL, NULL, 3, 'active'),
	(129, 27, 'DMZ', 'DMZ', NULL, NULL, 4, 'active'),
	(130, 27, 'ECN', 'ECN', NULL, NULL, 5, 'active'),
	(131, 27, 'MGMT', 'MGMT', NULL, NULL, 6, 'active'),
	(132, 27, 'ADM', 'ADM', NULL, NULL, 7, 'active'),
	(133, 27, 'CS', 'CS', NULL, NULL, 8, 'active'),
	(134, 27, 'CDCN', 'CDCN', NULL, NULL, 9, 'active'),
	(135, 27, 'RDCN', 'RDCN', NULL, NULL, 10, 'active'),
	(136, 28, 'APP', 'Application', NULL, NULL, 1, 'active'),
	(137, 28, 'DB', 'Database', NULL, NULL, 2, 'active'),
	(138, 28, 'CACHE', 'Cache', NULL, NULL, 3, 'active'),
	(139, 29, 'DNS', 'DNS', NULL, NULL, 1, 'active'),
	(140, 29, 'CLB_INTRANET', 'Tencent Cloud Intranet LB', NULL, NULL, 2, 'active'),
	(141, 29, 'CLB_INTERNET', 'Tencent Cloud External LB', NULL, NULL, 3, 'active'),
	(142, 29, 'MYSQL_MS', 'MySQL Master-Slave Switch', NULL, NULL, 4, 'active'),
	(143, 30, 'rmb_ip', NULL, NULL, NULL, 1, 'active'),
	(144, 30, 'rmb_port', NULL, NULL, NULL, 2, 'active'),
	(145, 30, 'rmb_name', NULL, NULL, NULL, 3, 'active'),
	(146, 34, 'CROSS_REGIONAL', 'Cross City IDC', NULL, NULL, 1, 'active'),
	(147, 34, 'CROSS_LOCAL', 'Intra City IDC', NULL, NULL, 2, 'active'),
	(148, 34, 'SINGLE_IDC', 'Single IDC', NULL, NULL, 3, 'active'),
	(149, 36, 'TCP_LONG', 'TCP Long Connection', NULL, NULL, 1, 'active'),
	(150, 36, 'TCP_SHORT', 'TCP Short Connection', NULL, NULL, 2, 'active'),
	(151, 36, 'UDP', 'UDP', NULL, NULL, 3, 'active'),
	(152, 38, 'sync_invoke', 'Synch Invocation', NULL, NULL, 1, 'active'),
	(153, 38, 'sync_request', 'Synch Request', NULL, NULL, 2, 'active'),
	(154, 38, 'async_respond', 'Asynch Response', NULL, NULL, 3, 'active'),
	(155, 43, 'app.wbtest.com', 'Intranet APP Domain Name', NULL, NULL, 1, 'active'),
	(156, 43, 'db.wbtest.com', 'Intranet DB Domain Name', NULL, NULL, 2, 'active'),
	(157, 43, 'cache.wbtest.com', 'Intranet Cache Domain Name', NULL, NULL, 3, 'active'),
	(158, 43, 'wbtest.com', 'Internet APP Domain Name', NULL, NULL, 4, 'active'),
	(159, 46, 'app', 'APP', NULL, NULL, 1, 'active'),
	(160, 46, 'mysql', 'MySQL', NULL, NULL, 2, 'active'),
	(161, 46, 'redis', 'Redis', NULL, NULL, 3, 'active'),
	(162, 48, 'SA1.SMALL2', 'Standard - 1 Core 2G', NULL, NULL, 1, 'active'),
	(163, 48, 'SA1.MEDIUM4', 'Standard - 2 Core 4G', NULL, NULL, 2, 'active'),
	(164, 49, 'img-31tjrtph', 'CentOs 7.2 64-bit', NULL, NULL, 1, 'active'),
	(165, 49, 'img-6ns5om13', 'CentOs 6.8 64-bit', NULL, NULL, 2, 'active'),
	(166, 50, '50', '50 GB', NULL, NULL, 1, 'active'),
	(167, 50, '100', '100 GB', NULL, NULL, 2, 'active'),
	(168, 50, '200', '200 GB', NULL, NULL, 3, 'active'),
	(169, 52, 'high_performance', 'High performance', NULL, NULL, 1, 'active'),
	(170, 52, 'high_capacity', 'High capacity', NULL, NULL, 2, 'active'),
	(171, 52, 'ssd', 'SSD', NULL, NULL, 3, 'active'),
	(172, 54, 'intranet_ip', 'Intranet IP', NULL, NULL, 1, 'active'),
	(173, 54, 'internet_ip', 'External network IP', NULL, NULL, 2, 'active'),
	(174, 56, 'tomcat_balance', 'TOMCAT load balancing node', 106, NULL, 1, 'active'),
	(175, 56, 'mysql_master', 'MYSQL master node', 107, NULL, 2, 'active'),
	(176, 56, 'mysql_slave', 'MYSQL slave node', 107, NULL, 3, 'active'),
	(177, 56, 'redis_master', 'REDIS master node', 108, NULL, 4, 'active'),
	(178, 56, 'redis_slave', 'REDIS slave node', 108, NULL, 5, 'active'),
	(179, 62, 'IDC', 'Computer room segment', NULL, NULL, 1, 'active'),
	(180, 62, 'VPC', 'VPC segment', NULL, NULL, 2, 'active'),
	(181, 62, 'SUBNET', 'VPC subnet segment', NULL, NULL, 3, 'active'),
	(182, 62, 'INTERNET', 'Internet segment', NULL, NULL, 4, 'active'),
	(218, 19, 'guid_of_deploy_detail', '[{"ciTypeId": 7},{ "ciTypeId": 2, "parentRs": { "attrId": 121, "isReferedFromParent": 1}},{ "ciTypeId": 1,"parentRs": { "attrId": 31,"isReferedFromParent": 1}}]', NULL, NULL, 8, 'active'),
	(219, 58, 'wecube-zone-create', 'Create a secure area', NULL, NULL, 1, 'active'),
	(220, 61, 'wecube1563966107126', 'Destroy the virtual host under the resource set', NULL, NULL, 1, 'active'),
	(221, 28, 'USER', 'Customer Resources', NULL, NULL, 4, 'active'),
	(222, 48, 'SA1.SMALL1', 'Standard-1Core 1G', NULL, NULL, 3, 'active'),
	(223, 39, 'wecube-appdeploy', 'Application deployment', NULL, NULL, 1, 'active'),
	(224, 58, 'wecube-zone-creation', 'Create a security zone_subnet_virtual machine', NULL, NULL, 2, 'active'),
	(225, 61, 'wecube_destory_set_vm', 'Destroy virtual machines under the resource set', NULL, NULL, 2, 'active'),
	(226, 59, 'wecube_destory_set_vm', 'Destroy virtual machines under the resource set', NULL, NULL, 1, 'active'),
	(227, 47, 'wecube-TerminateVM', 'destoryVM-726', NULL, NULL, 1, 'active'),
	(228, 47, 'wecube-CreateVM', 'CreateVM-726', NULL, NULL, 2, 'active'),
	(229, 58, 'wecube-createVpc', 'Create VPC-726', NULL, NULL, 3, 'active'),
	(231, 41, 'wecube-appdeploy', 'Application deployment-726', NULL, NULL, 1, 'active'),
	(232, 58, 'create-SubNet', 'Create subnet-726', NULL, NULL, 4, 'active'),
	(233, 46, 'root', 'root', NULL, NULL, 4, 'active'),
	(234, 58, 'delete-SubNet', 'Destroy subnet-726-01', NULL, NULL, 5, 'active'),
	(235, 41, 'deploy-app-726-12', 'Application deployment-726-12', NULL, NULL, 2, 'active'),
	(237, 30, 'code1', 'value1', NULL, NULL, 4, 'active'),
	(238, 58, 'wecube1564467202875', 'test', NULL, NULL, 6, 'active'),
	(239, 31, 'wecube1564468847441', 'test\n', NULL, NULL, 1, 'active'),
	(240, 69, 'seed123456', 'seed', NULL, NULL, 1, 'active'),
	(241, 70, '1', 'System', 2, NULL, 1, 'active'),
	(242, 70, '2', 'Subsystem', 2, NULL, 2, 'active'),
	(243, 70, '3', 'Unit', 2, NULL, 3, 'active'),
	(244, 70, '4', 'Running Instance & Service', 2, NULL, 4, 'active'),
	(245, 16, '1', 'System Design', NULL, NULL, 1, 'active'),
	(246, 17, 'guid_of_sys_design', NULL, 245, NULL, 1, 'active');

INSERT INTO `adm_ci_type` (`id_adm_ci_type`, `name`, `description`, `id_adm_tenement`, `table_name`, `status`, `catalog_id`, `ci_global_unique_id`, `seq_no`, `layer_id`, `zoom_level_id`, `image_file_id`, `ci_state_type`) VALUES
	(1, 'System Design', 'System Design', NULL, 'system_design', 'created', 6, NULL, 1, 1, NULL, 1, NULL),
	(2, 'Subsystem Design', 'Subsystem Design', NULL, 'subsys_design', 'created', 6, NULL, 2, 1, NULL, 2, NULL),
	(3, 'Unit Design', 'Unit Design', NULL, 'unit_design', 'created', 6, NULL, 3, 1, NULL, 3, NULL),
	(4, 'Service Design', 'Service Design', NULL, 'service_design', 'created', 6, NULL, 4, 1, NULL, 4, NULL),
	(5, 'Invocation Design', 'Invocation Design', NULL, 'invoke_design', 'created', 6, NULL, 5, 1, NULL, 5, NULL),
	(6, 'Invocation Seq Design', 'Invocation Seq Design', NULL, 'invoke_sequence_design', 'created', 6, NULL, 6, 1, NULL, 6, NULL),
	(7, 'Subsystem', 'Subsystem', NULL, 'subsys', 'created', 7, NULL, 1, 2, NULL, 7, NULL),
	(8, 'Unit', 'Unit', NULL, 'unit', 'created', 7, NULL, 2, 2, NULL, 8, NULL),
	(9, 'Service', 'Service', NULL, 'service', 'created', 7, NULL, 3, 2, NULL, 9, NULL),
	(10, 'Invocation', 'Invocation', NULL, 'invoke', 'created', 7, NULL, 4, 2, NULL, 10, NULL),
	(11, 'Package', 'Package', NULL, 'package', 'created', 7, NULL, 5, 2, NULL, 11, NULL),
	(12, 'Host', 'Host', NULL, 'host', 'created', 8, NULL, 1, 3, NULL, 12, NULL),
	(13, 'Storage', 'Block Storage', NULL, 'block_storage', 'created', 8, NULL, 2, 3, NULL, 13, NULL),
	(14, 'IP', 'IP', NULL, 'ip_addr', 'created', 8, NULL, 3, 3, NULL, 14, NULL),
	(15, 'Running Instance', 'Running Instance', NULL, 'running_instance', 'created', 8, NULL, 4, 3, NULL, 15, NULL),
	(16, 'IDC', 'IDC', NULL, 'IDC', 'created', 9, NULL, 1, 4, NULL, 16, NULL),
	(17, 'Zone', 'Zone', NULL, 'zone', 'created', 9, NULL, 2, 4, NULL, 17, NULL),
	(18, 'Peer Conn', 'Peer Conn', NULL, 'zone_link', 'created', 9, NULL, 3, 4, NULL, 18, NULL),
	(19, 'DCN', 'DCN', NULL, 'DCN', 'created', 9, NULL, 4, 4, NULL, 19, NULL),
	(20, 'Resource Set', 'Resource Set', NULL, 'resource_set', 'created', 9, NULL, 5, 4, NULL, 20, NULL),
	(21, 'Network Segment', 'Network Segment', NULL, 'network_segment', 'created', 9, NULL, 6, 3, NULL, 21, NULL),
	(22, 'IDC Design', 'IDC Design', NULL, 'IDC_design', 'created', 10, NULL, 1, 5, NULL, 22, NULL),
	(23, 'Zone Design', 'Zone Design', NULL, 'zone_design', 'created', 10, NULL, 2, 5, NULL, 23, NULL),
	(24, 'Peer Conn Design', 'Peer Conn Design', NULL, 'zone_link_design', 'created', 10, NULL, 3, 5, NULL, 24, NULL),
	(25, 'DCN Design', 'DCN Design', NULL, 'DCN_desgin', 'created', 10, NULL, 4, 5, NULL, 25, NULL),
	(26, 'Resource Set Design', 'Resource Set Design', NULL, 'resource_set_design', 'created', 10, NULL, 5, 5, NULL, 26, NULL);

INSERT INTO `adm_ci_type_attr_base` (`id_adm_ci_type`, `name`, `description`, `input_type`, `property_name`, `property_type`, `length`, `reference_id`, `reference_name`, `reference_type`, `filter_rule`, `search_seq_no`, `display_type`, `display_seq_no`, `edit_is_null`, `edit_is_only`, `edit_is_hiden`, `edit_is_editable`, `is_defunct`, `special_logic`, `status`, `is_system`, `is_access_controlled`, `is_auto`, `auto_fill_rule`, `is_refreshable`) VALUES
	(1, 'Global Unique ID', 'Global Unique ID', 'text', 'guid', 'varchar', 15, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 'notCreated', 1, 0, 0, NULL, 0),
	(1, 'Key Name', 'Key Name', 'text', 'key_name', 'varchar', 200, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, 0, 0, NULL, 'notCreated', 1, 0, 1, NULL, 0),
	(1, 'State', 'State', 'select', 'state', 'int', 15, 7, NULL, NULL, NULL, 2, 1, 2, 0, 0, 0, 0, 0, NULL, 'notCreated', 1, 0, 0, NULL, 0),
	(1, 'Fixed Date', 'Fixed Date', 'text', 'fixed_date', 'varchar', 19, NULL, NULL, NULL, NULL, 3, 1, 3, 1, 0, 0, 0, 0, NULL, 'notCreated', 1, 0, 0, NULL, 0),
	(1, 'Previous Version Guid', 'Previous Version Guid', 'text', 'p_guid', 'varchar', 15, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 1, 0, 0, NULL, 'notCreated', 1, 0, 0, NULL, 0),
	(1, 'Root Guid', 'Root Guid', 'text', 'r_guid', 'varchar', 15, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'notCreated', 1, 0, 0, NULL, 0),
	(1, 'Description', 'Description', 'textArea', 'description', 'varchar', 1000, NULL, NULL, NULL, NULL, 4, 1, 4, 1, 0, 0, 1, 0, NULL, 'notCreated', 1, 0, 0, NULL, 0),
	(1, 'Code', 'Code', 'text', 'code', 'varchar', 50, NULL, NULL, NULL, NULL, 5, 1, 5, 0, 0, 0, 1, 0, NULL, 'notCreated', 1, 0, 0, NULL, 0),
	(1, 'Orchestration', 'Orchestration', 'select', 'orchestration', 'int', 15, 31, NULL, NULL, NULL, 0, 1, 6, 1, 0, 0, 1, 0, NULL, 'notCreated', 0, 0, 0, NULL, 1),
	(1, 'Orchestration Instance ID', 'Orchestration Instance ID', 'text', 'biz_key', 'varchar', 50, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 1, 0, NULL, 'notCreated', 0, 0, 0, NULL, 1),
	(1, 'Updated By', 'Updated By', 'text', 'updated_by', 'varchar', 50, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 'notCreated', 1, 0, 0, NULL, 0),
	(1, 'Updated Date', 'Updated Date', 'date', 'updated_date', 'datetime', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 'notCreated', 1, 0, 0, NULL, 0),
	(1, 'Created_By', 'Created By', 'text', 'created_by', 'varchar', 50, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 'notCreated', 1, 0, 0, NULL, 0),
	(1, 'Created Date', 'Created Date', 'date', 'created_date', 'datetime', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 'notCreated', 1, 0, 0, NULL, 0);

INSERT INTO `adm_state_transition` (`id_adm_state_transition`, `current_state`, `current_state_is_confirmed`, `target_state`, `target_state_is_confirmed`, `operation`, `action`, `status`) VALUES
	(1, 37, 0, NULL, NULL, 48, 54, 'active'),
	(2, NULL, NULL, 37, 0, 45, 52, 'active'),
	(3, 37, 0, 37, 0, 46, 56, 'active'),
	(4, 37, 0, 37, 1, 49, 57, 'active'),
	(5, 37, 1, 38, 0, 46, 53, 'active'),
	(6, 38, 0, 37, 1, 47, 55, 'active'),
	(7, 37, 1, 39, 0, 48, 53, 'active'),
	(8, 39, 0, 37, 1, 47, 55, 'active'),
	(9, 38, 0, 38, 0, 46, 56, 'active'),
	(10, 38, 0, 38, 1, 49, 57, 'active'),
	(11, 38, 1, 38, 0, 46, 53, 'active'),
	(12, 38, 0, 38, 1, 47, 55, 'active'),
	(13, 38, 1, 39, 0, 48, 53, 'active'),
	(14, 39, 0, 38, 1, 47, 55, 'active'),
	(15, 39, 0, 39, 1, 49, 57, 'active'),
	(16, 40, 0, NULL, NULL, 48, 54, 'active'),
	(17, NULL, NULL, 40, 0, 45, 52, 'active'),
	(18, 40, 0, 40, 0, 46, 56, 'active'),
	(19, 40, 0, 40, 1, 49, 57, 'active'),
	(20, 40, 1, 41, 0, 50, 53, 'active'),
	(21, 41, 0, 40, 1, 47, 55, 'active'),
	(22, 41, 0, 41, 1, 49, 57, 'active'),
	(23, 40, 1, 43, 0, 51, 53, 'active'),
	(24, 43, 0, 40, 1, 47, 55, 'active'),
	(25, 43, 0, 43, 1, 49, 57, 'active'),
	(26, 41, 1, 43, 0, 51, 53, 'active'),
	(27, 43, 0, 41, 1, 47, 55, 'active'),
	(28, 43, 1, 41, 0, 50, 53, 'active'),
	(29, 41, 0, 43, 1, 47, 55, 'active'),
	(30, 41, 1, 42, 0, 46, 53, 'active'),
	(31, 42, 0, 41, 1, 47, 55, 'active'),
	(32, 43, 1, 42, 0, 46, 53, 'active'),
	(33, 42, 0, 43, 1, 47, 55, 'active'),
	(34, 42, 0, 42, 0, 46, 56, 'active'),
	(35, 42, 0, 42, 1, 49, 57, 'active'),
	(36, 42, 1, 43, 0, 51, 53, 'active'),
	(37, 43, 0, 42, 1, 47, 55, 'active'),
	(38, 42, 1, 41, 0, 50, 53, 'active'),
	(39, 41, 0, 42, 1, 47, 55, 'active'),
	(40, 43, 1, 44, 0, 48, 53, 'active'),
	(41, 44, 0, 43, 1, 47, 55, 'active'),
	(42, 44, 0, 44, 1, 49, 57, 'active'),
	(43, 34, 0, NULL, NULL, 48, 54, 'active'),
	(44, NULL, NULL, 34, 0, 45, 52, 'active'),
	(45, 34, 0, 34, 0, 46, 56, 'active'),
	(46, 34, 0, 34, 1, 49, 57, 'active'),
	(47, 34, 1, 35, 0, 46, 53, 'active'),
	(48, 35, 0, 34, 1, 47, 55, 'active'),
	(49, 34, 1, 36, 0, 48, 53, 'active'),
	(50, 36, 0, 34, 1, 47, 55, 'active'),
	(51, 35, 0, 35, 0, 46, 56, 'active'),
	(52, 35, 0, 35, 1, 49, 57, 'active'),
	(53, 35, 1, 35, 0, 46, 53, 'active'),
	(54, 35, 0, 35, 1, 47, 55, 'active'),
	(55, 35, 1, 36, 0, 48, 53, 'active'),
	(56, 36, 0, 35, 1, 47, 55, 'active'),
	(57, 36, 0, 36, 1, 49, 57, 'active');

INSERT INTO `adm_role` (`id_adm_role`, `role_name`, `description`, `id_adm_tenement`, `parent_id_adm_role`, `role_type`, `is_system`) VALUES
	(1, 'SUPER_ADMIN', 'Super Admin', NULL, NULL, 'ADMIN', 1),
	(2, 'CMDB_ADMIN', 'CMDB Admin', NULL, NULL, 'ADMIN', 0),
	(3, 'PLUGIN_ADMIN', 'Plugin Admin', NULL, NULL, 'ADMIN', 0),
	(4, 'IDC_ARCHITECT', 'IDC Arch-er', NULL, NULL, 'ADMIN', 0),
	(5, 'NETWORK_ARCHITECT', 'Network Arch-er', NULL, NULL, 'ADMIN', 0),
	(6, 'APP_ARCHITECT', 'APP Arch-er', NULL, NULL, 'ADMIN', 0),
	(7, 'OPS-PROD', 'Prod Env Operator', NULL, NULL, 'ADMIN', 0),
	(8, 'OPS-TEST', 'Test Env Operator', NULL, NULL, 'ADMIN', 0),
	(9, 'DEVELOPER', 'Developer', NULL, NULL, 'ADMIN', 0),
	(10, 'REGULAR', 'Normal User', NULL, NULL, 'REGULAR', 0),
	(11, 'READONLY', 'Read Only User', NULL, NULL, 'READONLY', 0);

INSERT INTO `adm_user` (`id_adm_user`, `name`, `code`, `encrypted_password`, `description`, `id_adm_tenement`, `action_flag`, `is_system`) VALUES
	(1, 'admin', 'admin','$2a$10$Gh3WDwZ8kFpxbmo/h.oywuN.LuYwgrlx53ZeG.mz7P4eKgct7IYZm', 'admin', NULL, 0, 1);

INSERT INTO `adm_role_user` (`id_adm_role_user`, `id_adm_role`, `id_adm_user`, `is_system`) VALUES
    ('1', '1', 1, 1);

INSERT INTO `adm_menu` (`id_adm_menu`, `name`, `other_name`, `seq_no`, `parent_id_adm_menu`) VALUES
(1, 'DATA_QUERY', 'Data Enquiry', 1, NULL),
(2, 'DATA_MANAGEMENT', 'Data Management', 2, NULL),
(4, 'VIEW_MANAGEMENT', 'View Management', 4, NULL),
(5, 'ADMIN', 'Administration', 5, NULL),
(6, 'DESIGNING_CI_DATA_ENQUIRY', 'CI Data Enquiry', 6, 1),
(7, 'DESIGNING_CI_INTEGRATED_QUERY_EXECUTION', 'CI Data Integrated Enquiry', 7, 1),
(8, 'DESIGNING_ENUM_ENQUIRY', 'Enum Enquiry', 8, 1),
(9, 'DESIGNING_CI_DATA_MANAGEMENT', 'CI Data Management', 9, 2),
(10, 'DESIGNING_CI_INTEGRATED_QUERY_MANAGEMENT', 'CI Data Integrated Enquiry Management', 10, 2),
(11, 'DESIGNING_ENUM_MANAGEMENT', 'Enum Management', 11, 2),
(16, 'IDC_PLANNING_DESIGN', 'IDC Planning and Designing', 16, 4),
(17, 'IDC_RESOURCE_PLANNING', 'IDC Resource Planning', 17, 4),
(18, 'APPLICATION_ARCHITECTURE_DESIGN', 'App Arch Design', 18, 4),
(19, 'APPLICATION_DEPLOYMENT_DESIGN', 'App Impl Design', 19, 4),
(20, 'ADMIN_CMDB_MODEL_MANAGEMENT', 'CMDB Model Management', 20, 5),
(21, 'ADMIN_PERMISSION_MANAGEMENT', 'Permission Management', 21, 5),
(22, 'ADMIN_BASE_DATA_MANAGEMENT', 'Basic Data Management', 22, 5),
(23, 'ADMIN_QUERY_LOG', 'Log query', 23, 5),
(24, 'ADMIN_USER_PASSWORD_MANAGEMENT', 'User Password Management', 24, 5);

INSERT INTO `adm_role_menu` (`id_adm_role_menu`, `id_adm_role`, `id_adm_menu`, `is_system`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(5, 1, 5, 1),
(6, 1, 6, 0),
(7, 1, 7, 0),
(8, 1, 8, 0),
(9, 1, 9, 0),
(10, 1, 10, 0),
(11, 1, 11, 0),
(16, 1, 16, 0),
(17, 1, 17, 0),
(18, 1, 18, 0),
(19, 1, 19, 0),
(20, 1, 20, 0),
(21, 1, 21, 1),
(22, 1, 22, 0),
(23, 1, 23, 0),
(24, 1, 24, 0);

SET FOREIGN_KEY_CHECKS=1;