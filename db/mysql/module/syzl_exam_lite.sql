/*
 Navicat Premium Data Transfer

 Source Server         : 47.113.202.83
 Source Server Type    : MySQL
 Source Server Version : 50739 (5.7.39-log)
 Source Host           : 47.113.202.83:3306
 Source Schema         : yf_exam_lite

 Target Server Type    : MySQL
 Target Server Version : 50739 (5.7.39-log)
 File Encoding         : 65001

 Date: 24/12/2023 17:09:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for el_exam
-- ----------------------------
DROP TABLE IF EXISTS `el_exam`;
CREATE TABLE `el_exam` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT '考试名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '考试描述',
  `open_type` int(11) NOT NULL DEFAULT '1' COMMENT '1公开2部门3定员',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '考试状态',
  `time_limit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否限时',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `total_score` int(11) NOT NULL DEFAULT '0' COMMENT '总分数',
  `total_time` int(11) NOT NULL DEFAULT '0' COMMENT '总时长（分钟）',
  `qualify_score` int(11) NOT NULL DEFAULT '0' COMMENT '及格分数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `open_type` (`open_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试主表';

-- ----------------------------
-- Records of el_exam
-- ----------------------------
BEGIN;
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `state`, `time_limit`, `start_time`, `end_time`, `create_time`, `update_time`, `total_score`, `total_time`, `qualify_score`) VALUES ('1730561158076731393', '焦虑自评量表(国奥改）', '焦虑自评量表(国奥改）', 1, 0, 0, NULL, NULL, '2023-12-01 20:15:07', '2023-12-01 20:15:07', 0, 120, 0);
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `state`, `time_limit`, `start_time`, `end_time`, `create_time`, `update_time`, `total_score`, `total_time`, `qualify_score`) VALUES ('1730584266540101634', '中小学生心理健康量表（MHT）', '中小学生心理健康量表（MHT）', 1, 0, 0, NULL, NULL, '2023-12-01 21:46:57', '2023-12-01 21:46:57', 0, 180, 0);
COMMIT;

-- ----------------------------
-- Table structure for el_exam_depart
-- ----------------------------
DROP TABLE IF EXISTS `el_exam_depart`;
CREATE TABLE `el_exam_depart` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `exam_id` varchar(32) NOT NULL DEFAULT '' COMMENT '考试ID',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `exam_id` (`exam_id`),
  KEY `depart_id` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试部门';

-- ----------------------------
-- Records of el_exam_depart
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_exam_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_exam_repo`;
CREATE TABLE `el_exam_repo` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `exam_id` varchar(64) NOT NULL COMMENT '考试ID',
  `repo_id` varchar(64) NOT NULL COMMENT '题库ID',
  `radio_count` int(11) NOT NULL DEFAULT '0' COMMENT '单选题数量',
  `radio_score` int(11) NOT NULL DEFAULT '0' COMMENT '单选题分数',
  `multi_count` int(11) NOT NULL DEFAULT '0' COMMENT '多选题数量',
  `multi_score` int(11) NOT NULL DEFAULT '0' COMMENT '多选题分数',
  `judge_count` int(11) NOT NULL DEFAULT '0' COMMENT '判断题数量',
  `judge_score` int(11) NOT NULL DEFAULT '0' COMMENT '判断题分数',
  `saq_count` int(11) NOT NULL DEFAULT '0' COMMENT '简答题数量',
  `saq_score` int(11) NOT NULL DEFAULT '0' COMMENT '简答题分数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `exam_repo_id` (`exam_id`,`repo_id`),
  KEY `rule_id` (`exam_id`) USING BTREE,
  KEY `repo_id` (`repo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试题库';

-- ----------------------------
-- Records of el_exam_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`) VALUES ('1730924093894619137', '1730561158076731393', '1730231999756537857', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`) VALUES ('1730924156129701889', '1730584266540101634', '1730231897507794945', 0, 0, 0, 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for el_paper
-- ----------------------------
DROP TABLE IF EXISTS `el_paper`;
CREATE TABLE `el_paper` (
  `id` varchar(64) NOT NULL COMMENT '试卷ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  `exam_id` varchar(64) NOT NULL COMMENT '规则ID',
  `title` varchar(64) NOT NULL COMMENT '考试标题',
  `total_time` int(11) NOT NULL DEFAULT '0' COMMENT '考试时长',
  `user_time` int(11) NOT NULL DEFAULT '0' COMMENT '用户时长',
  `total_score` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总分',
  `qualify_score` int(11) NOT NULL DEFAULT '0' COMMENT '及格分',
  `obj_score` int(11) NOT NULL DEFAULT '0' COMMENT '客观分',
  `subj_score` int(11) NOT NULL DEFAULT '0' COMMENT '主观分',
  `user_score` int(11) NOT NULL COMMENT '用户得分',
  `has_saq` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否包含简答题',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '试卷状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `limit_time` datetime DEFAULT NULL COMMENT '截止时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `exam_id` (`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录';

-- ----------------------------
-- Records of el_paper
-- ----------------------------
BEGIN;
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `create_time`, `update_time`, `limit_time`) VALUES ('1730924182472556546', '10001', '1318103313740320770', '1730584266540101634', '中小学生心理健康量表（MHT）', 180, 4, 0, 0, 0, 0, 11, 0, 2, '2023-12-02 20:17:39', '2023-12-02 20:21:40', '2023-12-02 23:17:39');
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `create_time`, `update_time`, `limit_time`) VALUES ('1730940350042275841', '10001', '1318103313740320770', '1730561158076731393', '焦虑自评量表(国奥改）', 120, 120, 0, 0, 0, 0, 0, 0, 2, '2023-12-02 21:21:53', '2023-12-02 23:21:53', '2023-12-02 23:21:53');
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `create_time`, `update_time`, `limit_time`) VALUES ('1733021693240713218', '10001', '1318103313740320770', '1730561158076731393', '焦虑自评量表(国奥改）', 120, 7, 0, 0, 0, 0, 44, 0, 2, '2023-12-08 15:12:24', '2023-12-08 15:19:39', '2023-12-08 17:12:24');
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `create_time`, `update_time`, `limit_time`) VALUES ('1733027411670900738', '10001', '1318103313740320770', '1730561158076731393', '焦虑自评量表(国奥改）', 120, 119, 0, 0, 0, 0, 0, 0, 2, '2023-12-08 15:35:08', '2023-12-08 17:35:07', '2023-12-08 17:35:08');
COMMIT;

-- ----------------------------
-- Table structure for el_paper_qu
-- ----------------------------
DROP TABLE IF EXISTS `el_paper_qu`;
CREATE TABLE `el_paper_qu` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `paper_id` varchar(64) NOT NULL COMMENT '试卷ID',
  `qu_id` varchar(64) NOT NULL COMMENT '题目ID',
  `no` int(11) DEFAULT NULL COMMENT '题号',
  `qu_type` int(11) NOT NULL COMMENT '题目类型',
  `answered` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已答',
  `answer` varchar(5000) NOT NULL DEFAULT '' COMMENT '主观答案',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '问题排序',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '单题分分值',
  `actual_score` int(11) NOT NULL DEFAULT '0' COMMENT '实际得分(主观题)',
  `is_right` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否答对',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录考题';

-- ----------------------------
-- Records of el_paper_qu
-- ----------------------------
BEGIN;
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183818928129', '1730924182472556546', '1730248387917316097', 1, 1, 1, '', 0, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183869259777', '1730924182472556546', '1730248388999446529', 2, 1, 1, '', 1, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183877648386', '1730924182472556546', '1730248390282903554', 3, 1, 1, '', 2, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183886036993', '1730924182472556546', '1730248391633469442', 4, 1, 1, '', 3, 0, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183890231297', '1730924182472556546', '1730248393042755585', 5, 1, 1, '', 4, 0, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183894425601', '1730924182472556546', '1730248394544316418', 6, 1, 1, '', 5, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183898619905', '1730924182472556546', '1730248396121374721', 7, 1, 1, '', 6, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183907008513', '1730924182472556546', '1730248397786513409', 8, 1, 1, '', 7, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183915397122', '1730924182472556546', '1730248399619424257', 9, 1, 1, '', 8, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183923785729', '1730924182472556546', '1730248401427169282', 10, 1, 1, '', 9, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183923785730', '1730924182472556546', '1730248403364937730', 11, 1, 1, '', 10, 0, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183940562946', '1730924182472556546', '1730248405361426433', 12, 1, 1, '', 11, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183940562947', '1730924182472556546', '1730248407538270209', 13, 1, 1, '', 12, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183940562948', '1730924182472556546', '1730248409656393729', 14, 1, 0, '', 13, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183961534465', '1730924182472556546', '1730248411938095105', 15, 1, 0, '', 14, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183965728769', '1730924182472556546', '1730248414425317378', 16, 1, 0, '', 15, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183974117377', '1730924182472556546', '1730248416820264962', 17, 1, 0, '', 16, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183982505986', '1730924182472556546', '1730248419294904322', 18, 1, 0, '', 17, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183986700289', '1730924182472556546', '1730248421811486721', 19, 1, 0, '', 18, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183986700290', '1730924182472556546', '1730248424399372290', 20, 1, 0, '', 19, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924183999283201', '1730924182472556546', '1730248427058561026', 21, 1, 0, '', 20, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184007671809', '1730924182472556546', '1730248429793247233', 22, 1, 0, '', 21, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184007671810', '1730924182472556546', '1730248432636985346', 23, 1, 0, '', 22, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184024449025', '1730924182472556546', '1730248435463946242', 24, 1, 0, '', 23, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184028643329', '1730924182472556546', '1730248438353821697', 25, 1, 0, '', 24, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184045420546', '1730924182472556546', '1730248441273057282', 26, 1, 0, '', 25, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184049614850', '1730924182472556546', '1730248444494282754', 27, 1, 0, '', 26, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184058003458', '1730924182472556546', '1730248447728091138', 28, 1, 0, '', 27, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184066392065', '1730924182472556546', '1730248451049979905', 29, 1, 0, '', 28, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184074780674', '1730924182472556546', '1730248454418006017', 30, 1, 1, '', 29, 0, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184078974978', '1730924182472556546', '1730248457861529602', 31, 1, 1, '', 30, 0, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184087363586', '1730924182472556546', '1730248461405716482', 32, 1, 0, '', 31, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184091557889', '1730924182472556546', '1730248465012817922', 33, 1, 1, '', 32, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184091557890', '1730924182472556546', '1730248468695416833', 34, 1, 0, '', 33, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184091557891', '1730924182472556546', '1730248472474484738', 35, 1, 0, '', 34, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184108335105', '1730924182472556546', '1730248476425519105', 36, 1, 0, '', 35, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184108335106', '1730924182472556546', '1730248480347193345', 37, 1, 1, '', 36, 0, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184125112322', '1730924182472556546', '1730248484352753666', 38, 1, 0, '', 37, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184125112323', '1730924182472556546', '1730248488454782977', 39, 1, 0, '', 38, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184137695234', '1730924182472556546', '1730248492636504065', 40, 1, 0, '', 39, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184141889538', '1730924182472556546', '1730248496872751106', 41, 1, 0, '', 40, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184150278146', '1730924182472556546', '1730248501167718402', 42, 1, 0, '', 41, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184154472450', '1730924182472556546', '1730248505575931906', 43, 1, 0, '', 42, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184162861058', '1730924182472556546', '1730248510055448578', 44, 1, 0, '', 43, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184167055362', '1730924182472556546', '1730248514644017154', 45, 1, 0, '', 44, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184175443970', '1730924182472556546', '1730248519350026241', 46, 1, 0, '', 45, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184179638273', '1730924182472556546', '1730248524060229634', 47, 1, 0, '', 46, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184188026882', '1730924182472556546', '1730248528841736193', 48, 1, 0, '', 47, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184196415490', '1730924182472556546', '1730248533694545922', 49, 1, 0, '', 48, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184200609793', '1730924182472556546', '1730248538631241729', 50, 1, 0, '', 49, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184208998402', '1730924182472556546', '1730248543656017921', 51, 1, 0, '', 50, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184213192705', '1730924182472556546', '1730248548760485890', 52, 1, 0, '', 51, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184221581313', '1730924182472556546', '1730248553948839938', 53, 1, 0, '', 52, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184225775617', '1730924182472556546', '1730248559204302850', 54, 1, 0, '', 53, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184234164226', '1730924182472556546', '1730248564560429057', 55, 1, 0, '', 54, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184242552833', '1730924182472556546', '1730248570042384385', 56, 1, 0, '', 55, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184246747137', '1730924182472556546', '1730248575574671361', 57, 1, 0, '', 56, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184246747138', '1730924182472556546', '1730248581169872898', 58, 1, 0, '', 57, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184246747139', '1730924182472556546', '1730248586819600386', 59, 1, 0, '', 58, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184267718657', '1730924182472556546', '1730248592574185473', 60, 1, 0, '', 59, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184271912961', '1730924182472556546', '1730248598387490818', 61, 1, 0, '', 60, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184280301570', '1730924182472556546', '1730248604255322114', 62, 1, 0, '', 61, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184284495873', '1730924182472556546', '1730248610228011010', 63, 1, 0, '', 62, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184292884482', '1730924182472556546', '1730248616263614465', 64, 1, 0, '', 63, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184301273090', '1730924182472556546', '1730248622433435650', 65, 1, 0, '', 64, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184305467393', '1730924182472556546', '1730248628657782785', 66, 1, 0, '', 65, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184313856001', '1730924182472556546', '1730248634961821697', 67, 1, 0, '', 66, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184318050306', '1730924182472556546', '1730248641358135297', 68, 1, 0, '', 67, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184326438913', '1730924182472556546', '1730248647850917889', 69, 1, 0, '', 68, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184334827521', '1730924182472556546', '1730248654494695425', 70, 1, 0, '', 69, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184343216130', '1730924182472556546', '1730248661088141313', 71, 1, 0, '', 70, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184347410433', '1730924182472556546', '1730248667744501762', 72, 1, 0, '', 71, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184351604738', '1730924182472556546', '1730248674371502082', 73, 1, 0, '', 72, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184359993345', '1730924182472556546', '1730248681258549250', 74, 1, 0, '', 73, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184359993346', '1730924182472556546', '1730248688271425538', 75, 1, 0, '', 74, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184359993347', '1730924182472556546', '1730248695250747393', 76, 1, 0, '', 75, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184359993348', '1730924182472556546', '1730248702334926850', 77, 1, 0, '', 76, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184359993349', '1730924182472556546', '1730248709490409473', 78, 1, 0, '', 77, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184397742082', '1730924182472556546', '1730248716759138305', 79, 1, 0, '', 78, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184401936386', '1730924182472556546', '1730248724069810178', 80, 1, 0, '', 79, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184401936387', '1730924182472556546', '1730248731518894082', 81, 1, 0, '', 80, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184414519297', '1730924182472556546', '1730248738984755202', 82, 1, 0, '', 81, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184414519298', '1730924182472556546', '1730248746538696706', 83, 1, 0, '', 82, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184427102210', '1730924182472556546', '1730248754172329985', 84, 1, 0, '', 83, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184435490817', '1730924182472556546', '1730248761881460738', 85, 1, 0, '', 84, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184439685122', '1730924182472556546', '1730248769678671874', 86, 1, 0, '', 85, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184448073730', '1730924182472556546', '1730248778000171009', 87, 1, 0, '', 86, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184456462337', '1730924182472556546', '1730248785948377090', 88, 1, 0, '', 87, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184460656642', '1730924182472556546', '1730248793942720514', 89, 1, 0, '', 88, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184469045250', '1730924182472556546', '1730248802020950017', 90, 1, 0, '', 89, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184477433858', '1730924182472556546', '1730248810187259905', 91, 1, 0, '', 90, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184481628162', '1730924182472556546', '1730248818487787522', 92, 1, 0, '', 91, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184490016770', '1730924182472556546', '1730248826897367042', 93, 1, 0, '', 92, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184494211074', '1730924182472556546', '1730248835634102274', 94, 1, 0, '', 93, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184502599681', '1730924182472556546', '1730248844190482434', 95, 1, 0, '', 94, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184506793986', '1730924182472556546', '1730248852813971458', 96, 1, 0, '', 95, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184515182594', '1730924182472556546', '1730248861487792130', 97, 1, 0, '', 96, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184519376897', '1730924182472556546', '1730248870237110274', 98, 1, 0, '', 97, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184527765506', '1730924182472556546', '1730248879070314497', 99, 1, 0, '', 98, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730924184531959809', '1730924182472556546', '1730248888037736450', 100, 1, 0, '', 99, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350042275842', '1730940350042275841', '1730248201459531778', 1, 1, 0, '', 0, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350059053058', '1730940350042275841', '1730248202608771074', 2, 1, 0, '', 1, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350063247361', '1730940350042275841', '1730248203657347073', 3, 1, 0, '', 2, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350063247362', '1730940350042275841', '1730248204949192705', 4, 1, 0, '', 3, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350067441666', '1730940350042275841', '1730248206215872513', 5, 1, 0, '', 4, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350071635970', '1730940350042275841', '1730248207507718146', 6, 1, 0, '', 5, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350075830274', '1730940350042275841', '1730248208791175170', 7, 1, 0, '', 6, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350080024577', '1730940350042275841', '1730248210217238530', 8, 1, 0, '', 7, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350080024578', '1730940350042275841', '1730248211764936706', 9, 1, 0, '', 8, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350084218882', '1730940350042275841', '1730248213379743745', 10, 1, 0, '', 9, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350088413185', '1730940350042275841', '1730248215099408386', 11, 1, 0, '', 10, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350088413186', '1730940350042275841', '1730248216772935682', 12, 1, 0, '', 11, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350092607490', '1730940350042275841', '1730248218610040834', 13, 1, 0, '', 12, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350096801794', '1730940350042275841', '1730248220380037121', 14, 1, 0, '', 13, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350100996098', '1730940350042275841', '1730248222175199234', 15, 1, 0, '', 14, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350105190401', '1730940350042275841', '1730248224071024642', 16, 1, 0, '', 15, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350109384706', '1730940350042275841', '1730248226042347521', 17, 1, 0, '', 16, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350113579009', '1730940350042275841', '1730248228064002050', 18, 1, 0, '', 17, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350117773313', '1730940350042275841', '1730248230144376834', 19, 1, 0, '', 18, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1730940350121967617', '1730940350042275841', '1730248232308637698', 20, 1, 0, '', 19, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693819527170', '1733021693240713218', '1730248201459531778', 1, 1, 1, '', 0, 3, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693882441729', '1733021693240713218', '1730248202608771074', 2, 1, 1, '', 1, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693899218946', '1733021693240713218', '1730248203657347073', 3, 1, 1, '', 2, 3, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693899218947', '1733021693240713218', '1730248204949192705', 4, 1, 1, '', 3, 2, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693915996162', '1733021693240713218', '1730248206215872513', 5, 1, 1, '', 4, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693928579073', '1733021693240713218', '1730248207507718146', 6, 1, 1, '', 5, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693928579074', '1733021693240713218', '1730248208791175170', 7, 1, 1, '', 6, 4, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693941161986', '1733021693240713218', '1730248210217238530', 8, 1, 1, '', 7, 4, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693941161987', '1733021693240713218', '1730248211764936706', 9, 1, 1, '', 8, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693957939201', '1733021693240713218', '1730248213379743745', 10, 1, 1, '', 9, 2, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693966327809', '1733021693240713218', '1730248215099408386', 11, 1, 1, '', 10, 3, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693970522114', '1733021693240713218', '1730248216772935682', 12, 1, 1, '', 11, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693974716417', '1733021693240713218', '1730248218610040834', 13, 1, 1, '', 12, 2, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693987299329', '1733021693240713218', '1730248220380037121', 14, 1, 1, '', 13, 4, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693995687937', '1733021693240713218', '1730248222175199234', 15, 1, 1, '', 14, 2, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693999882241', '1733021693240713218', '1730248224071024642', 16, 1, 1, '', 15, 2, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021693999882242', '1733021693240713218', '1730248226042347521', 17, 1, 1, '', 16, 3, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021694020853761', '1733021693240713218', '1730248228064002050', 18, 1, 1, '', 17, 1, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021694020853762', '1733021693240713218', '1730248230144376834', 19, 1, 1, '', 18, 2, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733021694037630978', '1733021693240713218', '1730248232308637698', 20, 1, 1, '', 19, 2, 0, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411670900739', '1733027411670900738', '1730248201459531778', 1, 1, 0, '', 0, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411670900740', '1733027411670900738', '1730248202608771074', 2, 1, 0, '', 1, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411683483649', '1733027411670900738', '1730248203657347073', 3, 1, 0, '', 2, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411683483650', '1733027411670900738', '1730248204949192705', 4, 1, 0, '', 3, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411683483651', '1733027411670900738', '1730248206215872513', 5, 1, 0, '', 4, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411696066562', '1733027411670900738', '1730248207507718146', 6, 1, 0, '', 5, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411696066563', '1733027411670900738', '1730248208791175170', 7, 1, 0, '', 6, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411696066564', '1733027411670900738', '1730248210217238530', 8, 1, 0, '', 7, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411696066565', '1733027411670900738', '1730248211764936706', 9, 1, 0, '', 8, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411708649473', '1733027411670900738', '1730248213379743745', 10, 1, 0, '', 9, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411708649474', '1733027411670900738', '1730248215099408386', 11, 1, 0, '', 10, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411717038082', '1733027411670900738', '1730248216772935682', 12, 1, 0, '', 11, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411721232385', '1733027411670900738', '1730248218610040834', 13, 1, 0, '', 12, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411725426689', '1733027411670900738', '1730248220380037121', 14, 1, 0, '', 13, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411729620993', '1733027411670900738', '1730248222175199234', 15, 1, 0, '', 14, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411733815298', '1733027411670900738', '1730248224071024642', 16, 1, 0, '', 15, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411742203905', '1733027411670900738', '1730248226042347521', 17, 1, 0, '', 16, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411746398209', '1733027411670900738', '1730248228064002050', 18, 1, 0, '', 17, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411750592514', '1733027411670900738', '1730248230144376834', 19, 1, 0, '', 18, 0, 0, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `no`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1733027411758981122', '1733027411670900738', '1730248232308637698', 20, 1, 0, '', 19, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for el_paper_qu_answer
-- ----------------------------
DROP TABLE IF EXISTS `el_paper_qu_answer`;
CREATE TABLE `el_paper_qu_answer` (
  `id` varchar(64) NOT NULL COMMENT '自增ID',
  `paper_id` varchar(64) NOT NULL COMMENT '试卷ID',
  `answer_id` varchar(32) NOT NULL COMMENT '回答项ID',
  `qu_id` varchar(32) NOT NULL COMMENT '题目ID',
  `is_right` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否正确项',
  `checked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否选中',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `abc` varchar(64) NOT NULL DEFAULT '' COMMENT '选项标签',
  `item_score` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录答案';

-- ----------------------------
-- Records of el_paper_qu_answer
-- ----------------------------
BEGIN;
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('007d24d4-00ce-4387-9ce7-607336f167fe', '1733021693240713218', '1730248230383452163', '1730248230144376834', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0093ed94-9258-4dae-8757-b7b7261a5336', '1733021693240713218', '1730248228294688769', '1730248228064002050', 1, 1, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('014708b5-89b1-4c7a-8ff8-9535a0cea32f', '1730924182472556546', '1730248407815094273', '1730248407538270209', 1, 1, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('01c31ece-03dd-4446-ab88-5f42186b12c1', '1730924182472556546', '1730248654779908098', '1730248654494695425', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('02afce6b-6972-45a5-ae07-8ff2ce4d58d1', '1730940350042275841', '1730248218878476289', '1730248218610040834', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('02d090a0-36fc-4431-9eb8-9adb9a475c30', '1730924182472556546', '1730248667987771393', '1730248667744501762', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('04aeca8d-2aab-4c62-aefe-db5e19f5a5fa', '1733021693240713218', '1730248224301711362', '1730248224071024642', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('05f203aa-5a0e-45e9-b681-47dbc3e99b95', '1730924182472556546', '1730248505865338881', '1730248505575931906', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('06e63e44-8739-423f-8dd8-a7983925a729', '1733027411670900738', '1730248211987234817', '1730248211764936706', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('072c5aab-e138-454a-9a71-f221838c5c10', '1733021693240713218', '1730248232585461762', '1730248232308637698', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0732e2b0-d645-45f7-b81b-ea9ead5afcc1', '1730924182472556546', '1730248559476932610', '1730248559204302850', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('07ef4c1d-a35b-4274-8a49-f725b680d8c6', '1730924182472556546', '1730248661381742594', '1730248661088141313', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0821bde9-211f-4934-9e6b-7435273a0403', '1730940350042275841', '1730248203976114178', '1730248203657347073', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('08c4ee6e-89d6-4b28-9b7e-94a29e2fbe55', '1730924182472556546', '1730248702632722433', '1730248702334926850', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('08ed0da8-238d-4429-8c3b-4325aaa5ad0d', '1730940350042275841', '1730248228307271683', '1730248228064002050', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('09d0c824-be21-4ca3-945e-7ff629515e69', '1730940350042275841', '1730248226277228546', '1730248226042347521', 1, 0, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('09e2c655-fa27-4f59-bbdf-e3dec482a454', '1730924182472556546', '1730248399917219841', '1730248399619424257', 1, 1, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0ac42c6e-23ed-48f4-a53e-c89a277a0bf1', '1730924182472556546', '1730248538916454402', '1730248538631241729', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0af212ed-fb46-4ed0-9e58-779a2d9b0523', '1730940350042275841', '1730248201820241921', '1730248201459531778', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0b465b96-a18a-4596-a9c9-b93f337e9bdf', '1733027411670900738', '1730248202805903364', '1730248202608771074', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0be7c9e5-4cfc-402e-b4a7-31009d91bf71', '1730924182472556546', '1730248702624333826', '1730248702334926850', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0c575516-ea48-4ece-99ef-984098ba5d98', '1733021693240713218', '1730248226277228546', '1730248226042347521', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0d39224e-76e7-4007-be6e-f0c6925ad9b4', '1730924182472556546', '1730248724363411457', '1730248724069810178', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0d5b3b8a-b4db-44bd-a3f0-4ff03277e3d5', '1730924182472556546', '1730248654788296706', '1730248654494695425', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0dbd0205-dbd9-451f-be13-74fa29129fba', '1733021693240713218', '1730248209000890372', '1730248208791175170', 1, 1, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0dc99321-d285-4b98-8b19-b0f04d317f3b', '1733021693240713218', '1730248202805903364', '1730248202608771074', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0e1beade-4e23-43ac-8268-89d7fb3b7541', '1730924182472556546', '1730248570331791361', '1730248570042384385', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0f64be61-cd3f-4296-86b0-a4d87d51ac5c', '1733021693240713218', '1730248210502451202', '1730248210217238530', 1, 0, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0f68b199-9391-4801-ad39-2d11d9a58ce7', '1733021693240713218', '1730248215363649537', '1730248215099408386', 1, 1, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('0f72981e-b4a5-4bc8-9d28-7ad55037f214', '1730940350042275841', '1730248202805903363', '1730248202608771074', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1078f19b-6aa5-47f6-baa8-b26764c60e16', '1730924182472556546', '1730248778285383681', '1730248778000171009', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('10a8c7c0-158d-4d66-9830-2dd5d25915fd', '1733021693240713218', '1730248201828630531', '1730248201459531778', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('117072be-5fce-4047-867f-b6034cb1cc5a', '1733027411670900738', '1730248222414274561', '1730248222175199234', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('12d34a4d-0709-4ed2-add5-856d54639270', '1733027411670900738', '1730248213631401987', '1730248213379743745', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('12dc461c-d00c-43d1-a4e0-570417bfc375', '1730924182472556546', '1730248661369159681', '1730248661088141313', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1358f366-d81b-469d-82f7-8cf644b700a1', '1730924182472556546', '1730248592851009537', '1730248592574185473', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('13e347e9-20b7-4742-b39c-9a1ca7d52d89', '1733021693240713218', '1730248205175685121', '1730248204949192705', 1, 1, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('13f18eef-9407-4973-8a47-50f235714b94', '1730924182472556546', '1730248399929802753', '1730248399619424257', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1422a37a-6666-4f96-8829-d9cbeefb8142', '1733027411670900738', '1730248207734210562', '1730248207507718146', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('142e328b-13fa-4142-8bcf-fc8b00d3a506', '1730924182472556546', '1730248461678346241', '1730248461405716482', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1554091f-1503-4c80-ad26-e5c7953326a2', '1730924182472556546', '1730248480632406017', '1730248480347193345', 1, 1, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('15570b1b-8197-4228-aba6-15d90e1fd148', '1730940350042275841', '1730248220598140930', '1730248220380037121', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1624bdd9-3f3c-4ea7-ab1b-697f2c7d5cea', '1730940350042275841', '1730248224314294276', '1730248224071024642', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('16b842cf-2980-40df-bc62-40fab539c844', '1730924182472556546', '1730248472784863233', '1730248472474484738', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('16bcc996-39f0-4e91-8cd0-8fafe91b9b2b', '1730924182472556546', '1730248514954395650', '1730248514644017154', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('178e335d-34f2-422c-83d3-c369f7e9ea14', '1730924182472556546', '1730248746815520769', '1730248746538696706', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('17eaf9d0-4487-407e-aa06-6b50b710bca8', '1730924182472556546', '1730248444783689729', '1730248444494282754', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1870ca0d-c736-4b8c-9bd0-bc3a9a3004bf', '1730924182472556546', '1730248451335192578', '1730248451049979905', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1941f792-e802-46ae-a578-36a159b124fb', '1730924182472556546', '1730248468972240898', '1730248468695416833', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1a35ceaf-f435-427c-b93f-1af27c2c4ce2', '1730924182472556546', '1730248802293579778', '1730248802020950017', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1ac5c1bf-1feb-48ba-9574-d04837546745', '1733021693240713218', '1730248230375063554', '1730248230144376834', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1b15464d-6701-48be-a8d4-ead68e84c0e0', '1733021693240713218', '1730248222414274562', '1730248222175199234', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1b34c910-06b7-4182-a276-6daf7c724fad', '1733021693240713218', '1730248218878476290', '1730248218610040834', 1, 1, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1b48e0ce-81c8-4ef5-9e91-ecf652cbe5ae', '1733021693240713218', '1730248201828630529', '1730248201459531778', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1bbc1eea-f6d3-4176-8c45-707d9b030ec8', '1733021693240713218', '1730248201820241921', '1730248201459531778', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1e22b85c-0603-47f2-a321-e834738b4878', '1733021693240713218', '1730248207734210562', '1730248207507718146', 1, 1, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1e312631-ed79-432c-944e-d7347a978e77', '1730924182472556546', '1730248564841447426', '1730248564560429057', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('1e5d8a69-9d28-4cf1-aead-7a96df32fd97', '1730924182472556546', '1730248458142547970', '1730248457861529602', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2001e20f-fb3a-47b4-994e-7568fd994a1f', '1733027411670900738', '1730248230375063554', '1730248230144376834', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('20c6b71e-8546-4ec2-a553-2ef933f6cd7e', '1730924182472556546', '1730248417105477633', '1730248416820264962', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('227a01e9-48b6-4075-a3ad-328ab36dbc24', '1733021693240713218', '1730248211987234817', '1730248211764936706', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('230f90d9-d6b6-4d41-9518-136d41d0d108', '1730924182472556546', '1730248427326996481', '1730248427058561026', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('241e98d4-f6b7-4c3e-93a0-10015f8029ce', '1733021693240713218', '1730248210506645505', '1730248210217238530', 1, 0, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('24813ed0-14a4-4dcd-848a-a5f623ded592', '1730924182472556546', '1730248501452931074', '1730248501167718402', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('25071ab6-1676-4009-81cf-845be475feca', '1730940350042275841', '1730248213631401987', '1730248213379743745', 1, 0, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2536b2ed-f0b2-4d06-9315-7f926987835a', '1730924182472556546', '1730248754461736961', '1730248754172329985', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('25935295-182a-4054-8646-371275becbde', '1730924182472556546', '1730248524332859393', '1730248524060229634', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('25ec884b-0b6c-4602-9fd0-be79d341b711', '1733021693240713218', '1730248213631401987', '1730248213379743745', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('25fa0d01-3922-4c77-9bda-a4ea8be85efe', '1730940350042275841', '1730248209000890371', '1730248208791175170', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('279e1a3f-f5bb-4581-b8ee-f9c33569e90e', '1730940350042275841', '1730248228307271681', '1730248228064002050', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('28ce2cc9-18ba-48ad-83a1-b06ed92292cf', '1733021693240713218', '1730248205163102210', '1730248204949192705', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('28e8daf2-cd1b-4466-9ed3-936dc5e73e4b', '1733021693240713218', '1730248222401691649', '1730248222175199234', 1, 0, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('29c9b95e-8943-4ba6-b80c-24b16d6f76e2', '1733021693240713218', '1730248206454947842', '1730248206215872513', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('29ea41a1-e3c6-445e-8ded-8ce7e7878746', '1730924182472556546', '1730248505856950273', '1730248505575931906', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2ada48de-1bcd-4e55-931e-fdd719fdbf37', '1730924182472556546', '1730248770479783937', '1730248769678671874', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2adf1f06-659c-4650-bccd-0cae2c4fc0ba', '1733021693240713218', '1730248212012400642', '1730248211764936706', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2b6e487e-c5dd-4478-a762-c6d2dcd0c3d1', '1733027411670900738', '1730248224314294274', '1730248224071024642', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2b95ccda-faae-4bd2-8e76-0e3752e79766', '1730924182472556546', '1730248391910293506', '1730248391633469442', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2baf7bd5-1353-4546-9063-6ced88ffec1c', '1730924182472556546', '1730248480624017409', '1730248480347193345', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2c588aea-0c39-4164-aa84-7c7a4d2246b2', '1730924182472556546', '1730248739261579266', '1730248738984755202', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2ca29164-8b36-4dd7-9755-6a1ae47b9c6f', '1730924182472556546', '1730248616544632833', '1730248616263614465', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2cc2e8eb-9e15-4579-8ffb-7fd88c1ca911', '1730924182472556546', '1730248786229395457', '1730248785948377090', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2d34ace9-9bcd-43f5-8c07-fa1f51b4004d', '1730924182472556546', '1730248564854030338', '1730248564560429057', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2d761e0e-93dd-4dd0-a33a-6e902d8de00a', '1730940350042275841', '1730248230383452163', '1730248230144376834', 1, 0, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2df5106b-d44e-4cd7-8bb7-f1e3296b150a', '1733021693240713218', '1730248201828630530', '1730248201459531778', 1, 1, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('2fee6123-60ba-4b37-a552-d39da87aa090', '1730924182472556546', '1730248835948675073', '1730248835634102274', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3058842f-57cf-4c0a-b6aa-bbcd88448e06', '1730924182472556546', '1730248818777194497', '1730248818487787522', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3074e4f9-1daf-4b8f-892f-5c881cd12f42', '1730940350042275841', '1730248209000890372', '1730248208791175170', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('30d50bd7-6291-4bca-ba75-1242330a7ec1', '1730940350042275841', '1730248226277228545', '1730248226042347521', 1, 0, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('31de7eb6-1a2b-454d-97c6-b1436e53d60a', '1733027411670900738', '1730248226277228545', '1730248226042347521', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('32044c2d-c6bf-4da2-b845-85dcb0e41bbc', '1730924182472556546', '1730248497149575169', '1730248496872751106', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('33a067a1-7567-4780-ab0b-4926281b7d2b', '1730924182472556546', '1730248786221006850', '1730248785948377090', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('33bcf7d8-6647-4f9a-83eb-9ecf3802e6fb', '1730940350042275841', '1730248215351066625', '1730248215099408386', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3451de5b-89e4-4490-ab09-214b534f16d5', '1730924182472556546', '1730248587109007362', '1730248586819600386', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('35ac8cb7-93f6-4505-9baf-bf2ac25649e9', '1730940350042275841', '1730248232585461762', '1730248232308637698', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('35df0ab6-8dcf-4191-8368-76938ffed4c6', '1733027411670900738', '1730248201828630531', '1730248201459531778', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('378191fd-d36f-4a39-88c7-d51228dad059', '1730924182472556546', '1730248519635238914', '1730248519350026241', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('37bdc92d-5400-43ff-b11f-e1237c1e3160', '1730924182472556546', '1730248610500640770', '1730248610228011010', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('384347c1-f53e-4318-9ed5-3e63ad13ba66', '1730924182472556546', '1730248778297966594', '1730248778000171009', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('395d69c8-1de9-4361-8011-e65307c152c0', '1730940350042275841', '1730248209000890370', '1730248208791175170', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3ab6f9eb-4488-4c37-8fae-e97ce55144a7', '1730924182472556546', '1730248492913328129', '1730248492636504065', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3b30814e-ffe4-408e-9b60-bcbae059e9ff', '1733027411670900738', '1730248228307271683', '1730248228064002050', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3c1f3df9-5c0e-4569-8f91-8ee286c8b883', '1730940350042275841', '1730248203976114177', '1730248203657347073', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3ca1eec7-289d-4a49-8518-86b26ec00553', '1730940350042275841', '1730248206471725057', '1730248206215872513', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3d3c23d4-c811-418a-af66-75abda918b94', '1730924182472556546', '1730248393344745473', '1730248393042755585', 1, 1, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3dfc9852-ba59-4955-bd39-c198bc47ac73', '1730940350042275841', '1730248206475919362', '1730248206215872513', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3e07ca4f-bfb0-497e-af0a-b91e7f5089e8', '1733021693240713218', '1730248218882670593', '1730248218610040834', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3e1f9001-3f6a-449c-9fa7-996a063973f9', '1730924182472556546', '1730248794223738882', '1730248793942720514', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('3f941b42-bd3e-48ae-9863-9b9096fbc699', '1733027411670900738', '1730248213631401986', '1730248213379743745', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('41ee7c48-aa9a-499e-9591-694f99cb10ab', '1730924182472556546', '1730248396398198786', '1730248396121374721', 1, 1, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('428198a7-b1e2-425c-b9c0-09f5032d9aa7', '1733021693240713218', '1730248217066536963', '1730248216772935682', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('42ef39df-a40c-48fa-91ae-e8737278136b', '1730924182472556546', '1730248468984823810', '1730248468695416833', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('432e31d7-2404-4e8e-8625-b39feefe9392', '1730924182472556546', '1730248405709553665', '1730248405361426433', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('435b3bd5-9c47-4019-88f7-dd8c50752158', '1730924182472556546', '1730248879372304386', '1730248879070314497', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('43977ab5-f851-4d7d-9ea1-5c654d0624ff', '1733027411670900738', '1730248226264645634', '1730248226042347521', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('440d7a6f-6a14-468c-a394-58828adf6155', '1730924182472556546', '1730248818764611586', '1730248818487787522', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('45ba0851-8df4-493a-a0e5-0fdf3972e2e6', '1730924182472556546', '1730248827341963265', '1730248826897367042', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('464ac637-da26-45c5-b7ae-4b0ba18aae67', '1730924182472556546', '1730248543928647682', '1730248543656017921', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('46a8ce59-b5a8-4537-aa20-9467b851dcd8', '1733021693240713218', '1730248226264645634', '1730248226042347521', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('479fffd1-c7f9-4c28-abf1-74ebd9d37449', '1733027411670900738', '1730248210489868290', '1730248210217238530', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('47c7fc44-cff8-4e34-8ed4-34a81b1da836', '1730924182472556546', '1730248575864078337', '1730248575574671361', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4816934a-feed-4728-ab3a-af3a068ebbc3', '1733021693240713218', '1730248206471725057', '1730248206215872513', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('49594e3c-f296-47ae-950d-b061c39c8bc9', '1730924182472556546', '1730248533967175681', '1730248533694545922', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4a3aae7a-2b91-48b0-8319-2aab5e68ca42', '1733021693240713218', '1730248232585461761', '1730248232308637698', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4a924ed3-3dca-41d5-ac7c-1b942bf4a322', '1733021693240713218', '1730248203976114178', '1730248203657347073', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4a9a6a9e-c82d-486a-949b-32d9d7b84ec6', '1730940350042275841', '1730248217066536961', '1730248216772935682', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4abf691a-1cba-4265-aa12-65ccebb5350c', '1730924182472556546', '1730248476714926081', '1730248476425519105', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4b7d743f-d674-4005-bfab-14a13865c16e', '1733027411670900738', '1730248203976114178', '1730248203657347073', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4cef236f-6215-43d5-a9b5-b942b7999428', '1730924182472556546', '1730248424684584961', '1730248424399372290', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4d134102-7d1c-4786-895b-2a9f05729447', '1730924182472556546', '1730248604523757570', '1730248604255322114', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4d561a33-abb0-4c2d-a887-31a54abfe9e9', '1730924182472556546', '1730248488748384258', '1730248488454782977', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4dcdea64-1827-4885-b13f-38a810bd8252', '1730940350042275841', '1730248202805903364', '1730248202608771074', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4ddad4ab-9e4d-4500-b5c1-78d2198ac605', '1733027411670900738', '1730248230383452162', '1730248230144376834', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4ea40281-ec67-460f-b156-25ae74baf49e', '1730924182472556546', '1730248454699024386', '1730248454418006017', 1, 1, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4f087547-3707-49ee-a256-7aae07e68edc', '1730940350042275841', '1730248206454947842', '1730248206215872513', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4f6dd353-06b4-4bea-83f7-3cf5950802d8', '1733027411670900738', '1730248218878476289', '1730248218610040834', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('4fc69451-d4fc-413d-8986-640db3f151ef', '1733027411670900738', '1730248205175685122', '1730248204949192705', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('501bbaed-7e3e-49b1-901b-eddfbfe0a57c', '1730940350042275841', '1730248201828630531', '1730248201459531778', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('52c80fef-b852-4f8e-af24-dfcb7ff10bc6', '1730940350042275841', '1730248232585461761', '1730248232308637698', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('532c305c-7908-4b63-a9ff-af701fff0e3b', '1730940350042275841', '1730248217049759746', '1730248216772935682', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('551e8349-7671-4ac5-be55-6f6243123c49', '1730924182472556546', '1730248510336466945', '1730248510055448578', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('568261a7-9739-41e3-a4cb-61eca824c908', '1730924182472556546', '1730248409945800706', '1730248409656393729', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('569c67e9-9065-4a28-b2fa-b1e8d81ea06f', '1733021693240713218', '1730248222414274561', '1730248222175199234', 1, 1, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('56c57a94-b8bf-42f3-b7da-d78853ba2381', '1733021693240713218', '1730248212020789249', '1730248211764936706', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('58e8b86d-fbd8-453e-8c8d-2311a523800f', '1730940350042275841', '1730248220593946625', '1730248220380037121', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5938ea07-86dd-4672-a042-787a2950e464', '1730924182472556546', '1730248419580116993', '1730248419294904322', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5a279748-4512-4039-8f8c-025fa014b876', '1733021693240713218', '1730248230383452162', '1730248230144376834', 1, 1, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5aa38ad3-cb3c-48f7-8c24-dd958b0862fb', '1733027411670900738', '1730248213614624770', '1730248213379743745', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5ad8eba8-819d-4c18-b0a1-12c7d966ee82', '1730924182472556546', '1730248389284659202', '1730248388999446529', 1, 1, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5b2e7223-0b1f-43b5-b412-48db52278599', '1730924182472556546', '1730248388173168643', '1730248387917316097', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5c04c52e-808d-4a22-aa9b-aa989d5f2064', '1733021693240713218', '1730248208992501762', '1730248208791175170', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5c181c11-67c7-4a16-92ba-fb99a8c99e4b', '1733027411670900738', '1730248201820241921', '1730248201459531778', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5c5e7d0d-2a96-46f6-be46-f974875ee2e5', '1730924182472556546', '1730248853094989826', '1730248852813971458', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5dedddbc-1c06-4d6b-b7b2-d615db39e3e1', '1730924182472556546', '1730248519626850305', '1730248519350026241', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5e6042e6-8c9e-4e98-bf1b-f1828c87c706', '1730924182472556546', '1730248794211155970', '1730248793942720514', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5e829849-f3bd-461b-a36d-d86430b4fd30', '1730940350042275841', '1730248210489868290', '1730248210217238530', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5e878f94-2b29-4e7c-8bf3-38b155d0291c', '1733027411670900738', '1730248220598140930', '1730248220380037121', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5ec37e34-a92e-494a-a191-1175543d77a2', '1733021693240713218', '1730248226277228545', '1730248226042347521', 1, 0, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5ecf8558-0950-498f-98ff-ae02fea755c8', '1733021693240713218', '1730248205175685122', '1730248204949192705', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5f2bd3b2-225f-4811-9597-9728feb2238a', '1730924182472556546', '1730248405692776450', '1730248405361426433', 1, 1, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5f3d55c2-d5a4-456a-985d-878a53ba3ef0', '1730924182472556546', '1730248412332359682', '1730248411938095105', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('5fdd9f9e-f2af-4896-bdf1-8b0cb3b326e5', '1733027411670900738', '1730248217066536962', '1730248216772935682', 1, 0, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('61442be4-eb8b-4fa8-9ca6-6270b3121558', '1730940350042275841', '1730248207734210562', '1730248207507718146', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('621777de-5784-40e7-b20f-ea19365f88ec', '1730940350042275841', '1730248230379257858', '1730248230144376834', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('636b4b57-bd0d-4aef-98f2-4926eaeb50cf', '1733021693240713218', '1730248205175685123', '1730248204949192705', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('64cf489b-75d1-4ad5-af55-399655bbf3d2', '1733021693240713218', '1730248203925782529', '1730248203657347073', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('66488817-bff7-44f5-8af1-371894cc9644', '1733021693240713218', '1730248232581267457', '1730248232308637698', 1, 1, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('665937f0-6d6a-4b6f-944d-98ed2bdff3e6', '1730924182472556546', '1730248465289641986', '1730248465012817922', 1, 1, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('684ab17a-9735-4d84-ba8c-f276166cc6d9', '1730940350042275841', '1730248205175685123', '1730248204949192705', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('69230ad0-ad66-4627-a8d1-11f6592a00b9', '1730924182472556546', '1730248543945424898', '1730248543656017921', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('69621f51-515b-40ab-b2ad-86e11d0e6626', '1730924182472556546', '1730248451322609666', '1730248451049979905', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('696bacb0-02da-4ed2-a541-0b154b685879', '1730924182472556546', '1730248554242441218', '1730248553948839938', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6999c876-c29c-4371-9e5f-e11e11bbdb5f', '1730924182472556546', '1730248407827677186', '1730248407538270209', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('69ef02ad-06a4-4861-82b8-45dfc4e260fd', '1730924182472556546', '1730248844479889410', '1730248844190482434', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6a14e6f5-2edd-4460-a48e-a1a887710540', '1730940350042275841', '1730248217066536962', '1730248216772935682', 1, 0, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6a8c9fb6-d266-49fc-9b76-8da997bad586', '1730924182472556546', '1730248432922198018', '1730248432636985346', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6accaddc-d1ce-4860-9c20-545b33ca35bf', '1733021693240713218', '1730248232577073153', '1730248232308637698', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6af41f00-d42d-4aca-8673-486a30e98bbc', '1730924182472556546', '1730248688556638209', '1730248688271425538', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6b227ae3-d74a-433c-9bf9-c258c9a0c457', '1730924182472556546', '1730248861777199105', '1730248861487792130', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6c107889-3e9b-480b-ab2b-7c2a29863562', '1733027411670900738', '1730248218878476290', '1730248218610040834', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6c13e002-c927-4bf3-a323-6ef4a7ad9554', '1730924182472556546', '1730248717027573761', '1730248716759138305', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6c411c92-633c-479f-8a75-bf6f07c51403', '1733027411670900738', '1730248215359455233', '1730248215099408386', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6c4a8b7a-9202-4e61-8258-421d374cc18c', '1733027411670900738', '1730248207742599171', '1730248207507718146', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6c9dc11e-f8ab-4012-85b3-c7a7eb07906e', '1730940350042275841', '1730248213635596290', '1730248213379743745', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6d0b148f-3bbb-4b83-b929-a7e29879b790', '1733021693240713218', '1730248220585558018', '1730248220380037121', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6d160f9a-d7cc-4791-81fc-bd95f65eab51', '1733027411670900738', '1730248208992501762', '1730248208791175170', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6d97800a-d09d-491b-b471-b81682f0723b', '1730924182472556546', '1730248709763039233', '1730248709490409473', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6d9885ed-c096-45ff-9633-42e1c6944bd7', '1730924182472556546', '1730248762154090498', '1730248761881460738', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6dc02e3f-5e94-4b95-a097-f306cbd9799b', '1730924182472556546', '1730248484637966337', '1730248484352753666', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6e3e7aed-97f3-4194-b5f0-a5db96b75e6c', '1730924182472556546', '1730248393332162561', '1730248393042755585', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6e9095c4-a775-46aa-aadc-2e6b84c689f6', '1730940350042275841', '1730248205175685122', '1730248204949192705', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('6f300d07-6b23-4e07-a8e4-237b72839ca0', '1730940350042275841', '1730248226264645634', '1730248226042347521', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('701cbb11-acb2-4184-8871-376477b0727b', '1733021693240713218', '1730248217066536961', '1730248216772935682', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('70290ab8-79e0-4e23-b272-dc1f30d2f123', '1730924182472556546', '1730248448009109505', '1730248447728091138', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('734db7cc-cf7f-4d60-b235-f3f4cba4e666', '1733021693240713218', '1730248209000890370', '1730248208791175170', 1, 0, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('739c01b7-18d8-494f-9fe3-a2a14211f336', '1733021693240713218', '1730248230379257858', '1730248230144376834', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('7586e596-99fb-432e-a06b-8e2b6f5c24f3', '1730924182472556546', '1730248695531765762', '1730248695250747393', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('76c88f51-61ac-4686-aa75-0f208ddd4c86', '1733021693240713218', '1730248220598140930', '1730248220380037121', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('770c8f11-6189-4a67-9ce3-81ea154c8db5', '1733027411670900738', '1730248205175685121', '1730248204949192705', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('77693631-7adc-41d0-a4f7-0c9ea4b6f334', '1730924182472556546', '1730248628963966977', '1730248628657782785', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('77d19faa-9f81-4593-9d00-307e28dc0e33', '1733021693240713218', '1730248226273034241', '1730248226042347521', 1, 1, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('79431e27-3764-41f0-b48e-6c4f9e792f8e', '1730924182472556546', '1730248497141186562', '1730248496872751106', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('795b69d5-c63f-434e-8db1-bde1623f84cf', '1730924182472556546', '1730248861764616193', '1730248861487792130', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('799cd796-9e9c-4835-9a83-52c228d360fc', '1733027411670900738', '1730248203925782529', '1730248203657347073', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('7a927dc6-06a2-4b3d-8c1d-2c521016652c', '1730924182472556546', '1730248435711410177', '1730248435463946242', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('7b898343-6c9d-4eb0-8339-44a61ecdf4e6', '1733027411670900738', '1730248209000890371', '1730248208791175170', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('7bf51f5a-e8db-4902-8638-40a8252fcad0', '1733027411670900738', '1730248232585461762', '1730248232308637698', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('7c6311b5-e4ec-4a3a-85cb-b0d0da2e3263', '1730924182472556546', '1730248888322949121', '1730248888037736450', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('7eab1175-0067-4a98-b49d-240963c63c55', '1730924182472556546', '1730248635272200194', '1730248634961821697', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('7edc4116-ff50-46c8-9962-1d573947ccc4', '1733021693240713218', '1730248210506645506', '1730248210217238530', 1, 1, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8003998e-eeb5-4f4a-8033-bd3541f22444', '1733021693240713218', '1730248212020789250', '1730248211764936706', 1, 1, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('803e718c-53b7-4d75-b9a2-effb082f3124', '1730924182472556546', '1730248524345442305', '1730248524060229634', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('80c8bf82-eb15-49c5-b97f-aa2491de1a44', '1733027411670900738', '1730248210506645506', '1730248210217238530', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('81fc3267-4665-4019-ab2e-fb2728c6528f', '1733027411670900738', '1730248210506645505', '1730248210217238530', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('82185306-8822-41bd-ba6f-a18acc3263cb', '1733021693240713218', '1730248222414274563', '1730248222175199234', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('82684537-1a02-4289-ae5f-bc839038bff5', '1730940350042275841', '1730248218857504769', '1730248218610040834', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('82a76917-e6cd-4d45-8255-3398c1520b0a', '1733021693240713218', '1730248228307271681', '1730248228064002050', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('82f05a4e-6836-471f-9391-7200fcbd0208', '1733021693240713218', '1730248218878476289', '1730248218610040834', 1, 0, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('831cca78-4b9d-4b0f-b6e9-663de4f5a875', '1730924182472556546', '1730248674648326145', '1730248674371502082', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8329fd99-9348-4328-99bb-6749d825fed8', '1733027411670900738', '1730248202805903363', '1730248202608771074', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('836eec6f-8df6-487a-8f3e-b111239b3982', '1733027411670900738', '1730248205175685123', '1730248204949192705', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('843c01fb-aa15-4bf6-b893-d5ce616ae41f', '1733027411670900738', '1730248226277228546', '1730248226042347521', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('877ac623-242a-4ec9-802d-f5e6fc77918f', '1730924182472556546', '1730248388173168642', '1730248387917316097', 1, 1, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('87f78daa-884d-42ce-946c-435334e31032', '1733021693240713218', '1730248202805903362', '1730248202608771074', 1, 1, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8834bd1c-546b-483f-a7bc-612d73a9590a', '1730924182472556546', '1730248581463474178', '1730248581169872898', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8918ffdb-3a02-4c3b-9013-daef9c3c920f', '1730940350042275841', '1730248222414274561', '1730248222175199234', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('89c69f56-cef3-4be0-babe-4591d7faa23e', '1733027411670900738', '1730248222414274563', '1730248222175199234', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8a8083fb-0d6e-4934-aead-8f29dba6cfbf', '1730924182472556546', '1730248514946007041', '1730248514644017154', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8b06ad97-3e0e-4c0c-ba31-69bcb33b44cf', '1730924182472556546', '1730248492930105345', '1730248492636504065', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8b21319a-7da6-41b2-8525-e1ec71f83702', '1730940350042275841', '1730248210506645505', '1730248210217238530', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8b2188c7-aacf-4a93-8a4f-f5c33ad09eb4', '1733027411670900738', '1730248201828630529', '1730248201459531778', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8b37cc87-108c-4187-ac4b-1427c6fbfb20', '1733027411670900738', '1730248206475919362', '1730248206215872513', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8b4f4198-0158-4695-8729-c938a6832945', '1733027411670900738', '1730248210502451202', '1730248210217238530', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8c42a925-8d12-434c-9a5f-b81af3ea5672', '1730924182472556546', '1730248674677686274', '1730248674371502082', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8cdd5bde-9222-4be0-ab58-9d342139697c', '1730940350042275841', '1730248210502451202', '1730248210217238530', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8dd31a1f-3a12-4199-8e6c-aba47ca31bc2', '1730940350042275841', '1730248222414274562', '1730248222175199234', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8e341162-4920-48b7-b39d-5ce4742f449b', '1730924182472556546', '1730248401724964865', '1730248401427169282', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('8f7300dc-b8da-4a5e-ab6a-10d9f8166fe8', '1730940350042275841', '1730248232577073153', '1730248232308637698', 1, 0, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9123b34d-8e60-4be0-8461-ed780f19e2ad', '1730924182472556546', '1730248570340179970', '1730248570042384385', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('91987408-fa2b-45ae-8aa4-74c72015edad', '1730924182472556546', '1730248549045698561', '1730248548760485890', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('91ea3212-9be6-4773-bf04-152362fff236', '1730924182472556546', '1730248403650150401', '1730248403364937730', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('925a9f94-9846-4d54-b6ea-eb496d273a04', '1730940350042275841', '1730248202805903365', '1730248202608771074', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('92eceb95-43ff-4389-b3ca-5b871e46bc53', '1730924182472556546', '1730248835931897858', '1730248835634102274', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('93641a23-89ee-40d5-9853-9389809ede19', '1730940350042275841', '1730248232581267457', '1730248232308637698', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('946f4392-eb77-4e94-9758-f7db60e265ff', '1730924182472556546', '1730248430074265602', '1730248429793247233', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('95931717-bdf7-4856-8716-26a018d42cfc', '1730940350042275841', '1730248207746793473', '1730248207507718146', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('95ad21ce-9e66-413f-bafa-d9da83214c72', '1730924182472556546', '1730248810459889665', '1730248810187259905', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('96360870-add0-4b60-b599-c1f0c816a26a', '1730940350042275841', '1730248213631401986', '1730248213379743745', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('967f086b-570c-4fe5-a2a7-3353d1aaf725', '1730924182472556546', '1730248533979758593', '1730248533694545922', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('96a0aeef-2425-4433-95f6-afb9595a57e0', '1733021693240713218', '1730248207742599170', '1730248207507718146', 1, 0, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('96c10024-f956-4e88-9b11-e265d06c61c2', '1730924182472556546', '1730248476702343170', '1730248476425519105', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('970be4fb-77cd-406c-9a21-c96e70ea708d', '1730924182472556546', '1730248427339579394', '1730248427058561026', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9764f89a-ed6f-453d-8c57-ae908c520403', '1730924182472556546', '1730248461690929154', '1730248461405716482', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('98b0e103-72aa-4a0a-b561-4a28591a0328', '1733027411670900738', '1730248212012400642', '1730248211764936706', 1, 0, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('98c19c8e-2283-4654-93a3-4ee50b7c4798', '1730924182472556546', '1730248396414976002', '1730248396121374721', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9918983d-1f59-41bb-9e01-37981a0512ad', '1733021693240713218', '1730248206475919362', '1730248206215872513', 1, 1, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9aba618b-ad41-47c5-87a4-1ae5d437c087', '1730940350042275841', '1730248205175685121', '1730248204949192705', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9af0bb82-a0d9-4b60-9461-af30092d6670', '1730924182472556546', '1730248598660120578', '1730248598387490818', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9c5f81ff-5de1-4618-a991-49c3152606d0', '1730924182472556546', '1730248424672002049', '1730248424399372290', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9d84ce4e-9401-4e76-ac25-705d32d68358', '1730940350042275841', '1730248215363649538', '1730248215099408386', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9df313f7-4929-4d88-90cc-2259e21f8b6d', '1733027411670900738', '1730248215363649537', '1730248215099408386', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9e3bb169-1d91-445f-8c5d-9a2ce6d20877', '1730940350042275841', '1730248228294688769', '1730248228064002050', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9e83fa77-c5d9-4821-9b35-0d70a5a173ac', '1733027411670900738', '1730248226273034241', '1730248226042347521', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9eb43a27-2662-44ec-a4f0-48b43414e96a', '1730940350042275841', '1730248218882670593', '1730248218610040834', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9ee76857-ccb5-4838-9be2-e035ac35cc95', '1730924182472556546', '1730248810472472578', '1730248810187259905', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9f61c8e6-500f-4ff4-a5c7-fbdc838d6736', '1730924182472556546', '1730248438601285633', '1730248438353821697', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('9f8647a4-d174-470e-b095-c333cc3990e8', '1733027411670900738', '1730248224301711362', '1730248224071024642', 1, 0, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a0438e16-2bd2-4a2a-a701-7efcc55430dd', '1730924182472556546', '1730248438605479938', '1730248438353821697', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a24866fc-1940-4aef-bc85-085e6da2e65d', '1733021693240713218', '1730248213614624770', '1730248213379743745', 1, 0, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a2655c9c-b8e7-4124-916e-99f713b00852', '1730924182472556546', '1730248510328078337', '1730248510055448578', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a27a3b46-e12a-496b-bb4f-19def95fd4fd', '1733027411670900738', '1730248217066536963', '1730248216772935682', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a2e28d03-fec7-4b69-b6d4-2b31f3efce21', '1730924182472556546', '1730248422079922178', '1730248421811486721', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a3664ca2-0e47-43fa-8f69-61091b6e7295', '1733021693240713218', '1730248210489868290', '1730248210217238530', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a44d0d85-7cba-4cc8-833e-c45ad0929074', '1730924182472556546', '1730248628947189762', '1730248628657782785', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a4c226c8-be6e-465b-897c-be2457ae1fab', '1730940350042275841', '1730248224314294274', '1730248224071024642', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a51dddca-a8bc-4905-ad6f-6b0c1a7d7d05', '1730924182472556546', '1730248417101283330', '1730248416820264962', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a58475f4-0c13-4808-b995-2fe85bb7b52e', '1733021693240713218', '1730248224314294276', '1730248224071024642', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a6c00cc4-7f90-4f3e-b256-75b3d7a8cec6', '1733027411670900738', '1730248201828630530', '1730248201459531778', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a70a9549-c6cd-4246-a510-36ef73649c9d', '1730924182472556546', '1730248598668509185', '1730248598387490818', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a779aae9-b51c-44b8-9dd3-12138a98f749', '1733027411670900738', '1730248215363649538', '1730248215099408386', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a7c32d2b-29b3-4774-b5dd-c42f02acf570', '1730924182472556546', '1730248635259617281', '1730248634961821697', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a7ef9195-0f6a-4b9e-a83a-181b59cae088', '1730940350042275841', '1730248224314294275', '1730248224071024642', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a7fed7a7-c5e6-42c3-9f68-e3f9d393356c', '1730940350042275841', '1730248226273034241', '1730248226042347521', 1, 0, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a8b14190-53d2-497b-afc0-fd5fe9445b58', '1733027411670900738', '1730248206471725057', '1730248206215872513', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a90fa994-f5f3-4562-8856-c2f8811d1ef0', '1730924182472556546', '1730248398159806466', '1730248397786513409', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('a9bd2353-5e57-45a1-a8a4-114e66400c20', '1730940350042275841', '1730248203971919874', '1730248203657347073', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('aa32c62e-e79a-4382-b390-fc0bf92ae624', '1730924182472556546', '1730248695519182850', '1730248695250747393', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('abdc5da2-64ca-4697-bb54-8c378bbe828d', '1733021693240713218', '1730248213631401986', '1730248213379743745', 1, 1, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('abf42791-675e-4055-8596-78652415c2bc', '1733027411670900738', '1730248220593946625', '1730248220380037121', 1, 0, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('ac66be63-6b3d-42a7-9ab4-a7adb36f6636', '1733021693240713218', '1730248218857504769', '1730248218610040834', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('acc6e5f3-9368-4954-9c3e-0a2e9f20cbba', '1733027411670900738', '1730248206471725058', '1730248206215872513', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('acd142c0-4413-4105-b30b-4dfa0324c496', '1733021693240713218', '1730248224314294275', '1730248224071024642', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('ade0a3d8-7447-4de6-bfe1-c7268c076845', '1730940350042275841', '1730248207742599170', '1730248207507718146', 1, 0, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('ae017d88-4f4f-4c0f-9cce-f01615fa5d29', '1733027411670900738', '1730248217066536961', '1730248216772935682', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('afc3d009-c2c1-4f46-af57-b7bd793ae49e', '1733027411670900738', '1730248209000890372', '1730248208791175170', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('affecf40-1374-43e8-bdaf-5977436fe781', '1730924182472556546', '1730248401712381953', '1730248401427169282', 1, 1, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b0a9fe3d-21ef-471f-9a27-fd3242dcd84d', '1730924182472556546', '1730248448017498114', '1730248447728091138', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b0e4f441-8e9d-49f2-a4e4-daf86e4fa715', '1733027411670900738', '1730248224314294275', '1730248224071024642', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b10bab51-13b0-4c9b-8bc7-0525b1b9b6a4', '1730924182472556546', '1730248398143029250', '1730248397786513409', 1, 1, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b12fe013-5263-45bc-aacc-2365200c57b2', '1730924182472556546', '1730248390584893442', '1730248390282903554', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b16f2242-f913-4fd4-89ad-de9db8f59a0e', '1730940350042275841', '1730248202805903362', '1730248202608771074', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b2889276-1c07-4e3b-9221-25f4deda4e24', '1730940350042275841', '1730248212020789249', '1730248211764936706', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b3272d17-9a1a-41ff-99c0-4a6adb70c04a', '1730924182472556546', '1730248622743814146', '1730248622433435650', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b3c05811-ff31-417c-9459-cfdfbd37b033', '1730924182472556546', '1730248441549881346', '1730248441273057282', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b438348e-ed01-4886-82af-6e71c808c553', '1730940350042275841', '1730248218878476290', '1730248218610040834', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b48e215a-7901-46e3-b975-13d8498c9112', '1730924182472556546', '1730248390572310529', '1730248390282903554', 1, 1, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b52ad7c2-ed92-41ff-bcad-729385ff0b61', '1733021693240713218', '1730248228307271682', '1730248228064002050', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b604d239-4c2d-45cb-a0db-929d95623d9c', '1730924182472556546', '1730248394829529089', '1730248394544316418', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b741bfa5-cfe1-4fc3-8457-a9efe3c19f55', '1730924182472556546', '1730248454686441474', '1730248454418006017', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b758860b-843a-4103-9e53-83b5557759ef', '1730924182472556546', '1730248724346634241', '1730248724069810178', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b7c23e7d-2eb3-4a16-bdfa-bc2e6e3dc71b', '1730924182472556546', '1730248472797446146', '1730248472474484738', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b7f3b69e-54de-4b1a-802c-b04b4ef1a9ab', '1730940350042275841', '1730248230375063554', '1730248230144376834', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b813b71f-ff4f-425b-86a5-c39546de319e', '1730924182472556546', '1730248501444542465', '1730248501167718402', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('b93bd5c6-05c0-42b8-8e37-0f0c88c31cc3', '1730940350042275841', '1730248203925782529', '1730248203657347073', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('babdc8c6-4702-423f-a95b-c9eadf6e3820', '1733021693240713218', '1730248217049759746', '1730248216772935682', 1, 1, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('baeb7d20-0060-4bb6-a77c-24f7cc345997', '1730924182472556546', '1730248432909615106', '1730248432636985346', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('bb2cf817-88cb-4f0e-892f-78bed19f9e37', '1730924182472556546', '1730248616557215746', '1730248616263614465', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('bb53edc3-583a-4ec2-844b-9c6a494be6e6', '1733027411670900738', '1730248207742599170', '1730248207507718146', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('bc2438ef-8461-4d29-aef2-5218abc624fd', '1730924182472556546', '1730248827354546178', '1730248826897367042', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('bd50d867-fd4d-47d5-a657-7705d0932315', '1730924182472556546', '1730248488739995650', '1730248488454782977', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('bdf2b20b-508e-47a2-9c36-47aa0dbbea20', '1730924182472556546', '1730248391922876418', '1730248391633469442', 1, 1, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('be15d98b-17ed-427c-ac4d-5e5c87e89562', '1730924182472556546', '1730248412340748290', '1730248411938095105', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('bfbaa203-e1ec-4821-896f-0d6edd54a536', '1730924182472556546', '1730248465302224898', '1730248465012817922', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c114fa14-b02f-480b-81d9-5e1894a74771', '1730924182472556546', '1730248746823909378', '1730248746538696706', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c1434b48-b676-451e-a386-ddb64da17535', '1730924182472556546', '1730248529126948865', '1730248528841736193', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c1460051-ee6a-49dc-b0a7-62123691ff0d', '1730924182472556546', '1730248414731501569', '1730248414425317378', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c1d78ecb-cdfe-4dbd-bfdb-4c96ed55ca10', '1733027411670900738', '1730248232581267457', '1730248232308637698', 1, 0, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c2c7bdb4-4398-4aa6-8280-8d6cf5be83e6', '1730924182472556546', '1730248604532146178', '1730248604255322114', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c2f91dc2-a28b-4160-811a-7b52a9083cb0', '1733021693240713218', '1730248224314294274', '1730248224071024642', 1, 1, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c30f4c17-d7ae-4eae-a45d-947e209ca7e7', '1733021693240713218', '1730248215359455233', '1730248215099408386', 1, 0, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c43ae66d-defe-4c83-8ff5-3cbf3e51a057', '1730940350042275841', '1730248210506645506', '1730248210217238530', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c45e7d18-434f-4bad-8885-96bcd9a76011', '1730924182472556546', '1730248622727036929', '1730248622433435650', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c575bcf8-dc23-42e1-93b0-b08eed47085d', '1730924182472556546', '1730248389297242113', '1730248388999446529', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c5930c8c-f7eb-4c59-898c-37cbdeb99f7b', '1733021693240713218', '1730248220598140931', '1730248220380037121', 1, 1, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c5a94260-5a64-47ad-b9b6-344a7c5a2e34', '1730940350042275841', '1730248212020789250', '1730248211764936706', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c67b306b-fe67-48fe-becd-f3589c4391cf', '1730924182472556546', '1730248444775301121', '1730248444494282754', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c6b090e8-8b94-4f4d-8a6c-d3795b7e24cf', '1733027411670900738', '1730248213635596290', '1730248213379743745', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c79cc24a-fe8d-4410-9157-801f60270a52', '1733027411670900738', '1730248228307271682', '1730248228064002050', 1, 0, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c840f89e-5d7e-48d9-b2c1-b9e82b2ab53b', '1730940350042275841', '1730248222401691649', '1730248222175199234', 1, 0, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c87f1b7c-c70d-4754-82ff-054855a590eb', '1730940350042275841', '1730248207742599171', '1730248207507718146', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c8b12e67-188a-4be1-a97a-10501fcd1b79', '1730940350042275841', '1730248205163102210', '1730248204949192705', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c9550b14-d41f-42d6-8e9a-5044f77ae28c', '1733027411670900738', '1730248207746793473', '1730248207507718146', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('c9cb615c-8223-4ba5-b75c-8c15ae30398c', '1733021693240713218', '1730248203976114177', '1730248203657347073', 1, 1, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('cb075354-c64f-46db-8354-bedab8e5c333', '1730924182472556546', '1730248641643347969', '1730248641358135297', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('cb1ae9a2-6c92-4631-b403-c3ed4eeb8746', '1733021693240713218', '1730248202805903363', '1730248202608771074', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('cb2ea64b-0fa0-4dff-9bf6-35a44bb29d49', '1730924182472556546', '1730248575847301121', '1730248575574671361', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('cc3de8fa-fe4a-48af-8441-a26f036c02e9', '1730924182472556546', '1730248870522322946', '1730248870237110274', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('cd0d9e08-da55-4f0c-8b30-6281dec95aa5', '1733021693240713218', '1730248220593946625', '1730248220380037121', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('cd0e6b2c-2b07-4217-af78-3e3bd48fddba', '1730924182472556546', '1730248870534905857', '1730248870237110274', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('cd8570ea-19d8-4d56-8672-55a579c5a8aa', '1730924182472556546', '1730248559489515521', '1730248559204302850', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('ce6b4c24-c54b-4a9c-a6a6-abeb0362f50a', '1730940350042275841', '1730248230383452162', '1730248230144376834', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('cf83f450-85f5-4fb5-8d4d-5e9fa6dd2175', '1733021693240713218', '1730248207742599171', '1730248207507718146', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('cf933e48-d2ac-4a80-abe0-485ee32b0088', '1733021693240713218', '1730248209000890371', '1730248208791175170', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('cff46fcd-a25c-47b3-aa6d-97129b22cc4c', '1730924182472556546', '1730248641655930882', '1730248641358135297', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d025a8a2-9093-4009-869f-78e2428587ff', '1733027411670900738', '1730248228294688769', '1730248228064002050', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d035b376-c370-4c19-96b6-cecbd6b4ab68', '1730940350042275841', '1730248206471725058', '1730248206215872513', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d046002c-9656-4eae-a5d0-82a7451ec43e', '1730940350042275841', '1730248222414274563', '1730248222175199234', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d04d1c18-152b-4461-ac78-c07aec9d1d8c', '1733021693240713218', '1730248203971919874', '1730248203657347073', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d066aded-56e7-4de8-9789-f0447cf46cd1', '1733027411670900738', '1730248215351066625', '1730248215099408386', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d30ba3e8-53a1-43d6-85d9-59d21a5dfeb2', '1733021693240713218', '1730248213635596290', '1730248213379743745', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d3643867-684d-4f83-bc77-112d8b5a4d59', '1733027411670900738', '1730248217049759746', '1730248216772935682', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d3fe0a9e-383a-40dc-9339-1005f3d5a45f', '1730924182472556546', '1730248587096424449', '1730248586819600386', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d65f2cc3-41bb-40d0-9e46-6abee480c100', '1730940350042275841', '1730248224301711362', '1730248224071024642', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d6a67da6-5894-4243-9663-f64e317b2909', '1733027411670900738', '1730248203976114177', '1730248203657347073', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d6d97b65-4a51-47df-a599-fcc23d62f99c', '1730924182472556546', '1730248844467306497', '1730248844190482434', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d70f482f-cce6-4ad4-861c-be873e8ba090', '1733027411670900738', '1730248206454947842', '1730248206215872513', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d73a2245-dc30-4074-939c-d6db713142a1', '1733027411670900738', '1730248203971919874', '1730248203657347073', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d7ba94ee-fdad-49af-ab63-c9bd21bc14c8', '1733027411670900738', '1730248232585461761', '1730248232308637698', 1, 0, 3, 'D', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d8997a84-2f72-4815-9389-26d66f681a33', '1733027411670900738', '1730248224314294276', '1730248224071024642', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d8d4cd68-fb5e-4176-881e-6999f9dad258', '1730924182472556546', '1730248538908065794', '1730248538631241729', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d994010a-c009-4ea6-bc11-7c553ccc14c7', '1730924182472556546', '1730248770488172546', '1730248769678671874', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('d9e7cac5-fc6b-476a-84a4-6a6221d1d4b7', '1730940350042275841', '1730248215359455233', '1730248215099408386', 1, 0, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('da730197-ffd3-4a29-a3a4-b1b444b5fbe0', '1733027411670900738', '1730248220598140931', '1730248220380037121', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('db37c04b-ba62-4fbd-acdb-e9b7bd0b1e24', '1730924182472556546', '1730248754449154049', '1730248754172329985', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('dbd30f1a-b733-4ee6-bad3-faffa2021ffc', '1733027411670900738', '1730248230379257858', '1730248230144376834', 1, 0, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('dcc679fd-9397-4950-b913-6cfb51f5a54b', '1730924182472556546', '1730248610517417986', '1730248610228011010', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('dcca1ecc-30f8-4412-aa06-3b712847bf27', '1730940350042275841', '1730248228307271682', '1730248228064002050', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('dd39fc2b-0ef2-46b3-a66f-2632b807610e', '1730940350042275841', '1730248220598140931', '1730248220380037121', 1, 0, 0, 'A', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('dd59b117-9fbc-42f2-9f2b-09c56969a091', '1733027411670900738', '1730248212020789249', '1730248211764936706', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('dd6ea7ff-3606-43e4-bf9f-511e15eb1acf', '1733021693240713218', '1730248202805903365', '1730248202608771074', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('ddb1f0fa-91e5-4a22-8b91-72fe7ea28212', '1733021693240713218', '1730248206471725058', '1730248206215872513', 1, 0, 2, 'C', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('de273aab-9538-410f-9930-b47aeacf3de0', '1733027411670900738', '1730248220585558018', '1730248220380037121', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('de37fcf9-7a98-4d9f-8e75-c9afcfc4cdc5', '1733027411670900738', '1730248218882670593', '1730248218610040834', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('deaa633d-d725-4b05-9253-2672f5034f78', '1730924182472556546', '1730248419588505602', '1730248419294904322', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('df48cfd7-197c-4e43-8d0e-abbb3da67229', '1733021693240713218', '1730248228307271683', '1730248228064002050', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('df80ef58-b046-4daf-a37b-f3d747219dc2', '1730924182472556546', '1730248681619259393', '1730248681258549250', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('dfa6a50a-d02d-4c2e-a05d-bafa0b5f0d17', '1730924182472556546', '1730248409933217794', '1730248409656393729', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e0028894-d7b6-45ab-968f-a4a73f79b09b', '1730940350042275841', '1730248211987234817', '1730248211764936706', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e00757ac-abe2-4be4-be10-90929e9f4dc7', '1730924182472556546', '1730248422088310786', '1730248421811486721', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e0520e83-67ef-4b0f-b27d-7e0cd3c6ca55', '1733027411670900738', '1730248209000890370', '1730248208791175170', 1, 0, 1, 'B', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e0604c06-797e-4c47-875c-b2b539b36107', '1730924182472556546', '1730248731804106753', '1730248731518894082', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e07e5ac5-a3f5-4af7-a778-afacf62ec44c', '1730940350042275841', '1730248212012400642', '1730248211764936706', 1, 0, 2, 'C', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e1f6ebb1-f324-4dad-9bcd-490b88367d24', '1730924182472556546', '1730248435715604482', '1730248435463946242', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e3085a8a-4caa-4f61-9e0e-3cac4dd135f9', '1733021693240713218', '1730248215363649538', '1730248215099408386', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e3ede54b-94df-43f5-96d2-36cc1afa0dfd', '1733027411670900738', '1730248212020789250', '1730248211764936706', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e484f018-91cd-416f-aceb-35f978a04221', '1730924182472556546', '1730248403662733313', '1730248403364937730', 1, 1, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e49fe259-acb9-4433-bcba-8f69e9b81be5', '1733027411670900738', '1730248218857504769', '1730248218610040834', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e4a14102-5a8d-466f-90d6-1a8903419096', '1730940350042275841', '1730248208992501762', '1730248208791175170', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e4d075bb-ffab-48ca-acb1-cdb35c6552fb', '1730924182472556546', '1730248441587630082', '1730248441273057282', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e50429fd-f042-4711-ae64-19592edba90e', '1730940350042275841', '1730248201828630530', '1730248201459531778', 1, 0, 1, 'B', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e618fdf6-8e9a-440a-b47b-beae30903cf8', '1730924182472556546', '1730248739269967873', '1730248738984755202', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e6279258-6f59-4287-a498-e37569940513', '1730924182472556546', '1730248731795718146', '1730248731518894082', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e7b4114c-917b-4dac-9dad-2efefc3dfba5', '1730924182472556546', '1730248888331337729', '1730248888037736450', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e862a1bb-2d9c-4e02-b489-f5cbb3634751', '1730940350042275841', '1730248220585558018', '1730248220380037121', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('e990a539-2f40-4ca7-bb16-a2149d08a7d7', '1730924182472556546', '1730248430061682690', '1730248429793247233', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('ea74eb3b-a7e0-4fb9-88b0-f6960dc8c186', '1733027411670900738', '1730248228307271681', '1730248228064002050', 1, 0, 3, 'D', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('eab15297-15f0-43d9-a067-b70875d95d04', '1730924182472556546', '1730248688544055297', '1730248688271425538', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('eb0f10ce-6a22-49a4-8aa4-57fecbfb1b02', '1733021693240713218', '1730248217066536962', '1730248216772935682', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('eb22362e-c6d9-4363-9675-fe9070f89f2c', '1730924182472556546', '1730248414744084482', '1730248414425317378', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('eb60a3e9-b639-41e7-b9ae-5188784bb2d0', '1730924182472556546', '1730248717040156674', '1730248716759138305', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('eb7c02a0-c2b6-4451-8739-922cb75c31d2', '1733027411670900738', '1730248202805903362', '1730248202608771074', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('ec52e326-d293-46bd-8bc6-33c8b9695b73', '1730924182472556546', '1730248581450891266', '1730248581169872898', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('ecd74023-9b34-4acf-82ae-0cea690c7dc0', '1730924182472556546', '1730248648169684993', '1730248647850917889', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('ed97f8c4-b7a4-467b-afa3-75285917c9d7', '1733027411670900738', '1730248202805903365', '1730248202608771074', 1, 0, 1, 'B', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('eda82100-8cec-4168-ba49-40d31626ef47', '1730924182472556546', '1730248709775622145', '1730248709490409473', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('edc7957b-0e17-4f94-8657-c27d4d391735', '1730924182472556546', '1730248592859398146', '1730248592574185473', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('edf3ec48-c9a3-40d6-be28-a2c850782f9a', '1730924182472556546', '1730248879355527169', '1730248879070314497', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('eed165a1-4c02-4a8d-8677-f013591bdc0c', '1730924182472556546', '1730248802301968385', '1730248802020950017', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('eff44a0a-1d19-4683-a2ce-50cd879f1a6d', '1730924182472556546', '1730248853103378433', '1730248852813971458', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f115077b-776f-4d19-8ccb-6232aa6eb8d0', '1730924182472556546', '1730248648152907778', '1730248647850917889', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f1ac9c9b-1650-4007-a0e9-8d9b6842e2c9', '1733027411670900738', '1730248222401691649', '1730248222175199234', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f1f0d6a9-1497-43b3-8973-bb60a7f93365', '1733027411670900738', '1730248222414274562', '1730248222175199234', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f261d35b-792c-458e-84f2-143f1d3dbef3', '1733021693240713218', '1730248215351066625', '1730248215099408386', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f44deb07-dd47-4466-acfc-6d321a5d1a7b', '1730924182472556546', '1730248458155130882', '1730248457861529602', 1, 1, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f53c8164-c73c-4cd9-9288-886cbdd70583', '1733027411670900738', '1730248230383452163', '1730248230144376834', 1, 0, 3, 'D', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f60bf4f1-7420-425a-98eb-8b2ec44e9ad8', '1730940350042275841', '1730248201828630529', '1730248201459531778', 1, 0, 0, 'A', 2);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f71f797a-b113-4ecf-8732-fe28c22a68dd', '1730924182472556546', '1730248681631842306', '1730248681258549250', 1, 0, 1, 'B', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f7d8083f-893a-49de-a971-49d952b8a401', '1730924182472556546', '1730248484625383425', '1730248484352753666', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f8968729-6e45-4bdd-9730-6c9152325f0f', '1730924182472556546', '1730248762166673410', '1730248761881460738', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f8d82b86-ce89-494d-92d3-cdbab4ef29cd', '1730924182472556546', '1730248554225664002', '1730248553948839938', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f96e5a38-b716-4d19-b772-8d8280056a90', '1730924182472556546', '1730248549037309954', '1730248548760485890', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('f97feedb-4f01-4f2b-baf8-c90751048c80', '1730940350042275841', '1730248215363649537', '1730248215099408386', 1, 0, 0, 'A', 3);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('fa1f7d69-824c-4310-b730-d372049e9877', '1730924182472556546', '1730248529114365954', '1730248528841736193', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('fa3160bd-2f04-4b5d-8f0f-c44c6b190234', '1733027411670900738', '1730248232577073153', '1730248232308637698', 1, 0, 2, 'C', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('fa39513d-3cff-4e65-a1e9-ab05837a979b', '1733021693240713218', '1730248207746793473', '1730248207507718146', 1, 0, 2, 'C', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('fa55c33d-e713-4cc9-8bba-184fb3a3a9d8', '1730924182472556546', '1730248667991965697', '1730248667744501762', 1, 0, 0, 'A', 0);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('fb66782b-0a34-47ee-bde3-c8be6f1a6abd', '1730940350042275841', '1730248217066536963', '1730248216772935682', 1, 0, 3, 'D', 4);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('fbcabba0-535a-4422-bc62-cf5358d22810', '1730940350042275841', '1730248213614624770', '1730248213379743745', 1, 0, 1, 'B', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('fd17dbd9-d140-4cc8-ab63-22fca33f5b42', '1733027411670900738', '1730248205163102210', '1730248204949192705', 1, 0, 0, 'A', 1);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `item_score`) VALUES ('ff93a931-3515-4e8c-ac27-da2a4e3e88cc', '1730924182472556546', '1730248394821140481', '1730248394544316418', 1, 1, 0, 'A', 1);
COMMIT;

-- ----------------------------
-- Table structure for el_qu
-- ----------------------------
DROP TABLE IF EXISTS `el_qu`;
CREATE TABLE `el_qu` (
  `id` varchar(64) NOT NULL COMMENT '题目ID',
  `no` int(11) DEFAULT NULL COMMENT '题号',
  `qu_type` int(11) NOT NULL COMMENT '题目类型',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '1普通,2较难',
  `image` varchar(500) NOT NULL DEFAULT '' COMMENT '题目图片',
  `content` varchar(2000) NOT NULL COMMENT '题目内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '题目备注',
  `analysis` varchar(2000) NOT NULL DEFAULT '' COMMENT '整题解析',
  `item_score` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_type` (`qu_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试题主表';

-- ----------------------------
-- Records of el_qu
-- ----------------------------
BEGIN;
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248091740733441', 1, 1, 1, '', '我觉得闷闷不乐，情绪低沉。', '2023-11-30 23:31:06', '2023-11-30 23:31:06', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248093431037954', 2, 1, 1, '', '我觉得一天之中早晨心情最好。', '2023-11-30 23:31:07', '2023-11-30 23:31:07', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248094567694337', 3, 1, 1, '', '我经常哭或者经常想哭。', '2023-11-30 23:31:07', '2023-11-30 23:31:07', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248095721127938', 4, 1, 1, '', '我容易入睡困难或者半夜容易醒。', '2023-11-30 23:31:07', '2023-11-30 23:31:07', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248097122025473', 5, 1, 1, '', '我吃得跟平常一样多。', '2023-11-30 23:31:07', '2023-11-30 23:31:07', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248098539700226', 6, 1, 1, '', '我和异性一起玩耍会感觉愉悦。', '2023-11-30 23:31:08', '2023-11-30 23:31:08', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248100116758530', 7, 1, 1, '', '我发觉我的体重在下降。', '2023-11-30 23:31:08', '2023-11-30 23:31:08', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248101551210498', 8, 1, 1, '', '我有便秘的苦恼。', '2023-11-30 23:31:09', '2023-11-30 23:31:09', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248103031799810', 9, 1, 1, '', '我心跳比平时快。', '2023-11-30 23:31:09', '2023-11-30 23:31:09', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248104684355585', 10, 1, 1, '', '我无缘无故感到疲乏。', '2023-11-30 23:31:09', '2023-11-30 23:31:09', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248106173333505', 11, 1, 1, '', '我的头脑跟平常一样清楚。', '2023-11-30 23:31:10', '2023-11-30 23:31:10', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248107674894338', 12, 1, 1, '', '觉得自己做以前经常做的事没有困难。', '2023-11-30 23:31:10', '2023-11-30 23:31:10', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248109310672898', 13, 1, 1, '', '我坐立不安，难以保持平静。', '2023-11-30 23:31:10', '2023-11-30 23:31:10', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248111072280577', 14, 1, 1, '', '我对将来抱有希望。', '2023-11-30 23:31:11', '2023-11-30 23:31:11', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248112812916738', 15, 1, 1, '', '我比平常容易激动。', '2023-11-30 23:31:11', '2023-11-30 23:31:11', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248114624856066', 16, 1, 1, '', '我觉得做出决定是容易的。', '2023-11-30 23:31:12', '2023-11-30 23:31:12', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248116503904257', 17, 1, 1, '', '我觉得自己是个有用的人，有人需要我。', '2023-11-30 23:31:12', '2023-11-30 23:31:12', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248118408118274', 18, 1, 1, '', '我的生活过得很有意思。', '2023-11-30 23:31:13', '2023-11-30 23:31:13', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248120442355714', 19, 1, 1, '', '我觉得身边的人都不需要我。', '2023-11-30 23:31:13', '2023-11-30 23:31:13', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248122484981761', 20, 1, 1, '', '平常感兴趣的事我仍然照样感兴趣。', '2023-11-30 23:31:14', '2023-11-30 23:31:14', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248201459531778', 1, 1, 1, '', '我近一个月容易紧张或着急', '2023-11-30 23:31:32', '2023-11-30 23:31:32', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248202608771074', 2, 1, 1, '', '我无缘无故地感到害怕', '2023-11-30 23:31:33', '2023-11-30 23:31:33', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248203657347073', 3, 1, 1, '', '我容易心里烦乱或觉得惊恐', '2023-11-30 23:31:33', '2023-11-30 23:31:33', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248204949192705', 4, 1, 1, '', '我觉得我的情绪无法控制', '2023-11-30 23:31:33', '2023-11-30 23:31:33', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248206215872513', 5, 1, 1, '', '我觉得一切都好，也不会发生什么不幸', '2023-11-30 23:31:33', '2023-11-30 23:31:33', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248207507718146', 6, 1, 1, '', '我手脚发抖打颤', '2023-11-30 23:31:34', '2023-11-30 23:31:34', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248208791175170', 7, 1, 1, '', '我因为头痛颈痛和背痛而苦恼', '2023-11-30 23:31:34', '2023-11-30 23:31:34', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248210217238530', 8, 1, 1, '', '我感觉容易衰弱和疲乏', '2023-11-30 23:31:34', '2023-11-30 23:31:34', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248211764936706', 9, 1, 1, '', '我觉得心平气和，并且容易安静坐着', '2023-11-30 23:31:35', '2023-11-30 23:31:35', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248213379743745', 10, 1, 1, '', '我觉得心跳很快', '2023-11-30 23:31:35', '2023-11-30 23:31:35', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248215099408386', 11, 1, 1, '', '我因为一阵阵头晕而苦恼', '2023-11-30 23:31:36', '2023-11-30 23:31:36', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248216772935682', 12, 1, 1, '', '我有晕倒发作或觉得要晕倒的感觉', '2023-11-30 23:31:36', '2023-11-30 23:31:36', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248218610040834', 13, 1, 1, '', '我呼气吸气都感到很容易', '2023-11-30 23:31:36', '2023-11-30 23:31:36', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248220380037121', 14, 1, 1, '', '我的手脚麻木和刺痛', '2023-11-30 23:31:37', '2023-11-30 23:31:37', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248222175199234', 15, 1, 1, '', '我因为胃痛和消化不良而苦恼', '2023-11-30 23:31:37', '2023-11-30 23:31:37', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248224071024642', 16, 1, 1, '', '我常常要小便', '2023-11-30 23:31:38', '2023-11-30 23:31:38', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248226042347521', 17, 1, 1, '', '我的手常常是干燥温暖的', '2023-11-30 23:31:38', '2023-11-30 23:31:38', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248228064002050', 18, 1, 1, '', '我容易脸红发热', '2023-11-30 23:31:39', '2023-11-30 23:31:39', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248230144376834', 19, 1, 1, '', '我容易入睡并且一夜睡得很好', '2023-11-30 23:31:39', '2023-11-30 23:31:39', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248232308637698', 20, 1, 1, '', '我每周都会做恶梦', '2023-11-30 23:31:40', '2023-11-30 23:31:40', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248267800838146', 1, 1, 1, '', '我因一些小事而烦恼', '2023-11-30 23:31:48', '2023-11-30 23:31:48', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248269050740737', 2, 1, 1, '', '我不大想吃东西,我的胃口不好', '2023-11-30 23:31:48', '2023-11-30 23:31:48', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248270485192705', 3, 1, 1, '', '即使家属和朋友帮助我,我仍然无法摆脱心中苦闷', '2023-11-30 23:31:49', '2023-11-30 23:31:49', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248272032890882', 4, 1, 1, '', '我觉得和一般人一样好', '2023-11-30 23:31:49', '2023-11-30 23:31:49', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248273635115009', 5, 1, 1, '', '我在做事时,无法集中自己的注意力', '2023-11-30 23:31:50', '2023-11-30 23:31:50', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248275258310657', 6, 1, 1, '', '我感到情绪低沉', '2023-11-30 23:31:50', '2023-11-30 23:31:50', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248276982169602', 7, 1, 1, '', '我感到做任何事都很费力', '2023-11-30 23:31:50', '2023-11-30 23:31:50', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248278773137410', 8, 1, 1, '', '我感觉到前途是有希望的', '2023-11-30 23:31:51', '2023-11-30 23:31:51', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248280748654594', 9, 1, 1, '', '我觉得我的生活是失败的', '2023-11-30 23:31:51', '2023-11-30 23:31:51', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248282757726210', 10, 1, 1, '', '我感到害怕', '2023-11-30 23:31:52', '2023-11-30 23:31:52', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248284880044034', 11, 1, 1, '', '我的睡眠情况不好', '2023-11-30 23:31:52', '2023-11-30 23:31:52', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248287153356802', 12, 1, 1, '', '我感到高兴', '2023-11-30 23:31:53', '2023-11-30 23:31:53', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248289598636033', 13, 1, 1, '', '我比平时说话要少', '2023-11-30 23:31:53', '2023-11-30 23:31:53', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248291863560193', 14, 1, 1, '', '我感到孤单', '2023-11-30 23:31:54', '2023-11-30 23:31:54', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248294229147649', 15, 1, 1, '', '我觉得人们对我不太友好', '2023-11-30 23:31:54', '2023-11-30 23:31:54', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248296645066753', 16, 1, 1, '', '我觉得生活得很有意思', '2023-11-30 23:31:55', '2023-11-30 23:31:55', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248299186814977', 17, 1, 1, '', '我曾哭泣', '2023-11-30 23:31:56', '2023-11-30 23:31:56', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248301804060674', 18, 1, 1, '', '我感到忧愁', '2023-11-30 23:31:56', '2023-11-30 23:31:56', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248304480026626', 19, 1, 1, '', '我感到人们不喜欢我', '2023-11-30 23:31:57', '2023-11-30 23:31:57', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248307193741313', 20, 1, 1, '', '我觉得我无法继续日常学习工作', '2023-11-30 23:31:58', '2023-11-30 23:31:58', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248387917316097', 1, 1, 1, '', '你晚上要睡觉时，是否总想着明天的功课？', '2023-11-30 23:32:17', '2023-11-30 23:32:17', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248388999446529', 2, 1, 1, '', '老师向全班提问时，你是否会觉得是在问自己而感到不安？', '2023-11-30 23:32:17', '2023-11-30 23:32:17', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248390282903554', 3, 1, 1, '', '你是否一听说“要考试”心里就紧张。', '2023-11-30 23:32:17', '2023-11-30 23:32:17', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248391633469442', 4, 1, 1, '', '你考试成绩不好时，心里是否感到很不快？', '2023-11-30 23:32:18', '2023-11-30 23:32:18', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248393042755585', 5, 1, 1, '', '你学习成绩不好时，是否总是提心吊胆？', '2023-11-30 23:32:18', '2023-11-30 23:32:18', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248394544316418', 6, 1, 1, '', '考试中，当你想不起来原来掌握的知识时，是否会感到紧张不安？', '2023-11-30 23:32:18', '2023-11-30 23:32:18', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248396121374721', 7, 1, 1, '', '你考试后，在是知道成绩之前，是否总是放不下心？', '2023-11-30 23:32:19', '2023-11-30 23:32:19', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248397786513409', 8, 1, 1, '', '你是否一遇到考试，就担心会考坏。', '2023-11-30 23:32:19', '2023-11-30 23:32:19', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248399619424257', 9, 1, 1, '', '你是否希望每次考试都能顺利？', '2023-11-30 23:32:20', '2023-11-30 23:32:20', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248401427169282', 10, 1, 1, '', '你在是完成任务之前，是否总担心完不成任务？', '2023-11-30 23:32:20', '2023-11-30 23:32:20', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248403364937730', 11, 1, 1, '', '你当着大家面朗读课文时，是否总是怕读错？', '2023-11-30 23:32:20', '2023-11-30 23:32:20', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248405361426433', 12, 1, 1, '', '你是否认为学校里得到的学习成绩总是不大可靠？', '2023-11-30 23:32:21', '2023-11-30 23:32:21', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248407538270209', 13, 1, 1, '', '你是否认为你比别人更担心学习？', '2023-11-30 23:32:21', '2023-11-30 23:32:21', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248409656393729', 14, 1, 1, '', '你是否做过考试考坏了的梦？', '2023-11-30 23:32:22', '2023-11-30 23:32:22', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248411938095105', 15, 1, 1, '', '你是否做过学习成绩不好时，受到爸爸妈妈或老师的训斥的梦？', '2023-11-30 23:32:23', '2023-11-30 23:32:23', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248414425317378', 16, 1, 1, '', '你是否经常觉得有同学在背后说你的坏话？', '2023-11-30 23:32:23', '2023-11-30 23:32:23', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248416820264962', 17, 1, 1, '', '你受到父母批评后，是否总是想不开，放在心上？', '2023-11-30 23:32:24', '2023-11-30 23:32:24', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248419294904322', 18, 1, 1, '', '你在游戏或与别人的竞争中输给了对方，是否就不想再干了？', '2023-11-30 23:32:24', '2023-11-30 23:32:24', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248421811486721', 19, 1, 1, '', '人家在背后议论你，你是否感到讨厌？', '2023-11-30 23:32:25', '2023-11-30 23:32:25', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248424399372290', 20, 1, 1, '', '你在大家面前或被老师提问时，是否会脸红？', '2023-11-30 23:32:25', '2023-11-30 23:32:25', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248427058561026', 21, 1, 1, '', '你是否很担心叫你担任班级干部工作？', '2023-11-30 23:32:26', '2023-11-30 23:32:26', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248429793247233', 22, 1, 1, '', '你是否总是觉得好像有人在注意你？', '2023-11-30 23:32:27', '2023-11-30 23:32:27', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248432636985346', 23, 1, 1, '', '在工作或学习时，如果有人在注意你，你心里是否会紧张？', '2023-11-30 23:32:27', '2023-11-30 23:32:27', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248435463946242', 24, 1, 1, '', '你受到批评时，心情是否不愉快？', '2023-11-30 23:32:28', '2023-11-30 23:32:28', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248438353821697', 25, 1, 1, '', '你受到老师批评时，心里是否总是不安？', '2023-11-30 23:32:29', '2023-11-30 23:32:29', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248441273057282', 26, 1, 1, '', '同学们在笑时，你是否也不大会笑？', '2023-11-30 23:32:30', '2023-11-30 23:32:30', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248444494282754', 27, 1, 1, '', '你是否觉得到同学家里去玩不如在自己家里玩？', '2023-11-30 23:32:30', '2023-11-30 23:32:30', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248447728091138', 28, 1, 1, '', '你和大家在一起时，是否也觉得自己是孤单的一个人？', '2023-11-30 23:32:31', '2023-11-30 23:32:31', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248451049979905', 29, 1, 1, '', '你是否觉得和同学一起玩，不如自己一个人玩？', '2023-11-30 23:32:32', '2023-11-30 23:32:32', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248454418006017', 30, 1, 1, '', '同学们交流时，你是否不想加入？', '2023-11-30 23:32:33', '2023-11-30 23:32:33', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248457861529602', 31, 1, 1, '', '你和大家在一起时，是否觉得自己是多余的人？', '2023-11-30 23:32:33', '2023-11-30 23:32:33', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248461405716482', 32, 1, 1, '', '你是否讨厌参加运动会和文艺演出？', '2023-11-30 23:32:34', '2023-11-30 23:32:34', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248465012817922', 33, 1, 1, '', '你的朋友是否很少？', '2023-11-30 23:32:35', '2023-11-30 23:32:35', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248468695416833', 34, 1, 1, '', '你是否不喜欢同别人谈话？', '2023-11-30 23:32:36', '2023-11-30 23:32:36', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248472474484738', 35, 1, 1, '', '在人多的地方，你是否觉得很怕？', '2023-11-30 23:32:37', '2023-11-30 23:32:37', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248476425519105', 36, 1, 1, '', '你在参加排球、篮球等集体比赛输了时，心里是否一直认为自己没做好？', '2023-11-30 23:32:38', '2023-11-30 23:32:38', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248480347193345', 37, 1, 1, '', '你受到批评后，是否总认为是自己不好？', '2023-11-30 23:32:39', '2023-11-30 23:32:39', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248484352753666', 38, 1, 1, '', '别人笑你的时候，你是否会认为是自己做错了什么事？', '2023-11-30 23:32:40', '2023-11-30 23:32:40', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248488454782977', 39, 1, 1, '', '你学习成绩不好时，是否总是认为是自己不用功的缘故？', '2023-11-30 23:32:41', '2023-11-30 23:32:41', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248492636504065', 40, 1, 1, '', '你做事失败的时候，是否总是认为是自己的责任？', '2023-11-30 23:32:42', '2023-11-30 23:32:42', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248496872751106', 41, 1, 1, '', '大家受到责备时，你是否认为主要是自己的过错？', '2023-11-30 23:32:43', '2023-11-30 23:32:43', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248501167718402', 42, 1, 1, '', '你参加乒乓球、羽毛球、广播体操等体育比赛时，是否一出错就特别紧张？', '2023-11-30 23:32:44', '2023-11-30 23:32:44', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248505575931906', 43, 1, 1, '', '碰到为难的事情时，你是否认为自己难以应付？', '2023-11-30 23:32:45', '2023-11-30 23:32:45', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248510055448578', 44, 1, 1, '', '你是否有时会后悔：“那件事不做就好了”。', '2023-11-30 23:32:46', '2023-11-30 23:32:46', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248514644017154', 45, 1, 1, '', '你和同学吵架以后，是否总是认为是自己的错？', '2023-11-30 23:32:47', '2023-11-30 23:32:47', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248519350026241', 46, 1, 1, '', '你心里是否总想为班级做点好事？', '2023-11-30 23:32:48', '2023-11-30 23:32:48', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248524060229634', 47, 1, 1, '', '你学习的时候，思想是否经常开小差？', '2023-11-30 23:32:49', '2023-11-30 23:32:49', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248528841736193', 48, 1, 1, '', '你把东西借给别人时，是否担心别人会把东西弄坏？', '2023-11-30 23:32:50', '2023-11-30 23:32:50', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248533694545922', 49, 1, 1, '', '碰到不顺心的事情时，你心里是否很烦燥？', '2023-11-30 23:32:52', '2023-11-30 23:32:52', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248538631241729', 50, 1, 1, '', '你是否经常对家人的安全健康担心？', '2023-11-30 23:32:53', '2023-11-30 23:32:53', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248543656017921', 51, 1, 1, '', '你是否在梦里见到过厌恶的人？', '2023-11-30 23:32:54', '2023-11-30 23:32:54', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248548760485890', 52, 1, 1, '', '你对收音机和汽车的声音是否特别敏感？', '2023-11-30 23:32:55', '2023-11-30 23:32:55', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248553948839938', 53, 1, 1, '', '你心里是否总觉得好像要有什么事是做好？', '2023-11-30 23:32:56', '2023-11-30 23:32:56', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248559204302850', 54, 1, 1, '', '你是否总担心会发生什么意外的事？', '2023-11-30 23:32:58', '2023-11-30 23:32:58', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248564560429057', 55, 1, 1, '', '你在决定要做什么事时，是否总是犹豫不决？', '2023-11-30 23:32:59', '2023-11-30 23:32:59', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248570042384385', 56, 1, 1, '', '你手上是否经常出汗？', '2023-11-30 23:33:00', '2023-11-30 23:33:00', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248575574671361', 57, 1, 1, '', '你害羞时是否会脸红？', '2023-11-30 23:33:02', '2023-11-30 23:33:02', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248581169872898', 58, 1, 1, '', '你是否经常头痛？', '2023-11-30 23:33:03', '2023-11-30 23:33:03', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248586819600386', 59, 1, 1, '', '你被老师提问时，心里是否总是很紧张？', '2023-11-30 23:33:04', '2023-11-30 23:33:04', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248592574185473', 60, 1, 1, '', '你是参加运动，心脏是否经常扑腾扑腾地跳？', '2023-11-30 23:33:06', '2023-11-30 23:33:06', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248598387490818', 61, 1, 1, '', '你是否很容易疲劳？', '2023-11-30 23:33:07', '2023-11-30 23:33:07', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248604255322114', 62, 1, 1, '', '你是否很不愿吃药？', '2023-11-30 23:33:08', '2023-11-30 23:33:08', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248610228011010', 63, 1, 1, '', '夜里你是否很难入睡？', '2023-11-30 23:33:10', '2023-11-30 23:33:10', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248616263614465', 64, 1, 1, '', '你是否总觉得身体好像有什么毛病？', '2023-11-30 23:33:11', '2023-11-30 23:33:11', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248622433435650', 65, 1, 1, '', '你是否经常认为自己的体形和面孔比别人难看？', '2023-11-30 23:33:13', '2023-11-30 23:33:13', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248628657782785', 66, 1, 1, '', '你是否经常觉得肠胃不好？', '2023-11-30 23:33:14', '2023-11-30 23:33:14', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248634961821697', 67, 1, 1, '', '你是否经常咬指甲？', '2023-11-30 23:33:16', '2023-11-30 23:33:16', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248641358135297', 68, 1, 1, '', '你是否经常咬自己的手？', '2023-11-30 23:33:17', '2023-11-30 23:33:17', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248647850917889', 69, 1, 1, '', '你是否经常感到呼吸困难？', '2023-11-30 23:33:19', '2023-11-30 23:33:19', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248654494695425', 70, 1, 1, '', '你去厕所的次数是否比别人多？', '2023-11-30 23:33:20', '2023-11-30 23:33:20', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248661088141313', 71, 1, 1, '', '你是否很怕到高的地方去？', '2023-11-30 23:33:22', '2023-11-30 23:33:22', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248667744501762', 72, 1, 1, '', '你是否害怕很多东西？', '2023-11-30 23:33:24', '2023-11-30 23:33:24', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248674371502082', 73, 1, 1, '', '你是否经常做噩梦？', '2023-11-30 23:33:25', '2023-11-30 23:33:25', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248681258549250', 74, 1, 1, '', '你胆子是否很小？', '2023-11-30 23:33:27', '2023-11-30 23:33:27', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248688271425538', 75, 1, 1, '', '夜里，你是否很怕一个人在房间里睡觉？', '2023-11-30 23:33:28', '2023-11-30 23:33:28', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248695250747393', 76, 1, 1, '', '你乘车穿过隧道或路过高桥时，是否很怕？', '2023-11-30 23:33:30', '2023-11-30 23:33:30', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248702334926850', 77, 1, 1, '', '你是否喜欢整夜开着灯睡觉？', '2023-11-30 23:33:32', '2023-11-30 23:33:32', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248709490409473', 78, 1, 1, '', '你听到打雷声是否非常害怕？', '2023-11-30 23:33:33', '2023-11-30 23:33:33', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248716759138305', 79, 1, 1, '', '你是否非常害怕黑暗？', '2023-11-30 23:33:35', '2023-11-30 23:33:35', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248724069810178', 80, 1, 1, '', '你是否经常感到后面有人跟着你？', '2023-11-30 23:33:37', '2023-11-30 23:33:37', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248731518894082', 81, 1, 1, '', '你是否经常生气？', '2023-11-30 23:33:39', '2023-11-30 23:33:39', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248738984755202', 82, 1, 1, '', '你是否不想得到好的成绩？', '2023-11-30 23:33:40', '2023-11-30 23:33:40', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248746538696706', 83, 1, 1, '', '你是否经常会突然想哭？', '2023-11-30 23:33:42', '2023-11-30 23:33:42', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248754172329985', 84, 1, 1, '', '你以前是否说过谎话？', '2023-11-30 23:33:44', '2023-11-30 23:33:44', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248761881460738', 85, 1, 1, '', '你有时是否会觉得，自己的存在是多余的？', '2023-11-30 23:33:46', '2023-11-30 23:33:46', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248769678671874', 86, 1, 1, '', '你是否一次也是失约过？', '2023-11-30 23:33:48', '2023-11-30 23:33:48', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248778000171009', 87, 1, 1, '', '你是否经常想大声喊叫？', '2023-11-30 23:33:50', '2023-11-30 23:33:50', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248785948377090', 88, 1, 1, '', '别人不让说的事你是否能保密？', '2023-11-30 23:33:52', '2023-11-30 23:33:52', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248793942720514', 89, 1, 1, '', '你有时是否想过自己一个人到远的地方去？', '2023-11-30 23:33:54', '2023-11-30 23:33:54', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248802020950017', 90, 1, 1, '', '你是否总是很有礼貌？', '2023-11-30 23:33:56', '2023-11-30 23:33:56', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248810187259905', 91, 1, 1, '', '你被人说了坏话，是否想立即采取报复行动？', '2023-11-30 23:33:57', '2023-11-30 23:33:57', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248818487787522', 92, 1, 1, '', '老师或父母说的话，你是否都照办？', '2023-11-30 23:33:59', '2023-11-30 23:33:59', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248826897367042', 93, 1, 1, '', '你心里不开心，是否会乱丢、乱砸东西？', '2023-11-30 23:34:01', '2023-11-30 23:34:01', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248835634102274', 94, 1, 1, '', '你是否发过怒？ ', '2023-11-30 23:34:04', '2023-11-30 23:34:04', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248844190482434', 95, 1, 1, '', '你想要的东西，是否就一定要拿到手？', '2023-11-30 23:34:06', '2023-11-30 23:34:06', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248852813971458', 96, 1, 1, '', '你不喜欢的功课老师提前下课，你是否会感到特别高兴？', '2023-11-30 23:34:08', '2023-11-30 23:34:08', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248861487792130', 97, 1, 1, '', '你是否经常想从高的地方跳下来？', '2023-11-30 23:34:10', '2023-11-30 23:34:10', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248870237110274', 98, 1, 1, '', '你是否无论对任何人都非常热情？', '2023-11-30 23:34:12', '2023-11-30 23:34:12', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248879070314497', 99, 1, 1, '', '你是否会经常急躁得坐立不安？', '2023-11-30 23:34:14', '2023-11-30 23:34:14', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248888037736450', 100, 1, 1, '', '对不认识的人，你是否会都喜欢？', '2023-11-30 23:34:16', '2023-11-30 23:34:16', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248962503409666', 1, 1, 1, '', '最近头痛', '2023-11-30 23:34:34', '2023-11-30 23:34:34', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248964055302146', 2, 1, 1, '', '神经过敏，心中不踏实', '2023-11-30 23:34:34', '2023-11-30 23:34:34', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248965493948418', 3, 1, 1, '', '头脑中有不必要的想法或字句盘旋', '2023-11-30 23:34:35', '2023-11-30 23:34:35', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248967058423810', 4, 1, 1, '', '头昏或昏倒', '2023-11-30 23:34:35', '2023-11-30 23:34:35', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248968669036546', 5, 1, 1, '', '对异性的兴趣减退　', '2023-11-30 23:34:35', '2023-11-30 23:34:35', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248970443227137', 6, 1, 1, '', '对他人容易挑剔并要求其完美', '2023-11-30 23:34:36', '2023-11-30 23:34:36', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248972280332290', 7, 1, 1, '', '感到别人能控制你的思想', '2023-11-30 23:34:36', '2023-11-30 23:34:36', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248974176157697', 8, 1, 1, '', '责怪别人制造麻烦', '2023-11-30 23:34:37', '2023-11-30 23:34:37', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248976160063490', 9, 1, 1, '', '忘性大', '2023-11-30 23:34:37', '2023-11-30 23:34:37', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248978240438273', 10, 1, 1, '', '担心自己的衣饰整齐及仪态的端正', '2023-11-30 23:34:38', '2023-11-30 23:34:38', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248980375339009', 11, 1, 1, '', '容易烦恼和激动', '2023-11-30 23:34:38', '2023-11-30 23:34:38', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248982657040385', 12, 1, 1, '', '容易胸痛', '2023-11-30 23:34:39', '2023-11-30 23:34:39', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248985014239233', 13, 1, 1, '', '害怕空旷的场所或街道', '2023-11-30 23:34:39', '2023-11-30 23:34:39', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248987404992513', 14, 1, 1, '', '感到自己的精力下降，活动减慢', '2023-11-30 23:34:40', '2023-11-30 23:34:40', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248989850271745', 15, 1, 1, '', '感觉不到生活的意义', '2023-11-30 23:34:40', '2023-11-30 23:34:40', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248992371048450', 16, 1, 1, '', '听到旁人听不到的声音', '2023-11-30 23:34:41', '2023-11-30 23:34:41', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248994963128321', 17, 1, 1, '', '容易发抖', '2023-11-30 23:34:42', '2023-11-30 23:34:42', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730248997676843009', 18, 1, 1, '', '感到大多数人都不可信任', '2023-11-30 23:34:42', '2023-11-30 23:34:42', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249000440889346', 19, 1, 1, '', '胃口不好', '2023-11-30 23:34:43', '2023-11-30 23:34:43', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249003280433154', 20, 1, 1, '', '容易哭泣', '2023-11-30 23:34:44', '2023-11-30 23:34:44', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249006199668737', 21, 1, 1, '', '同异性相处时感到害羞不自在', '2023-11-30 23:34:44', '2023-11-30 23:34:44', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249009202790402', 22, 1, 1, '', '感到受骗，中了圈套或有人想抓住自己', '2023-11-30 23:34:45', '2023-11-30 23:34:45', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249012298186753', 23, 1, 1, '', '无缘无故地突然感到害怕', '2023-11-30 23:34:46', '2023-11-30 23:34:46', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249015456497666', 24, 1, 1, '', '自己不能控制地大发脾气　', '2023-11-30 23:34:46', '2023-11-30 23:34:46', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249018677723138', 25, 1, 1, '', '怕单独出门', '2023-11-30 23:34:47', '2023-11-30 23:34:47', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249021999611906', 26, 1, 1, '', '经常责怪自己', '2023-11-30 23:34:48', '2023-11-30 23:34:48', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249025409581057', 27, 1, 1, '', '容易腰痛', '2023-11-30 23:34:49', '2023-11-30 23:34:49', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249028869881857', 28, 1, 1, '', '感到难以完成任务', '2023-11-30 23:34:50', '2023-11-30 23:34:50', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249032451817474', 29, 1, 1, '', '感到孤独', '2023-11-30 23:34:50', '2023-11-30 23:34:50', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249036092473345', 30, 1, 1, '', '感到苦闷', '2023-11-30 23:34:51', '2023-11-30 23:34:51', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249039817015298', 31, 1, 1, '', '过分担忧', '2023-11-30 23:34:52', '2023-11-30 23:34:52', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249043625443330', 32, 1, 1, '', '对事物不感兴趣', '2023-11-30 23:34:53', '2023-11-30 23:34:53', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249047530340353', 33, 1, 1, '', '感到害怕', '2023-11-30 23:34:54', '2023-11-30 23:34:54', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249051607203841', 34, 1, 1, '', '我的感情容易受到伤害', '2023-11-30 23:34:55', '2023-11-30 23:34:55', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249055684067330', 35, 1, 1, '', '旁人能知道我的私下想法　', '2023-11-30 23:34:56', '2023-11-30 23:34:56', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249059798679554', 36, 1, 1, '', '感到别人不理解我或不同情我', '2023-11-30 23:34:57', '2023-11-30 23:34:57', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249064013955074', 37, 1, 1, '', '感到别人对我不友好，不喜欢我', '2023-11-30 23:34:58', '2023-11-30 23:34:58', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249068266979329', 38, 1, 1, '', '做事必须做得很慢以保证做得准确', '2023-11-30 23:34:59', '2023-11-30 23:34:59', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249072641638401', 39, 1, 1, '', '容易心慌', '2023-11-30 23:35:00', '2023-11-30 23:35:00', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249077007908865', 40, 1, 1, '', '恶心或胃部不舒服', '2023-11-30 23:35:01', '2023-11-30 23:35:01', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249081500008450', 41, 1, 1, '', '感到比不上他人', '2023-11-30 23:35:02', '2023-11-30 23:35:02', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249086071799809', 42, 1, 1, '', '容易肌肉酸痛', '2023-11-30 23:35:03', '2023-11-30 23:35:03', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249090668756993', 43, 1, 1, '', '感到有人在监视我谈论我', '2023-11-30 23:35:04', '2023-11-30 23:35:04', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249095429292034', 44, 1, 1, '', '难以入睡　', '2023-11-30 23:35:05', '2023-11-30 23:35:05', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249100240158721', 45, 1, 1, '', '做事必须反复检查', '2023-11-30 23:35:07', '2023-11-30 23:35:07', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249105134911490', 46, 1, 1, '', '难以做出决定', '2023-11-30 23:35:08', '2023-11-30 23:35:08', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249110142910465', 47, 1, 1, '', '怕乘电车、公共汽车、地铁或火车', '2023-11-30 23:35:09', '2023-11-30 23:35:09', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249115180269570', 48, 1, 1, '', '呼吸有困难', '2023-11-30 23:35:10', '2023-11-30 23:35:10', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249120288931841', 49, 1, 1, '', '一阵阵发冷或发热', '2023-11-30 23:35:11', '2023-11-30 23:35:11', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249125494063106', 50, 1, 1, '', '因为感到害怕而避开某些东西、场合或活动', '2023-11-30 23:35:13', '2023-11-30 23:35:13', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249130791469058', 51, 1, 1, '', '大脑容易无法停止的思考问题', '2023-11-30 23:35:14', '2023-11-30 23:35:14', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249136181149698', 52, 1, 1, '', '身体有发麻或刺痛的表现', '2023-11-30 23:35:15', '2023-11-30 23:35:15', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249141663105025', 53, 1, 1, '', '喉咙有梗塞感', '2023-11-30 23:35:17', '2023-11-30 23:35:17', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249147187003393', 54, 1, 1, '', '感到前途没希望', '2023-11-30 23:35:18', '2023-11-30 23:35:18', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249152811565057', 55, 1, 1, '', '不能集中注意力', '2023-11-30 23:35:19', '2023-11-30 23:35:19', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249158520012802', 56, 1, 1, '', '身体容易发软或无力', '2023-11-30 23:35:21', '2023-11-30 23:35:21', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249164291375106', 57, 1, 1, '', '感到紧张或容易紧张', '2023-11-30 23:35:22', '2023-11-30 23:35:22', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249170134040577', 58, 1, 1, '', '感到手或脚容易僵硬', '2023-11-30 23:35:23', '2023-11-30 23:35:23', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249176081563650', 59, 1, 1, '', '半夜经常被惊醒', '2023-11-30 23:35:25', '2023-11-30 23:35:25', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249182071029761', 60, 1, 1, '', '吃得太多', '2023-11-30 23:35:26', '2023-11-30 23:35:26', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249188169547778', 61, 1, 1, '', '当别人看着我或谈论我时感到不自在', '2023-11-30 23:35:28', '2023-11-30 23:35:28', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249194368729089', 62, 1, 1, '', '有一些不属于你自己的想法', '2023-11-30 23:35:29', '2023-11-30 23:35:29', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249200593076225', 63, 1, 1, '', '有想打人或伤害他人的冲动', '2023-11-30 23:35:31', '2023-11-30 23:35:31', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249206892920833', 64, 1, 1, '', '醒得太早', '2023-11-30 23:35:32', '2023-11-30 23:35:32', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249213264068609', 65, 1, 1, '', '必须反复洗手、点数目或触摸某些东西', '2023-11-30 23:35:34', '2023-11-30 23:35:34', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249219702325250', 66, 1, 1, '', '睡得不稳不深', '2023-11-30 23:35:35', '2023-11-30 23:35:35', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249226211885058', 67, 1, 1, '', '有想摔坏或破坏东西的冲动', '2023-11-30 23:35:37', '2023-11-30 23:35:37', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249232830496770', 68, 1, 1, '', '有一些别人没有的想法或念头', '2023-11-30 23:35:38', '2023-11-30 23:35:38', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249239528800257', 69, 1, 1, '', '感到对别人神经过敏', '2023-11-30 23:35:40', '2023-11-30 23:35:40', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249246348738561', 70, 1, 1, '', '在商店或电影院等人多的地方感到不自在', '2023-11-30 23:35:41', '2023-11-30 23:35:41', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249253214814209', 71, 1, 1, '', '感到任何事情都很困难', '2023-11-30 23:35:43', '2023-11-30 23:35:43', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249260177358849', 72, 1, 1, '', '一阵阵恐惧或惊恐', '2023-11-30 23:35:45', '2023-11-30 23:35:45', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249267190235138', 73, 1, 1, '', '感到在公共场合吃东西很不舒服', '2023-11-30 23:35:46', '2023-11-30 23:35:46', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249274312163329', 74, 1, 1, '', '经常与人争论', '2023-11-30 23:35:48', '2023-11-30 23:35:48', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249281480228865', 75, 1, 1, '', '单独一人时神经很紧张　', '2023-11-30 23:35:50', '2023-11-30 23:35:50', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249288732180481', 76, 1, 1, '', '别人对我的成绩没有作出恰当的评价', '2023-11-30 23:35:52', '2023-11-30 23:35:52', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249296072212482', 77, 1, 1, '', '即使和别人在一起也感到孤单', '2023-11-30 23:35:53', '2023-11-30 23:35:53', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249303479353345', 78, 1, 1, '', '感到坐立不安心神不定', '2023-11-30 23:35:55', '2023-11-30 23:35:55', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249310987157505', 79, 1, 1, '', '感到自己没有什么价值', '2023-11-30 23:35:57', '2023-11-30 23:35:57', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249318553681921', 80, 1, 1, '', '感到熟悉的东西变得陌生或不像是真的', '2023-11-30 23:35:59', '2023-11-30 23:35:59', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249326275395586', 81, 1, 1, '', '大叫或摔东西', '2023-11-30 23:36:01', '2023-11-30 23:36:01', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249334043246594', 82, 1, 1, '', '害怕会在公共场合昏倒', '2023-11-30 23:36:02', '2023-11-30 23:36:02', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249341890789377', 83, 1, 1, '', '感到别人想占我的便宜', '2023-11-30 23:36:04', '2023-11-30 23:36:04', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249349771886594', 84, 1, 1, '', '生活中有出现过无意识的行为', '2023-11-30 23:36:06', '2023-11-30 23:36:06', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249357753647106', 85, 1, 1, '', '我认为应该因为自己的过错而受到惩罚', '2023-11-30 23:36:08', '2023-11-30 23:36:08', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249365798322178', 86, 1, 1, '', '感到要赶快把事情做完', '2023-11-30 23:36:10', '2023-11-30 23:36:10', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249373910106114', 87, 1, 1, '', '感到自己的身体有严重问题', '2023-11-30 23:36:12', '2023-11-30 23:36:12', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249382114164738', 88, 1, 1, '', '从未感到和其他人很亲近', '2023-11-30 23:36:14', '2023-11-30 23:36:14', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249390385332226', 89, 1, 1, '', '感到自己有罪', '2023-11-30 23:36:16', '2023-11-30 23:36:16', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730249398614556674', 90, 1, 1, '', '感到自己的脑子有毛病', '2023-11-30 23:36:18', '2023-11-30 23:36:18', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250689403224066', 1, 1, 1, '', '食欲不振', '2023-11-30 23:41:26', '2023-11-30 23:41:26', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250690510520321', 2, 1, 1, '', '恶心,胃口难受,肚子痛', '2023-11-30 23:41:26', '2023-11-30 23:41:26', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250691726868481', 3, 1, 1, '', '容易拉肚子或便秘', '2023-11-30 23:41:26', '2023-11-30 23:41:26', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250693136154626', 4, 1, 1, '', '关注心悸的感觉和脉搏跳动的速度', '2023-11-30 23:41:26', '2023-11-30 23:41:26', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250694520274946', 5, 1, 1, '', '身体健康状况良好', '2023-11-30 23:41:27', '2023-11-30 23:41:27', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250696021835778', 6, 1, 1, '', '牢骚和不满多', '2023-11-30 23:41:27', '2023-11-30 23:41:27', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250697590505473', 7, 1, 1, '', '父母期望过高', '2023-11-30 23:41:27', '2023-11-30 23:41:27', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250699452776449', 8, 1, 1, '', '自已的过去和家庭是不幸的', '2023-11-30 23:41:28', '2023-11-30 23:41:28', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250701302464514', 9, 1, 1, '', '过于担心将来的事情', '2023-11-30 23:41:28', '2023-11-30 23:41:28', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250703089238018', 10, 1, 1, '', '不想见人', '2023-11-30 23:41:29', '2023-11-30 23:41:29', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250704955703298', 11, 1, 1, '', '觉得自已不是自己', '2023-11-30 23:41:29', '2023-11-30 23:41:29', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250706885083138', 12, 1, 1, '', '缺乏热情和积极性', '2023-11-30 23:41:30', '2023-11-30 23:41:30', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250708923514881', 13, 1, 1, '', '悲观', '2023-11-30 23:41:30', '2023-11-30 23:41:30', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250711029055490', 14, 1, 1, '', '思想不集中', '2023-11-30 23:41:31', '2023-11-30 23:41:31', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250713201704962', 15, 1, 1, '', '情绪起伏过大', '2023-11-30 23:41:31', '2023-11-30 23:41:31', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250715479212034', 16, 1, 1, '', '常常失眠', '2023-11-30 23:41:32', '2023-11-30 23:41:32', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250717790273538', 17, 1, 1, '', '头痛', '2023-11-30 23:41:32', '2023-11-30 23:41:32', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250720243941378', 18, 1, 1, '', '脖子,肩膀酸痛', '2023-11-30 23:41:33', '2023-11-30 23:41:33', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250722676637698', 19, 1, 1, '', '胸痛憋闷', '2023-11-30 23:41:33', '2023-11-30 23:41:33', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250725201608705', 20, 1, 1, '', '总是朝气蓬勃', '2023-11-30 23:41:34', '2023-11-30 23:41:34', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250727869186050', 21, 1, 1, '', '气量小', '2023-11-30 23:41:35', '2023-11-30 23:41:35', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250730612260866', 22, 1, 1, '', '爱操心', '2023-11-30 23:41:35', '2023-11-30 23:41:35', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250733426638850', 23, 1, 1, '', '焦燥不安', '2023-11-30 23:41:36', '2023-11-30 23:41:36', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250736362651650', 24, 1, 1, '', '容易动怒', '2023-11-30 23:41:37', '2023-11-30 23:41:37', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250739328024577', 25, 1, 1, '', '想轻生', '2023-11-30 23:41:37', '2023-11-30 23:41:37', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250742364700673', 26, 1, 1, '', '对任何事都没兴趣', '2023-11-30 23:41:38', '2023-11-30 23:41:38', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250745485262849', 27, 1, 1, '', '记忆力减退', '2023-11-30 23:41:39', '2023-11-30 23:41:39', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250748710682626', 28, 1, 1, '', '缺乏耐力', '2023-11-30 23:41:40', '2023-11-30 23:41:40', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250751994822658', 29, 1, 1, '', '缺乏决断能力', '2023-11-30 23:41:40', '2023-11-30 23:41:40', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250755358654465', 30, 1, 1, '', '过于依赖别人', '2023-11-30 23:41:41', '2023-11-30 23:41:41', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250758844121090', 31, 1, 1, '', '为脸红而苦恼', '2023-11-30 23:41:42', '2023-11-30 23:41:42', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250762413473793', 32, 1, 1, '', '口吃,声音发颤', '2023-11-30 23:41:43', '2023-11-30 23:41:43', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250766028963842', 33, 1, 1, '', '身体忽冷忽热', '2023-11-30 23:41:44', '2023-11-30 23:41:44', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250769732534274', 34, 1, 1, '', '常常注意排尿和性器官', '2023-11-30 23:41:45', '2023-11-30 23:41:45', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250773503213570', 35, 1, 1, '', '心情开朗', '2023-11-30 23:41:46', '2023-11-30 23:41:46', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250777257115649', 36, 1, 1, '', '莫明其妙地不安', '2023-11-30 23:41:46', '2023-11-30 23:41:46', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250781099098113', 37, 1, 1, '', '一个人独处时感到不安', '2023-11-30 23:41:47', '2023-11-30 23:41:47', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250785041743873', 38, 1, 1, '', '缺乏自信心', '2023-11-30 23:41:48', '2023-11-30 23:41:48', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250789110218754', 39, 1, 1, '', '办事畏首畏尾', '2023-11-30 23:41:49', '2023-11-30 23:41:49', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250793203859458', 40, 1, 1, '', '容易被人误解', '2023-11-30 23:41:50', '2023-11-30 23:41:50', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250797360414722', 41, 1, 1, '', '不相信别人', '2023-11-30 23:41:51', '2023-11-30 23:41:51', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250801592467458', 42, 1, 1, '', '过于猜疑', '2023-11-30 23:41:52', '2023-11-30 23:41:52', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250805941960706', 43, 1, 1, '', '厌恶交往', '2023-11-30 23:41:53', '2023-11-30 23:41:53', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250810396311553', 44, 1, 1, '', '感到自卑', '2023-11-30 23:41:54', '2023-11-30 23:41:54', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250814921965570', 45, 1, 1, '', '杞人忧天', '2023-11-30 23:41:55', '2023-11-30 23:41:55', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250819544088578', 46, 1, 1, '', '身体倦乏', '2023-11-30 23:41:57', '2023-11-30 23:41:57', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250824212348929', 47, 1, 1, '', '一着急就出冷汗', '2023-11-30 23:41:58', '2023-11-30 23:41:58', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250828935135234', 48, 1, 1, '', '站起来就头晕', '2023-11-30 23:41:59', '2023-11-30 23:41:59', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250833733419010', 49, 1, 1, '', '有过失去意识或抽风的情况', '2023-11-30 23:42:00', '2023-11-30 23:42:00', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250838665920514', 50, 1, 1, '', '人缘好，受欢迎', '2023-11-30 23:42:01', '2023-11-30 23:42:01', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250843724251137', 51, 1, 1, '', '过于拘泥', '2023-11-30 23:42:02', '2023-11-30 23:42:02', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250848811941889', 52, 1, 1, '', '对任何事情不反复确认就不放心', '2023-11-30 23:42:04', '2023-11-30 23:42:04', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250853966741505', 53, 1, 1, '', '对脏很在乎', '2023-11-30 23:42:05', '2023-11-30 23:42:05', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250859201232897', 54, 1, 1, '', '有些摆脱不了的毫无意义的想法', '2023-11-30 23:42:06', '2023-11-30 23:42:06', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250864574136321', 55, 1, 1, '', '觉得自己有怪气味', '2023-11-30 23:42:07', '2023-11-30 23:42:07', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250870009954305', 56, 1, 1, '', '别人在自己背后说坏话', '2023-11-30 23:42:09', '2023-11-30 23:42:09', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250875496103937', 57, 1, 1, '', '总注意周围的人', '2023-11-30 23:42:10', '2023-11-30 23:42:10', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250881074528257', 58, 1, 1, '', '在乎别人的视线', '2023-11-30 23:42:11', '2023-11-30 23:42:11', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250886770393090', 59, 1, 1, '', '觉得别人轻视自己', '2023-11-30 23:42:13', '2023-11-30 23:42:13', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250892512395265', 60, 1, 1, '', '情绪易被破坏', '2023-11-30 23:42:14', '2023-11-30 23:42:14', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250898325700610', 61, 1, 1, '', '至今为止，感到自身健康方面有问题', '2023-11-30 23:42:15', '2023-11-30 23:42:15', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250904222892033', 62, 1, 1, '', '曾觉得自己在心理健康方面有问题', '2023-11-30 23:42:17', '2023-11-30 23:42:17', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250910187192322', 63, 1, 1, '', '至今为止，曾经接受过心理咨询与治疗', '2023-11-30 23:42:18', '2023-11-30 23:42:18', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730250916243767298', 64, 1, 1, '', '现在有心理咨询的愿望', '2023-11-30 23:42:20', '2023-11-30 23:42:20', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253398600646658', 1, 1, 1, '', '你经常陪孩子一起玩。', '2023-11-30 23:52:11', '2023-11-30 23:52:11', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253399624056834', 2, 1, 1, '', '你不经常和孩子呆在一起。', '2023-11-30 23:52:12', '2023-11-30 23:52:12', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253400743936002', 3, 1, 1, '', '你经常听孩子讲悄悄话和心里话。', '2023-11-30 23:52:12', '2023-11-30 23:52:12', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253402014810114', 4, 1, 1, '', '你即使和孩子在一起，也说话很少。', '2023-11-30 23:52:12', '2023-11-30 23:52:12', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253403294072833', 5, 1, 1, '', '孩子虽小，但是对于与孩子有关的事，你还是会在事前告诉他一声。', '2023-11-30 23:52:13', '2023-11-30 23:52:13', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253404611084290', 6, 1, 1, '', '你不喜欢孩子自作主张，你喜欢他听话。', '2023-11-30 23:52:13', '2023-11-30 23:52:13', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253406011981825', 7, 1, 1, '', '在一般情况下，你对孩子做的事是不加干涉的。但如果出现问题，你会出面干预。', '2023-11-30 23:52:13', '2023-11-30 23:52:13', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253407438045185', 8, 1, 1, '', '凡是与孩子有关的事，你都不能保持沉默，非要进行干预不可。', '2023-11-30 23:52:14', '2023-11-30 23:52:14', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253408931217409', 9, 1, 1, '', '你如果发现了孩子的缺点，往往不是训斥一通(或打一顿)，而是耐心启发，让他自己认识问题。', '2023-11-30 23:52:14', '2023-11-30 23:52:14', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253410470526977', 10, 1, 1, '', '孩子做错事，你会十分恼火，常不问理由动手就打。', '2023-11-30 23:52:14', '2023-11-30 23:52:14', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253412664147969', 11, 1, 1, '', '你从不打骂孩子。', '2023-11-30 23:52:15', '2023-11-30 23:52:15', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253414367035393', 12, 1, 1, '', '你相信“不打不成才”、“棍棒下出孝子”的说法是正确的。', '2023-11-30 23:52:15', '2023-11-30 23:52:15', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253416065728513', 13, 1, 1, '', '你能放手让孩子独立处理一些问题，而自己只是从旁关心和指点。', '2023-11-30 23:52:16', '2023-11-30 23:52:16', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253417823141890', 14, 1, 1, '', '有关孩子生活方面的事，你全包下了，孩子几乎一点家务都不做。', '2023-11-30 23:52:16', '2023-11-30 23:52:16', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253419643469825', 15, 1, 1, '', '你让孩子从小就去做一些力所能及的事。', '2023-11-30 23:52:16', '2023-11-30 23:52:16', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253421551878146', 16, 1, 1, '', '你是不允许孩子未经您同意就单独行动的。', '2023-11-30 23:52:17', '2023-11-30 23:52:17', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253423506423809', 17, 1, 1, '', '你对孩子管得不严，允许他的个性自由发展。', '2023-11-30 23:52:17', '2023-11-30 23:52:17', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253425523884034', 18, 1, 1, '', '你每天都要检查孩子的穿着、饮食、课业用品等并且反复提醒他，惟恐误事。', '2023-11-30 23:52:18', '2023-11-30 23:52:18', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253427595870209', 19, 1, 1, '', '你常鼓励孩子独立思考问题、解决问题，培养他具有符合其年龄的成熟行为。', '2023-11-30 23:52:18', '2023-11-30 23:52:18', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253429743353857', 20, 1, 1, '', '孩子读书时，你总要在旁陪伴着，对他的作业你都要亲自过目，逐题检查。', '2023-11-30 23:52:19', '2023-11-30 23:52:19', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253431916003329', 21, 1, 1, '', '你与孩子的关系是平等的，不把自己当作他的权威。', '2023-11-30 23:52:19', '2023-11-30 23:52:19', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253434197704705', 22, 1, 1, '', '你决不允许孩子跟你顶嘴，他必须无条件地服从你。', '2023-11-30 23:52:20', '2023-11-30 23:52:20', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253436517154818', 23, 1, 1, '', '当孩子指出你的缺点时，你能心平气和地听，假如他讲得有理，你会认真考虑。', '2023-11-30 23:52:20', '2023-11-30 23:52:20', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253438870159362', 24, 1, 1, '', '在孩子面前，你是权威，你的要求他必须接受，不许违背。', '2023-11-30 23:52:21', '2023-11-30 23:52:21', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253441294467073', 25, 1, 1, '', '你很爱孩子，当他在你身边时，你会感到快乐。', '2023-11-30 23:52:22', '2023-11-30 23:52:22', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253443794272257', 26, 1, 1, '', '你讨厌孩子，因为他经常惹你生气。', '2023-11-30 23:52:22', '2023-11-30 23:52:22', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253446315048961', 27, 1, 1, '', '休息日、假日孩子不在你身边，会像丢了什么东西似的感到不安。', '2023-11-30 23:52:23', '2023-11-30 23:52:23', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253448907128834', 28, 1, 1, '', '你不太喜欢孩子，常以打骂他等惩罚措施来出气。', '2023-11-30 23:52:23', '2023-11-30 23:52:23', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253451578900481', 29, 1, 1, '', '你对孩子十分关心，对他的生活、学习情况十分清楚。', '2023-11-30 23:52:24', '2023-11-30 23:52:24', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253454317780993', 30, 1, 1, '', '你常常忘记或忽视有关孩子的事。', '2023-11-30 23:52:25', '2023-11-30 23:52:25', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253457094410241', 31, 1, 1, '', '你十分关心孩子的前途，只要他有出息，你就是做点牺牲也在所不惜。', '2023-11-30 23:52:25', '2023-11-30 23:52:25', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253459933954050', 32, 1, 1, '', '你很忙，因此对孩子关心甚少，了解得不多。', '2023-11-30 23:52:26', '2023-11-30 23:52:26', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253462857383937', 33, 1, 1, '', '你经常看到孩子的优点和成绩，并能及时给予肯定和鼓励。', '2023-11-30 23:52:27', '2023-11-30 23:52:27', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253465810173954', 34, 1, 1, '', '你对孩子的作业或其他学习情况总是看不顺眼，颇有意见。', '2023-11-30 23:52:27', '2023-11-30 23:52:27', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253468842655745', 35, 1, 1, '', '尽管孩子有些缺点，你也发现他（她）身上有不少长处和优点。', '2023-11-30 23:52:28', '2023-11-30 23:52:28', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253471900303361', 36, 1, 1, '', '你总觉得孩子缺点较多，叫人讨厌。', '2023-11-30 23:52:29', '2023-11-30 23:52:29', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253474916007937', 37, 1, 1, '', '你与孩子的关系十分亲密，家庭气氛是和谐的。', '2023-11-30 23:52:30', '2023-11-30 23:52:30', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253478141427713', 38, 1, 1, '', '你与孩子较疏远，关系不是太好。', '2023-11-30 23:52:30', '2023-11-30 23:52:30', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253481400401922', 39, 1, 1, '', '孩子跟你很亲热，他（她）什么事都告诉你。', '2023-11-30 23:52:31', '2023-11-30 23:52:31', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253484713902082', 40, 1, 1, '', '你对孩子要求很严，他（她）有点怕你。', '2023-11-30 23:52:32', '2023-11-30 23:52:32', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253488119676930', 41, 1, 1, '', '你对孩子的将来有设想，有要求。', '2023-11-30 23:52:33', '2023-11-30 23:52:33', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253491575783426', 42, 1, 1, '', '你对孩子没有什么要求可言，只要他不闯祸就行。', '2023-11-30 23:52:34', '2023-11-30 23:52:34', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253495065444353', 43, 1, 1, '', '你对孩子的学习有较高的要求，并且经常督促他。', '2023-11-30 23:52:34', '2023-11-30 23:52:34', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253498643185665', 44, 1, 1, '', '你对孩子已丧失信心。', '2023-11-30 23:52:35', '2023-11-30 23:52:35', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253502246092802', 45, 1, 1, '', '你对孩子将来的工作、生活和所受教育都有较高期望。', '2023-11-30 23:52:36', '2023-11-30 23:52:36', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253505916108801', 46, 1, 1, '', '你讲不清对孩子有什么期望，这个问题尚未认真考虑过。', '2023-11-30 23:52:37', '2023-11-30 23:52:37', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253509598707713', 47, 1, 1, '', '你希望孩子读书好，品德、身体也要好。', '2023-11-30 23:52:38', '2023-11-30 23:52:38', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253513394552833', 48, 1, 1, '', '你认为没有必要过早考虑对孩子的期望，等他长大了再说。', '2023-11-30 23:52:39', '2023-11-30 23:52:39', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253517265895425', 49, 1, 1, '', '你对孩子的合理要求总是想方设法地加以满足，而对他提出的不合理的要求，一般都加以拒绝，且向他说明理由。', '2023-11-30 23:52:40', '2023-11-30 23:52:40', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253521204346882', 50, 1, 1, '', '你认为只要孩子的教师不找上门来就放心了，说明他没有问题。', '2023-11-30 23:52:41', '2023-11-30 23:52:41', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253525163769858', 51, 1, 1, '', '孩子年幼无知，你有责任加强对他的管理。', '2023-11-30 23:52:42', '2023-11-30 23:52:42', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253529211273217', 52, 1, 1, '', '你对孩子管得较少，因为他将来是好是坏全取决于他自己，父母起不了多大作用。', '2023-11-30 23:52:43', '2023-11-30 23:52:43', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253533304913922', 53, 1, 1, '', '孩子讨人喜欢，让他吃好、穿好、生活好是你的心愿。', '2023-11-30 23:52:44', '2023-11-30 23:52:44', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253537453080578', 54, 1, 1, '', '孩子不聪明，学习又差，你对他已不抱什么希望。', '2023-11-30 23:52:45', '2023-11-30 23:52:45', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253541588664322', 55, 1, 1, '', '孩子年龄小，不懂事，父母应该多护着他点，多为他着想。', '2023-11-30 23:52:46', '2023-11-30 23:52:46', '', '', NULL);
INSERT INTO `el_qu` (`id`, `no`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`, `item_score`) VALUES ('1730253545875243010', 56, 1, 1, '', '孩子脾气坏，学习漫不经心，你对他也管不好，只好顺其自然了。', '2023-11-30 23:52:47', '2023-11-30 23:52:47', '', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for el_qu_answer
-- ----------------------------
DROP TABLE IF EXISTS `el_qu_answer`;
CREATE TABLE `el_qu_answer` (
  `id` varchar(64) NOT NULL COMMENT '答案ID',
  `qu_id` varchar(64) NOT NULL COMMENT '问题ID',
  `is_right` tinyint(4) DEFAULT '0' COMMENT '是否正确',
  `image` varchar(500) DEFAULT '' COMMENT '选项图片',
  `content` varchar(5000) NOT NULL DEFAULT '' COMMENT '答案内容',
  `analysis` varchar(5000) DEFAULT '' COMMENT '答案分析',
  `item_score` int(5) DEFAULT '0' COMMENT '分数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试题答案选项';

-- ----------------------------
-- Records of el_qu_answer
-- ----------------------------
BEGIN;
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248092206301185', '1730248091740733441', 1, '', '很少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248092223078401', '1730248091740733441', 1, '', '有时有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248092227272706', '1730248091740733441', 1, '', '大部分时间有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248092227272707', '1730248091740733441', 1, '', '绝大部分时间有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248093695279105', '1730248093431037954', 1, '', '很少有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248093707862017', '1730248093431037954', 1, '', '有时有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248093707862018', '1730248093431037954', 1, '', '大部分时间有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248093712056321', '1730248093431037954', 1, '', '绝大部分时间有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248094752243714', '1730248094567694337', 1, '', '很少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248094760632321', '1730248094567694337', 1, '', '有时有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248094760632322', '1730248094567694337', 1, '', '大部分时间有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248094760632323', '1730248094567694337', 1, '', '绝大部分时间有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248095939231745', '1730248095721127938', 1, '', '很少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248095956008961', '1730248095721127938', 1, '', '有时有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248095964397570', '1730248095721127938', 1, '', '大部分时间有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248095972786178', '1730248095721127938', 1, '', '绝大部分时间有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248097390460929', '1730248097122025473', 1, '', '很少有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248097411432450', '1730248097122025473', 1, '', '有时有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248097411432451', '1730248097122025473', 1, '', '大部分时间有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248097411432452', '1730248097122025473', 1, '', '绝大部分时间有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248098782969857', '1730248098539700226', 1, '', '很少有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248098812329986', '1730248098539700226', 1, '', '有时有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248098820718593', '1730248098539700226', 1, '', '大部分时间有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248098824912898', '1730248098539700226', 1, '', '绝大部分时间有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248100330668034', '1730248100116758530', 1, '', '很少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248100339056642', '1730248100116758530', 1, '', '有时有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248100339056643', '1730248100116758530', 1, '', '大部分时间有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248100339056644', '1730248100116758530', 1, '', '绝大部分时间有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248101819645954', '1730248101551210498', 1, '', '很少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248101828034562', '1730248101551210498', 1, '', '有时有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248101832228865', '1730248101551210498', 1, '', '大部分时间有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248101832228866', '1730248101551210498', 1, '', '绝大部分时间有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248103254097922', '1730248103031799810', 1, '', '很少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248103279263745', '1730248103031799810', 1, '', '有时有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248103279263746', '1730248103031799810', 1, '', '大部分时间有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248103279263747', '1730248103031799810', 1, '', '绝大部分时间有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248104877293569', '1730248104684355585', 1, '', '很少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248104881487873', '1730248104684355585', 1, '', '有时有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248104881487874', '1730248104684355585', 1, '', '大部分时间有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248104889876482', '1730248104684355585', 1, '', '绝大部分时间有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248106353688578', '1730248106173333505', 1, '', '很少有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248106366271489', '1730248106173333505', 1, '', '有时有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248106366271490', '1730248106173333505', 1, '', '大部分时间有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248106366271491', '1730248106173333505', 1, '', '绝大部分时间有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248107872026625', '1730248107674894338', 1, '', '很少有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248107880415233', '1730248107674894338', 1, '', '有时有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248107880415234', '1730248107674894338', 1, '', '大部分时间有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248107880415235', '1730248107674894338', 1, '', '绝大部分时间有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248109537165313', '1730248109310672898', 1, '', '很少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248109553942529', '1730248109310672898', 1, '', '有时有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248109558136834', '1730248109310672898', 1, '', '大部分时间有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248109562331137', '1730248109310672898', 1, '', '绝大部分时间有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248111298772993', '1730248111072280577', 1, '', '很少有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248111307161601', '1730248111072280577', 1, '', '有时有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248111307161602', '1730248111072280577', 1, '', '大部分时间有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248111307161603', '1730248111072280577', 1, '', '绝大部分时间有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248113001660418', '1730248112812916738', 1, '', '很少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248113022631938', '1730248112812916738', 1, '', '有时有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248113022631939', '1730248112812916738', 1, '', '大部分时间有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248113022631940', '1730248112812916738', 1, '', '绝大部分时间有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248114847154177', '1730248114624856066', 1, '', '很少有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248114847154178', '1730248114624856066', 1, '', '有时有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248114847154179', '1730248114624856066', 1, '', '大部分时间有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248114851348482', '1730248114624856066', 1, '', '绝大部分时间有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248116726202370', '1730248116503904257', 1, '', '很少有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248116738785282', '1730248116503904257', 1, '', '有时有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248116738785283', '1730248116503904257', 1, '', '大部分时间有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248116738785284', '1730248116503904257', 1, '', '绝大部分时间有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248118638804993', '1730248118408118274', 1, '', '很少有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248118655582209', '1730248118408118274', 1, '', '有时有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248118663970817', '1730248118408118274', 1, '', '大部分时间有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248118663970818', '1730248118408118274', 1, '', '绝大部分时间有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248120647876610', '1730248120442355714', 1, '', '很少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248120677236738', '1730248120442355714', 1, '', '有时有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248120689819650', '1730248120442355714', 1, '', '大部分时间有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248120689819651', '1730248120442355714', 1, '', '绝大部分时间有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248122761805825', '1730248122484981761', 1, '', '很少有', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248122770194434', '1730248122484981761', 1, '', '有时有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248122770194435', '1730248122484981761', 1, '', '大部分时间有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248122770194436', '1730248122484981761', 1, '', '绝大部分时间有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248201820241921', '1730248201459531778', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248201828630529', '1730248201459531778', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248201828630530', '1730248201459531778', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248201828630531', '1730248201459531778', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248202805903362', '1730248202608771074', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248202805903363', '1730248202608771074', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248202805903364', '1730248202608771074', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248202805903365', '1730248202608771074', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248203925782529', '1730248203657347073', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248203971919874', '1730248203657347073', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248203976114177', '1730248203657347073', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248203976114178', '1730248203657347073', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248205163102210', '1730248204949192705', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248205175685121', '1730248204949192705', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248205175685122', '1730248204949192705', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248205175685123', '1730248204949192705', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248206454947842', '1730248206215872513', 1, '', '没有或很少', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248206471725057', '1730248206215872513', 1, '', '有时', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248206471725058', '1730248206215872513', 1, '', '大部分时间', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248206475919362', '1730248206215872513', 1, '', '绝大部分时间', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248207734210562', '1730248207507718146', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248207742599170', '1730248207507718146', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248207742599171', '1730248207507718146', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248207746793473', '1730248207507718146', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248208992501762', '1730248208791175170', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248209000890370', '1730248208791175170', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248209000890371', '1730248208791175170', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248209000890372', '1730248208791175170', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248210489868290', '1730248210217238530', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248210502451202', '1730248210217238530', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248210506645505', '1730248210217238530', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248210506645506', '1730248210217238530', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248211987234817', '1730248211764936706', 1, '', '没有或很少', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248212012400642', '1730248211764936706', 1, '', '有时', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248212020789249', '1730248211764936706', 1, '', '大部分时间', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248212020789250', '1730248211764936706', 1, '', '绝大部分时间', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248213614624770', '1730248213379743745', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248213631401986', '1730248213379743745', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248213631401987', '1730248213379743745', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248213635596290', '1730248213379743745', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248215351066625', '1730248215099408386', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248215359455233', '1730248215099408386', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248215363649537', '1730248215099408386', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248215363649538', '1730248215099408386', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248217049759746', '1730248216772935682', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248217066536961', '1730248216772935682', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248217066536962', '1730248216772935682', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248217066536963', '1730248216772935682', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248218857504769', '1730248218610040834', 1, '', '没有或很少', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248218878476289', '1730248218610040834', 1, '', '有时', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248218878476290', '1730248218610040834', 1, '', '大部分时间', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248218882670593', '1730248218610040834', 1, '', '绝大部分时间', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248220585558018', '1730248220380037121', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248220593946625', '1730248220380037121', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248220598140930', '1730248220380037121', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248220598140931', '1730248220380037121', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248222401691649', '1730248222175199234', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248222414274561', '1730248222175199234', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248222414274562', '1730248222175199234', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248222414274563', '1730248222175199234', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248224301711362', '1730248224071024642', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248224314294274', '1730248224071024642', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248224314294275', '1730248224071024642', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248224314294276', '1730248224071024642', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248226264645634', '1730248226042347521', 1, '', '没有或很少', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248226273034241', '1730248226042347521', 1, '', '有时', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248226277228545', '1730248226042347521', 1, '', '大部分时间', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248226277228546', '1730248226042347521', 1, '', '绝大部分时间', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248228294688769', '1730248228064002050', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248228307271681', '1730248228064002050', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248228307271682', '1730248228064002050', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248228307271683', '1730248228064002050', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248230375063554', '1730248230144376834', 1, '', '没有或很少', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248230379257858', '1730248230144376834', 1, '', '有时', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248230383452162', '1730248230144376834', 1, '', '大部分时间', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248230383452163', '1730248230144376834', 1, '', '绝大部分时间', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248232577073153', '1730248232308637698', 1, '', '没有或很少', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248232581267457', '1730248232308637698', 1, '', '有时', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248232585461761', '1730248232308637698', 1, '', '大部分时间', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248232585461762', '1730248232308637698', 1, '', '绝大部分时间', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248268048302081', '1730248267800838146', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248268052496386', '1730248267800838146', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248268056690690', '1730248267800838146', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248268056690691', '1730248267800838146', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248269348536321', '1730248269050740737', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248269361119233', '1730248269050740737', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248269361119234', '1730248269050740737', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248269365313537', '1730248269050740737', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248270762016770', '1730248270485192705', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248270770405377', '1730248270485192705', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248270774599681', '1730248270485192705', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248270774599682', '1730248270485192705', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248272326492161', '1730248272032890882', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248272334880770', '1730248272032890882', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248272334880771', '1730248272032890882', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248272334880772', '1730248272032890882', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248273903550465', '1730248273635115009', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248273911939073', '1730248273635115009', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248273916133378', '1730248273635115009', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248273916133379', '1730248273635115009', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248275522551809', '1730248275258310657', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248275530940418', '1730248275258310657', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248275530940419', '1730248275258310657', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248275530940420', '1730248275258310657', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248277246410753', '1730248276982169602', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248277254799362', '1730248276982169602', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248277254799363', '1730248276982169602', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248277258993666', '1730248276982169602', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248279087710210', '1730248278773137410', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248279096098818', '1730248278773137410', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248279096098819', '1730248278773137410', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248279096098820', '1730248278773137410', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248281021284353', '1730248280748654594', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248281033867265', '1730248280748654594', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248281033867266', '1730248280748654594', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248281038061569', '1730248280748654594', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248283076493313', '1730248282757726210', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248283089076226', '1730248282757726210', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248283089076227', '1730248282757726210', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248283089076228', '1730248282757726210', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248285190422529', '1730248284880044034', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248285219782658', '1730248284880044034', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248285219782659', '1730248284880044034', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248285219782660', '1730248284880044034', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248287568592897', '1730248287153356802', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248287593758722', '1730248287153356802', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248287593758723', '1730248287153356802', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248287593758724', '1730248287153356802', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248289871265793', '1730248289598636033', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248289888043009', '1730248289598636033', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248289888043010', '1730248289598636033', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248289888043011', '1730248289598636033', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248292131995649', '1730248291863560193', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248292140384257', '1730248291863560193', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248292140384258', '1730248291863560193', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248292144578562', '1730248291863560193', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248294505971714', '1730248294229147649', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248294514360321', '1730248294229147649', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248294514360322', '1730248294229147649', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248294518554625', '1730248294229147649', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248296930279425', '1730248296645066753', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248296955445249', '1730248296645066753', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248296955445250', '1730248296645066753', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248296955445251', '1730248296645066753', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248299467833346', '1730248299186814977', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248299484610562', '1730248299186814977', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248299484610563', '1730248299186814977', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248299484610564', '1730248299186814977', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248302093467649', '1730248301804060674', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248302101856258', '1730248301804060674', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248302106050561', '1730248301804060674', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248302106050562', '1730248301804060674', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248304748462081', '1730248304480026626', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248304756850690', '1730248304480026626', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248304761044993', '1730248304480026626', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248304761044994', '1730248304480026626', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248307466371074', '1730248307193741313', 1, '', '没有或几乎没有', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248307478953985', '1730248307193741313', 1, '', '少有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248307478953986', '1730248307193741313', 1, '', '常有', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248307478953987', '1730248307193741313', 1, '', '一直有', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248388173168642', '1730248387917316097', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248388173168643', '1730248387917316097', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248389284659202', '1730248388999446529', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248389297242113', '1730248388999446529', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248390572310529', '1730248390282903554', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248390584893442', '1730248390282903554', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248391910293506', '1730248391633469442', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248391922876418', '1730248391633469442', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248393332162561', '1730248393042755585', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248393344745473', '1730248393042755585', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248394821140481', '1730248394544316418', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248394829529089', '1730248394544316418', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248396398198786', '1730248396121374721', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248396414976002', '1730248396121374721', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248398143029250', '1730248397786513409', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248398159806466', '1730248397786513409', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248399917219841', '1730248399619424257', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248399929802753', '1730248399619424257', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248401712381953', '1730248401427169282', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248401724964865', '1730248401427169282', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248403650150401', '1730248403364937730', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248403662733313', '1730248403364937730', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248405692776450', '1730248405361426433', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248405709553665', '1730248405361426433', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248407815094273', '1730248407538270209', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248407827677186', '1730248407538270209', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248409933217794', '1730248409656393729', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248409945800706', '1730248409656393729', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248412332359682', '1730248411938095105', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248412340748290', '1730248411938095105', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248414731501569', '1730248414425317378', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248414744084482', '1730248414425317378', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248417101283330', '1730248416820264962', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248417105477633', '1730248416820264962', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248419580116993', '1730248419294904322', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248419588505602', '1730248419294904322', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248422079922178', '1730248421811486721', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248422088310786', '1730248421811486721', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248424672002049', '1730248424399372290', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248424684584961', '1730248424399372290', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248427326996481', '1730248427058561026', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248427339579394', '1730248427058561026', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248430061682690', '1730248429793247233', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248430074265602', '1730248429793247233', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248432909615106', '1730248432636985346', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248432922198018', '1730248432636985346', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248435711410177', '1730248435463946242', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248435715604482', '1730248435463946242', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248438601285633', '1730248438353821697', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248438605479938', '1730248438353821697', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248441549881346', '1730248441273057282', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248441587630082', '1730248441273057282', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248444775301121', '1730248444494282754', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248444783689729', '1730248444494282754', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248448009109505', '1730248447728091138', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248448017498114', '1730248447728091138', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248451322609666', '1730248451049979905', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248451335192578', '1730248451049979905', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248454686441474', '1730248454418006017', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248454699024386', '1730248454418006017', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248458142547970', '1730248457861529602', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248458155130882', '1730248457861529602', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248461678346241', '1730248461405716482', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248461690929154', '1730248461405716482', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248465289641986', '1730248465012817922', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248465302224898', '1730248465012817922', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248468972240898', '1730248468695416833', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248468984823810', '1730248468695416833', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248472784863233', '1730248472474484738', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248472797446146', '1730248472474484738', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248476702343170', '1730248476425519105', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248476714926081', '1730248476425519105', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248480624017409', '1730248480347193345', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248480632406017', '1730248480347193345', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248484625383425', '1730248484352753666', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248484637966337', '1730248484352753666', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248488739995650', '1730248488454782977', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248488748384258', '1730248488454782977', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248492913328129', '1730248492636504065', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248492930105345', '1730248492636504065', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248497141186562', '1730248496872751106', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248497149575169', '1730248496872751106', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248501444542465', '1730248501167718402', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248501452931074', '1730248501167718402', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248505856950273', '1730248505575931906', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248505865338881', '1730248505575931906', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248510328078337', '1730248510055448578', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248510336466945', '1730248510055448578', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248514946007041', '1730248514644017154', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248514954395650', '1730248514644017154', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248519626850305', '1730248519350026241', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248519635238914', '1730248519350026241', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248524332859393', '1730248524060229634', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248524345442305', '1730248524060229634', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248529114365954', '1730248528841736193', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248529126948865', '1730248528841736193', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248533967175681', '1730248533694545922', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248533979758593', '1730248533694545922', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248538908065794', '1730248538631241729', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248538916454402', '1730248538631241729', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248543928647682', '1730248543656017921', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248543945424898', '1730248543656017921', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248549037309954', '1730248548760485890', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248549045698561', '1730248548760485890', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248554225664002', '1730248553948839938', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248554242441218', '1730248553948839938', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248559476932610', '1730248559204302850', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248559489515521', '1730248559204302850', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248564841447426', '1730248564560429057', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248564854030338', '1730248564560429057', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248570331791361', '1730248570042384385', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248570340179970', '1730248570042384385', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248575847301121', '1730248575574671361', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248575864078337', '1730248575574671361', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248581450891266', '1730248581169872898', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248581463474178', '1730248581169872898', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248587096424449', '1730248586819600386', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248587109007362', '1730248586819600386', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248592851009537', '1730248592574185473', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248592859398146', '1730248592574185473', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248598660120578', '1730248598387490818', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248598668509185', '1730248598387490818', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248604523757570', '1730248604255322114', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248604532146178', '1730248604255322114', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248610500640770', '1730248610228011010', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248610517417986', '1730248610228011010', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248616544632833', '1730248616263614465', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248616557215746', '1730248616263614465', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248622727036929', '1730248622433435650', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248622743814146', '1730248622433435650', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248628947189762', '1730248628657782785', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248628963966977', '1730248628657782785', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248635259617281', '1730248634961821697', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248635272200194', '1730248634961821697', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248641643347969', '1730248641358135297', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248641655930882', '1730248641358135297', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248648152907778', '1730248647850917889', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248648169684993', '1730248647850917889', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248654779908098', '1730248654494695425', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248654788296706', '1730248654494695425', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248661369159681', '1730248661088141313', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248661381742594', '1730248661088141313', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248667987771393', '1730248667744501762', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248667991965697', '1730248667744501762', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248674648326145', '1730248674371502082', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248674677686274', '1730248674371502082', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248681619259393', '1730248681258549250', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248681631842306', '1730248681258549250', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248688544055297', '1730248688271425538', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248688556638209', '1730248688271425538', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248695519182850', '1730248695250747393', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248695531765762', '1730248695250747393', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248702624333826', '1730248702334926850', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248702632722433', '1730248702334926850', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248709763039233', '1730248709490409473', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248709775622145', '1730248709490409473', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248717027573761', '1730248716759138305', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248717040156674', '1730248716759138305', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248724346634241', '1730248724069810178', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248724363411457', '1730248724069810178', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248731795718146', '1730248731518894082', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248731804106753', '1730248731518894082', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248739261579266', '1730248738984755202', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248739269967873', '1730248738984755202', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248746815520769', '1730248746538696706', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248746823909378', '1730248746538696706', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248754449154049', '1730248754172329985', 1, '', '是', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248754461736961', '1730248754172329985', 1, '', '否', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248762154090498', '1730248761881460738', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248762166673410', '1730248761881460738', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248770479783937', '1730248769678671874', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248770488172546', '1730248769678671874', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248778285383681', '1730248778000171009', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248778297966594', '1730248778000171009', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248786221006850', '1730248785948377090', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248786229395457', '1730248785948377090', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248794211155970', '1730248793942720514', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248794223738882', '1730248793942720514', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248802293579778', '1730248802020950017', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248802301968385', '1730248802020950017', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248810459889665', '1730248810187259905', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248810472472578', '1730248810187259905', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248818764611586', '1730248818487787522', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248818777194497', '1730248818487787522', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248827341963265', '1730248826897367042', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248827354546178', '1730248826897367042', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248835931897858', '1730248835634102274', 1, '', '是', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248835948675073', '1730248835634102274', 1, '', '否', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248844467306497', '1730248844190482434', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248844479889410', '1730248844190482434', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248853094989826', '1730248852813971458', 1, '', '是', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248853103378433', '1730248852813971458', 1, '', '否', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248861764616193', '1730248861487792130', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248861777199105', '1730248861487792130', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248870522322946', '1730248870237110274', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248870534905857', '1730248870237110274', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248879355527169', '1730248879070314497', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248879372304386', '1730248879070314497', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248888322949121', '1730248888037736450', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248888331337729', '1730248888037736450', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248962927034370', '1730248962503409666', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248962935422978', '1730248962503409666', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248962935422979', '1730248962503409666', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248962935422980', '1730248962503409666', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248962935422981', '1730248962503409666', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248964311154689', '1730248964055302146', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248964315348994', '1730248964055302146', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248964315348995', '1730248964055302146', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248964319543298', '1730248964055302146', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248964319543299', '1730248964055302146', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248965770772482', '1730248965493948418', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248965783355394', '1730248965493948418', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248965783355395', '1730248965493948418', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248965783355396', '1730248965493948418', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248965783355397', '1730248965493948418', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248967322664962', '1730248967058423810', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248967335247873', '1730248967058423810', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248967335247874', '1730248967058423810', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248967335247875', '1730248967058423810', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248967335247876', '1730248967058423810', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248968987803649', '1730248968669036546', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248968996192257', '1730248968669036546', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248968996192258', '1730248968669036546', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248969000386562', '1730248968669036546', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248969000386563', '1730248968669036546', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248970736828418', '1730248970443227137', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248970749411329', '1730248970443227137', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248970749411330', '1730248970443227137', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248970749411331', '1730248970443227137', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248970753605633', '1730248970443227137', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248972561350657', '1730248972280332290', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248972578127873', '1730248972280332290', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248972578127874', '1730248972280332290', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248972578127875', '1730248972280332290', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248972582322178', '1730248972280332290', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248974452981762', '1730248974176157697', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248974469758978', '1730248974176157697', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248974469758979', '1730248974176157697', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248974478147585', '1730248974176157697', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248974478147586', '1730248974176157697', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248976441081858', '1730248976160063490', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248976453664770', '1730248976160063490', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248976453664771', '1730248976160063490', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248976453664772', '1730248976160063490', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248976457859074', '1730248976160063490', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248978521456642', '1730248978240438273', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248978538233858', '1730248978240438273', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248978538233859', '1730248978240438273', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248978538233860', '1730248978240438273', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248978542428162', '1730248978240438273', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248980660551681', '1730248980375339009', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248980677328898', '1730248980375339009', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248980685717505', '1730248980375339009', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248980685717506', '1730248980375339009', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248980685717507', '1730248980375339009', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248982938058753', '1730248982657040385', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248982946447361', '1730248982657040385', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248982950641665', '1730248982657040385', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248982950641666', '1730248982657040385', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248982950641667', '1730248982657040385', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248985299451905', '1730248985014239233', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248985312034818', '1730248985014239233', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248985312034819', '1730248985014239233', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248985312034820', '1730248985014239233', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248985312034821', '1730248985014239233', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248987686010882', '1730248987404992513', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248987698593794', '1730248987404992513', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248987698593795', '1730248987404992513', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248987698593796', '1730248987404992513', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248987698593797', '1730248987404992513', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248990131290114', '1730248989850271745', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248990139678722', '1730248989850271745', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248990143873026', '1730248989850271745', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248990143873027', '1730248989850271745', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248990143873028', '1730248989850271745', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248992647872514', '1730248992371048450', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248992668844034', '1730248992371048450', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248992673038338', '1730248992371048450', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248992673038339', '1730248992371048450', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248992673038340', '1730248992371048450', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248995235758081', '1730248994963128321', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248995244146689', '1730248994963128321', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248995248340994', '1730248994963128321', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248995248340995', '1730248994963128321', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248995248340996', '1730248994963128321', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248997957861378', '1730248997676843009', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248997970444289', '1730248997676843009', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248997970444290', '1730248997676843009', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248997970444291', '1730248997676843009', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730248997970444292', '1730248997676843009', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249000721907714', '1730249000440889346', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249000734490625', '1730249000440889346', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249000734490626', '1730249000440889346', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249000738684929', '1730249000440889346', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249000738684930', '1730249000440889346', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249003561451522', '1730249003280433154', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249003574034434', '1730249003280433154', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249003574034435', '1730249003280433154', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249003574034436', '1730249003280433154', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249003574034437', '1730249003280433154', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249006472298497', '1730249006199668737', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249006484881409', '1730249006199668737', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249006484881410', '1730249006199668737', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249006489075713', '1730249006199668737', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249006489075714', '1730249006199668737', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249009479614466', '1730249009202790402', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249009496391682', '1730249009202790402', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249009496391683', '1730249009202790402', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249009496391684', '1730249009202790402', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249009500585985', '1730249009202790402', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249012575010818', '1730249012298186753', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249012587593729', '1730249012298186753', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249012591788033', '1730249012298186753', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249012591788034', '1730249012298186753', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249012591788035', '1730249012298186753', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249015733321729', '1730249015456497666', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249015750098946', '1730249015456497666', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249015750098947', '1730249015456497666', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249015750098948', '1730249015456497666', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249015750098949', '1730249015456497666', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249018962935809', '1730249018677723138', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249018975518722', '1730249018677723138', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249018979713026', '1730249018677723138', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249018979713027', '1730249018677723138', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249018979713028', '1730249018677723138', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249022280630273', '1730249021999611906', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249022293213185', '1730249021999611906', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249022293213186', '1730249021999611906', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249022293213187', '1730249021999611906', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249022293213188', '1730249021999611906', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249025682210817', '1730249025409581057', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249025690599425', '1730249025409581057', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249025698988033', '1730249025409581057', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249025698988034', '1730249025409581057', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249025698988035', '1730249025409581057', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249029159288834', '1730249028869881857', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249029176066050', '1730249028869881857', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249029176066051', '1730249028869881857', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249029176066052', '1730249028869881857', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249029180260354', '1730249028869881857', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249032720252929', '1730249032451817474', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249032732835841', '1730249032451817474', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249032732835842', '1730249032451817474', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249032732835843', '1730249032451817474', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249032732835844', '1730249032451817474', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249036377686018', '1730249036092473345', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249036386074626', '1730249036092473345', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249036394463234', '1730249036092473345', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249036394463235', '1730249036092473345', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249036394463236', '1730249036092473345', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249040102227970', '1730249039817015298', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249040114810881', '1730249039817015298', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249040114810882', '1730249039817015298', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249040114810883', '1730249039817015298', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249040119005186', '1730249039817015298', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249043910656001', '1730249043625443330', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249043927433217', '1730249043625443330', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249043927433218', '1730249043625443330', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249043927433219', '1730249043625443330', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249043927433220', '1730249043625443330', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249047823941634', '1730249047530340353', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249047832330241', '1730249047530340353', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249047832330242', '1730249047530340353', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249047836524546', '1730249047530340353', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249047836524547', '1730249047530340353', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249051896610818', '1730249051607203841', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249051917582337', '1730249051607203841', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249051917582338', '1730249051607203841', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249051921776641', '1730249051607203841', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249051921776642', '1730249051607203841', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249055973474305', '1730249055684067330', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249055986057217', '1730249055684067330', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249055986057218', '1730249055684067330', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249055986057219', '1730249055684067330', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249055986057220', '1730249055684067330', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249060088086530', '1730249059798679554', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249060100669442', '1730249059798679554', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249060100669443', '1730249059798679554', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249060100669444', '1730249059798679554', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249060100669445', '1730249059798679554', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249064290779138', '1730249064013955074', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249064299167746', '1730249064013955074', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249064299167747', '1730249064013955074', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249064303362050', '1730249064013955074', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249064303362051', '1730249064013955074', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249068543803394', '1730249068266979329', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249068556386305', '1730249068266979329', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249068556386306', '1730249068266979329', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249068556386307', '1730249068266979329', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249068556386308', '1730249068266979329', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249072910073857', '1730249072641638401', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249072918462465', '1730249072641638401', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249072918462466', '1730249072641638401', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249072918462467', '1730249072641638401', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249072918462468', '1730249072641638401', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249077280538625', '1730249077007908865', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249077288927234', '1730249077007908865', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249077293121537', '1730249077007908865', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249077293121538', '1730249077007908865', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249077293121539', '1730249077007908865', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249081776832513', '1730249081500008450', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249081785221122', '1730249081500008450', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249081785221123', '1730249081500008450', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249081785221124', '1730249081500008450', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249081789415425', '1730249081500008450', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249086344429570', '1730249086071799809', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249086352818178', '1730249086071799809', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249086352818179', '1730249086071799809', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249086352818180', '1730249086071799809', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249086352818181', '1730249086071799809', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249090945581058', '1730249090668756993', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249090962358274', '1730249090668756993', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249090962358275', '1730249090668756993', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249090962358276', '1730249090668756993', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249090966552577', '1730249090668756993', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249095706116097', '1730249095429292034', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249095718699010', '1730249095429292034', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249095722893314', '1730249095429292034', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249095722893315', '1730249095429292034', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249095722893316', '1730249095429292034', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249100516982785', '1730249100240158721', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249100533760001', '1730249100240158721', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249100533760002', '1730249100240158721', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249100533760003', '1730249100240158721', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249100533760004', '1730249100240158721', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249105411735554', '1730249105134911490', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249105428512769', '1730249105134911490', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249105428512770', '1730249105134911490', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249105432707073', '1730249105134911490', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249105432707074', '1730249105134911490', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249110423928834', '1730249110142910465', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249110436511745', '1730249110142910465', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249110436511746', '1730249110142910465', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249110436511747', '1730249110142910465', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249110436511748', '1730249110142910465', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249115461287938', '1730249115180269570', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249115473870850', '1730249115180269570', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249115473870851', '1730249115180269570', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249115473870852', '1730249115180269570', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249115478065154', '1730249115180269570', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249120565755905', '1730249120288931841', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249120578338818', '1730249120288931841', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249120578338819', '1730249120288931841', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249120582533121', '1730249120288931841', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249120582533122', '1730249120288931841', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249125779275777', '1730249125494063106', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249125791858690', '1730249125494063106', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249125791858691', '1730249125494063106', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249125796052993', '1730249125494063106', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249125796052994', '1730249125494063106', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249131085070337', '1730249130791469058', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249131101847553', '1730249130791469058', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249131101847554', '1730249130791469058', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249131101847555', '1730249130791469058', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249131106041857', '1730249130791469058', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249136478945282', '1730249136181149698', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249136491528193', '1730249136181149698', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249136491528194', '1730249136181149698', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249136491528195', '1730249136181149698', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249136495722497', '1730249136181149698', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249141948317697', '1730249141663105025', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249141960900609', '1730249141663105025', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249141960900610', '1730249141663105025', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249141960900611', '1730249141663105025', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249141960900612', '1730249141663105025', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249147468021761', '1730249147187003393', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249147480604673', '1730249147187003393', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249147480604674', '1730249147187003393', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249147480604675', '1730249147187003393', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249147480604676', '1730249147187003393', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249153100972033', '1730249152811565057', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249153113554946', '1730249152811565057', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249153113554947', '1730249152811565057', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249153113554948', '1730249152811565057', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249153113554949', '1730249152811565057', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249158801031170', '1730249158520012802', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249158813614082', '1730249158520012802', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249158813614083', '1730249158520012802', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249158813614084', '1730249158520012802', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249158817808385', '1730249158520012802', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249164568199170', '1730249164291375106', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249164584976385', '1730249164291375106', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249164589170689', '1730249164291375106', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249164589170690', '1730249164291375106', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249164589170691', '1730249164291375106', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249170427641858', '1730249170134040577', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249170444419074', '1730249170134040577', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249170444419075', '1730249170134040577', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249170444419076', '1730249170134040577', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249170444419077', '1730249170134040577', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249176366776321', '1730249176081563650', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249176379359233', '1730249176081563650', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249176379359234', '1730249176081563650', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249176379359235', '1730249176081563650', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249176383553537', '1730249176081563650', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249182343659521', '1730249182071029761', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249182360436738', '1730249182071029761', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249182360436739', '1730249182071029761', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249182360436740', '1730249182071029761', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249182364631042', '1730249182071029761', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249188475731970', '1730249188169547778', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249188484120577', '1730249188169547778', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249188484120578', '1730249188169547778', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249188488314881', '1730249188169547778', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249188488314882', '1730249188169547778', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249194645553153', '1730249194368729089', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249194662330370', '1730249194368729089', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249194662330371', '1730249194368729089', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249194666524673', '1730249194368729089', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249194666524674', '1730249194368729089', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249200869900289', '1730249200593076225', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249200882483201', '1730249200593076225', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249200882483202', '1730249200593076225', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249200882483203', '1730249200593076225', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249200886677505', '1730249200593076225', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249207165550594', '1730249206892920833', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249207173939201', '1730249206892920833', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249207178133505', '1730249206892920833', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249207178133506', '1730249206892920833', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249207178133507', '1730249206892920833', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249213540892674', '1730249213264068609', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249213553475586', '1730249213264068609', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249213553475587', '1730249213264068609', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249213557669890', '1730249213264068609', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249213557669891', '1730249213264068609', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249219974955009', '1730249219702325250', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249219987537922', '1730249219702325250', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249219987537923', '1730249219702325250', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249219987537924', '1730249219702325250', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249219991732226', '1730249219702325250', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249226488709121', '1730249226211885058', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249226501292034', '1730249226211885058', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249226501292035', '1730249226211885058', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249226501292036', '1730249226211885058', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249226505486338', '1730249226211885058', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249233111515137', '1730249232830496770', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249233124098050', '1730249232830496770', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249233124098051', '1730249232830496770', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249233124098052', '1730249232830496770', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249233124098053', '1730249232830496770', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249239809818625', '1730249239528800257', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249239826595841', '1730249239528800257', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249239826595842', '1730249239528800257', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249239826595843', '1730249239528800257', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249239830790145', '1730249239528800257', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249246633951233', '1730249246348738561', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249246650728450', '1730249246348738561', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249246650728451', '1730249246348738561', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249246650728452', '1730249246348738561', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249246650728453', '1730249246348738561', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249253491638273', '1730249253214814209', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249253508415490', '1730249253214814209', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249253508415491', '1730249253214814209', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249253508415492', '1730249253214814209', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249253508415493', '1730249253214814209', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249260454182914', '1730249260177358849', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249260458377217', '1730249260177358849', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249260458377218', '1730249260177358849', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249260458377219', '1730249260177358849', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249260458377220', '1730249260177358849', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249267471253505', '1730249267190235138', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249267488030722', '1730249267190235138', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249267488030723', '1730249267190235138', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249267488030724', '1730249267190235138', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249267488030725', '1730249267190235138', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249274588987393', '1730249274312163329', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249274601570306', '1730249274312163329', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249274601570307', '1730249274312163329', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249274605764609', '1730249274312163329', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249274605764610', '1730249274312163329', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249281765441537', '1730249281480228865', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249281769635841', '1730249281480228865', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249281773830145', '1730249281480228865', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249281773830146', '1730249281480228865', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249281773830147', '1730249281480228865', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249289013198849', '1730249288732180481', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249289038364673', '1730249288732180481', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249289038364674', '1730249288732180481', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249289038364675', '1730249288732180481', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249289038364676', '1730249288732180481', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249296336453633', '1730249296072212482', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249296344842242', '1730249296072212482', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249296344842243', '1730249296072212482', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249296349036546', '1730249296072212482', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249296349036547', '1730249296072212482', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249303772954626', '1730249303479353345', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249303785537538', '1730249303479353345', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249303789731841', '1730249303479353345', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249303789731842', '1730249303479353345', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249303789731843', '1730249303479353345', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249311272370177', '1730249310987157505', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249311284953090', '1730249310987157505', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249311284953091', '1730249310987157505', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249311284953092', '1730249310987157505', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249311284953093', '1730249310987157505', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249318834700289', '1730249318553681921', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249318851477506', '1730249318553681921', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249318855671810', '1730249318553681921', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249318855671811', '1730249318553681921', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249318855671812', '1730249318553681921', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249326573191169', '1730249326275395586', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249326585774082', '1730249326275395586', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249326589968386', '1730249326275395586', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249326589968387', '1730249326275395586', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249326589968388', '1730249326275395586', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249334328459266', '1730249334043246594', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249334345236482', '1730249334043246594', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249334345236483', '1730249334043246594', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249334345236484', '1730249334043246594', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249334345236485', '1730249334043246594', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249342159224833', '1730249341890789377', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249342171807746', '1730249341890789377', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249342171807747', '1730249341890789377', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249342176002049', '1730249341890789377', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249342176002050', '1730249341890789377', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249350052904961', '1730249349771886594', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249350069682178', '1730249349771886594', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249350069682179', '1730249349771886594', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249350069682180', '1730249349771886594', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249350073876482', '1730249349771886594', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249358034665473', '1730249357753647106', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249358051442689', '1730249357753647106', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249358051442690', '1730249357753647106', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249358051442691', '1730249357753647106', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249358059831297', '1730249357753647106', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249366079340545', '1730249365798322178', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249366091923458', '1730249365798322178', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249366091923459', '1730249365798322178', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249366096117762', '1730249365798322178', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249366096117763', '1730249365798322178', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249374191124481', '1730249373910106114', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249374199513090', '1730249373910106114', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249374199513091', '1730249373910106114', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249374199513092', '1730249373910106114', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249374207901697', '1730249373910106114', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249382386794497', '1730249382114164738', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249382395183105', '1730249382114164738', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249382399377410', '1730249382114164738', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249382399377411', '1730249382114164738', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249382399377412', '1730249382114164738', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249390657961986', '1730249390385332226', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249390670544897', '1730249390385332226', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249390670544898', '1730249390385332226', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249390670544899', '1730249390385332226', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249390670544900', '1730249390385332226', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249398903963650', '1730249398614556674', 1, '', '没有', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249398916546562', '1730249398614556674', 1, '', '很轻', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249398920740866', '1730249398614556674', 1, '', '中等', '', 3);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249398920740867', '1730249398614556674', 1, '', '偏重', '', 4);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730249398920740868', '1730249398614556674', 1, '', '严重', '', 5);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250689667465217', '1730250689403224066', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250689671659521', '1730250689403224066', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250690762178561', '1730250690510520321', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250690770567170', '1730250690510520321', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250692054024194', '1730250691726868481', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250692058218498', '1730250691726868481', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250693408784386', '1730250693136154626', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250693421367297', '1730250693136154626', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250694797099009', '1730250694520274946', 1, '', '是', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250694801293313', '1730250694520274946', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250696294465537', '1730250696021835778', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250696307048450', '1730250696021835778', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250698009935874', '1730250697590505473', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250698022518786', '1730250697590505473', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250699733794818', '1730250699452776449', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250699746377730', '1730250699452776449', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250701570899970', '1730250701302464514', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250701579288577', '1730250701302464514', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250703357673474', '1730250703089238018', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250703374450689', '1730250703089238018', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250705219944450', '1730250704955703298', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250705232527361', '1730250704955703298', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250707149324289', '1730250706885083138', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250707157712897', '1730250706885083138', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250709196144642', '1730250708923514881', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250709208727553', '1730250708923514881', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250711293296641', '1730250711029055490', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250711305879554', '1730250711029055490', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250713474334722', '1730250713201704962', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250713486917633', '1730250713201704962', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250715747647489', '1730250715479212034', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250715760230402', '1730250715479212034', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250718075486210', '1730250717790273538', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250718092263426', '1730250717790273538', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250720487211009', '1730250720243941378', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250720495599617', '1730250720243941378', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250722928295937', '1730250722676637698', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250722936684545', '1730250722676637698', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250725486821377', '1730250725201608705', 1, '', '是', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250725495209985', '1730250725201608705', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250728141815810', '1730250727869186050', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250728154398722', '1730250727869186050', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250730889084929', '1730250730612260866', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250730901667841', '1730250730612260866', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250733703462914', '1730250733426638850', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250733711851522', '1730250733426638850', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250736639475714', '1730250736362651650', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250736647864322', '1730250736362651650', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250739604848642', '1730250739328024577', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250739613237250', '1730250739328024577', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250742633136129', '1730250742364700673', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250742645719041', '1730250742364700673', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250745762086914', '1730250745485262849', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250745778864129', '1730250745485262849', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250748983312385', '1730250748710682626', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250748995895298', '1730250748710682626', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250752271646722', '1730250751994822658', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250752280035329', '1730250751994822658', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250755631284226', '1730250755358654465', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250755639672834', '1730250755358654465', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250759141916674', '1730250758844121090', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250759167082498', '1730250758844121090', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250762694492162', '1730250762413473793', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250762711269378', '1730250762413473793', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250766301593601', '1730250766028963842', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250766318370818', '1730250766028963842', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250770009358337', '1730250769732534274', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250770030329857', '1730250769732534274', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250773759066113', '1730250773503213570', 1, '', '是', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250773771649025', '1730250773503213570', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250777521356802', '1730250777257115649', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250777529745410', '1730250777257115649', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250781354950658', '1730250781099098113', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250781367533569', '1730250781099098113', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250785322762242', '1730250785041743873', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250785335345154', '1730250785041743873', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250789366071298', '1730250789110218754', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250789374459906', '1730250789110218754', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250793463906306', '1730250793203859458', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250793476489218', '1730250793203859458', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250797612072962', '1730250797360414722', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250797620461570', '1730250797360414722', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250801852514306', '1730250801592467458', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250801860902914', '1730250801592467458', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250806214590465', '1730250805941960706', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250806231367681', '1730250805941960706', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250810668941313', '1730250810396311553', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250810681524226', '1730250810396311553', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250815194595330', '1730250814921965570', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250815202983938', '1730250814921965570', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250819820912642', '1730250819544088578', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250819841884161', '1730250819544088578', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250824472395778', '1730250824212348929', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250824484978690', '1730250824212348929', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250829195182082', '1730250828935135234', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250829203570690', '1730250828935135234', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250833993465857', '1730250833733419010', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250834001854466', '1730250833733419010', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250838946938881', '1730250838665920514', 1, '', '是', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250838955327490', '1730250838665920514', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250844001075201', '1730250843724251137', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250844009463810', '1730250843724251137', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250849080377346', '1730250848811941889', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250849092960257', '1730250848811941889', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250854235176961', '1730250853966741505', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250854243565570', '1730250853966741505', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250859478056961', '1730250859201232897', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250859490639874', '1730250859201232897', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250864842571778', '1730250864574136321', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250864855154689', '1730250864574136321', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250870278389761', '1730250870009954305', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250870286778370', '1730250870009954305', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250875772928001', '1730250875496103937', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250875781316609', '1730250875496103937', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250881351352322', '1730250881074528257', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250881363935234', '1730250881074528257', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250887055605761', '1730250886770393090', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250887072382978', '1730250886770393090', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250892776636418', '1730250892512395265', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250892793413633', '1730250892512395265', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250898602524674', '1730250898325700610', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250898610913282', '1730250898325700610', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250904491327489', '1730250904222892033', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250904499716098', '1730250904222892033', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250910464016385', '1730250910187192322', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250910476599298', '1730250910187192322', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250916516397058', '1730250916243767298', 1, '', '是', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730250916528979970', '1730250916243767298', 1, '', '否', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253398806167553', '1730253398600646658', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253398814556162', '1730253398600646658', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253398814556163', '1730253398600646658', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253398818750465', '1730253398600646658', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253398818750466', '1730253398600646658', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253399812800514', '1730253399624056834', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253399816994818', '1730253399624056834', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253399816994819', '1730253399624056834', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253399816994820', '1730253399624056834', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253399816994821', '1730253399624056834', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253400966234114', '1730253400743936002', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253400978817025', '1730253400743936002', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253400983011330', '1730253400743936002', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253400983011331', '1730253400743936002', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253400983011332', '1730253400743936002', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253402237108225', '1730253402014810114', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253402245496834', '1730253402014810114', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253402245496835', '1730253402014810114', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253402245496836', '1730253402014810114', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253402245496837', '1730253402014810114', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253403503788034', '1730253403294072833', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253403516370945', '1730253403294072833', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253403516370946', '1730253403294072833', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253403516370947', '1730253403294072833', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253403516370948', '1730253403294072833', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253404820799489', '1730253404611084290', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253404837576705', '1730253404611084290', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253404837576706', '1730253404611084290', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253404837576707', '1730253404611084290', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253404837576708', '1730253404611084290', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253406221697025', '1730253406011981825', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253406230085634', '1730253406011981825', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253406234279937', '1730253406011981825', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253406234279938', '1730253406011981825', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253406234279939', '1730253406011981825', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253407660343297', '1730253407438045185', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253407677120513', '1730253407438045185', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253407677120514', '1730253407438045185', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253407677120515', '1730253407438045185', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253407681314817', '1730253407438045185', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253409145126913', '1730253408931217409', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253409157709826', '1730253408931217409', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253409157709827', '1730253408931217409', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253409157709828', '1730253408931217409', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253409161904130', '1730253408931217409', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253410692825089', '1730253410470526977', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253410705408001', '1730253410470526977', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253410705408002', '1730253410470526977', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253410705408003', '1730253410470526977', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253410705408004', '1730253410470526977', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253412920000513', '1730253412664147969', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253412928389122', '1730253412664147969', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253412928389123', '1730253412664147969', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253412928389124', '1730253412664147969', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253412928389125', '1730253412664147969', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253414576750594', '1730253414367035393', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253414589333505', '1730253414367035393', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253414589333506', '1730253414367035393', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253414593527810', '1730253414367035393', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253414593527811', '1730253414367035393', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253416271249410', '1730253416065728513', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253416279638017', '1730253416065728513', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253416283832321', '1730253416065728513', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253416283832322', '1730253416065728513', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253416283832323', '1730253416065728513', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253418028662785', '1730253417823141890', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253418041245698', '1730253417823141890', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253418041245699', '1730253417823141890', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253418041245700', '1730253417823141890', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253418041245701', '1730253417823141890', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253419853185026', '1730253419643469825', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253419865767937', '1730253419643469825', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253419869962241', '1730253419643469825', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253419869962242', '1730253419643469825', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253419869962243', '1730253419643469825', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253421778370562', '1730253421551878146', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253421799342082', '1730253421551878146', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253421799342083', '1730253421551878146', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253421799342084', '1730253421551878146', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253421799342085', '1730253421551878146', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253423728721922', '1730253423506423809', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253423745499137', '1730253423506423809', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253423745499138', '1730253423506423809', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253423745499139', '1730253423506423809', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253423753887746', '1730253423506423809', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253425737793537', '1730253425523884034', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253425750376450', '1730253425523884034', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253425754570754', '1730253425523884034', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253425754570755', '1730253425523884034', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253425754570756', '1730253425523884034', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253427809779713', '1730253427595870209', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253427818168321', '1730253427595870209', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253427818168322', '1730253427595870209', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253427818168323', '1730253427595870209', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253427822362625', '1730253427595870209', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253429961457665', '1730253429743353857', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253429974040578', '1730253429743353857', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253429974040579', '1730253429743353857', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253429974040580', '1730253429743353857', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253429978234882', '1730253429743353857', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253432138301441', '1730253431916003329', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253432146690049', '1730253431916003329', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253432150884354', '1730253431916003329', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253432150884355', '1730253431916003329', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253432150884356', '1730253431916003329', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253434424197122', '1730253434197704705', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253434436780033', '1730253434197704705', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253434445168641', '1730253434197704705', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253434445168642', '1730253434197704705', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253434445168643', '1730253434197704705', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253436743647233', '1730253436517154818', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253436756230146', '1730253436517154818', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253436756230147', '1730253436517154818', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253436756230148', '1730253436517154818', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253436756230149', '1730253436517154818', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253439084068865', '1730253438870159362', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253439100846081', '1730253438870159362', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253439100846082', '1730253438870159362', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253439100846083', '1730253438870159362', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253439100846084', '1730253438870159362', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253441508376578', '1730253441294467073', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253441520959490', '1730253441294467073', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253441520959491', '1730253441294467073', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253441520959492', '1730253441294467073', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253441525153794', '1730253441294467073', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253444012376066', '1730253443794272257', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253444024958977', '1730253443794272257', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253444024958978', '1730253443794272257', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253444024958979', '1730253443794272257', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253444029153281', '1730253443794272257', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253446537347074', '1730253446315048961', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253446545735682', '1730253446315048961', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253446545735683', '1730253446315048961', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253446545735684', '1730253446315048961', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253446549929986', '1730253446315048961', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253449129426945', '1730253448907128834', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253449142009857', '1730253448907128834', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253449142009858', '1730253448907128834', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253449142009859', '1730253448907128834', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253449146204162', '1730253448907128834', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253451784421377', '1730253451578900481', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253451797004290', '1730253451578900481', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253451797004291', '1730253451578900481', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253451797004292', '1730253451578900481', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253451797004293', '1730253451578900481', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253454531690498', '1730253454317780993', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253454544273410', '1730253454317780993', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253454544273411', '1730253454317780993', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253454544273412', '1730253454317780993', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253454544273413', '1730253454317780993', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253457304125442', '1730253457094410241', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253457312514050', '1730253457094410241', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253457312514051', '1730253457094410241', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253457312514052', '1730253457094410241', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253457316708354', '1730253457094410241', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253460156252162', '1730253459933954050', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253460177223682', '1730253459933954050', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253460177223683', '1730253459933954050', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253460177223684', '1730253459933954050', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253460177223685', '1730253459933954050', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253463067099137', '1730253462857383937', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253463083876353', '1730253462857383937', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253463083876354', '1730253462857383937', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253463088070657', '1730253462857383937', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253463088070658', '1730253462857383937', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253466036666369', '1730253465810173954', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253466049249282', '1730253465810173954', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253466049249283', '1730253465810173954', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253466049249284', '1730253465810173954', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253466049249285', '1730253465810173954', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253469048176642', '1730253468842655745', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253469060759554', '1730253468842655745', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253469060759555', '1730253468842655745', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253469060759556', '1730253468842655745', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253469060759557', '1730253468842655745', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253472084852738', '1730253471900303361', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253472089047042', '1730253471900303361', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253472089047043', '1730253471900303361', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253472089047044', '1730253471900303361', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253472089047045', '1730253471900303361', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253475129917441', '1730253474916007937', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253475138306050', '1730253474916007937', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253475138306051', '1730253474916007937', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253475142500353', '1730253474916007937', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253475142500354', '1730253474916007937', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253478346948609', '1730253478141427713', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253478359531521', '1730253478141427713', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253478359531522', '1730253478141427713', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253478359531523', '1730253478141427713', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253478363725826', '1730253478141427713', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253481618505729', '1730253481400401922', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253481626894337', '1730253481400401922', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253481626894338', '1730253481400401922', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253481626894339', '1730253481400401922', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253481626894340', '1730253481400401922', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253484923617281', '1730253484713902082', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253484936200194', '1730253484713902082', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253484936200195', '1730253484713902082', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253484936200196', '1730253484713902082', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253484940394498', '1730253484713902082', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253488333586434', '1730253488119676930', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253488346169345', '1730253488119676930', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253488346169346', '1730253488119676930', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253488346169347', '1730253488119676930', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253488346169348', '1730253488119676930', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253491793887233', '1730253491575783426', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253491806470146', '1730253491575783426', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253491810664449', '1730253491575783426', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253491810664450', '1730253491575783426', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253491810664451', '1730253491575783426', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253495300325378', '1730253495065444353', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253495317102594', '1730253495065444353', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253495317102595', '1730253495065444353', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253495321296898', '1730253495065444353', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253495321296899', '1730253495065444353', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253498865483778', '1730253498643185665', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253498882260994', '1730253498643185665', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253498886455298', '1730253498643185665', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253498886455299', '1730253498643185665', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253498886455300', '1730253498643185665', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253502460002306', '1730253502246092802', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253502476779521', '1730253502246092802', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253502476779522', '1730253502246092802', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253502480973826', '1730253502246092802', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253502480973827', '1730253502246092802', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253506138406913', '1730253505916108801', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253506155184130', '1730253505916108801', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253506159378433', '1730253505916108801', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253506159378434', '1730253505916108801', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253506159378435', '1730253505916108801', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253509821005826', '1730253509598707713', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253509833588738', '1730253509598707713', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253509833588739', '1730253509598707713', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253509833588740', '1730253509598707713', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253509837783042', '1730253509598707713', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253513625239553', '1730253513394552833', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253513637822466', '1730253513394552833', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253513637822467', '1730253513394552833', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253513637822468', '1730253513394552833', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253513642016769', '1730253513394552833', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253517488193538', '1730253517265895425', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253517504970754', '1730253517265895425', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253517504970755', '1730253517265895425', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253517504970756', '1730253517265895425', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253517509165057', '1730253517265895425', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253521430839298', '1730253521204346882', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253521447616514', '1730253521204346882', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253521447616515', '1730253521204346882', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253521451810818', '1730253521204346882', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253521451810819', '1730253521204346882', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253525381873666', '1730253525163769858', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253525394456578', '1730253525163769858', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253525398650882', '1730253525163769858', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253525398650883', '1730253525163769858', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253525398650884', '1730253525163769858', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253529429377025', '1730253529211273217', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253529441959938', '1730253529211273217', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253529446154242', '1730253529211273217', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253529446154243', '1730253529211273217', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253529446154244', '1730253529211273217', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253533527212033', '1730253533304913922', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253533539794946', '1730253533304913922', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253533543989250', '1730253533304913922', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253533543989251', '1730253533304913922', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253533543989252', '1730253533304913922', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253537658601473', '1730253537453080578', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253537671184385', '1730253537453080578', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253537675378690', '1730253537453080578', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253537675378691', '1730253537453080578', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253537675378692', '1730253537453080578', 1, '', '完全不符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253541789990913', '1730253541588664322', 1, '', '完全符合', '', 2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253541798379522', '1730253541588664322', 1, '', '大致符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253541798379523', '1730253541588664322', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253541806768130', '1730253541588664322', 1, '', '很少符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253541806768131', '1730253541588664322', 1, '', '完全不符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253546093346818', '1730253545875243010', 1, '', '完全符合', '', -2);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253546105929730', '1730253545875243010', 1, '', '大致符合', '', -1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253546110124034', '1730253545875243010', 1, '', '稍微符合', '', 0);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253546110124035', '1730253545875243010', 1, '', '很少符合', '', 1);
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`, `item_score`) VALUES ('1730253546110124036', '1730253545875243010', 1, '', '完全不符合', '', 2);
COMMIT;

-- ----------------------------
-- Table structure for el_qu_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_qu_repo`;
CREATE TABLE `el_qu_repo` (
  `id` varchar(64) NOT NULL,
  `qu_id` varchar(64) NOT NULL COMMENT '试题',
  `repo_id` varchar(64) NOT NULL COMMENT '归属题库',
  `qu_type` int(11) NOT NULL DEFAULT '0' COMMENT '题目类型',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `repo_id` (`repo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试题题库关联';

-- ----------------------------
-- Records of el_qu_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248092785115138', '1730248091740733441', '1730232110939148290', 1, 1);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248094173429761', '1730248093431037954', '1730232110939148290', 1, 2);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248095251365890', '1730248094567694337', '1730232110939148290', 1, 3);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248096429965313', '1730248095721127938', '1730232110939148290', 1, 4);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248097864417281', '1730248097122025473', '1730232110939148290', 1, 5);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248099311452162', '1730248098539700226', '1730232110939148290', 1, 6);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248100808818690', '1730248100116758530', '1730232110939148290', 1, 7);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248102293602306', '1730248101551210498', '1730232110939148290', 1, 8);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248103774191618', '1730248103031799810', '1730232110939148290', 1, 9);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248105313501185', '1730248104684355585', '1730232110939148290', 1, 10);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248106781507586', '1730248106173333505', '1730232110939148290', 1, 11);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248108333400066', '1730248107674894338', '1730232110939148290', 1, 12);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248110032093186', '1730248109310672898', '1730232110939148290', 1, 13);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248111726592001', '1730248111072280577', '1730232110939148290', 1, 14);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248113458839553', '1730248112812916738', '1730232110939148290', 1, 15);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248115283361794', '1730248114624856066', '1730232110939148290', 1, 16);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248117154021378', '1730248116503904257', '1730232110939148290', 1, 17);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248119100178433', '1730248118408118274', '1730232110939148290', 1, 18);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248121130221570', '1730248120442355714', '1730232110939148290', 1, 19);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248123198013441', '1730248122484981761', '1730232110939148290', 1, 20);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248202285809665', '1730248201459531778', '1730231999756537857', 1, 1);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248203242110977', '1730248202608771074', '1730231999756537857', 1, 2);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248204458459137', '1730248203657347073', '1730231999756537857', 1, 3);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248205637058561', '1730248204949192705', '1730231999756537857', 1, 4);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248206916321282', '1730248206215872513', '1730231999756537857', 1, 5);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248208195584002', '1730248207507718146', '1730231999756537857', 1, 6);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248209466458114', '1730248208791175170', '1730231999756537857', 1, 7);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248210968018945', '1730248210217238530', '1730231999756537857', 1, 8);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248212477968386', '1730248211764936706', '1730231999756537857', 1, 9);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248214105358337', '1730248213379743745', '1730231999756537857', 1, 10);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248215841800194', '1730248215099408386', '1730231999756537857', 1, 11);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248217544687617', '1730248216772935682', '1730231999756537857', 1, 12);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248219339849729', '1730248218610040834', '1730231999756537857', 1, 13);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248221051125762', '1730248220380037121', '1730231999756537857', 1, 14);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248222888230914', '1730248222175199234', '1730231999756537857', 1, 15);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248224775667713', '1730248224071024642', '1730231999756537857', 1, 16);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248226742796289', '1730248226042347521', '1730231999756537857', 1, 17);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248228760256513', '1730248228064002050', '1730231999756537857', 1, 18);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248230844825602', '1730248230144376834', '1730231999756537857', 1, 19);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248233030057986', '1730248232308637698', '1730231999756537857', 1, 20);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248268618727425', '1730248267800838146', '1730231956819447810', 1, 1);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248269948321793', '1730248269050740737', '1730231956819447810', 1, 2);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248271374385154', '1730248270485192705', '1730231956819447810', 1, 3);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248272934666241', '1730248272032890882', '1730231956819447810', 1, 4);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248274499141633', '1730248273635115009', '1730231956819447810', 1, 5);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248276126531585', '1730248275258310657', '1730231956819447810', 1, 6);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248277842001922', '1730248276982169602', '1730231956819447810', 1, 7);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248279691689986', '1730248278773137410', '1730231956819447810', 1, 8);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248281642041345', '1730248280748654594', '1730231956819447810', 1, 9);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248283714027522', '1730248282757726210', '1730231956819447810', 1, 10);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248285882482689', '1730248284880044034', '1730231956819447810', 1, 11);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248288235487234', '1730248287153356802', '1730231956819447810', 1, 12);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248290466856962', '1730248289598636033', '1730231956819447810', 1, 13);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248292744364033', '1730248291863560193', '1730231956819447810', 1, 14);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248295097368578', '1730248294229147649', '1730231956819447810', 1, 15);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248297542647810', '1730248296645066753', '1730231956819447810', 1, 16);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248300071813121', '1730248299186814977', '1730231956819447810', 1, 17);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248302689058817', '1730248301804060674', '1730231956819447810', 1, 18);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248305335664641', '1730248304480026626', '1730231956819447810', 1, 19);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248308053573634', '1730248307193741313', '1730231956819447810', 1, 20);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248388580016129', '1730248387917316097', '1730231897507794945', 1, 1);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248389737644034', '1730248388999446529', '1730231897507794945', 1, 2);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248391012712450', '1730248390282903554', '1730231897507794945', 1, 3);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248392350695425', '1730248391633469442', '1730231897507794945', 1, 4);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248393772564481', '1730248393042755585', '1730231897507794945', 1, 5);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248395257348098', '1730248394544316418', '1730231897507794945', 1, 6);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248396842795009', '1730248396121374721', '1730231897507794945', 1, 7);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248398612791297', '1730248397786513409', '1730231897507794945', 1, 8);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248400345038849', '1730248399619424257', '1730231897507794945', 1, 9);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248402169561090', '1730248401427169282', '1730231897507794945', 1, 10);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248404086358017', '1730248403364937730', '1730231897507794945', 1, 11);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248406187704322', '1730248405361426433', '1730231897507794945', 1, 12);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248408259690498', '1730248407538270209', '1730231897507794945', 1, 13);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248410415562754', '1730248409656393729', '1730231897507794945', 1, 14);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248412860841986', '1730248411938095105', '1730231897507794945', 1, 15);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248415180292097', '1730248414425317378', '1730231897507794945', 1, 16);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248417545879553', '1730248416820264962', '1730231897507794945', 1, 17);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248420024713217', '1730248419294904322', '1730231897507794945', 1, 18);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248422520324097', '1730248421811486721', '1730231897507794945', 1, 19);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248425112403969', '1730248424399372290', '1730231897507794945', 1, 20);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248427771592706', '1730248427058561026', '1730231897507794945', 1, 21);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248430502084609', '1730248429793247233', '1730231897507794945', 1, 22);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248433329045506', '1730248432636985346', '1730231897507794945', 1, 23);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248436118257666', '1730248435463946242', '1730231897507794945', 1, 24);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248439008133121', '1730248438353821697', '1730231897507794945', 1, 25);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248442032226306', '1730248441273057282', '1730231897507794945', 1, 26);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248445224091649', '1730248444494282754', '1730231897507794945', 1, 27);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248448453705729', '1730248447728091138', '1730231897507794945', 1, 28);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248451767205890', '1730248451049979905', '1730231897507794945', 1, 29);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248455135232001', '1730248454418006017', '1730231897507794945', 1, 30);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248458591338497', '1730248457861529602', '1730231897507794945', 1, 31);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248462127136769', '1730248461405716482', '1730231897507794945', 1, 32);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248465725849601', '1730248465012817922', '1730231897507794945', 1, 33);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248469408448514', '1730248468695416833', '1730231897507794945', 1, 34);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248473233653762', '1730248472474484738', '1730231897507794945', 1, 35);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248477142745090', '1730248476425519105', '1730231897507794945', 1, 36);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248481060225025', '1730248480347193345', '1730231897507794945', 1, 37);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248485086756865', '1730248484352753666', '1730231897507794945', 1, 38);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248489180397569', '1730248488454782977', '1730231897507794945', 1, 39);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248493353730050', '1730248492636504065', '1730231897507794945', 1, 40);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248497573199873', '1730248496872751106', '1730231897507794945', 1, 41);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248501880750081', '1730248501167718402', '1730231897507794945', 1, 42);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248506305740801', '1730248505575931906', '1730231897507794945', 1, 43);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248510776868866', '1730248510055448578', '1730231897507794945', 1, 44);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248515394797569', '1730248514644017154', '1730231897507794945', 1, 45);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248520063057922', '1730248519350026241', '1730231897507794945', 1, 46);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248524773261313', '1730248524060229634', '1730231897507794945', 1, 47);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248529554767874', '1730248528841736193', '1730231897507794945', 1, 48);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248534403383298', '1730248533694545922', '1730231897507794945', 1, 49);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248539348467713', '1730248538631241729', '1730231897507794945', 1, 50);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248544377438210', '1730248543656017921', '1730231897507794945', 1, 51);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248549481906177', '1730248548760485890', '1730231897507794945', 1, 52);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248554666065921', '1730248553948839938', '1730231897507794945', 1, 53);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248559917334530', '1730248559204302850', '1730231897507794945', 1, 54);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248565286043649', '1730248564560429057', '1730231897507794945', 1, 55);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248570788970498', '1730248570042384385', '1730231897507794945', 1, 56);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248576308674561', '1730248575574671361', '1730231897507794945', 1, 57);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248581895487490', '1730248581169872898', '1730231897507794945', 1, 58);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248587557797890', '1730248586819600386', '1730231897507794945', 1, 59);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248593295605761', '1730248592574185473', '1730231897507794945', 1, 60);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248599100522498', '1730248598387490818', '1730231897507794945', 1, 61);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248604968353793', '1730248604255322114', '1730231897507794945', 1, 62);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248610941042690', '1730248610228011010', '1730231897507794945', 1, 63);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248616993423362', '1730248616263614465', '1730231897507794945', 1, 64);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248623175827458', '1730248622433435650', '1730231897507794945', 1, 65);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248629387591682', '1730248628657782785', '1730231897507794945', 1, 66);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248635708407810', '1730248634961821697', '1730231897507794945', 1, 67);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248642087944194', '1730248641358135297', '1730231897507794945', 1, 68);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248648656224258', '1730248647850917889', '1730231897507794945', 1, 69);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248655228698626', '1730248654494695425', '1730231897507794945', 1, 70);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248661805367297', '1730248661088141313', '1730231897507794945', 1, 71);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248668390424577', '1730248667744501762', '1730231897507794945', 1, 72);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248675113893890', '1730248674371502082', '1730231897507794945', 1, 73);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248682063855617', '1730248681258549250', '1730231897507794945', 1, 74);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248688988651522', '1730248688271425538', '1730231897507794945', 1, 75);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248695963779073', '1730248695250747393', '1730231897507794945', 1, 76);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248703060541441', '1730248702334926850', '1730231897507794945', 1, 77);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248710216024066', '1730248709490409473', '1730231897507794945', 1, 78);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248717472169986', '1730248716759138305', '1730231897507794945', 1, 79);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248724837367810', '1730248724069810178', '1730231897507794945', 1, 80);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248732231925762', '1730248731518894082', '1730231897507794945', 1, 81);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248739701981186', '1730248738984755202', '1730231897507794945', 1, 82);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248747260116994', '1730248746538696706', '1730231897507794945', 1, 83);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248754893750273', '1730248754172329985', '1730231897507794945', 1, 84);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248762598686722', '1730248761881460738', '1730231897507794945', 1, 85);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248770924380162', '1730248769678671874', '1730231897507794945', 1, 86);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248778729979905', '1730248778000171009', '1730231897507794945', 1, 87);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248786657214465', '1730248785948377090', '1730231897507794945', 1, 88);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248794647363586', '1730248793942720514', '1730231897507794945', 1, 89);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248802729787394', '1730248802020950017', '1730231897507794945', 1, 90);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248810904485889', '1730248810187259905', '1730231897507794945', 1, 91);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248819213402113', '1730248818487787522', '1730231897507794945', 1, 92);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248827862056961', '1730248826897367042', '1730231897507794945', 1, 93);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248836393271297', '1730248835634102274', '1730231897507794945', 1, 94);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248844911902721', '1730248844190482434', '1730231897507794945', 1, 95);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248853539586050', '1730248852813971458', '1730231897507794945', 1, 96);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248862217601025', '1730248861487792130', '1730231897507794945', 1, 97);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248870962724865', '1730248870237110274', '1730231897507794945', 1, 98);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248879833677826', '1730248879070314497', '1730231897507794945', 1, 99);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248888805294082', '1730248888037736450', '1730231897507794945', 1, 100);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248963623288833', '1730248962503409666', '1730147090266411009', 1, 1);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248964969660418', '1730248964055302146', '1730147090266411009', 1, 2);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248966450249730', '1730248965493948418', '1730147090266411009', 1, 3);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248967993753601', '1730248967058423810', '1730147090266411009', 1, 4);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248969684058114', '1730248968669036546', '1730147090266411009', 1, 5);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248971428888577', '1730248970443227137', '1730147090266411009', 1, 6);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248973236633601', '1730248972280332290', '1730147090266411009', 1, 7);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248975145041922', '1730248974176157697', '1730147090266411009', 1, 8);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248977145724929', '1730248976160063490', '1730147090266411009', 1, 9);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248979205128194', '1730248978240438273', '1730147090266411009', 1, 10);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248981352611842', '1730248980375339009', '1730147090266411009', 1, 11);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248983646896129', '1730248982657040385', '1730147090266411009', 1, 12);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248985987317761', '1730248985014239233', '1730147090266411009', 1, 13);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248988361293826', '1730248987404992513', '1730147090266411009', 1, 14);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248990806573058', '1730248989850271745', '1730147090266411009', 1, 15);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248993331544065', '1730248992371048450', '1730147090266411009', 1, 16);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248995911041026', '1730248994963128321', '1730147090266411009', 1, 17);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730248998637338625', '1730248997676843009', '1730147090266411009', 1, 18);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249001405579266', '1730249000440889346', '1730147090266411009', 1, 19);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249004240928769', '1730249003280433154', '1730147090266411009', 1, 20);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249007168552961', '1730249006199668737', '1730147090266411009', 1, 21);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249010171674625', '1730249009202790402', '1730147090266411009', 1, 22);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249013254488065', '1730249012298186753', '1730147090266411009', 1, 23);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249016412798977', '1730249015456497666', '1730147090266411009', 1, 24);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249019642413057', '1730249018677723138', '1730147090266411009', 1, 25);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249022968496129', '1730249021999611906', '1730147090266411009', 1, 26);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249026361688065', '1730249025409581057', '1730147090266411009', 1, 27);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249029855543298', '1730249028869881857', '1730147090266411009', 1, 28);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249033399730178', '1730249032451817474', '1730147090266411009', 1, 29);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249037069746177', '1730249036092473345', '1730147090266411009', 1, 30);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249040785899521', '1730249039817015298', '1730147090266411009', 1, 31);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249044602716161', '1730249043625443330', '1730147090266411009', 1, 32);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249048532779009', '1730249047530340353', '1730147090266411009', 1, 33);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249052605448194', '1730249051607203841', '1730147090266411009', 1, 34);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249056648757250', '1730249055684067330', '1730147090266411009', 1, 35);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249060771758082', '1730249059798679554', '1730147090266411009', 1, 36);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249064974450690', '1730249064013955074', '1730147090266411009', 1, 37);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249069219086337', '1730249068266979329', '1730147090266411009', 1, 38);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249073581162497', '1730249072641638401', '1730147090266411009', 1, 39);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249077955821570', '1730249077007908865', '1730147090266411009', 1, 40);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249082460504065', '1730249081500008450', '1730147090266411009', 1, 41);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249087007129602', '1730249086071799809', '1730147090266411009', 1, 42);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249091646029825', '1730249090668756993', '1730147090266411009', 1, 43);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249096385593346', '1730249095429292034', '1730147090266411009', 1, 44);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249101204848642', '1730249100240158721', '1730147090266411009', 1, 45);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249106112184321', '1730249105134911490', '1730147090266411009', 1, 46);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249111099211777', '1730249110142910465', '1730147090266411009', 1, 47);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249116128182274', '1730249115180269570', '1730147090266411009', 1, 48);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249121236844545', '1730249120288931841', '1730147090266411009', 1, 49);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249126450364418', '1730249125494063106', '1730147090266411009', 1, 50);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249131772936194', '1730249130791469058', '1730147090266411009', 1, 51);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249137154228226', '1730249136181149698', '1730147090266411009', 1, 52);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249142636183553', '1730249141663105025', '1730147090266411009', 1, 53);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249148164276225', '1730249147187003393', '1730147090266411009', 1, 54);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249153776254978', '1730249152811565057', '1730147090266411009', 1, 55);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249159480508417', '1730249158520012802', '1730147090266411009', 1, 56);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249165264453634', '1730249164291375106', '1730147090266411009', 1, 57);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249171111313410', '1730249170134040577', '1730147090266411009', 1, 58);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249177037864962', '1730249176081563650', '1730147090266411009', 1, 59);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249183027331074', '1730249182071029761', '1730147090266411009', 1, 60);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249189163597826', '1730249188169547778', '1730147090266411009', 1, 61);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249195333419010', '1730249194368729089', '1730147090266411009', 1, 62);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249201553571842', '1730249200593076225', '1730147090266411009', 1, 63);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249207840833538', '1730249206892920833', '1730147090266411009', 1, 64);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249214220369922', '1730249213264068609', '1730147090266411009', 1, 65);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249220646043650', '1730249219702325250', '1730147090266411009', 1, 66);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249227163992065', '1730249226211885058', '1730147090266411009', 1, 67);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249233786798082', '1730249232830496770', '1730147090266411009', 1, 68);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249240501878785', '1730249239528800257', '1730147090266411009', 1, 69);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249247317622786', '1730249246348738561', '1730147090266411009', 1, 70);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249254192087042', '1730249253214814209', '1730147090266411009', 1, 71);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249261125271554', '1730249260177358849', '1730147090266411009', 1, 72);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249268159119361', '1730249267190235138', '1730147090266411009', 1, 73);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249275268464641', '1730249274312163329', '1730147090266411009', 1, 74);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249282436530178', '1730249281480228865', '1730147090266411009', 1, 75);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249289701064705', '1730249288732180481', '1730147090266411009', 1, 76);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249297024319490', '1730249296072212482', '1730147090266411009', 1, 77);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249304460820481', '1730249303479353345', '1730147090266411009', 1, 78);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249311947653121', '1730249310987157505', '1730147090266411009', 1, 79);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249319526760449', '1730249318553681921', '1730147090266411009', 1, 80);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249327273639938', '1730249326275395586', '1730147090266411009', 1, 81);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249335020519425', '1730249334043246594', '1730147090266411009', 1, 82);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249342842896385', '1730249341890789377', '1730147090266411009', 1, 83);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249350740770818', '1730249349771886594', '1730147090266411009', 1, 84);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249358726725634', '1730249357753647106', '1730147090266411009', 1, 85);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249366763012097', '1730249365798322178', '1730147090266411009', 1, 86);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249374870601730', '1730249373910106114', '1730147090266411009', 1, 87);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249383066271745', '1730249382114164738', '1730147090266411009', 1, 88);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249391320662017', '1730249390385332226', '1730147090266411009', 1, 89);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730249399587635201', '1730249398614556674', '1730147090266411009', 1, 90);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250690082701314', '1730250689403224066', '1730232456130367490', 1, 1);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250691194191873', '1730250690510520321', '1730232456130367490', 1, 2);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250692507009025', '1730250691726868481', '1730232456130367490', 1, 3);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250693840797698', '1730250693136154626', '1730232456130367490', 1, 4);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250695233306626', '1730250694520274946', '1730232456130367490', 1, 5);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250696739061762', '1730250696021835778', '1730232456130367490', 1, 6);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250698500669442', '1730250697590505473', '1730232456130367490', 1, 7);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250700228722689', '1730250699452776449', '1730232456130367490', 1, 8);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250701998718977', '1730250701302464514', '1730232456130367490', 1, 9);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250703806464001', '1730250703089238018', '1730232456130367490', 1, 10);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250705656152065', '1730250704955703298', '1730232456130367490', 1, 11);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250707598114817', '1730250706885083138', '1730232456130367490', 1, 12);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250709640740866', '1730250708923514881', '1730232456130367490', 1, 13);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250711733698561', '1730250711029055490', '1730232456130367490', 1, 14);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250713931513858', '1730250713201704962', '1730232456130367490', 1, 15);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250716179660801', '1730250715479212034', '1730232456130367490', 1, 16);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250718520082434', '1730250717790273538', '1730232456130367490', 1, 17);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250720902447106', '1730250720243941378', '1730232456130367490', 1, 18);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250723372892162', '1730250722676637698', '1730232456130367490', 1, 19);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250725939806209', '1730250725201608705', '1730232456130367490', 1, 20);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250728578023425', '1730250727869186050', '1730232456130367490', 1, 21);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250731325292545', '1730250730612260866', '1730232456130367490', 1, 22);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250734169030658', '1730250733426638850', '1730232456130367490', 1, 23);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250737075683330', '1730250736362651650', '1730232456130367490', 1, 24);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250740041056257', '1730250739328024577', '1730232456130367490', 1, 25);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250743073538050', '1730250742364700673', '1730232456130367490', 1, 26);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250746210877442', '1730250745485262849', '1730232456130367490', 1, 27);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250749423714306', '1730250748710682626', '1730232456130367490', 1, 28);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250752707854338', '1730250751994822658', '1730232456130367490', 1, 29);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250756071686146', '1730250755358654465', '1730232456130367490', 1, 30);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250759594901505', '1730250758844121090', '1730232456130367490', 1, 31);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250763143282689', '1730250762413473793', '1730232456130367490', 1, 32);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250766750384129', '1730250766028963842', '1730232456130367490', 1, 33);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250770449760258', '1730250769732534274', '1730232456130367490', 1, 34);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250774186885121', '1730250773503213570', '1730232456130367490', 1, 35);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250777940787201', '1730250777257115649', '1730232456130367490', 1, 36);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250781782769665', '1730250781099098113', '1730232456130367490', 1, 37);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250785767358466', '1730250785041743873', '1730232456130367490', 1, 38);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250789798084610', '1730250789110218754', '1730232456130367490', 1, 39);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250793891725314', '1730250793203859458', '1730232456130367490', 1, 40);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250798044086274', '1730250797360414722', '1730232456130367490', 1, 41);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250802284527617', '1730250801592467458', '1730232456130367490', 1, 42);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250806646603778', '1730250805941960706', '1730232456130367490', 1, 43);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250811105148930', '1730250810396311553', '1730232456130367490', 1, 44);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250815634997249', '1730250814921965570', '1730232456130367490', 1, 45);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250820273897473', '1730250819544088578', '1730232456130367490', 1, 46);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250824900214786', '1730250824212348929', '1730232456130367490', 1, 47);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250829618806786', '1730250828935135234', '1730232456130367490', 1, 48);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250834492588034', '1730250833733419010', '1730232456130367490', 1, 49);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250839399923713', '1730250838665920514', '1730232456130367490', 1, 50);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250844433088514', '1730250843724251137', '1730232456130367490', 1, 51);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250849533362177', '1730250848811941889', '1730232456130367490', 1, 52);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250854675578881', '1730250853966741505', '1730232456130367490', 1, 53);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250859926847489', '1730250859201232897', '1730232456130367490', 1, 54);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250865287168001', '1730250864574136321', '1730232456130367490', 1, 55);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250870714597377', '1730250870009954305', '1730232456130367490', 1, 56);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250876213329922', '1730250875496103937', '1730232456130367490', 1, 57);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250881808531457', '1730250881074528257', '1730232456130367490', 1, 58);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250887496007681', '1730250886770393090', '1730232456130367490', 1, 59);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250893221232641', '1730250892512395265', '1730232456130367490', 1, 60);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250899034537985', '1730250898325700610', '1730232456130367490', 1, 61);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250904927535106', '1730250904222892033', '1730232456130367490', 1, 62);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250910908612609', '1730250910187192322', '1730232456130367490', 1, 63);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730250916969381889', '1730250916243767298', '1730232456130367490', 1, 64);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253399305289730', '1730253398600646658', '1730232408751509506', 1, 1);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253400316116993', '1730253399624056834', '1730232408751509506', 1, 2);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253401545048065', '1730253400743936002', '1730232408751509506', 1, 3);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253402753007617', '1730253402014810114', '1730232408751509506', 1, 4);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253404023881729', '1730253403294072833', '1730232408751509506', 1, 5);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253405349281794', '1730253404611084290', '1730232408751509506', 1, 6);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253406729207809', '1730253406011981825', '1730232408751509506', 1, 7);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253408180436994', '1730253407438045185', '1730232408751509506', 1, 8);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253409656832002', '1730253408931217409', '1730232408751509506', 1, 9);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253411208724482', '1730253410470526977', '1730232408751509506', 1, 10);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253413427511297', '1730253412664147969', '1730232408751509506', 1, 11);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253415084261377', '1730253414367035393', '1730232408751509506', 1, 12);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253416770371586', '1730253416065728513', '1730232408751509506', 1, 13);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253418540367874', '1730253417823141890', '1730232408751509506', 1, 14);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253420385861634', '1730253419643469825', '1730232408751509506', 1, 15);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253422294269954', '1730253421551878146', '1730232408751509506', 1, 16);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253424244621314', '1730253423506423809', '1730232408751509506', 1, 17);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253426253692930', '1730253425523884034', '1730232408751509506', 1, 18);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253428329873409', '1730253427595870209', '1730232408751509506', 1, 19);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253430464774146', '1730253429743353857', '1730232408751509506', 1, 20);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253432662589442', '1730253431916003329', '1730232408751509506', 1, 21);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253434940096513', '1730253434197704705', '1730232408751509506', 1, 22);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253437246963714', '1730253436517154818', '1730232408751509506', 1, 23);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253439604162562', '1730253438870159362', '1730232408751509506', 1, 24);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253442028470274', '1730253441294467073', '1730232408751509506', 1, 25);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253444515692546', '1730253443794272257', '1730232408751509506', 1, 26);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253447044857857', '1730253446315048961', '1730232408751509506', 1, 27);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253449653714946', '1730253448907128834', '1730232408751509506', 1, 28);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253452308709378', '1730253451578900481', '1730232408751509506', 1, 29);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253455051784193', '1730253454317780993', '1730232408751509506', 1, 30);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253457824219138', '1730253457094410241', '1730232408751509506', 1, 31);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253460680540161', '1730253459933954050', '1730232408751509506', 1, 32);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253463582998529', '1730253462857383937', '1730232408751509506', 1, 33);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253466552565762', '1730253465810173954', '1730232408751509506', 1, 34);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253469564076034', '1730253468842655745', '1730232408751509506', 1, 35);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253472563003394', '1730253471900303361', '1730232408751509506', 1, 36);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253475650011137', '1730253474916007937', '1730232408751509506', 1, 37);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253478871236610', '1730253478141427713', '1730232408751509506', 1, 38);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253482126016513', '1730253481400401922', '1730232408751509506', 1, 39);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253485447905282', '1730253484713902082', '1730232408751509506', 1, 40);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253488853680130', '1730253488119676930', '1730232408751509506', 1, 41);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253492318175233', '1730253491575783426', '1730232408751509506', 1, 42);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253495820419073', '1730253495065444353', '1730232408751509506', 1, 43);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253499368800257', '1730253498643185665', '1730232408751509506', 1, 44);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253502992678913', '1730253502246092802', '1730232408751509506', 1, 45);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253506654306305', '1730253505916108801', '1730232408751509506', 1, 46);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253510341099522', '1730253509598707713', '1730232408751509506', 1, 47);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253514162110466', '1730253513394552833', '1730232408751509506', 1, 48);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253518020870145', '1730253517265895425', '1730232408751509506', 1, 49);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253521946738690', '1730253521204346882', '1730232408751509506', 1, 50);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253525918744578', '1730253525163769858', '1730232408751509506', 1, 51);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253529957859329', '1730253529211273217', '1730232408751509506', 1, 52);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253534043111425', '1730253533304913922', '1730232408751509506', 1, 53);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253538174500866', '1730253537453080578', '1730232408751509506', 1, 54);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253542322667521', '1730253541588664322', '1730232408751509506', 1, 55);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1730253546613440513', '1730253545875243010', '1730232408751509506', 1, 56);
COMMIT;

-- ----------------------------
-- Table structure for el_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_repo`;
CREATE TABLE `el_repo` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '题库ID',
  `code` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '题库编号',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '题库名称',
  `remark` text CHARACTER SET utf8 COMMENT '题库备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='题库信息';

-- ----------------------------
-- Records of el_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_repo` (`id`, `code`, `title`, `remark`, `create_time`, `update_time`) VALUES ('1730147090266411009', '', '《心理健康临床症状自评量表》', '《心理健康临床症状自评量表》\n量表备注', '2023-11-30 16:49:46', '2023-11-30 16:49:46');
INSERT INTO `el_repo` (`id`, `code`, `title`, `remark`, `create_time`, `update_time`) VALUES ('1730231897507794945', '', '中小学生心理健康量表（MHT）', '中小学生心理健康量表（MHT）', '2023-11-30 22:26:45', '2023-11-30 22:26:45');
INSERT INTO `el_repo` (`id`, `code`, `title`, `remark`, `create_time`, `update_time`) VALUES ('1730231956819447810', '', '流调中心抑郁量表（CES-D)', '流调中心抑郁量表（CES-D)', '2023-11-30 22:26:59', '2023-11-30 22:26:59');
INSERT INTO `el_repo` (`id`, `code`, `title`, `remark`, `create_time`, `update_time`) VALUES ('1730231999756537857', '', '焦虑自评量表(国奥改）', '焦虑自评量表(国奥改）', '2023-11-30 22:27:10', '2023-11-30 22:27:10');
INSERT INTO `el_repo` (`id`, `code`, `title`, `remark`, `create_time`, `update_time`) VALUES ('1730232110939148290', '', '《抑郁自评量表》(国奥改）', '《抑郁自评量表》(国奥改）', '2023-11-30 22:27:36', '2023-11-30 22:27:36');
INSERT INTO `el_repo` (`id`, `code`, `title`, `remark`, `create_time`, `update_time`) VALUES ('1730232408751509506', '', '《家庭教育方式综合测评》', NULL, '2023-11-30 22:28:47', '2023-11-30 22:28:47');
INSERT INTO `el_repo` (`id`, `code`, `title`, `remark`, `create_time`, `update_time`) VALUES ('1730232456130367490', '', '《大学生人格健康调查表》（UPI）', '《大学生人格健康调查表》（UPI）', '2023-11-30 22:28:58', '2023-11-30 22:28:58');
COMMIT;

-- ----------------------------
-- Table structure for el_repo_rule
-- ----------------------------
DROP TABLE IF EXISTS `el_repo_rule`;
CREATE TABLE `el_repo_rule` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `title` varchar(255) DEFAULT NULL COMMENT '规则名称',
  `repo_id` varchar(64) NOT NULL COMMENT '量表ID',
  `content` varchar(255) DEFAULT '' COMMENT '规则描述',
  `qu_ids` text COMMENT '题目ID聚合',
  `rule_type` int(11) DEFAULT '0',
  `number` int(11) DEFAULT '1',
  `nos` text COMMENT '题号聚合',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '考试状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `total_score` varchar(255) NOT NULL DEFAULT '0' COMMENT '总分数',
  `score` varchar(255) NOT NULL DEFAULT '0' COMMENT '得分数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='量表规则';

-- ----------------------------
-- Records of el_repo_rule
-- ----------------------------
BEGIN;
INSERT INTO `el_repo_rule` (`id`, `title`, `repo_id`, `content`, `qu_ids`, `rule_type`, `number`, `nos`, `state`, `create_time`, `update_time`, `total_score`, `score`) VALUES ('1730972507319599106', 'ddd', '1730147090266411009', 'd', '[1730248962503409666, 1730248964055302146, 1730248965493948418, 1730248967058423810, 1730248968669036546, 1730248970443227137, 1730248972280332290, 1730248974176157697, 1730248976160063490, 1730248978240438273, 1730248980375339009, 1730248982657040385, 1730248985014239233, 1730248987404992513, 1730248989850271745, 1730248992371048450, 1730248994963128321, 1730248997676843009, 1730249000440889346, 1730249003280433154, 1730249006199668737, 1730249009202790402, 1730249012298186753, 1730249015456497666, 1730249018677723138, 1730249021999611906, 1730249025409581057, 1730249028869881857, 1730249032451817474, 1730249036092473345, 1730249039817015298, 1730249043625443330, 1730249047530340353, 1730249051607203841, 1730249055684067330, 1730249059798679554, 1730249064013955074, 1730249068266979329, 1730249072641638401, 1730249077007908865, 1730249081500008450, 1730249086071799809, 1730249090668756993, 1730249095429292034, 1730249100240158721, 1730249105134911490, 1730249110142910465, 1730249115180269570, 1730249120288931841, 1730249125494063106, 1730249130791469058, 1730249136181149698, 1730249141663105025, 1730249147187003393, 1730249152811565057, 1730249158520012802, 1730249164291375106, 1730249170134040577, 1730249176081563650, 1730249182071029761, 1730249188169547778, 1730249194368729089, 1730249200593076225, 1730249206892920833, 1730249213264068609, 1730249219702325250, 1730249226211885058, 1730249232830496770, 1730249239528800257, 1730249246348738561, 1730249253214814209, 1730249260177358849, 1730249267190235138, 1730249274312163329, 1730249281480228865, 1730249288732180481, 1730249296072212482, 1730249303479353345, 1730249310987157505, 1730249318553681921, 1730249326275395586, 1730249334043246594, 1730249341890789377, 1730249349771886594, 1730249357753647106, 1730249365798322178, 1730249373910106114, 1730249382114164738, 1730249390385332226, 1730249398614556674]', 1, 1, NULL, 0, '2023-12-02 23:29:40', '2023-12-02 23:29:40', '0', '0');
INSERT INTO `el_repo_rule` (`id`, `title`, `repo_id`, `content`, `qu_ids`, `rule_type`, `number`, `nos`, `state`, `create_time`, `update_time`, `total_score`, `score`) VALUES ('1730974044079030273', '1', '1730147090266411009', '1', '[1730248962503409666, 1730248964055302146, 1730248965493948418, 1730248967058423810, 1730248968669036546, 1730248970443227137, 1730248972280332290, 1730248974176157697, 1730248976160063490, 1730248978240438273, 1730248980375339009, 1730248982657040385, 1730248985014239233, 1730248987404992513, 1730248989850271745, 1730248992371048450, 1730248994963128321, 1730248997676843009, 1730249000440889346, 1730249003280433154, 1730249006199668737, 1730249009202790402, 1730249012298186753, 1730249015456497666, 1730249018677723138, 1730249021999611906, 1730249025409581057, 1730249028869881857, 1730249032451817474, 1730249036092473345, 1730249039817015298, 1730249043625443330, 1730249047530340353, 1730249051607203841, 1730249055684067330, 1730249059798679554, 1730249064013955074, 1730249068266979329, 1730249072641638401, 1730249077007908865, 1730249081500008450, 1730249086071799809, 1730249090668756993, 1730249095429292034, 1730249100240158721, 1730249105134911490, 1730249110142910465, 1730249115180269570, 1730249120288931841, 1730249125494063106, 1730249130791469058, 1730249136181149698, 1730249141663105025, 1730249147187003393, 1730249152811565057, 1730249158520012802, 1730249164291375106, 1730249170134040577, 1730249176081563650, 1730249182071029761, 1730249188169547778, 1730249194368729089, 1730249200593076225, 1730249206892920833, 1730249213264068609, 1730249219702325250, 1730249226211885058, 1730249232830496770, 1730249239528800257, 1730249246348738561, 1730249253214814209, 1730249260177358849, 1730249267190235138, 1730249274312163329, 1730249281480228865, 1730249288732180481, 1730249296072212482, 1730249303479353345, 1730249310987157505, 1730249318553681921, 1730249326275395586, 1730249334043246594, 1730249341890789377, 1730249349771886594, 1730249357753647106, 1730249365798322178, 1730249373910106114, 1730249382114164738, 1730249390385332226, 1730249398614556674]', 1, 4, NULL, 0, '2023-12-02 23:35:47', '2023-12-02 23:35:47', '0', '0');
INSERT INTO `el_repo_rule` (`id`, `title`, `repo_id`, `content`, `qu_ids`, `rule_type`, `number`, `nos`, `state`, `create_time`, `update_time`, `total_score`, `score`) VALUES ('1730974103835279362', 'ddd', '1730147090266411009', '33', '[1730248962503409666, 1730248964055302146]', 1, 33, '[1, 2]', 0, '2023-12-02 23:36:01', '2023-12-02 23:36:01', '0', '0');
INSERT INTO `el_repo_rule` (`id`, `title`, `repo_id`, `content`, `qu_ids`, `rule_type`, `number`, `nos`, `state`, `create_time`, `update_time`, `total_score`, `score`) VALUES ('1730976684837994497', 'dd', '1730231956819447810', 'dd', '[1730248270485192705, 1730248272032890882]', 4, 22, '[3, 4]', 0, '2023-12-02 23:46:16', '2023-12-02 23:46:16', '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for el_repo_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `el_repo_user_rule`;
CREATE TABLE `el_repo_user_rule` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `title` varchar(255) DEFAULT NULL COMMENT '规则名称',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `exam_id` varchar(64) DEFAULT NULL COMMENT '考试ID',
  `repo_id` varchar(64) DEFAULT NULL COMMENT '量表',
  `rule_type` int(11) DEFAULT '0',
  `number` int(11) DEFAULT '1',
  `content` varchar(255) DEFAULT '' COMMENT '规则描述',
  `qu_ids` text COMMENT '题目ID聚合',
  `nos` text COMMENT '题号聚合',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '考试状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `total_score` varchar(255) NOT NULL DEFAULT '0' COMMENT '总分数',
  `score` varchar(255) NOT NULL DEFAULT '0' COMMENT '得分数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='量表用户规则';

-- ----------------------------
-- Records of el_repo_user_rule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_user_book
-- ----------------------------
DROP TABLE IF EXISTS `el_user_book`;
CREATE TABLE `el_user_book` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `exam_id` varchar(32) NOT NULL COMMENT '考试ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `qu_id` varchar(64) NOT NULL COMMENT '题目ID',
  `create_time` datetime DEFAULT NULL COMMENT '加入时间',
  `update_time` datetime DEFAULT NULL COMMENT '最近错误时间',
  `wrong_count` int(11) NOT NULL COMMENT '错误时间',
  `title` varchar(1000) NOT NULL COMMENT '题目标题',
  `sort` int(11) NOT NULL COMMENT '错题序号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `sort` (`sort`),
  KEY `exam_id` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='错题本';

-- ----------------------------
-- Records of el_user_book
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_user_exam
-- ----------------------------
DROP TABLE IF EXISTS `el_user_exam`;
CREATE TABLE `el_user_exam` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `exam_id` varchar(32) NOT NULL COMMENT '考试ID',
  `try_count` int(11) NOT NULL DEFAULT '1' COMMENT '考试次数',
  `max_score` int(11) NOT NULL DEFAULT '0' COMMENT '最高分数',
  `passed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录';

-- ----------------------------
-- Records of el_user_exam
-- ----------------------------
BEGIN;
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `create_time`, `update_time`) VALUES ('1730925196005146625', '10001', '1730584266540101634', 1, 0, 1, '2023-12-02 20:21:40', '2023-12-02 20:21:40');
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `create_time`, `update_time`) VALUES ('1730970547307216897', '10001', '1730561158076731393', 3, 0, 1, '2023-12-02 23:21:53', '2023-12-08 17:35:07');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
