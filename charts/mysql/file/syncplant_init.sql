-- --------------------------------------------------------
-- 主机:                           192.168.1.13
-- 服务器版本:                        8.0.27 - Source distribution
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 nacos_config 的数据库结构
CREATE DATABASE IF NOT EXISTS `nacos_config` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nacos_config`;

-- 导出  表 nacos_config.config_info 结构
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE IF NOT EXISTS `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'group_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'configuration description',
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'configuration usage',
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '配置生效的描述',
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '配置的类型',
  `c_schema` text COLLATE utf8_bin COMMENT '配置的模式',
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_info';

-- 正在导出表  nacos_config.config_info 的数据：~0 rows (大约)
DELETE FROM `config_info`;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;

-- 导出  表 nacos_config.config_info_aggr 结构
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE IF NOT EXISTS `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='增加租户字段';

-- 正在导出表  nacos_config.config_info_aggr 的数据：~0 rows (大约)
DELETE FROM `config_info_aggr`;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;

-- 导出  表 nacos_config.config_info_beta 结构
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE IF NOT EXISTS `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_info_beta';

-- 正在导出表  nacos_config.config_info_beta 的数据：~0 rows (大约)
DELETE FROM `config_info_beta`;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;

-- 导出  表 nacos_config.config_info_tag 结构
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE IF NOT EXISTS `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_info_tag';

-- 正在导出表  nacos_config.config_info_tag 的数据：~0 rows (大约)
DELETE FROM `config_info_tag`;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;

-- 导出  表 nacos_config.config_tags_relation 结构
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE IF NOT EXISTS `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增长标识',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- 正在导出表  nacos_config.config_tags_relation 的数据：~0 rows (大约)
DELETE FROM `config_tags_relation`;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;

-- 导出  表 nacos_config.group_capacity 结构
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE IF NOT EXISTS `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- 正在导出表  nacos_config.group_capacity 的数据：~0 rows (大约)
DELETE FROM `group_capacity`;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;

-- 导出  表 nacos_config.his_config_info 结构
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE IF NOT EXISTS `his_config_info` (
  `id` bigint unsigned NOT NULL COMMENT 'id',
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增标识',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'operation type',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='多租户改造';

-- 正在导出表  nacos_config.his_config_info 的数据：~0 rows (大约)
DELETE FROM `his_config_info`;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;

-- 导出  表 nacos_config.permissions 结构
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `role` varchar(50) NOT NULL COMMENT 'role',
  `resource` varchar(255) NOT NULL COMMENT 'resource',
  `action` varchar(8) NOT NULL COMMENT 'action',
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  nacos_config.permissions 的数据：~0 rows (大约)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- 导出  表 nacos_config.roles 结构
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `username` varchar(50) NOT NULL COMMENT 'username',
  `role` varchar(50) NOT NULL COMMENT 'role',
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  nacos_config.roles 的数据：~1 rows (大约)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`username`, `role`) VALUES
	('nacos', 'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- 导出  表 nacos_config.tenant_capacity 结构
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE IF NOT EXISTS `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- 正在导出表  nacos_config.tenant_capacity 的数据：~0 rows (大约)
DELETE FROM `tenant_capacity`;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;

-- 导出  表 nacos_config.tenant_info 结构
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE IF NOT EXISTS `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='tenant_info';

-- 正在导出表  nacos_config.tenant_info 的数据：~0 rows (大约)
DELETE FROM `tenant_info`;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;

-- 导出  表 nacos_config.users 结构
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) NOT NULL COMMENT 'username',
  `password` varchar(500) NOT NULL COMMENT 'password',
  `enabled` tinyint(1) NOT NULL COMMENT 'enabled',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  nacos_config.users 的数据：~1 rows (大约)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
	('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- 导出 xxl_job 的数据库结构
CREATE DATABASE IF NOT EXISTS `xxl_job` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `xxl_job`;

-- 导出  表 xxl_job.worker_node 结构
DROP TABLE IF EXISTS `worker_node`;
CREATE TABLE IF NOT EXISTS `worker_node` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'auto increment id',
  `HOST_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'host name',
  `PORT` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'port',
  `TYPE` int NOT NULL COMMENT 'node type: ACTUAL or CONTAINER',
  `LAUNCH_DATE` date NOT NULL COMMENT 'launch date',
  `MODIFIED` timestamp NOT NULL COMMENT 'modified time',
  `CREATED` timestamp NOT NULL COMMENT 'created time',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6963 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xxl_job.worker_node 的数据：~0 rows (大约)
DELETE FROM `worker_node`;
/*!40000 ALTER TABLE `worker_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_node` ENABLE KEYS */;

-- 导出  表 xxl_job.xxl_job_group 结构
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE IF NOT EXISTS `xxl_job_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '执行器地址列表，多地址逗号分隔',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  xxl_job.xxl_job_group 的数据：~7 rows (大约)
DELETE FROM `xxl_job_group`;
/*!40000 ALTER TABLE `xxl_job_group` DISABLE KEYS */;
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`) VALUES
	(1, 'xxl-job-executor-sample', '示例执行器', 0, NULL),
	(42, 'syncplant-system-resource', '资源服务', 0, NULL),
	(43, 'jn-task', 'jn-task', 0, NULL),
	(44, 'datax-executor', 'datax-execut', 0, NULL),
	(45, 'syncplant-system-datacenter', '数据中台', 0, NULL),
	(46, 'ptm-task', 'ptm-task', 0, NULL),
	(49, 'syncplant-system-pf', '微服务基础平台PF', 0, NULL);
/*!40000 ALTER TABLE `xxl_job_group` ENABLE KEYS */;

