drop database if exists zm-media;
CREATE DATABASE zm-media DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
use zm-media;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_corp`公司信息表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_corp`;
CREATE TABLE `tbl_corp` (
  `corpId` varchar(32) NOT NULL COMMENT '主键',
  `corpName` varchar(64) NOT NULL COMMENT '公司名称',
  `corpCode` varchar(8) NOT NULL COMMENT '公司邀请码',
  `corpLogo` varchar(128) DEFAULT NULL COMMENT '公司logo',
  `location` varchar(128) DEFAULT NULL COMMENT '公司地址',
  `createBy` varchar(32) NOT NULL COMMENT '创建者',
  `updateBy` varchar(32) DEFAULT NULL COMMENT '更改者',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`corpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `tbl_group`公司部门信息表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group`;
CREATE TABLE `tbl_group` (
  `groupId` varchar(32) NOT NULL COMMENT '主键',
  `corpId` varchar(32) DEFAULT NULL COMMENT '公司id',
  `groupName` varchar(64) NOT NULL COMMENT '部门名称',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父部门id',
  `createBy` varchar(32) NOT NULL COMMENT '创建者',
  `updateBy` varchar(32) DEFAULT NULL COMMENT ' 更改者id',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `tbl_user`用户信息表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `userId` varchar(32) NOT NULL COMMENT '主键',
  `mobile` varchar(16) NOT NULL COMMENT '手机号',
  `userName` varchar(64) NOT NULL COMMENT '名称',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0男1女',
  `avatar` varchar(128) DEFAULT NULL COMMENT '头像url',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '激活状态: 1=已激活，2=已禁用',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `tbl_user_corp`用户-公司关联表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_corp`;
CREATE TABLE `tbl_user_corp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` varchar(32) NOT NULL COMMENT '用户id',
  `corpId` varchar(32) NOT NULL COMMENT '公司id',
  `createBy` varchar(32) NOT NULL COMMENT '创建者',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `tbl_user_group`用户-部门关联表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_group`;
CREATE TABLE `tbl_user_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` varchar(32) NOT NULL COMMENT '用户id',
  `groupId` varchar(32) NOT NULL COMMENT '部门id',
  `createBy` varchar(32) NOT NULL COMMENT '创建者',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `tbl_program`节目表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_program`;
CREATE TABLE `tbl_program` (
  `programId` varchar(32) NOT NULL COMMENT '主键',
  `corpId` varchar(32) NOT NULL COMMENT '公司id',
  `programName` varchar(64) NOT NULL COMMENT '主题名称',
  `type` int(1) DEFAULT NULL COMMENT '主题类型',
  `size` double NOT NULL COMMENT '主题包大小',
  `duration` int(11) NOT NULL COMMENT '主题时长，秒为单位',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '审核状态1审核0未审核',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(32) NOT NULL COMMENT '创建者',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateBy` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`programId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `tbl_element`节目元素表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_element`;
CREATE TABLE `tbl_element` (
  `elementId` varchar(32) NOT NULL COMMENT '主键',
  `programId` varchar(32) NOT NULL COMMENT '主题id',
  `elementName` varchar(64) NOT NULL COMMENT '元素名称',
  `type` int(11) NOT NULL COMMENT '元素类型',
  `background` varchar(8) NOT NULL DEFAULT '' COMMENT '背景RGB',
  `left` int(3) NOT NULL COMMENT '距离左边百分比',
  `top` int(3) NOT NULL COMMENT '具体顶部百分比',
  `width` int(3) NOT NULL COMMENT '宽度百分比',
  `height` int(3) NOT NULL COMMENT '高度百分比',
  `index` int(2) NOT NULL DEFAULT '0' COMMENT '覆盖位置,越小越底层',
  `duration` int(11) DEFAULT NULL COMMENT '时长，秒为单位',
  `effect` int(2) DEFAULT '0' COMMENT '播放效果',
  `mode` int(1) DEFAULT '0' COMMENT '播放模式',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`elementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `tbl_material`素材表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_material`;
CREATE TABLE `tbl_material` (
  `materialId` varchar(32) NOT NULL COMMENT ' 主键',
  `corpId` varchar(32) NOT NULL COMMENT '公司id',
  `md5` varchar(32) NOT NULL COMMENT '文件MD5',
  `materialName` varchar(64) NOT NULL COMMENT '素材名称',
  `type` int(2) NOT NULL COMMENT '素材类型',
  `size` int(11) NOT NULL COMMENT '素材大小k',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '素材审核状态0未审核，1审核',
  `duration` bigint(20) DEFAULT NULL COMMENT '素材时间（video）',
  `standard` varchar(64) DEFAULT NULL COMMENT '素材参数',
  `relativePath` varchar(128) NOT NULL COMMENT '素材相对路径',
  `thumbnailPath` varchar(128) DEFAULT NULL COMMENT '缩略图相对路径',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(32) NOT NULL COMMENT '创建者',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `auditBy` varchar(32) DEFAULT NULL COMMENT '审批人',
  `auditTime` datetime DEFAULT NULL COMMENT '审批时间',
  PRIMARY KEY (`materialId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `tbl_element_material`元素素材关联表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_element_material`;
CREATE TABLE `tbl_element_material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `elementId` varchar(32) NOT NULL COMMENT '元素id',
  `materialId` varchar(32) NOT NULL COMMENT '素材id',
  `createBy` varchar(32) NOT NULL COMMENT '创建者',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `tbl_device`设备信息表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_device`;
CREATE TABLE `tbl_device` (
  `deviceId` varchar(32) NOT NULL COMMENT '主键',
  `deviceCode` varchar(32) NOT NULL COMMENT '设备唯一编码',
  `netType` int(1) NOT NULL COMMENT '设备网络类型',
  `netIP` varchar(16) NOT NULL COMMENT '设备网络ip',
  `netMac` varchar(32) NOT NULL COMMENT '设备mac',
  `resolution` varchar(16) NOT NULL COMMENT '设备分辨率',
  `version` varchar(32) DEFAULT NULL COMMENT '设备系统版本',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '设备连入时间',
  `updateTime` datetime DEFAULT NULL COMMENT '设备更新时间',
  PRIMARY KEY (`deviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `tbl_dgroup`设备分组表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dgroup`;
CREATE TABLE `tbl_dgroup` (
  `dgroupId` varchar(32) NOT NULL COMMENT '主键',
  `corpId` varchar(32) DEFAULT NULL COMMENT '公司id',
  `groupName` varchar(32) NOT NULL COMMENT '分组名称',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父分组id',
  `createBy` varchar(20) NOT NULL COMMENT '创建者',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateBy` varchar(32) DEFAULT NULL COMMENT '更新者',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dgroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `tbl_device_corp`设备-公司关联表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_device_corp`;
CREATE TABLE `tbl_device_corp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deviceId` varchar(32) NOT NULL COMMENT '设备id',
  `corpId` varchar(32) NOT NULL COMMENT '公司id',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `tbl_device_group`设备-分组关联表
-- ----------------------------
DROP TABLE IF EXISTS `tbl_device_group`;
CREATE TABLE `tbl_device_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deviceId` varchar(32) NOT NULL COMMENT '设备id',
  `dgroupId` varchar(32) NOT NULL COMMENT '设备分组id',
  `createBy` varchar(32) NOT NULL COMMENT '创建者',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;