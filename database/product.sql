

DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(120) NOT NULL DEFAULT '' COMMENT '描述',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '商品类型',
  `sub_type`int(11) NOT NULL DEFAULT 0 COMMENT '商品子类型',

  `outer_id`  varchar(40) DEFAULT ''  COMMENT '外部数据id',
  `outer_url`  varchar(300) DEFAULT ''  COMMENT '外部数据url',
  `outer_img`  varchar(300) DEFAULT ''  COMMENT '外部数据图片',

  `seller_id` int(11) NOT NULL DEFAULT 0 COMMENT '卖家id',
  `seller_nick`  varchar(64) NOT NULL DEFAULT 0 COMMENT '卖家nick',
  `sell_ronin` varchar(120) NOT NULL DEFAULT 0 COMMENT '卖家ronin',

  `single_price` decimal(18,6) DEFAULT '0.000000' COMMENT '单价',
  `show_price` decimal(18,6) DEFAULT '0.000000' COMMENT '其他平台卖价',
  `min_sell_count` int(11) NOT NULL DEFAULT 1 COMMENT '最小售卖数量',
  `total_count` int(11) NOT NULL DEFAULT 1 COMMENT '总量',
  `lock_count` int(11) NOT NULL DEFAULT 1 COMMENT '锁库存量',
  `is_egg` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是蛋么',
  `product_mode` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1,买；2卖',

  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: 正常 -1: 已删除 0以外非正常状态',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`),
  KEY `seller_id` (`seller_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;