-- 导出  表 xxl_job.xxl_job_info 结构
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE IF NOT EXISTS `xxl_job_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_cron` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务执行CRON',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '报警邮件',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` text COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  `reissue` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否允许补录：0-允许，1-不允许',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  xxl_job.xxl_job_info 的数据：~110 rows (大约)
DELETE FROM `xxl_job_info`;
/*!40000 ALTER TABLE `xxl_job_info` DISABLE KEYS */;
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_cron`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`, `reissue`) VALUES
	(1, 1, '0 0 0 * * ? *', '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '', 0, 0, 0, NULL),
	(242, 42, '* * * 1/1 * ?', '默认描述:executeRule，请及时修改描述和执行器', '2022-12-15 11:19:14', '2022-12-15 11:19:14', '自动注入', NULL, 'FIRST', 'executeRule', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2022-12-15 11:19:14', NULL, 0, 0, 0, NULL),
	(243, 42, '* * * 1/1 * ?', '默认描述:resetSequence，请及时修改描述和执行器', '2022-12-15 11:19:14', '2022-12-15 11:19:14', '自动注入', NULL, 'FIRST', 'resetSequence', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2022-12-15 11:19:14', NULL, 0, 0, 0, NULL),
	(244, 43, '* * * 1/1 * ?', '默认描述:genOverhualweekly，请及时修改描述和执行器', '2022-12-16 11:21:27', '2022-12-16 11:21:27', '自动注入', NULL, 'FIRST', 'genOverhualweekly', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2022-12-16 11:21:27', NULL, 0, 0, 0, NULL),
	(245, 43, '* * * 1/1 * ?', '默认描述:genWeatherWarning，请及时修改描述和执行器', '2022-12-16 11:21:27', '2022-12-16 11:21:27', '自动注入', NULL, 'FIRST', 'genWeatherWarning', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2022-12-16 11:21:27', NULL, 0, 0, 0, NULL),
	(253, 44, '0 0 0 * * ?', 'metesphere', '2022-12-21 10:34:18', '2022-12-21 10:34:18', 'XXL', NULL, 'FIRST', 'datax-handler', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2022-12-21 10:34:18', NULL, 0, 0, 0, NULL),
	(254, 44, '0 0 0 * * ?', 'test_case', '2022-12-21 10:36:29', '2022-12-21 10:36:31', 'admin', NULL, 'FIRST', 'datax-handler', '{\n	"xxlJobId":254,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"1qaz2wsx",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"test_case"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.55.1.106:30050/metersphere?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.55.1.51:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.55.1.51:9030",\n							"database":"ODS_tes01",\n							"table":"test_case",\n							"column":[\n								"id",\n								"node_id",\n								"test_id",\n								"node_path",\n								"project_id",\n								"name",\n								"type",\n								"maintainer",\n								"priority",\n								"method",\n								"prerequisite",\n								"remark",\n								"steps",\n								"create_time",\n								"update_time",\n								"sort",\n								"num",\n								"review_status",\n								"tags",\n								"demand_id",\n								"demand_name",\n								"status",\n								"step_description",\n								"expected_result",\n								"custom_fields",\n								"step_model",\n								"custom_num",\n								"create_user",\n								"original_status",\n								"delete_time",\n								"delete_user_id",\n								"order",\n								"case_public",\n								"version_id",\n								"ref_id",\n								"latest",\n								"last_execute_result"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table ODS_tes01.test_case"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2022-12-21 10:36:29', '255', 0, 0, 0, NULL),
	(255, 44, '0 0 0 * * ?', 'test_case_comment', '2022-12-21 10:36:30', '2022-12-21 10:36:31', 'admin', NULL, 'FIRST', 'datax-handler', '{\n	"xxlJobId":255,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"1qaz2wsx",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"test_case_comment"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.55.1.106:30050/metersphere?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.55.1.51:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.55.1.51:9030",\n							"database":"ODS_tes01",\n							"table":"test_case_comment",\n							"column":[\n								"id",\n								"case_id",\n								"description",\n								"author",\n								"create_time",\n								"update_time",\n								"status",\n								"type"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table ODS_tes01.test_case_comment"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2022-12-21 10:36:30', NULL, 0, 0, 0, NULL),
	(257, 45, '0 0 0 * * ?', '111', '2022-12-26 10:19:28', '2023-01-04 14:21:31', 'admin', NULL, 'FIRST', 'DataGovernHandler', '935455430530826436', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2022-12-26 10:19:28', NULL, 0, 0, 0, NULL),
	(259, 45, '0 0 0 * * ?', 'test', '2022-12-26 16:36:41', '2022-12-26 16:36:41', 'admin', NULL, 'FIRST', 'DataServiceHandler', '935455430530827010', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2022-12-26 16:36:41', NULL, 0, 0, 0, NULL),
	(260, 44, '0 0 0 * * ?', 'auth_data_scope_permission', '2022-12-27 15:24:16', '2022-12-27 15:24:36', 'admin', NULL, 'FIRST', 'datax-handler', '{\n	"xxlJobId":260,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"1qaz2wsx",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"auth_data_scope_permission"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.55.1.113:3306/syncplant_formdesign?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.55.1.51:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.55.1.51:9030",\n							"database":"ODS_tes01",\n							"table":"auth_data_scope_permission",\n							"column":[\n								"ID",\n								"NAME",\n								"PERMISSION_ID",\n								"TYPE",\n								"REMARK",\n								"SCOPE_ID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table ODS_tes01.auth_data_scope_permission"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2022-12-27 15:24:16', '', 0, 0, 0, NULL),
	(261, 45, '0 0 0 * * ?', '质量稽核任务', '2022-12-27 15:34:01', '2023-01-29 15:22:38', 'admin', NULL, 'FIRST', 'DQCheckHandler', '935455430530827028', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2022-12-27 15:34:01', NULL, 0, 0, 0, NULL),
	(266, 45, '0 0 0 * * ?', '节点顺序', '2022-12-27 16:53:36', '2023-01-05 20:14:49', 'admin', NULL, 'FIRST', 'DataGovernHandler', '935455430530827450', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2022-12-27 16:53:36', NULL, 0, 0, 0, NULL),
	(267, 45, '* * * 1/1 * ?', '默认描述:DataDevelopHandler，请及时修改描述和执行器', '2022-12-28 14:10:36', '2022-12-28 14:10:36', '自动注入', NULL, 'FIRST', 'DataDevelopHandler', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2022-12-28 14:10:36', NULL, 0, 0, 0, NULL),
	(268, 45, '* * * 1/1 * ?', '默认描述:SQLTaskHandler，请及时修改描述和执行器', '2022-12-28 14:10:36', '2022-12-28 14:10:36', '自动注入', NULL, 'FIRST', 'SQLTaskHandler', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2022-12-28 14:10:36', NULL, 0, 0, 0, NULL),
	(269, 45, '* * * 1/1 * ?', '默认描述:taskJobHandler，请及时修改描述和执行器', '2022-12-28 14:10:36', '2022-12-28 14:10:36', '自动注入', NULL, 'FIRST', 'taskJobHandler', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2022-12-28 14:10:36', NULL, 0, 0, 0, NULL),
	(270, 45, '0 0 0 * * ?', '123', '2022-12-29 15:53:29', '2022-12-29 15:53:29', 'admin', NULL, 'FIRST', 'DataServiceHandler', '941504814657830912', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2022-12-29 15:53:29', NULL, 0, 0, 0, NULL),
	(271, 46, '* * * 1/1 * ?', '默认描述:eamspecmsg，请及时修改描述和执行器', '2023-01-03 11:01:35', '2023-01-03 11:01:35', '自动注入', NULL, 'FIRST', 'eamspecmsg', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-03 11:01:35', NULL, 0, 0, 0, NULL),
	(272, 46, '* * * 1/1 * ?', '默认描述:dsmWarn，请及时修改描述和执行器', '2023-01-03 11:01:35', '2023-01-03 11:01:35', '自动注入', NULL, 'FIRST', 'dsmWarn', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-03 11:01:35', NULL, 0, 0, 0, NULL),
	(273, 46, '* * * 1/1 * ?', '默认描述:executeInternal，请及时修改描述和执行器', '2023-01-03 11:01:35', '2023-01-03 11:01:35', '自动注入', NULL, 'FIRST', 'executeInternal', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-03 11:01:35', NULL, 0, 0, 0, NULL),
	(276, 42, '* 0,1 * * * ? *', '消息发送', '2023-01-03 17:10:42', '2023-01-03 17:10:50', '超级管理员', NULL, 'FIRST', 'executeRule', '1604649253025419266', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-03 17:10:42', NULL, 0, 0, 0, NULL),
	(277, 42, '* 0,1 * * * ? *', '消息发送', '2023-01-03 17:10:50', '2023-01-03 17:11:58', '超级管理员', NULL, 'FIRST', 'executeRule', '1604649253025419266', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-03 17:10:50', NULL, 0, 0, 0, NULL),
	(278, 42, '10 * * * * ? *', '消息发送', '2023-01-03 17:11:58', '2023-01-03 17:16:40', '超级管理员', NULL, 'FIRST', 'executeRule', '1604649253025419266', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-03 17:11:58', NULL, 0, 0, 0, NULL),
	(279, 42, '10 * * * * ? *', '消息发送', '2023-01-03 17:16:40', '2023-01-03 17:18:08', '超级管理员', NULL, 'FIRST', 'executeRule', '1604649253025419266', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-03 17:16:40', NULL, 0, 0, 0, NULL),
	(280, 42, '10 * * * * ? *', '消息发送', '2023-01-03 17:18:08', '2023-03-16 09:18:54', '超级管理员', NULL, 'FIRST', 'executeRule', '1604649253025419266', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-03 17:18:08', NULL, 0, 0, 0, NULL),
	(281, 44, '0 0 0 * * ?', 'api_test', '2023-01-04 11:57:10', '2023-01-04 11:57:11', 'admin', NULL, 'FIRST', 'datax-handler', '{\n	"xxlJobId":281,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"1qaz2wsx",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"api_test"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.55.1.106:30050/metersphere?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.55.1.51:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.55.1.51:9030",\n							"database":"ODS_tes01",\n							"table":"api_test",\n							"column":[\n								"id",\n								"project_id",\n								"name",\n								"description",\n								"scenario_definition",\n								"status",\n								"user_id",\n								"create_time",\n								"update_time"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table ODS_tes01.api_test"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-04 11:57:10', '282', 0, 0, 0, NULL),
	(282, 44, '0 0 0 * * ?', 'api_test_case', '2023-01-04 11:57:10', '2023-01-04 11:57:11', 'admin', NULL, 'FIRST', 'datax-handler', '{\n	"xxlJobId":282,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"1qaz2wsx",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"api_test_case"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.55.1.106:30050/metersphere?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.55.1.51:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.55.1.51:9030",\n							"database":"ODS_tes01",\n							"table":"api_test_case",\n							"column":[\n								"id",\n								"project_id",\n								"name",\n								"priority",\n								"api_definition_id",\n								"description",\n								"request",\n								"create_user_id",\n								"update_user_id",\n								"create_time",\n								"update_time",\n								"num",\n								"tags",\n								"last_result_id",\n								"status",\n								"original_status",\n								"delete_time",\n								"delete_user_id",\n								"version",\n								"order",\n								"case_status",\n								"version_id",\n								"to_be_updated",\n								"to_be_update_Time"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table ODS_tes01.api_test_case"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-04 11:57:10', NULL, 0, 0, 0, NULL),
	(283, 45, '0 0 0 * * ?', '两表关联', '2023-01-04 14:32:11', '2023-01-05 20:15:24', 'admin', NULL, 'FIRST', 'DataGovernHandler', '945973204143308800', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2023-01-04 14:32:11', NULL, 0, 0, 0, NULL),
	(284, 45, '0 0 0 * * ?', '多步骤测试', '2023-01-04 15:48:43', '2023-03-02 10:06:06', 'admin', NULL, 'FIRST', 'DataGovernHandler', '946000520135311559', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2023-01-04 15:48:43', NULL, 0, 0, 0, NULL),
	(285, 45, '0 0 0 * * ?', '自定义规则', '2023-01-04 18:44:21', '2023-03-21 13:13:34', 'admin', NULL, 'FIRST', 'DataGovernHandler', '946064961824620545', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2023-01-04 18:44:21', NULL, 0, 0, 0, NULL),
	(286, 44, '0 0 0 * * ?', 't_order', '2023-01-05 11:43:30', '2023-01-05 11:43:31', 'admin', NULL, 'FIRST', 'datax-handler', '{\n	"xxlJobId":286,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"1qaz2wsx",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"t_order"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.55.1.106:30050/bigdata?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.55.1.51:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.55.1.51:9030",\n							"database":"ODS_tes01",\n							"table":"t_order",\n							"column":[\n								"id",\n								"user_id",\n								"product_count",\n								"price",\n								"create_time",\n								"update_time"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table ODS_tes01.t_order"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-05 11:43:30', '', 0, 0, 0, NULL),
	(287, 45, '0 0 0 * * ?', '数值计算', '2023-01-05 11:47:23', '2023-01-05 20:15:46', 'admin', NULL, 'FIRST', 'DataGovernHandler', '946064961824620619', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2023-01-05 11:47:23', NULL, 0, 0, 0, NULL),
	(288, 45, '0 0 0 * * ?', '大表测试', '2023-01-05 15:27:05', '2023-03-10 10:10:46', 'admin', NULL, 'FIRST', 'DataGovernHandler', '946064961824620628', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2023-01-05 15:27:05', NULL, 0, 0, 0, NULL),
	(289, 45, '0 0 0 * * ?', '异常测试', '2023-01-05 15:27:51', '2023-03-21 13:13:27', 'admin', NULL, 'FIRST', 'DataGovernHandler', '946064961824620667', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2023-01-05 15:27:51', NULL, 0, 0, 0, NULL),
	(290, 45, '0 0 0 * * ?', '数据治理测试', '2023-01-06 09:43:54', '2023-03-21 13:13:21', 'admin', NULL, 'FIRST', 'DataGovernHandler', '946064961824620734', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2023-01-06 09:43:54', NULL, 0, 0, 0, NULL),
	(291, 44, '0 0 0 * * ?', 'algorithm_global_param', '2023-01-06 11:09:47', '2023-01-06 11:09:49', 'admin', NULL, 'FIRST', 'datax-handler', '{\n	"xxlJobId":291,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"1qaz2wsx",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"algorithm_global_param"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.55.1.113:3306/syncplant?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.55.1.51:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.55.1.51:9030",\n							"database":"ODS_tes01",\n							"table":"algorithm_global_param",\n							"column":[\n								"id",\n								"PROJECT_ID",\n								"TYPE",\n								"NAME",\n								"DATA_TYPE",\n								"VALUE",\n								"REMARK",\n								"TAG_ID",\n								"INIT_VALUE"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table ODS_tes01.algorithm_global_param"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-06 11:09:47', '292', 0, 0, 0, NULL),
	(292, 44, '0 0 0 * * ?', 'algorithm_library', '2023-01-06 11:09:48', '2023-01-06 11:09:49', 'admin', NULL, 'FIRST', 'datax-handler', '{\n	"xxlJobId":292,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"1qaz2wsx",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"algorithm_library"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.55.1.113:3306/syncplant?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.55.1.51:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.55.1.51:9030",\n							"database":"ODS_tes01",\n							"table":"algorithm_library",\n							"column":[\n								"CREATE_BY",\n								"CREATE_TIME",\n								"LAST_UPDATE_BY",\n								"LAST_UPDATE_TIME",\n								"id",\n								"LIB_CODE",\n								"LIB_NAME",\n								"TYPE_ID",\n								"CATEGORY",\n								"DESCRIPTION",\n								"ATTACHMENT",\n								"PUB_STATE",\n								"VERSION",\n								"IMPORT_LIB"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table ODS_tes01.algorithm_library"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-06 11:09:48', NULL, 0, 0, 0, NULL),
	(293, 45, '0 0 0 * * ?', 'apitemp', '2023-01-06 11:22:36', '2023-01-06 13:23:25', 'admin', NULL, 'FIRST', 'DataServiceHandler', '947337285756518789', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2023-01-06 11:22:36', NULL, 0, 0, 0, NULL),
	(294, 42, '0 0 15 * * ? *', '121212', '2023-01-12 14:32:27', '2023-01-12 14:46:25', '许亮亮', NULL, 'FIRST', 'executeRule', '1613423401046192130', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-12 14:32:27', NULL, 0, 0, 0, NULL),
	(295, 42, '0 0 15 * * ? *', '121212', '2023-01-12 14:46:25', '2023-01-12 15:25:06', '许亮亮', NULL, 'FIRST', 'executeRule', '1613423401046192130', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-12 14:46:25', NULL, 0, 0, 0, NULL),
	(296, 42, '0 0 15 * * ? *', '121212', '2023-01-12 15:25:06', '2023-03-16 09:18:48', '许亮亮', NULL, 'FIRST', 'executeRule', '1613423401046192130', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-12 15:25:06', NULL, 0, 0, 0, NULL),
	(297, 42, '5,15,25,35,45,55 * * * * ? *', '测试', '2023-01-28 14:02:19', '2023-01-28 14:03:07', '曹瑞', NULL, 'FIRST', 'executeRule', '1619214257722601473', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-01-28 14:02:19', NULL, 0, 0, 0, NULL),
	(298, 42, '11,12,13,24,47 * * * * ? *', 'ccccc', '2023-02-03 16:21:10', '2023-02-03 16:23:55', '曹瑞', NULL, 'FIRST', 'executeRule', '1621423527219478529', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-03 16:21:10', NULL, 0, 0, 0, NULL),
	(299, 42, '11,12,13,24,47 * * * * ? *', 'ccccc', '2023-02-03 16:23:55', '2023-02-03 16:25:35', '曹瑞', NULL, 'FIRST', 'executeRule', '1621423527219478529', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-03 16:23:55', NULL, 0, 0, 0, NULL),
	(300, 42, '11,12,13,24,47 * * * * ? *', 'ccccc', '2023-02-03 16:25:35', '2023-02-03 16:27:43', '曹瑞', NULL, 'FIRST', 'executeRule', '1621423527219478529', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-03 16:25:35', NULL, 0, 0, 0, NULL),
	(301, 42, '11,12,13,24,47 * * * * ? *', 'ccccc', '2023-02-03 16:27:43', '2023-02-03 16:31:19', '曹瑞', NULL, 'FIRST', 'executeRule', '1621423527219478529', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-03 16:27:43', NULL, 0, 0, 0, NULL),
	(302, 42, '11,12,13,24,47 * * * * ? *', 'ccccc', '2023-02-03 16:31:19', '2023-03-16 09:18:43', '曹瑞', NULL, 'FIRST', 'executeRule', '1621423527219478529', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-03 16:31:19', NULL, 0, 0, 0, NULL),
	(303, 42, '0 0 15 * * ? *', '121212', '2023-02-03 16:42:58', '2023-02-03 16:43:04', '曹瑞', NULL, 'FIRST', 'executeRule', '1613423401046192130', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-03 16:42:58', NULL, 0, 0, 0, NULL),
	(304, 42, '10 * * * * ? *', '消息发送', '2023-02-03 16:43:14', '2023-02-03 16:45:32', '曹瑞', NULL, 'FIRST', 'executeRule', '1604649253025419266', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-03 16:43:14', NULL, 0, 0, 0, NULL),
	(305, 45, '* * * 1/1 * ?', '默认描述:ApiRequestHandler，请及时修改描述和执行器', '2023-02-08 09:31:51', '2023-02-08 09:31:51', '自动注入', NULL, 'FIRST', 'ApiRequestHandler', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-08 09:31:51', NULL, 0, 0, 0, NULL),
	(306, 44, '0 0 0 * * ?', 'ruleinfo', '2023-02-08 10:25:14', '2023-02-08 10:25:14', 'XXL', NULL, 'RANDOM', 'datax-handler', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-08 10:25:14', NULL, 0, 0, 0, NULL),
	(307, 44, '0 0 0 * * ?', 'ruleinfo', '2023-02-08 10:25:23', '2023-02-08 10:25:23', 'XXL', NULL, 'RANDOM', 'datax-handler', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-08 10:25:23', NULL, 0, 0, 0, NULL),
	(308, 44, '0 0 0 * * ?', 'ruleinfo', '2023-02-08 10:27:26', '2023-02-08 10:27:26', 'XXL', NULL, 'RANDOM', 'datax-handler', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-08 10:27:26', NULL, 0, 0, 0, NULL),
	(311, 44, '0 0 0 * * ?', 'act_evt_log', '2023-02-09 13:50:55', '2023-02-09 13:50:58', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":311,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_evt_log"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_evt_log",\n							"column":[\n								"LOG_NR_",\n								"TYPE_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"TASK_ID_",\n								"TIME_STAMP_",\n								"USER_ID_",\n								"DATA_",\n								"LOCK_OWNER_",\n								"LOCK_TIME_",\n								"IS_PROCESSED_",\n								"ISDELETE",\n								"SITEID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_evt_log`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:50:55', NULL, 0, 0, 0, NULL),
	(312, 44, '0 0 0 * * ?', 'act_ge_bytearray', '2023-02-09 13:50:58', '2023-02-09 13:50:59', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":312,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:50:58', NULL, 0, 0, 0, NULL),
	(313, 44, '0 0 0 * * ?', 'act_ge_bytearray_arc', '2023-02-09 13:50:59', '2023-02-09 13:50:59', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":313,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray_arc"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray_arc",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray_arc`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:50:59', NULL, 0, 0, 0, NULL),
	(314, 44, '0 0 0 * * ?', 'act_ge_bytearray_backup', '2023-02-09 13:50:59', '2023-02-09 13:51:00', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":314,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray_backup"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray_backup",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray_backup`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:50:59', NULL, 0, 0, 0, NULL),
	(315, 44, '0 0 0 * * ?', 'act_ge_property', '2023-02-09 13:51:00', '2023-02-09 13:51:01', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":315,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_property"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_property",\n							"column":[\n								"NAME_",\n								"VALUE_",\n								"REV_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_property`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:00', NULL, 0, 0, 0, NULL),
	(316, 44, '0 0 0 * * ?', 'act_hi_actinst', '2023-02-09 13:51:01', '2023-02-09 13:51:01', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":316,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_actinst"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_actinst",\n							"column":[\n								"ID_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"ACT_ID_",\n								"TASK_ID_",\n								"CALL_PROC_INST_ID_",\n								"ACT_NAME_",\n								"ACT_TYPE_",\n								"ASSIGNEE_",\n								"START_TIME_",\n								"END_TIME_",\n								"DURATION_",\n								"TENANT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_actinst`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:01', NULL, 0, 0, 0, NULL),
	(317, 44, '0 0 0 * * ?', 'act_hi_actinst_arc', '2023-02-09 13:51:01', '2023-02-09 13:51:02', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":317,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_actinst_arc"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_actinst_arc",\n							"column":[\n								"ID_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"ACT_ID_",\n								"TASK_ID_",\n								"CALL_PROC_INST_ID_",\n								"ACT_NAME_",\n								"ACT_TYPE_",\n								"ASSIGNEE_",\n								"START_TIME_",\n								"END_TIME_",\n								"DURATION_",\n								"TENANT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_actinst_arc`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:01', NULL, 0, 0, 0, NULL),
	(318, 44, '0 0 0 * * ?', 'act_hi_attachment', '2023-02-09 13:51:02', '2023-02-09 13:51:02', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":318,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_attachment"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_attachment",\n							"column":[\n								"ID_",\n								"REV_",\n								"USER_ID_",\n								"NAME_",\n								"DESCRIPTION_",\n								"TYPE_",\n								"TASK_ID_",\n								"PROC_INST_ID_",\n								"URL_",\n								"CONTENT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID",\n								"TIME_"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_attachment`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:02', NULL, 0, 0, 0, NULL),
	(319, 44, '0 0 0 * * ?', 'act_hi_comment', '2023-02-09 13:51:02', '2023-02-09 13:51:03', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":319,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_comment"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_comment",\n							"column":[\n								"ORGANID",\n								"USER_ID_",\n								"TASK_ID_",\n								"PROC_INST_ID_",\n								"ACTION_",\n								"MESSAGE_",\n								"FULL_MSG_",\n								"ISDELETE",\n								"SITEID",\n								"ID_",\n								"TYPE_",\n								"TIME_"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_comment`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:02', NULL, 0, 0, 0, NULL),
	(321, 44, '0 0 0 * * ?', 'act_evt_log', '2023-02-09 13:51:14', '2023-02-09 13:51:14', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":321,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_evt_log"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_evt_log",\n							"column":[\n								"LOG_NR_",\n								"TYPE_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"TASK_ID_",\n								"TIME_STAMP_",\n								"USER_ID_",\n								"DATA_",\n								"LOCK_OWNER_",\n								"LOCK_TIME_",\n								"IS_PROCESSED_",\n								"ISDELETE",\n								"SITEID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_evt_log`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:14', NULL, 0, 0, 0, NULL),
	(322, 44, '0 0 0 * * ?', 'act_ge_bytearray', '2023-02-09 13:51:14', '2023-02-09 13:51:14', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":322,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:14', NULL, 0, 0, 0, NULL),
	(323, 44, '0 0 0 * * ?', 'act_ge_bytearray_arc', '2023-02-09 13:51:15', '2023-02-09 13:51:15', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":323,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray_arc"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray_arc",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray_arc`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:15', NULL, 0, 0, 0, NULL),
	(324, 44, '0 0 0 * * ?', 'act_ge_bytearray_backup', '2023-02-09 13:51:15', '2023-02-09 13:51:15', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":324,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray_backup"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray_backup",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray_backup`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:15', NULL, 0, 0, 0, NULL),
	(325, 44, '0 0 0 * * ?', 'act_ge_property', '2023-02-09 13:51:15', '2023-02-09 13:51:16', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":325,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_property"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_property",\n							"column":[\n								"NAME_",\n								"VALUE_",\n								"REV_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_property`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:15', NULL, 0, 0, 0, NULL),
	(326, 44, '0 0 0 * * ?', 'act_hi_actinst', '2023-02-09 13:51:16', '2023-02-09 13:51:16', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":326,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_actinst"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_actinst",\n							"column":[\n								"ID_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"ACT_ID_",\n								"TASK_ID_",\n								"CALL_PROC_INST_ID_",\n								"ACT_NAME_",\n								"ACT_TYPE_",\n								"ASSIGNEE_",\n								"START_TIME_",\n								"END_TIME_",\n								"DURATION_",\n								"TENANT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_actinst`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:16', NULL, 0, 0, 0, NULL),
	(327, 44, '0 0 0 * * ?', 'act_hi_actinst_arc', '2023-02-09 13:51:16', '2023-02-09 13:51:17', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":327,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_actinst_arc"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_actinst_arc",\n							"column":[\n								"ID_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"ACT_ID_",\n								"TASK_ID_",\n								"CALL_PROC_INST_ID_",\n								"ACT_NAME_",\n								"ACT_TYPE_",\n								"ASSIGNEE_",\n								"START_TIME_",\n								"END_TIME_",\n								"DURATION_",\n								"TENANT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_actinst_arc`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:16', NULL, 0, 0, 0, NULL),
	(328, 44, '0 0 0 * * ?', 'act_hi_attachment', '2023-02-09 13:51:17', '2023-02-09 13:51:17', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":328,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_attachment"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_attachment",\n							"column":[\n								"ID_",\n								"REV_",\n								"USER_ID_",\n								"NAME_",\n								"DESCRIPTION_",\n								"TYPE_",\n								"TASK_ID_",\n								"PROC_INST_ID_",\n								"URL_",\n								"CONTENT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID",\n								"TIME_"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_attachment`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:17', NULL, 0, 0, 0, NULL),
	(329, 44, '0 0 0 * * ?', 'act_hi_comment', '2023-02-09 13:51:17', '2023-02-09 13:51:17', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":329,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_comment"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_comment",\n							"column":[\n								"ORGANID",\n								"USER_ID_",\n								"TASK_ID_",\n								"PROC_INST_ID_",\n								"ACTION_",\n								"MESSAGE_",\n								"FULL_MSG_",\n								"ISDELETE",\n								"SITEID",\n								"ID_",\n								"TYPE_",\n								"TIME_"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_comment`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:17', NULL, 0, 0, 0, NULL),
	(331, 44, '0 0 0 * * ?', 'act_evt_log', '2023-02-09 13:51:24', '2023-02-09 13:51:24', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":331,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_evt_log"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_evt_log",\n							"column":[\n								"LOG_NR_",\n								"TYPE_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"TASK_ID_",\n								"TIME_STAMP_",\n								"USER_ID_",\n								"DATA_",\n								"LOCK_OWNER_",\n								"LOCK_TIME_",\n								"IS_PROCESSED_",\n								"ISDELETE",\n								"SITEID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_evt_log`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:24', NULL, 0, 0, 0, NULL),
	(332, 44, '0 0 0 * * ?', 'act_ge_bytearray', '2023-02-09 13:51:24', '2023-02-09 13:51:25', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":332,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:24', NULL, 0, 0, 0, NULL),
	(333, 44, '0 0 0 * * ?', 'act_ge_bytearray_arc', '2023-02-09 13:51:25', '2023-02-09 13:51:26', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":333,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray_arc"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray_arc",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray_arc`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:25', NULL, 0, 0, 0, NULL),
	(334, 44, '0 0 0 * * ?', 'act_ge_bytearray_backup', '2023-02-09 13:51:26', '2023-02-09 13:51:26', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":334,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray_backup"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray_backup",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray_backup`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:26', NULL, 0, 0, 0, NULL),
	(335, 44, '0 0 0 * * ?', 'act_ge_property', '2023-02-09 13:51:26', '2023-02-09 13:51:26', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":335,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_property"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_property",\n							"column":[\n								"NAME_",\n								"VALUE_",\n								"REV_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_property`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:26', NULL, 0, 0, 0, NULL),
	(336, 44, '0 0 0 * * ?', 'act_hi_actinst', '2023-02-09 13:51:27', '2023-02-09 13:51:27', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":336,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_actinst"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_actinst",\n							"column":[\n								"ID_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"ACT_ID_",\n								"TASK_ID_",\n								"CALL_PROC_INST_ID_",\n								"ACT_NAME_",\n								"ACT_TYPE_",\n								"ASSIGNEE_",\n								"START_TIME_",\n								"END_TIME_",\n								"DURATION_",\n								"TENANT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_actinst`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:27', NULL, 0, 0, 0, NULL),
	(337, 44, '0 0 0 * * ?', 'act_hi_actinst_arc', '2023-02-09 13:51:27', '2023-02-09 13:51:27', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":337,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_actinst_arc"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_actinst_arc",\n							"column":[\n								"ID_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"ACT_ID_",\n								"TASK_ID_",\n								"CALL_PROC_INST_ID_",\n								"ACT_NAME_",\n								"ACT_TYPE_",\n								"ASSIGNEE_",\n								"START_TIME_",\n								"END_TIME_",\n								"DURATION_",\n								"TENANT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_actinst_arc`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:27', NULL, 0, 0, 0, NULL),
	(338, 44, '0 0 0 * * ?', 'act_hi_attachment', '2023-02-09 13:51:27', '2023-02-09 13:51:28', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":338,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_attachment"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_attachment",\n							"column":[\n								"ID_",\n								"REV_",\n								"USER_ID_",\n								"NAME_",\n								"DESCRIPTION_",\n								"TYPE_",\n								"TASK_ID_",\n								"PROC_INST_ID_",\n								"URL_",\n								"CONTENT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID",\n								"TIME_"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_attachment`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:27', NULL, 0, 0, 0, NULL),
	(339, 44, '0 0 0 * * ?', 'act_hi_comment', '2023-02-09 13:51:28', '2023-02-09 13:51:28', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":339,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_comment"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_comment",\n							"column":[\n								"ORGANID",\n								"USER_ID_",\n								"TASK_ID_",\n								"PROC_INST_ID_",\n								"ACTION_",\n								"MESSAGE_",\n								"FULL_MSG_",\n								"ISDELETE",\n								"SITEID",\n								"ID_",\n								"TYPE_",\n								"TIME_"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_comment`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:51:28', NULL, 0, 0, 0, NULL),
	(341, 44, '0 0 0 * * ?', 'act_evt_log', '2023-02-09 13:56:59', '2023-02-09 13:57:05', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":341,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_evt_log"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_evt_log",\n							"column":[\n								"LOG_NR_",\n								"TYPE_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"TASK_ID_",\n								"TIME_STAMP_",\n								"USER_ID_",\n								"DATA_",\n								"LOCK_OWNER_",\n								"LOCK_TIME_",\n								"IS_PROCESSED_",\n								"ISDELETE",\n								"SITEID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_evt_log`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:56:59', NULL, 0, 0, 0, NULL),
	(342, 44, '0 0 0 * * ?', 'act_ge_bytearray', '2023-02-09 13:57:00', '2023-02-09 13:57:00', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":342,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:57:00', NULL, 0, 0, 0, NULL),
	(343, 44, '0 0 0 * * ?', 'act_ge_bytearray_arc', '2023-02-09 13:57:00', '2023-02-09 13:57:01', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":343,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray_arc"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray_arc",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray_arc`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:57:00', NULL, 0, 0, 0, NULL),
	(344, 44, '0 0 0 * * ?', 'act_ge_bytearray_backup', '2023-02-09 13:57:01', '2023-02-09 13:57:01', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":344,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_bytearray_backup"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_bytearray_backup",\n							"column":[\n								"ID_",\n								"REV_",\n								"NAME_",\n								"DEPLOYMENT_ID_",\n								"BYTES_",\n								"GENERATED_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_bytearray_backup`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:57:01', NULL, 0, 0, 0, NULL),
	(345, 44, '0 0 0 * * ?', 'act_ge_property', '2023-02-09 13:57:01', '2023-02-09 13:57:02', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":345,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_ge_property"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_ge_property",\n							"column":[\n								"NAME_",\n								"VALUE_",\n								"REV_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_ge_property`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:57:01', NULL, 0, 0, 0, NULL),
	(346, 44, '0 0 0 * * ?', 'act_hi_actinst', '2023-02-09 13:57:02', '2023-02-09 13:57:02', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":346,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_actinst"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_actinst",\n							"column":[\n								"ID_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"ACT_ID_",\n								"TASK_ID_",\n								"CALL_PROC_INST_ID_",\n								"ACT_NAME_",\n								"ACT_TYPE_",\n								"ASSIGNEE_",\n								"START_TIME_",\n								"END_TIME_",\n								"DURATION_",\n								"TENANT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_actinst`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:57:02', NULL, 0, 0, 0, NULL),
	(347, 44, '0 0 0 * * ?', 'act_hi_actinst_arc', '2023-02-09 13:57:02', '2023-02-09 13:57:03', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":347,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_actinst_arc"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_actinst_arc",\n							"column":[\n								"ID_",\n								"PROC_DEF_ID_",\n								"PROC_INST_ID_",\n								"EXECUTION_ID_",\n								"ACT_ID_",\n								"TASK_ID_",\n								"CALL_PROC_INST_ID_",\n								"ACT_NAME_",\n								"ACT_TYPE_",\n								"ASSIGNEE_",\n								"START_TIME_",\n								"END_TIME_",\n								"DURATION_",\n								"TENANT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_actinst_arc`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:57:02', NULL, 0, 0, 0, NULL),
	(348, 44, '0 0 0 * * ?', 'act_hi_attachment', '2023-02-09 13:57:03', '2023-02-09 13:57:03', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":348,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_attachment"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_attachment",\n							"column":[\n								"ID_",\n								"REV_",\n								"USER_ID_",\n								"NAME_",\n								"DESCRIPTION_",\n								"TYPE_",\n								"TASK_ID_",\n								"PROC_INST_ID_",\n								"URL_",\n								"CONTENT_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID",\n								"TIME_"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_attachment`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:57:03', NULL, 0, 0, 0, NULL),
	(349, 44, '0 0 0 * * ?', 'act_hi_comment', '2023-02-09 13:57:03', '2023-02-09 13:57:03', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":349,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_comment"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_comment",\n							"column":[\n								"ORGANID",\n								"USER_ID_",\n								"TASK_ID_",\n								"PROC_INST_ID_",\n								"ACTION_",\n								"MESSAGE_",\n								"FULL_MSG_",\n								"ISDELETE",\n								"SITEID",\n								"ID_",\n								"TYPE_",\n								"TIME_"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_comment`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:57:03', NULL, 0, 0, 0, NULL),
	(350, 44, '0 0 0 * * ?', 'act_hi_identitylink', '2023-02-09 13:57:04', '2023-02-09 13:57:05', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":350,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_identitylink"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_identitylink",\n							"column":[\n								"ID_",\n								"GROUP_ID_",\n								"TYPE_",\n								"USER_ID_",\n								"TASK_ID_",\n								"PROC_INST_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_identitylink`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:57:04', NULL, 0, 0, 0, NULL),
	(351, 44, '0 0 0 * * ?', 'act_hi_identitylink_arc', '2023-02-09 13:57:05', '2023-02-09 13:57:05', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":351,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"mysqlreader",\n						"parameter":{\n							"username":"root",\n							"password":"210Ndcs",\n							"column":[\n								"*"\n							],\n							"connection":[\n								{\n									"table":[\n										"act_hi_identitylink_arc"\n									],\n									"jdbcUrl":[\n										"jdbc:mysql://10.88.12.35:5648/sync5_mis?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai"\n									]\n								}\n							]\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_SIS",\n							"table":"act_hi_identitylink_arc",\n							"column":[\n								"ID_",\n								"GROUP_ID_",\n								"TYPE_",\n								"USER_ID_",\n								"TASK_ID_",\n								"PROC_INST_ID_",\n								"ISDELETE",\n								"SITEID",\n								"ORGANID"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_SIS`.`act_hi_identitylink_arc`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:57:05', NULL, 0, 0, 0, NULL),
	(352, 44, '0 0 0 * * ?', 'blood', '2023-02-09 13:57:40', '2023-02-09 13:57:40', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":352,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"apireader",\n						"parameter":{\n							"apiConfig":"eyJhcGlEZXNjIjoiIiwiYXBpTmFtZSI6ImJsb29kIiwiY3JlYXRlVGltZSI6MTY3NTkyMjE0MTk3\\nMCwiY3JlYXRlVXNlciI6Iui2hee6p+euoeeQhuWRmCIsImlkIjoiOTcyNTUyMDMzNzI4OTg3MTM4\\nIiwianNvbkZpZWxkU3RyIjoiW3tcIm5hbWVcIjpcInNvdXJjZVRhYmxlXCIsXCJqc29uUGF0aFwi\\nOlwiJC5bJ3NvdXJjZVRhYmxlJ11cIixcImlkXCI6XCI5NzI1NTIwMzM3Mjg5ODcxMzZcIixcImNo\\nZWNrXCI6dHJ1ZSxcInR5cGVcIjoxLjAsXCJ2YWx1ZVwiOltcIltcXFwiPGRlZmF1bHQ+LnRhYjJc\\nXFwiLFxcXCI8ZGVmYXVsdD4udGFiM1xcXCJdXCJdLFwib3JpZ2luTmFtZVwiOlwic291cmNlVGFi\\nbGVcIn0se1wibmFtZVwiOlwidGFyZ2V0VGFibGVcIixcImpzb25QYXRoXCI6XCIkLlsndGFyZ2V0\\nVGFibGUnXVwiLFwiaWRcIjpcIjk3MjU1MjAzMzcyODk4NzEzN1wiLFwiY2hlY2tcIjp0cnVlLFwi\\ndHlwZVwiOjEuMCxcInZhbHVlXCI6W1wiPGRlZmF1bHQ+LnRhYjFcIl0sXCJvcmlnaW5OYW1lXCI6\\nXCJ0YXJnZXRUYWJsZVwifV0iLCJuZWVkRmllbGRTdHIiOiJbe1wiY2hlY2tcIjp0cnVlLFwianNv\\nblBhdGhcIjpcIiQuWydzb3VyY2VUYWJsZSddXCIsXCJuYW1lXCI6XCJzb3VyY2VUYWJsZVwiLFwi\\nb3JpZ2luTmFtZVwiOlwic291cmNlVGFibGVcIixcInR5cGVcIjoxLFwidmFsdWVcIjpbXCJbXFxc\\nIjxkZWZhdWx0Pi50YWIyXFxcIixcXFwiPGRlZmF1bHQ+LnRhYjNcXFwiXVwiXX0se1wiY2hlY2tc\\nIjp0cnVlLFwianNvblBhdGhcIjpcIiQuWyd0YXJnZXRUYWJsZSddXCIsXCJuYW1lXCI6XCJ0YXJn\\nZXRUYWJsZVwiLFwib3JpZ2luTmFtZVwiOlwidGFyZ2V0VGFibGVcIixcInR5cGVcIjoxLFwidmFs\\ndWVcIjpbXCI8ZGVmYXVsdD4udGFiMVwiXX1dIiwicHJldmlld051bSI6MTAsInJlcXVlc3RDb25m\\naWciOiJ7XCJhdXRoXCI6ZmFsc2UsXCJhdXRoUHdkXCI6XCJcIixcImF1dGhVc3JcIjpcIlwiLFwi\\nYm9keVwiOntcImt2c1wiOlt7XCJpZFwiOlwiNzY3NTcyMzEwNDA2MDU2OVwiLFwibmFtZVwiOlwi\\nXCIsXCJ2YWx1ZVwiOlwiXCIsXCJkZXNjcmlwdGlvblwiOlwiXCIsXCJkZWxcIjpmYWxzZX1dLFwi\\ncmF3XCI6XCJ7XFxcInNxbFxcXCI6XFxcImluc2VydCBpbnRvIHRhYjEgc2VsZWN0IHRhYjIuaWQs\\ndGFiMi5uYW1lLHRhYjIuY29kZSx0YWIzLnRpbWUgZnJvbSB0YWIyIGpvaW4gdGFiMyBvbiB0YWIy\\nLmlkPXRhYjMuaWQ7XFxcIn1cIixcInR5cGVcIjpcIkpTT05cIn0sXCJoZWFkZXJcIjpbe1wiaWRc\\nIjpcIjc5NzA3NTk4NDQwMDI4OTIwMTI2MFwiLFwibmFtZVwiOlwiQ29udGVudC1UeXBlXCIsXCJ2\\nYWx1ZVwiOlwiYXBwbGljYXRpb24vanNvblwiLFwiZGVzY3JpcHRpb25cIjpcIlwiLFwiZGVsXCI6\\nXCJ0cnVlXCJ9LHtcImlkXCI6XCI4NTU0MjAxNDUyOTA0MjQxXCIsXCJuYW1lXCI6XCJcIixcInZh\\nbHVlXCI6XCJcIixcImRlc2NyaXB0aW9uXCI6XCJcIixcImRlbFwiOlwidHJ1ZVwifV19IiwicmVx\\ndWVzdFR5cGUiOjIsInJlcXVlc3RVcmwiOiJodHRwOi8vMTAuNDQuMi4xMDM6ODg5MC9hbmFseXNl\\nU3FsIn0="\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_DT_MES",\n							"table":"blood",\n							"column":[\n								"sourceTable",\n								"targetTable"\n							],\n							"username":"root",\n							"password":"",\n							"preSql":[\n								"truncate table `ODS_DT_MES`.`blood`"\n							],\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-09 13:57:40', NULL, 0, 0, 0, NULL),
	(353, 44, '0 0 0 * * ?', 'ceshi', '2023-02-14 09:05:19', '2023-02-14 09:05:19', 'admin', NULL, 'RANDOM', 'datax-handler', '{\n	"xxlJobId":353,\n	"jobInfo":{\n		"job":{\n			"setting":{\n				"speed":{\n					"channel":2\n				}\n			},\n			"content":[\n				{\n					"reader":{\n						"name":"apireader",\n						"parameter":{\n							"apiConfig":"eyJhcGlEZXNjIjoiIiwiYXBpTmFtZSI6ImNlc2hpIiwiY3JlYXRlVGltZSI6MTY3NjMzNjY5MDkw\\nMiwiY3JlYXRlVXNlciI6Iui2hee6p+euoeeQhuWRmCIsImlkIjoiOTc2MjMyMDkwNTU3MjI1NTE1\\nIiwianNvbkZpZWxkU3RyIjoiW3tcImNoaWxkcmVuXCI6W3tcIm5hbWVcIjpcImlkXCIsXCJqc29u\\nUGF0aFwiOlwiJC5saXN0WypdLlsnaWQnXVwiLFwiaWRcIjpcIjk3NjIzMjA4MTk2NzI4ODY5MFwi\\nLFwiY2hlY2tcIjp0cnVlLFwidHlwZVwiOjEuMCxcInZhbHVlXCI6W1wiMVwiLFwiMlwiLFwiM1wi\\nLFwiNFwiLFwiNVwiLFwiNlwiLFwiN1wiLFwiOFwiLFwiOVwiLFwiMTBcIl0sXCJvcmlnaW5OYW1l\\nXCI6XCJpZFwifSx7XCJuYW1lXCI6XCJudW1iZXJcIixcImpzb25QYXRoXCI6XCIkLmxpc3RbKl0u\\nWydudW1iZXInXVwiLFwiaWRcIjpcIjk3NjIzMjA4MTk2NzI4ODY5MVwiLFwiY2hlY2tcIjp0cnVl\\nLFwidHlwZVwiOjEuMCxcInZhbHVlXCI6W1wiOFwiLFwiMlwiLFwiNlwiLFwiOFwiLFwiNVwiLFwi\\nNlwiLFwiNlwiLFwiMVwiLFwiMVwiLFwiOFwiXSxcIm9yaWdpbk5hbWVcIjpcIm51bWJlclwifSx7\\nXCJuYW1lXCI6XCJuYW1lXCIsXCJqc29uUGF0aFwiOlwiJC5saXN0WypdLlsnbmFtZSddXCIsXCJp\\nZFwiOlwiOTc2MjMyMDgxOTY3Mjg4NjkyXCIsXCJjaGVja1wiOnRydWUsXCJ0eXBlXCI6MS4wLFwi\\ndmFsdWVcIjpbXCJSdXRoIFdpbGxpYW1zXCIsXCJDeW50aGlhIFBlcmV6XCIsXCJDYXJvbCBBbmRl\\ncnNvblwiLFwiR2FyeSBIYWxsXCIsXCJCcmlhbiBKb2huc29uXCIsXCJKZW5uaWZlciBXaGl0ZVwi\\nLFwiU2NvdHQgQW5kZXJzb25cIixcIkFudGhvbnkgSm9uZXNcIixcIkFteSBXaWxzb25cIixcIkdl\\nb3JnZSBNYXJ0aW5cIl0sXCJvcmlnaW5OYW1lXCI6XCJuYW1lXCJ9LHtcIm5hbWVcIjpcImNvbG9y\\nXCIsXCJqc29uUGF0aFwiOlwiJC5saXN0WypdLlsnY29sb3InXVwiLFwiaWRcIjpcIjk3NjIzMjA4\\nMTk2NzI4ODY5M1wiLFwiY2hlY2tcIjp0cnVlLFwidHlwZVwiOjEuMCxcInZhbHVlXCI6W1wiIzk4\\nNzlmMlwiLFwiIzdjZjI3OVwiLFwiI2YyNzlhMFwiLFwiIzc5YzNmMlwiLFwiI2U2ZjI3OVwiLFwi\\nI2RhNzlmMlwiLFwiIzc5ZjJiN1wiLFwiI2YyOTM3OVwiLFwiIzc5ODFmMlwiLFwiI2E1ZjI3OVwi\\nXSxcIm9yaWdpbk5hbWVcIjpcImNvbG9yXCJ9LHtcIm5hbWVcIjpcInRpdGxlXCIsXCJqc29uUGF0\\naFwiOlwiJC5saXN0WypdLlsndGl0bGUnXVwiLFwiaWRcIjpcIjk3NjIzMjA4MTk2NzI4ODY5NFwi\\nLFwiY2hlY2tcIjp0cnVlLFwidHlwZVwiOjEuMCxcInZhbHVlXCI6W1wiSGp1Z3AgTHVoaXhqamYg\\nRXJkdXQgQXVjYiBZc21weGZmblwiLFwiT3JvdXMgRWpoa29ldWN1ayBNb2dxIFByZCBGc3FxXCIs\\nXCJReXcgT2RzdWlpdWIgUHJwdWlnIFBxdmF6YWpoIEh2bHdkayBGeWJjaVwiLFwiQ2l2bnJzZWwg\\nRWdnbCBIa3h2eCBMaXVvZSBXZHZwa3dxeCBLa3hhcnNwcGUgWXZuZHJrXCIsXCJIcm5xeCBSamRu\\ncyBZeW9ka2NqbXllIEZucmtjdlwiLFwiV25ldHRpa25xeiBTZGcgUmlmaHIgWGR3Y3NkbGYgTG12\\nZWVqcXNcIixcIlRzbWcgQ3Nxbml3bCBJZ29nd2IgWHVyd2VoYm5xIEpsb3dcIixcIlRrdG1wY2V3\\nciBMcHhkenpucCBDY2ttIEVkY2toZ2ZvcmcgRXhiZWpyb2ZcIixcIk51a2EgSHd0YnF1cHEgSmxh\\nayBNZWdiaCBQd2xqaFwiLFwiRHVmYW9rIFF6bGRydiBJZnFxcWxcIl0sXCJvcmlnaW5OYW1lXCI6\\nXCJ0aXRsZVwifSx7XCJuYW1lXCI6XCJ1cmxcIixcImpzb25QYXRoXCI6XCIkLmxpc3RbKl0uWyd1\\ncmwnXVwiLFwiaWRcIjpcIjk3NjIzMjA4MTk2NzI4ODY5NVwiLFwiY2hlY2tcIjp0cnVlLFwidHlw\\nZVwiOjEuMCxcInZhbHVlXCI6W1wiaHR0cDovL3ljbnZiZHJsZnouaHQvbm1pZndcIixcImh0dHA6\\nLy9jZHdubWUuY2svaHJzYXNycmdcIixcImh0dHA6Ly9pZ2JnZm1iLmdwL2tvbG93dVwiLFwiaHR0\\ncDovL2lueWtvLm5sL25iYWNcIixcImh0dHA6Ly9oc3Rkdi5hZi9qbGllbHF2XCIsXCJodHRwOi8v\\nemJ0aWtwcGNkLmFkL25sZFwiLFwiaHR0cDovL3dvaHMuam0vcGJpXCIsXCJodHRwOi8vZmpwd3Mu\\nY2Yvdmh3eWJzdnFubVwiLFwiaHR0cDovL2VyaXRxZnIuYnQvZHVoeGN5XCIsXCJodHRwOi8vbG5z\\ndC5iaC9mZXJlXCJdLFwib3JpZ2luTmFtZVwiOlwidXJsXCJ9LHtcIm5hbWVcIjpcImVtYWlsXCIs\\nXCJqc29uUGF0aFwiOlwiJC5saXN0WypdLlsnZW1haWwnXVwiLFwiaWRcIjpcIjk3NjIzMjA4MTk2\\nNzI4ODY5NlwiLFwiY2hlY2tcIjp0cnVlLFwidHlwZVwiOjEuMCxcInZhbHVlXCI6W1wibS5nZnFv\\ncnBuYkBya3F5a291LnBrXCIsXCJyLmF0YmtramJAYnppY2JzcnouemFcIixcImsub2RrQGh5dS50\\nclwiLFwidy5rZXBAbW9uZnBpYnkubWlsXCIsXCJ2LmxhbHdodXlAeWV6cC5tdFwiLFwiZS54bXZw\\nZUBkZGpmLm1sXCIsXCJlLm53d3V0QHpka2lhZmsubWhcIixcIm0ucG90cmNAcm5uZWtmdC5ldlwi\\nLFwiai5lc2R3QHF1dmV5eXhlZS5ja1wiLFwidC5ndW1ocXhibkBxaXVuZi5rZVwiXSxcIm9yaWdp\\nbk5hbWVcIjpcImVtYWlsXCJ9LHtcIm5hbWVcIjpcImltYWdlXCIsXCJqc29uUGF0aFwiOlwiJC5s\\naXN0WypdLlsnaW1hZ2UnXVwiLFwiaWRcIjpcIjk3NjIzMjA4MTk2NzI4ODY5N1wiLFwiY2hlY2tc\\nIjp0cnVlLFwidHlwZVwiOjEuMCxcInZhbHVlXCI6W1wiaHR0cDovL2R1bW15aW1hZ2UuY29tLzIw\\nMHgyMDAvNTBCMzQ3L0ZGRiZ0ZXh0PU1vY2suanNcIixcImh0dHA6Ly9kdW1teWltYWdlLmNvbS8y\\nMDB4MjAwLzUwQjM0Ny9GRkYmdGV4dD1Nb2NrLmpzXCIsXCJodHRwOi8vZHVtbXlpbWFnZS5jb20v\\nMjAweDIwMC81MEIzNDcvRkZGJnRleHQ9TW9jay5qc1wiLFwiaHR0cDovL2R1bW15aW1hZ2UuY29t\\nLzIwMHgyMDAvNTBCMzQ3L0ZGRiZ0ZXh0PU1vY2suanNcIixcImh0dHA6Ly9kdW1teWltYWdlLmNv\\nbS8yMDB4MjAwLzUwQjM0Ny9GRkYmdGV4dD1Nb2NrLmpzXCIsXCJodHRwOi8vZHVtbXlpbWFnZS5j\\nb20vMjAweDIwMC81MEIzNDcvRkZGJnRleHQ9TW9jay5qc1wiLFwiaHR0cDovL2R1bW15aW1hZ2Uu\\nY29tLzIwMHgyMDAvNTBCMzQ3L0ZGRiZ0ZXh0PU1vY2suanNcIixcImh0dHA6Ly9kdW1teWltYWdl\\nLmNvbS8yMDB4MjAwLzUwQjM0Ny9GRkYmdGV4dD1Nb2NrLmpzXCIsXCJodHRwOi8vZHVtbXlpbWFn\\nZS5jb20vMjAweDIwMC81MEIzNDcvRkZGJnRleHQ9TW9jay5qc1wiLFwiaHR0cDovL2R1bW15aW1h\\nZ2UuY29tLzIwMHgyMDAvNTBCMzQ3L0ZGRiZ0ZXh0PU1vY2suanNcIl0sXCJvcmlnaW5OYW1lXCI6\\nXCJpbWFnZVwifSx7XCJuYW1lXCI6XCJkYXRlXCIsXCJqc29uUGF0aFwiOlwiJC5saXN0WypdLlsn\\nZGF0ZSddXCIsXCJpZFwiOlwiOTc2MjMyMDgxOTY3Mjg4Njk4XCIsXCJjaGVja1wiOnRydWUsXCJ0\\neXBlXCI6MS4wLFwidmFsdWVcIjpbXCIxOTkyLTA5LTE0IDE0OjE3OjAyXCIsXCIxOTc2LTAzLTE2\\nIDA0OjE1OjEyXCIsXCIxOTkzLTAxLTI5IDE0OjI1OjQxXCIsXCIxOTk2LTEwLTAyIDEyOjE3OjM4\\nXCIsXCIxOTgyLTEwLTE0IDAxOjQ5OjEwXCIsXCIxOTg0LTA3LTA1IDEyOjQyOjAzXCIsXCIxOTc0\\nLTAxLTAzIDIwOjI2OjE4XCIsXCIxOTc5LTAzLTIzIDE3OjQ5OjAzXCIsXCIyMDEyLTA4LTE3IDE1\\nOjI2OjI2XCIsXCIxOTc0LTA3LTI1IDA4OjU4OjQ1XCJdLFwib3JpZ2luTmFtZVwiOlwiZGF0ZVwi\\nfSx7XCJuYW1lXCI6XCJkYXRlMlwiLFwianNvblBhdGhcIjpcIiQubGlzdFsqXS5bJ2RhdGUyJ11c\\nIixcImlkXCI6XCI5NzYyMzIwODE5NjcyODg2OTlcIixcImNoZWNrXCI6dHJ1ZSxcInR5cGVcIjox\\nLjAsXCJ2YWx1ZVwiOltcIjIwMDAtMDYtMDUgMDM6NTE6NTlcIixcIjIwMDctMTAtMjMgMDA6MTc6\\nMjFcIixcIjE5ODgtMDMtMjYgMDI6MDM6NTFcIixcIjE5NzMtMDktMjQgMDU6MjA6NDFcIixcIjE5\\nNzMtMDUtMzAgMDk6NTQ6NTdcIixcIjE5ODEtMDgtMDkgMTE6MTY6MDJcIixcIjE5OTYtMDUtMjIg\\nMTg6NDY6NTlcIixcIjE5ODktMDktMTUgMDc6MzY6NTBcIixcIjIwMTUtMDEtMTMgMDA6MTU6Mzhc\\nIixcIjE5ODItMDktMTcgMDM6NDA6MzhcIl0sXCJvcmlnaW5OYW1lXCI6XCJkYXRlMlwifSx7XCJu\\nYW1lXCI6XCJjdGl0bGVcIixcImpzb25QYXRoXCI6XCIkLmxpc3RbKl0uWydjdGl0bGUnXVwiLFwi\\naWRcIjpcIjk3NjIzMjA4MTk2NzI4ODcwMFwiLFwiY2hlY2tcIjp0cnVlLFwidHlwZVwiOjEuMCxc\\nInZhbHVlXCI6W1wi5Lyg56S654Wn5b6A6LW35oiY57u05rS+XCIsXCLliLbmiornu4TluLjmmK/m\\nnInnva7pqaxcIixcIuWutumCo+S7o+WHoOS4k+WMlumZpOiupFwiLFwi5Zy65a6M5Yiw57O75LiO\\n5byP5bel5Y20XCIsXCLlhpzlip7pqozopb/ov5DlpbnlhazlhptcIixcIuaPkOmFuOeUqOWPiOes\\nrOWFiOagh+autVwiLFwi5Y+W5Lmf5rK55Y206Zeu5a2Q5YaN6ZeoXCIsXCLkuqfpgKDkuJzovrnn\\nhafliIbmraTkuJRcIixcIuiCsuaIluWHuuW5tOS6uuaWl+WtmOWPr1wiLFwi5aSH56iL5p2l6L2m\\n572u6ZOB5rOV6K+GXCJdLFwib3JpZ2luTmFtZVwiOlwiY3RpdGxlXCJ9LHtcIm5hbWVcIjpcImNh\\nbm1lXCIsXCJqc29uUGF0aFwiOlwiJC5saXN0WypdLlsnY2FubWUnXVwiLFwiaWRcIjpcIjk3NjIz\\nMjA4MTk2NzI4ODcwMVwiLFwiY2hlY2tcIjp0cnVlLFwidHlwZVwiOjEuMCxcInZhbHVlXCI6W1wi\\n5pa55piOXCIsXCLoooHmnbBcIixcIuiUoeaVj1wiLFwi6JGj6Z2ZXCIsXCLmr5voibNcIixcIuS9\\nlemdmVwiLFwi5bSU6ZyeXCIsXCLotL7li4dcIixcIuWImOengOWFsFwiLFwi5p2o5qGC6IuxXCJd\\nLFwib3JpZ2luTmFtZVwiOlwiY2FubWVcIn0se1wibmFtZVwiOlwiY2FkZFwiLFwianNvblBhdGhc\\nIjpcIiQubGlzdFsqXS5bJ2NhZGQnXVwiLFwiaWRcIjpcIjk3NjIzMjA4MTk2NzI4ODcwMlwiLFwi\\nY2hlY2tcIjp0cnVlLFwidHlwZVwiOjEuMCxcInZhbHVlXCI6W1wi5LiK5rW35ryz5bee5biC55m7\\n5bCB5biCXCIsXCLopb/ol4/oh6rmsrvljLrpmL/lnZ3ol4/ml4/nvozml4/oh6rmsrvlt57lrp3l\\nsbHljLpcIixcIumdkua1t+ecgea1t+Wkluexu+S5jOm9kOWOv1wiLFwi6buR6b6Z5rGf55yB5qGC\\n5p6X5biC5rC46Z2W5Y6/XCIsXCLlj7Dmub7nmb3ln47luILkuIHpnZLljr9cIixcIui0teW3nuec\\ngeaclOW3nuW4guWHpOe/lOWOv1wiLFwi5rKz5YyX55yB5b635a6P5YKj5peP5pmv6aKH5peP6Ieq\\n5rK75bee6Iux5b635biCXCIsXCLlpKnmtKXlpKfnkIbnmb3ml4/oh6rmsrvlt57pu5HlsbHljr9c\\nIixcIuWbm+W3neecgemHkeaYjOW4guWQtOWgoeWOv1wiLFwi6L695a6B55yB5rO45bee5biC5rK5\\n5bCW5pe65Yy6XCJdLFwib3JpZ2luTmFtZVwiOlwiY2FkZFwifSx7XCJuYW1lXCI6XCJwaG9uZVwi\\nLFwianNvblBhdGhcIjpcIiQubGlzdFsqXS5bJ3Bob25lJ11cIixcImlkXCI6XCI5NzYyMzIwODE5\\nNjcyODg3MDNcIixcImNoZWNrXCI6dHJ1ZSxcInR5cGVcIjoxLjAsXCJ2YWx1ZVwiOltcIjEzNTg5\\nODY3NjIyXCIsXCIxNTMxODI2NTM0MlwiLFwiMTgzNTIzNzQyNjVcIixcIjE4NzQ3Njg2NzgxXCIs\\nXCIxMzUzNDEzMTI4OFwiLFwiMTg1OTYwNjcyNTFcIixcIjEzNjYwMjI0MTA3XCIsXCIxMzgxMDIz\\nNzMyM1wiLFwiMTMyNTQ0NTgyOTNcIixcIjE4MjIzNTg3MzgyXCJdLFwib3JpZ2luTmFtZVwiOlwi\\ncGhvbmVcIn1dLFwiY2hpbGRyZW5EYXRhVHlwZVwiOlwiTElTVFwiLFwibmFtZVwiOlwibGlzdFwi\\nLFwianNvblBhdGhcIjpcIiQuWydsaXN0J11cIixcImlkXCI6XCI5NzYyMzIwOTA1NTcyMjU1MTRc\\nIixcImNoZWNrXCI6dHJ1ZSxcInR5cGVcIjoxLjAsXCJvcmlnaW5OYW1lXCI6XCJsaXN0XCJ9XSIs\\nIm5lZWRGaWVsZFN0ciI6Ilt7XCJjaGVja1wiOnRydWUsXCJqc29uUGF0aFwiOlwiJC5saXN0Wypd\\nLlsnaWQnXVwiLFwibmFtZVwiOlwiaWRcIixcIm9yaWdpbk5hbWVcIjpcImlkXCIsXCJ0eXBlXCI6\\nMSxcInZhbHVlXCI6W1wiMVwiLFwiMlwiLFwiM1wiLFwiNFwiLFwiNVwiLFwiNlwiLFwiN1wiLFwi\\nOFwiLFwiOVwiLFwiMTBcIl19LHtcImNoZWNrXCI6dHJ1ZSxcImpzb25QYXRoXCI6XCIkLmxpc3Rb\\nKl0uWydudW1iZXInXVwiLFwibmFtZVwiOlwibnVtYmVyXCIsXCJvcmlnaW5OYW1lXCI6XCJudW1i\\nZXJcIixcInR5cGVcIjoxLFwidmFsdWVcIjpbXCI4XCIsXCIyXCIsXCI2XCIsXCI4XCIsXCI1XCIs\\nXCI2XCIsXCI2XCIsXCIxXCIsXCIxXCIsXCI4XCJdfSx7XCJjaGVja1wiOnRydWUsXCJqc29uUGF0\\naFwiOlwiJC5saXN0WypdLlsnbmFtZSddXCIsXCJuYW1lXCI6XCJuYW1lXCIsXCJvcmlnaW5OYW1l\\nXCI6XCJuYW1lXCIsXCJ0eXBlXCI6MSxcInZhbHVlXCI6W1wiUnV0aCBXaWxsaWFtc1wiLFwiQ3lu\\ndGhpYSBQZXJlelwiLFwiQ2Fyb2wgQW5kZXJzb25cIixcIkdhcnkgSGFsbFwiLFwiQnJpYW4gSm9o\\nbnNvblwiLFwiSmVubmlmZXIgV2hpdGVcIixcIlNjb3R0IEFuZGVyc29uXCIsXCJBbnRob255IEpv\\nbmVzXCIsXCJBbXkgV2lsc29uXCIsXCJHZW9yZ2UgTWFydGluXCJdfSx7XCJjaGVja1wiOnRydWUs\\nXCJqc29uUGF0aFwiOlwiJC5saXN0WypdLlsnY29sb3InXVwiLFwibmFtZVwiOlwiY29sb3JcIixc\\nIm9yaWdpbk5hbWVcIjpcImNvbG9yXCIsXCJ0eXBlXCI6MSxcInZhbHVlXCI6W1wiIzk4NzlmMlwi\\nLFwiIzdjZjI3OVwiLFwiI2YyNzlhMFwiLFwiIzc5YzNmMlwiLFwiI2U2ZjI3OVwiLFwiI2RhNzlm\\nMlwiLFwiIzc5ZjJiN1wiLFwiI2YyOTM3OVwiLFwiIzc5ODFmMlwiLFwiI2E1ZjI3OVwiXX0se1wi\\nY2hlY2tcIjp0cnVlLFwianNvblBhdGhcIjpcIiQubGlzdFsqXS5bJ3RpdGxlJ11cIixcIm5hbWVc\\nIjpcInRpdGxlXCIsXCJvcmlnaW5OYW1lXCI6XCJ0aXRsZVwiLFwidHlwZVwiOjEsXCJ2YWx1ZVwi\\nOltcIkhqdWdwIEx1aGl4ampmIEVyZHV0IEF1Y2IgWXNtcHhmZm5cIixcIk9yb3VzIEVqaGtvZXVj\\ndWsgTW9ncSBQcmQgRnNxcVwiLFwiUXl3IE9kc3VpaXViIFBycHVpZyBQcXZhemFqaCBIdmx3ZGsg\\nRnliY2lcIixcIkNpdm5yc2VsIEVnZ2wgSGt4dnggTGl1b2UgV2R2cGt3cXggS2t4YXJzcHBlIFl2\\nbmRya1wiLFwiSHJucXggUmpkbnMgWXlvZGtjam15ZSBGbnJrY3ZcIixcIlduZXR0aWtucXogU2Rn\\nIFJpZmhyIFhkd2NzZGxmIExtdmVlanFzXCIsXCJUc21nIENzcW5pd2wgSWdvZ3diIFh1cndlaGJu\\ncSBKbG93XCIsXCJUa3RtcGNld3IgTHB4ZHp6bnAgQ2NrbSBFZGNraGdmb3JnIEV4YmVqcm9mXCIs\\nXCJOdWthIEh3dGJxdXBxIEpsYWsgTWVnYmggUHdsamhcIixcIkR1ZmFvayBRemxkcnYgSWZxcXFs\\nXCJdfSx7XCJjaGVja1wiOnRydWUsXCJqc29uUGF0aFwiOlwiJC5saXN0WypdLlsndXJsJ11cIixc\\nIm5hbWVcIjpcInVybFwiLFwib3JpZ2luTmFtZVwiOlwidXJsXCIsXCJ0eXBlXCI6MSxcInZhbHVl\\nXCI6W1wiaHR0cDovL3ljbnZiZHJsZnouaHQvbm1pZndcIixcImh0dHA6Ly9jZHdubWUuY2svaHJz\\nYXNycmdcIixcImh0dHA6Ly9pZ2JnZm1iLmdwL2tvbG93dVwiLFwiaHR0cDovL2lueWtvLm5sL25i\\nYWNcIixcImh0dHA6Ly9oc3Rkdi5hZi9qbGllbHF2XCIsXCJodHRwOi8vemJ0aWtwcGNkLmFkL25s\\nZFwiLFwiaHR0cDovL3dvaHMuam0vcGJpXCIsXCJodHRwOi8vZmpwd3MuY2Yvdmh3eWJzdnFubVwi\\nLFwiaHR0cDovL2VyaXRxZnIuYnQvZHVoeGN5XCIsXCJodHRwOi8vbG5zdC5iaC9mZXJlXCJdfSx7\\nXCJjaGVja1wiOnRydWUsXCJqc29uUGF0aFwiOlwiJC5saXN0WypdLlsnZW1haWwnXVwiLFwibmFt\\nZVwiOlwiZW1haWxcIixcIm9yaWdpbk5hbWVcIjpcImVtYWlsXCIsXCJ0eXBlXCI6MSxcInZhbHVl\\nXCI6W1wibS5nZnFvcnBuYkBya3F5a291LnBrXCIsXCJyLmF0YmtramJAYnppY2JzcnouemFcIixc\\nImsub2RrQGh5dS50clwiLFwidy5rZXBAbW9uZnBpYnkubWlsXCIsXCJ2LmxhbHdodXlAeWV6cC5t\\ndFwiLFwiZS54bXZwZUBkZGpmLm1sXCIsXCJlLm53d3V0QHpka2lhZmsubWhcIixcIm0ucG90cmNA\\ncm5uZWtmdC5ldlwiLFwiai5lc2R3QHF1dmV5eXhlZS5ja1wiLFwidC5ndW1ocXhibkBxaXVuZi5r\\nZVwiXX0se1wiY2hlY2tcIjp0cnVlLFwianNvblBhdGhcIjpcIiQubGlzdFsqXS5bJ2ltYWdlJ11c\\nIixcIm5hbWVcIjpcImltYWdlXCIsXCJvcmlnaW5OYW1lXCI6XCJpbWFnZVwiLFwidHlwZVwiOjEs\\nXCJ2YWx1ZVwiOltcImh0dHA6Ly9kdW1teWltYWdlLmNvbS8yMDB4MjAwLzUwQjM0Ny9GRkYmdGV4\\ndD1Nb2NrLmpzXCIsXCJodHRwOi8vZHVtbXlpbWFnZS5jb20vMjAweDIwMC81MEIzNDcvRkZGJnRl\\neHQ9TW9jay5qc1wiLFwiaHR0cDovL2R1bW15aW1hZ2UuY29tLzIwMHgyMDAvNTBCMzQ3L0ZGRiZ0\\nZXh0PU1vY2suanNcIixcImh0dHA6Ly9kdW1teWltYWdlLmNvbS8yMDB4MjAwLzUwQjM0Ny9GRkYm\\ndGV4dD1Nb2NrLmpzXCIsXCJodHRwOi8vZHVtbXlpbWFnZS5jb20vMjAweDIwMC81MEIzNDcvRkZG\\nJnRleHQ9TW9jay5qc1wiLFwiaHR0cDovL2R1bW15aW1hZ2UuY29tLzIwMHgyMDAvNTBCMzQ3L0ZG\\nRiZ0ZXh0PU1vY2suanNcIixcImh0dHA6Ly9kdW1teWltYWdlLmNvbS8yMDB4MjAwLzUwQjM0Ny9G\\nRkYmdGV4dD1Nb2NrLmpzXCIsXCJodHRwOi8vZHVtbXlpbWFnZS5jb20vMjAweDIwMC81MEIzNDcv\\nRkZGJnRleHQ9TW9jay5qc1wiLFwiaHR0cDovL2R1bW15aW1hZ2UuY29tLzIwMHgyMDAvNTBCMzQ3\\nL0ZGRiZ0ZXh0PU1vY2suanNcIixcImh0dHA6Ly9kdW1teWltYWdlLmNvbS8yMDB4MjAwLzUwQjM0\\nNy9GRkYmdGV4dD1Nb2NrLmpzXCJdfSx7XCJjaGVja1wiOnRydWUsXCJqc29uUGF0aFwiOlwiJC5s\\naXN0WypdLlsnZGF0ZSddXCIsXCJuYW1lXCI6XCJkYXRlXCIsXCJvcmlnaW5OYW1lXCI6XCJkYXRl\\nXCIsXCJ0eXBlXCI6MSxcInZhbHVlXCI6W1wiMTk5Mi0wOS0xNCAxNDoxNzowMlwiLFwiMTk3Ni0w\\nMy0xNiAwNDoxNToxMlwiLFwiMTk5My0wMS0yOSAxNDoyNTo0MVwiLFwiMTk5Ni0xMC0wMiAxMjox\\nNzozOFwiLFwiMTk4Mi0xMC0xNCAwMTo0OToxMFwiLFwiMTk4NC0wNy0wNSAxMjo0MjowM1wiLFwi\\nMTk3NC0wMS0wMyAyMDoyNjoxOFwiLFwiMTk3OS0wMy0yMyAxNzo0OTowM1wiLFwiMjAxMi0wOC0x\\nNyAxNToyNjoyNlwiLFwiMTk3NC0wNy0yNSAwODo1ODo0NVwiXX0se1wiY2hlY2tcIjp0cnVlLFwi\\nanNvblBhdGhcIjpcIiQubGlzdFsqXS5bJ2RhdGUyJ11cIixcIm5hbWVcIjpcImRhdGUyXCIsXCJv\\ncmlnaW5OYW1lXCI6XCJkYXRlMlwiLFwidHlwZVwiOjEsXCJ2YWx1ZVwiOltcIjIwMDAtMDYtMDUg\\nMDM6NTE6NTlcIixcIjIwMDctMTAtMjMgMDA6MTc6MjFcIixcIjE5ODgtMDMtMjYgMDI6MDM6NTFc\\nIixcIjE5NzMtMDktMjQgMDU6MjA6NDFcIixcIjE5NzMtMDUtMzAgMDk6NTQ6NTdcIixcIjE5ODEt\\nMDgtMDkgMTE6MTY6MDJcIixcIjE5OTYtMDUtMjIgMTg6NDY6NTlcIixcIjE5ODktMDktMTUgMDc6\\nMzY6NTBcIixcIjIwMTUtMDEtMTMgMDA6MTU6MzhcIixcIjE5ODItMDktMTcgMDM6NDA6MzhcIl19\\nLHtcImNoZWNrXCI6dHJ1ZSxcImpzb25QYXRoXCI6XCIkLmxpc3RbKl0uWydjdGl0bGUnXVwiLFwi\\nbmFtZVwiOlwiY3RpdGxlXCIsXCJvcmlnaW5OYW1lXCI6XCJjdGl0bGVcIixcInR5cGVcIjoxLFwi\\ndmFsdWVcIjpbXCLkvKDnpLrnhaflvoDotbfmiJjnu7TmtL5cIixcIuWItuaKiue7hOW4uOaYr+ac\\niee9rumprFwiLFwi5a626YKj5Luj5Yeg5LiT5YyW6Zmk6K6kXCIsXCLlnLrlrozliLDns7vkuI7l\\nvI/lt6XljbRcIixcIuWGnOWKnumqjOilv+i/kOWlueWFrOWGm1wiLFwi5o+Q6YW455So5Y+I56ys\\n5YWI5qCH5q61XCIsXCLlj5bkuZ/msrnljbTpl67lrZDlho3pl6hcIixcIuS6p+mAoOS4nOi+ueeF\\np+WIhuatpOS4lFwiLFwi6IKy5oiW5Ye65bm05Lq65paX5a2Y5Y+vXCIsXCLlpIfnqIvmnaXovabn\\nva7pk4Hms5Xor4ZcIl19LHtcImNoZWNrXCI6dHJ1ZSxcImpzb25QYXRoXCI6XCIkLmxpc3RbKl0u\\nWydjYW5tZSddXCIsXCJuYW1lXCI6XCJjYW5tZVwiLFwib3JpZ2luTmFtZVwiOlwiY2FubWVcIixc\\nInR5cGVcIjoxLFwidmFsdWVcIjpbXCLmlrnmmI5cIixcIuiigeadsFwiLFwi6JSh5pWPXCIsXCLo\\nkaPpnZlcIixcIuavm+iJs1wiLFwi5L2V6Z2ZXCIsXCLltJTpnJ5cIixcIui0vuWLh1wiLFwi5YiY\\n56eA5YWwXCIsXCLmnajmoYLoi7FcIl19LHtcImNoZWNrXCI6dHJ1ZSxcImpzb25QYXRoXCI6XCIk\\nLmxpc3RbKl0uWydjYWRkJ11cIixcIm5hbWVcIjpcImNhZGRcIixcIm9yaWdpbk5hbWVcIjpcImNh\\nZGRcIixcInR5cGVcIjoxLFwidmFsdWVcIjpbXCLkuIrmtbfmvLPlt57luILnmbvlsIHluIJcIixc\\nIuilv+iXj+iHquayu+WMuumYv+WdneiXj+aXj+e+jOaXj+iHquayu+W3nuWuneWxseWMulwiLFwi\\n6Z2S5rW355yB5rW35aSW57G75LmM6b2Q5Y6/XCIsXCLpu5HpvpnmsZ/nnIHmoYLmnpfluILmsLjp\\nnZbljr9cIixcIuWPsOa5vueZveWfjuW4guS4gemdkuWOv1wiLFwi6LS15bee55yB5pyU5bee5biC\\n5Yek57+U5Y6/XCIsXCLmsrPljJfnnIHlvrflro/lgqPml4/mma/poofml4/oh6rmsrvlt57oi7Hl\\nvrfluIJcIixcIuWkqea0peWkp+eQhueZveaXj+iHquayu+W3num7keWxseWOv1wiLFwi5Zub5bed\\n55yB6YeR5piM5biC5ZC05aCh5Y6/XCIsXCLovr3lroHnnIHms7jlt57luILmsrnlsJbml7rljLpc\\nIl19LHtcImNoZWNrXCI6dHJ1ZSxcImpzb25QYXRoXCI6XCIkLmxpc3RbKl0uWydwaG9uZSddXCIs\\nXCJuYW1lXCI6XCJwaG9uZVwiLFwib3JpZ2luTmFtZVwiOlwicGhvbmVcIixcInR5cGVcIjoxLFwi\\ndmFsdWVcIjpbXCIxMzU4OTg2NzYyMlwiLFwiMTUzMTgyNjUzNDJcIixcIjE4MzUyMzc0MjY1XCIs\\nXCIxODc0NzY4Njc4MVwiLFwiMTM1MzQxMzEyODhcIixcIjE4NTk2MDY3MjUxXCIsXCIxMzY2MDIy\\nNDEwN1wiLFwiMTM4MTAyMzczMjNcIixcIjEzMjU0NDU4MjkzXCIsXCIxODIyMzU4NzM4MlwiXX1d\\nIiwicHJldmlld051bSI6MTAsInJlcXVlc3RDb25maWciOiJ7XCJhdXRoXCI6ZmFsc2UsXCJhdXRo\\nUHdkXCI6XCJcIixcImF1dGhVc3JcIjpcIlwiLFwiYm9keVwiOntcImt2c1wiOlt7XCJpZFwiOlwi\\nNzY3NTcyMzEwNDA2MDU2OVwiLFwibmFtZVwiOlwiXCIsXCJ2YWx1ZVwiOlwiXCIsXCJkZXNjcmlw\\ndGlvblwiOlwiXCIsXCJkZWxcIjpmYWxzZX1dLFwicmF3XCI6XCJQSEJ5YjNCbGNuUnBaWE0rQ2lB\\nZ0lDQThjM2x1WTNCc1lXNTBMblJ2YjJ3dWRtVnljMmx2Ymo0eExqUXVNVEE4TDNONWJtTndiR0Z1\\nZEM1MGIyOXNMblpsY25OcGIyNCtDand2Y0hKdmNHVnlkR2xsY3o0PVwiLFwidHlwZVwiOlwiWE1M\\nXCJ9LFwiaGVhZGVyXCI6W3tcImlkXCI6XCI1NDU1MDg5NDIyNzg3MDA2NDUyN1wiLFwibmFtZVwi\\nOlwiQ29udGVudC1UeXBlXCIsXCJ2YWx1ZVwiOlwidGV4dC94bWxcIixcImRlc2NyaXB0aW9uXCI6\\nXCJcIixcImRlbFwiOlwidHJ1ZVwifSx7XCJpZFwiOlwiODU1NDIwMTQ1MjkwNDI0MVwiLFwibmFt\\nZVwiOlwiXCIsXCJ2YWx1ZVwiOlwiXCIsXCJkZXNjcmlwdGlvblwiOlwiXCIsXCJkZWxcIjpcInRy\\ndWVcIn1dfSIsInJlcXVlc3RUeXBlIjoyLCJyZXF1ZXN0VXJsIjoiaHR0cDovLzEwLjg4LjEyLjM3\\nOjgwODEvYXBpL21vY2svMTAwMDIzL3Bvc3RVc2VyRGF0YSJ9"\n						}\n					},\n					"writer":{\n						"name":"doriswriter",\n						"parameter":{\n							"feLoadUrl":[\n								"10.44.2.110:8030"\n							],\n							"jdbcUrl":"jdbc:mysql://10.44.2.110:9030",\n							"database":"ODS_DT_MES",\n							"table":"ceshi",\n							"column":[\n								"id",\n								"number",\n								"name",\n								"color",\n								"title",\n								"url",\n								"email",\n								"image",\n								"date",\n								"date2",\n								"ctitle",\n								"canme",\n								"cadd",\n								"phone"\n							],\n							"username":"root",\n							"password":"",\n							"maxBatchRows":50000,\n							"maxBatchByteSize":10485760,\n							"labelPrefix":"my_prefix",\n							"lineDelimiter":"\\n"\n						}\n					}\n				}\n			]\n		}\n	}\n}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-02-14 09:05:19', NULL, 0, 0, 0, NULL),
	(354, 45, '0 0 0 * * ?', 'kafka-test', '2023-03-06 11:16:42', '2023-03-06 11:16:42', 'admin', NULL, 'FIRST', 'DataServiceHandler', '977789669037047808', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2023-03-06 11:16:42', NULL, 0, 0, 0, NULL),
	(355, 49, '0 0/10 * * * ?', '默认描述:saveOnlineUserStatistics，请及时修改描述和执行器', '2023-03-16 09:24:38', '2023-03-21 08:33:35', '自动注入', '', 'FIRST', 'saveOnlineUserStatistics', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-03-16 09:24:38', '', 0, 0, 0, '1'),
	(356, 49, '* * * 1/1 * ?', '默认描述:syncXiaokeRole，请及时修改描述和执行器', '2023-03-16 09:24:38', '2023-03-16 09:24:38', '自动注入', NULL, 'FIRST', 'syncXiaokeRole', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-03-16 09:24:38', NULL, 0, 0, 0, NULL),
	(357, 49, '* * * 1/1 * ?', '默认描述:syncXiaokeOrgan，请及时修改描述和执行器', '2023-03-16 09:24:38', '2023-03-16 09:24:38', '自动注入', NULL, 'FIRST', 'syncXiaokeOrgan', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-03-16 09:24:38', NULL, 0, 0, 0, NULL),
	(358, 49, '* * * 1/1 * ?', '默认描述:executeDingOrgan，请及时修改描述和执行器', '2023-03-16 09:24:38', '2023-03-16 09:24:38', '自动注入', NULL, 'FIRST', 'executeDingOrgan', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-03-16 09:24:38', NULL, 0, 0, 0, NULL),
	(359, 42, '* * * * * ? *', 'xddddd', '2023-03-17 14:02:13', '2023-03-17 14:03:16', '曹瑞', NULL, 'FIRST', 'executeRule', '1636607465441927169', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-03-17 14:02:13', NULL, 0, 0, 0, NULL),
	(360, 45, '0 0 0 * * ?', '11', '2023-03-21 13:13:42', '2023-03-21 13:13:42', 'admin', NULL, 'FIRST', 'DataGovernHandler', '995777936965500928', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2023-03-21 13:13:42', NULL, 0, 0, 0, NULL),
	(361, 42, '0 0 0 * * ? *', 'cccc', '2023-04-04 16:34:33', '2023-04-04 16:31:02', '曹瑞', NULL, 'FIRST', 'executeRule', '1636608815227674625', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-04-04 16:34:33', NULL, 0, 0, 0, NULL),
	(362, 42, '0 0 0 * * ? *', 'cccc', '2023-04-04 16:31:02', '2023-04-04 16:38:00', '曹瑞', NULL, 'FIRST', 'executeRule', '1636608815227674625', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-04-04 16:31:02', NULL, 0, 0, 0, NULL),
	(363, 42, '0 0 0 * * ? *', 'cccc', '2023-04-04 16:38:00', '2023-04-04 16:33:41', '曹瑞', NULL, 'FIRST', 'executeRule', '1636608815227674625', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-04-04 16:38:00', NULL, 0, 0, 0, NULL),
	(364, 42, '0 0 0 * * ? *', 'cccc', '2023-04-04 16:33:41', '2023-04-06 10:13:46', '曹瑞', NULL, 'FIRST', 'executeRule', '1636608815227674625', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-04-04 16:33:41', NULL, 0, 0, 0, NULL),
	(365, 42, '0 0 0 * * ? *', 'cccc', '2023-04-06 10:13:46', '2023-04-06 10:15:34', '曹瑞', NULL, 'FIRST', 'executeRule', '1636608815227674625', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-04-06 10:13:46', NULL, 0, 0, 0, NULL),
	(366, 42, '0 0 0 * * ? *', 'cccc', '2023-04-06 10:15:34', '2023-04-06 10:11:17', '曹瑞', NULL, 'FIRST', 'executeRule', '1636608815227674625', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-04-06 10:15:34', NULL, 0, 0, 0, NULL),
	(367, 42, '0 0 0 * * ? *', 'cccc', '2023-04-06 10:11:17', '2023-04-06 11:04:27', '曹瑞', NULL, 'FIRST', 'executeRule', '1636608815227674625', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-04-06 10:11:17', NULL, 0, 0, 0, NULL),
	(369, 42, '0-4 * * * * ? *', '测试ccc', '2023-04-18 14:32:59', '2023-04-18 14:33:15', '超级管理员', NULL, 'FIRST', 'executeRule', '1648214198737952770', 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-04-18 14:32:59', NULL, 0, 0, 0, NULL),
	(370, 49, '* * * 1/1 * ?', '默认描述:executeYaxinOrgan，请及时修改描述和执行器', '2023-07-10 05:50:31', '2023-07-10 05:50:31', '自动注入', NULL, 'FIRST', 'executeYaxinOrgan', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-07-10 05:50:31', NULL, 0, 0, 0, NULL),
	(371, 49, '* * * 1/1 * ?', '默认描述:executeChinaerdosOrgan，请及时修改描述和执行器', '2023-07-10 05:50:31', '2023-07-10 05:50:31', '自动注入', NULL, 'FIRST', 'executeChinaerdosOrgan', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, NULL, '2023-07-10 05:50:31', NULL, 0, 0, 0, NULL);
/*!40000 ALTER TABLE `xxl_job_info` ENABLE KEYS */;

-- 导出  表 xxl_job.xxl_job_lock 结构
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE IF NOT EXISTS `xxl_job_lock` (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  xxl_job.xxl_job_lock 的数据：~0 rows (大约)
DELETE FROM `xxl_job_lock`;
/*!40000 ALTER TABLE `xxl_job_lock` DISABLE KEYS */;
INSERT INTO `xxl_job_lock` (`lock_name`) VALUES
	('schedule_lock');
/*!40000 ALTER TABLE `xxl_job_lock` ENABLE KEYS */;

-- 导出  表 xxl_job.xxl_job_log 结构
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE IF NOT EXISTS `xxl_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `I_trigger_time` (`trigger_time`) USING BTREE,
  KEY `I_handle_code` (`handle_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3016727 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  xxl_job.xxl_job_log 的数据：~0 rows (大约)
DELETE FROM `xxl_job_log`;
/*!40000 ALTER TABLE `xxl_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_log` ENABLE KEYS */;

-- 导出  表 xxl_job.xxl_job_logglue 结构
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE IF NOT EXISTS `xxl_job_logglue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  xxl_job.xxl_job_logglue 的数据：~0 rows (大约)
DELETE FROM `xxl_job_logglue`;
/*!40000 ALTER TABLE `xxl_job_logglue` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_logglue` ENABLE KEYS */;

-- 导出  表 xxl_job.xxl_job_log_report 结构
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE IF NOT EXISTS `xxl_job_log_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=805 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  xxl_job.xxl_job_log_report 的数据：~176 rows (大约)
DELETE FROM `xxl_job_log_report`;
/*!40000 ALTER TABLE `xxl_job_log_report` DISABLE KEYS */;
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`) VALUES
	(628, '2022-12-10 00:00:00', 0, 0, 0),
	(629, '2022-12-09 00:00:00', 0, 0, 0),
	(630, '2022-12-08 00:00:00', 0, 0, 0),
	(631, '2022-12-12 00:00:00', 0, 0, 0),
	(632, '2022-12-11 00:00:00', 0, 0, 0),
	(633, '2022-12-13 00:00:00', 0, 0, 0),
	(634, '2022-12-14 00:00:00', 0, 0, 0),
	(635, '2022-12-15 00:00:00', 0, 0, 0),
	(636, '2022-12-16 00:00:00', 0, 0, 0),
	(637, '2022-12-17 00:00:00', 0, 0, 0),
	(638, '2022-12-18 00:00:00', 0, 0, 0),
	(639, '2022-12-19 00:00:00', 0, 0, 1673),
	(640, '2022-12-20 00:00:00', 0, 0, 2880),
	(641, '2022-12-21 00:00:00', 0, 2, 2885),
	(642, '2022-12-22 00:00:00', 0, 0, 2880),
	(643, '2022-12-23 00:00:00', 0, 0, 2880),
	(644, '2022-12-24 00:00:00', 0, 0, 2880),
	(645, '2022-12-25 00:00:00', 0, 0, 2880),
	(646, '2022-12-26 00:00:00', 0, 0, 2880),
	(647, '2022-12-27 00:00:00', 0, 1, 2043),
	(648, '2022-12-28 00:00:00', 0, 0, 1),
	(649, '2022-12-29 00:00:00', 0, 0, 2),
	(650, '2022-12-30 00:00:00', 0, 0, 1),
	(651, '2022-12-31 00:00:00', 0, 0, 1),
	(652, '2023-01-01 00:00:00', 0, 0, 1),
	(653, '2023-01-02 00:00:00', 0, 0, 1),
	(654, '2023-01-03 00:00:00', 0, 0, 406),
	(655, '2023-01-04 00:00:00', 0, 93, 1357),
	(656, '2023-01-05 00:00:00', 0, 299, 1160),
	(657, '2023-01-06 00:00:00', 0, 178, 1272),
	(658, '2023-01-07 00:00:00', 0, 0, 1441),
	(659, '2023-01-08 00:00:00', 0, 0, 1441),
	(660, '2023-01-09 00:00:00', 1, 0, 1379),
	(661, '2023-01-10 00:00:00', 0, 0, 1441),
	(662, '2023-01-11 00:00:00', 0, 88, 1356),
	(663, '2023-01-12 00:00:00', 0, 275, 1173),
	(664, '2023-01-13 00:00:00', 0, 93, 1209),
	(665, '2023-01-14 00:00:00', 0, 0, 1442),
	(666, '2023-01-15 00:00:00', 0, 0, 1442),
	(667, '2023-01-16 00:00:00', 0, 0, 1442),
	(668, '2023-01-17 00:00:00', 0, 0, 1442),
	(669, '2023-01-18 00:00:00', 0, 0, 1442),
	(670, '2023-01-19 00:00:00', 0, 0, 1442),
	(671, '2023-01-20 00:00:00', 0, 0, 1442),
	(672, '2023-01-21 00:00:00', 0, 0, 1442),
	(673, '2023-01-22 00:00:00', 0, 0, 1442),
	(674, '2023-01-23 00:00:00', 0, 0, 1442),
	(675, '2023-01-24 00:00:00', 0, 0, 1442),
	(676, '2023-01-25 00:00:00', 0, 0, 1442),
	(677, '2023-01-26 00:00:00', 0, 0, 1442),
	(678, '2023-01-27 00:00:00', 0, 0, 1442),
	(679, '2023-01-28 00:00:00', 0, 0, 1447),
	(680, '2023-01-29 00:00:00', 0, 0, 1442),
	(681, '2023-01-30 00:00:00', 0, 0, 1441),
	(682, '2023-01-31 00:00:00', 0, 0, 1441),
	(683, '2023-02-01 00:00:00', 0, 0, 1441),
	(684, '2023-02-02 00:00:00', 0, 0, 1441),
	(685, '2023-02-03 00:00:00', 0, 0, 3723),
	(686, '2023-02-04 00:00:00', 0, 0, 8641),
	(687, '2023-02-05 00:00:00', 0, 0, 8641),
	(688, '2023-02-06 00:00:00', 0, 0, 8641),
	(689, '2023-02-07 00:00:00', 0, 0, 8641),
	(690, '2023-02-08 00:00:00', 0, 0, 8641),
	(691, '2023-02-09 00:00:00', 0, 0, 8666),
	(692, '2023-02-10 00:00:00', 12, 0, 8625),
	(693, '2023-02-11 00:00:00', 0, 0, 8641),
	(694, '2023-02-12 00:00:00', 0, 0, 8641),
	(695, '2023-02-13 00:00:00', 0, 0, 8641),
	(696, '2023-02-14 00:00:00', 0, 0, 8644),
	(697, '2023-02-15 00:00:00', 0, 0, 8641),
	(698, '2023-02-16 00:00:00', 0, 0, 8641),
	(699, '2023-02-17 00:00:00', 0, 0, 8641),
	(700, '2023-02-18 00:00:00', 0, 0, 8641),
	(701, '2023-02-19 00:00:00', 0, 0, 8641),
	(702, '2023-02-20 00:00:00', 0, 0, 8641),
	(703, '2023-02-21 00:00:00', 0, 0, 8641),
	(704, '2023-02-22 00:00:00', 0, 0, 8641),
	(705, '2023-02-23 00:00:00', 0, 0, 8641),
	(706, '2023-02-24 00:00:00', 0, 0, 8641),
	(707, '2023-02-25 00:00:00', 0, 0, 8641),
	(708, '2023-02-26 00:00:00', 0, 0, 8641),
	(709, '2023-02-27 00:00:00', 0, 0, 8641),
	(710, '2023-02-28 00:00:00', 0, 0, 8641),
	(711, '2023-03-01 00:00:00', 0, 0, 8641),
	(712, '2023-03-02 00:00:00', 0, 0, 8641),
	(713, '2023-03-03 00:00:00', 0, 0, 8641),
	(714, '2023-03-04 00:00:00', 0, 0, 8641),
	(715, '2023-03-05 00:00:00', 0, 0, 8641),
	(716, '2023-03-06 00:00:00', 0, 0, 8642),
	(717, '2023-03-07 00:00:00', 0, 0, 8641),
	(718, '2023-03-08 00:00:00', 0, 0, 8641),
	(719, '2023-03-09 00:00:00', 0, 0, 8612),
	(720, '2023-03-10 00:00:00', 0, 0, 8641),
	(721, '2023-03-11 00:00:00', 0, 0, 8641),
	(722, '2023-03-12 00:00:00', 0, 0, 8641),
	(723, '2023-03-13 00:00:00', 0, 0, 8641),
	(724, '2023-03-14 00:00:00', 0, 0, 8641),
	(725, '2023-03-15 00:00:00', 0, 0, 8641),
	(726, '2023-03-16 00:00:00', 0, 963, 5329),
	(727, '2023-03-17 00:00:00', 0, 83, 125),
	(728, '2023-03-18 00:00:00', 0, 29, 115),
	(729, '2023-03-19 00:00:00', 0, 64, 80),
	(730, '2023-03-20 00:00:00', 0, 57, 87),
	(731, '2023-03-21 00:00:00', 0, 15, 37),
	(732, '2023-03-22 00:00:00', 0, 0, 0),
	(733, '2023-03-23 00:00:00', 0, 0, 0),
	(734, '2023-03-24 00:00:00', 0, 0, 0),
	(735, '2023-03-25 00:00:00', 0, 0, 0),
	(736, '2023-03-26 00:00:00', 0, 0, 0),
	(737, '2023-03-27 00:00:00', 0, 0, 0),
	(738, '2023-03-28 00:00:00', 0, 0, 2),
	(739, '2023-03-29 00:00:00', 0, 0, 0),
	(740, '2023-03-30 00:00:00', 0, 0, 0),
	(741, '2023-03-31 00:00:00', 0, 0, 0),
	(742, '2023-04-01 00:00:00', 0, 0, 0),
	(743, '2023-04-02 00:00:00', 0, 0, 0),
	(744, '2023-04-03 00:00:00', 0, 0, 0),
	(745, '2023-04-04 00:00:00', 1, 4, 0),
	(746, '2023-04-05 00:00:00', 0, 0, 0),
	(747, '2023-04-06 00:00:00', 0, 3, 1),
	(748, '2023-04-07 00:00:00', 0, 0, 0),
	(749, '2023-04-08 00:00:00', 0, 0, 0),
	(750, '2023-04-09 00:00:00', 0, 0, 0),
	(751, '2023-04-10 00:00:00', 0, 0, 0),
	(752, '2023-04-11 00:00:00', 0, 0, 0),
	(753, '2023-04-12 00:00:00', 0, 0, 0),
	(754, '2023-04-13 00:00:00', 0, 0, 0),
	(755, '2023-04-14 00:00:00', 0, 0, 0),
	(756, '2023-04-15 00:00:00', 0, 0, 0),
	(757, '2023-04-16 00:00:00', 0, 0, 0),
	(758, '2023-04-17 00:00:00', 0, 0, 0),
	(759, '2023-04-18 00:00:00', 0, 0, 3),
	(760, '2023-04-19 00:00:00', 0, 0, 0),
	(761, '2023-04-20 00:00:00', 0, 0, 0),
	(762, '2023-04-21 00:00:00', 0, 0, 0),
	(763, '2023-04-22 00:00:00', 0, 0, 0),
	(764, '2023-04-23 00:00:00', 0, 0, 0),
	(765, '2023-04-24 00:00:00', 0, 0, 0),
	(766, '2023-04-25 00:00:00', 0, 0, 0),
	(767, '2023-04-26 00:00:00', 0, 0, 0),
	(768, '2023-04-27 00:00:00', 0, 0, 0),
	(769, '2023-04-28 00:00:00', 0, 0, 0),
	(770, '2023-04-29 00:00:00', 0, 0, 0),
	(771, '2023-04-30 00:00:00', 0, 0, 0),
	(772, '2023-05-01 00:00:00', 0, 0, 0),
	(773, '2023-05-02 00:00:00', 0, 0, 0),
	(774, '2023-05-03 00:00:00', 0, 0, 0),
	(775, '2023-05-04 00:00:00', 0, 0, 0),
	(776, '2023-05-05 00:00:00', 0, 0, 0),
	(777, '2023-05-06 00:00:00', 0, 0, 0),
	(778, '2023-05-07 00:00:00', 0, 0, 0),
	(779, '2023-05-08 00:00:00', 0, 0, 0),
	(780, '2023-05-09 00:00:00', 0, 0, 0),
	(781, '2023-05-11 00:00:00', 0, 0, 0),
	(782, '2023-05-10 00:00:00', 0, 0, 0),
	(783, '2023-05-12 00:00:00', 0, 0, 0),
	(784, '2023-05-13 00:00:00', 0, 0, 0),
	(785, '2023-05-14 00:00:00', 0, 0, 0),
	(786, '2023-05-15 00:00:00', 0, 0, 0),
	(787, '2023-05-16 00:00:00', 0, 0, 0),
	(788, '2023-05-17 00:00:00', 0, 0, 0),
	(789, '2023-05-18 00:00:00', 0, 0, 0),
	(790, '2023-05-19 00:00:00', 0, 0, 0),
	(791, '2023-05-20 00:00:00', 0, 0, 0),
	(792, '2023-05-21 00:00:00', 0, 0, 0),
	(793, '2023-05-22 00:00:00', 0, 0, 0),
	(794, '2023-05-23 00:00:00', 0, 0, 0),
	(795, '2023-07-10 00:00:00', 0, 0, 0),
	(796, '2023-07-09 00:00:00', 0, 0, 0),
	(797, '2023-07-08 00:00:00', 0, 0, 0),
	(798, '2023-07-11 00:00:00', 0, 0, 0),
	(799, '2023-07-12 00:00:00', 0, 0, 0),
	(800, '2023-07-13 00:00:00', 0, 0, 0),
	(801, '2023-07-14 00:00:00', 0, 0, 0),
	(802, '2023-07-15 00:00:00', 0, 0, 0),
	(803, '2023-07-16 00:00:00', 0, 0, 0),
	(804, '2023-07-17 00:00:00', 0, 0, 0);
/*!40000 ALTER TABLE `xxl_job_log_report` ENABLE KEYS */;

-- 导出  表 xxl_job.xxl_job_registry 结构
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE IF NOT EXISTS `xxl_job_registry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=441782 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  xxl_job.xxl_job_registry 的数据：~0 rows (大约)
DELETE FROM `xxl_job_registry`;
/*!40000 ALTER TABLE `xxl_job_registry` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_registry` ENABLE KEYS */;

-- 导出  表 xxl_job.xxl_job_user 结构
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE IF NOT EXISTS `xxl_job_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  xxl_job.xxl_job_user 的数据：~0 rows (大约)
DELETE FROM `xxl_job_user`;
/*!40000 ALTER TABLE `xxl_job_user` DISABLE KEYS */;
INSERT INTO `xxl_job_user` (`id`, `username`, `password`, `role`, `permission`) VALUES
	(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
/*!40000 ALTER TABLE `xxl_job_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
