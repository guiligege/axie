

DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  `product_name` varchar(100) NOT NULL DEFAULT '' COMMENT '描述',
  `product_type` varchar(100) NOT NULL DEFAULT '' COMMENT '商品类型',

  `seller_id` int(11) NOT NULL DEFAULT 0 COMMENT '卖家id',
  `seller_nick`  varchar(64) NOT NULL DEFAULT 0 COMMENT '卖家nick',
  `seller_ronin` varchar(120) NOT NULL DEFAULT 0 COMMENT '卖家ronin',

  `buyer_id` int(11) NOT NULL DEFAULT 0 COMMENT '买家id',
  `buyer_nick`  varchar(64) NOT NULL DEFAULT 0 COMMENT '买家nick',
  `buyer_ronin` varchar(120) NOT NULL DEFAULT 0 COMMENT '买家ronin',

  `single_price` decimal(18,6) DEFAULT '0.000000' COMMENT '单价',
  `total_price` decimal(18,6) DEFAULT '0.000000' COMMENT '总价',
  `buy_count` int(11) NOT NULL DEFAULT 1 COMMENT '总量',

  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '待支付：1/已支付：2/已发货：3/已确认：4/纠纷中：5/撤销：6/完结：7）',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`),
  KEY `seller_id` (`seller_id`) USING BTREE,
  KEY `buyer_id` (`buyer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;