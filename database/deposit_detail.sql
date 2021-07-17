

DROP TABLE IF EXISTS `t_deposit_detail`;
CREATE TABLE `t_deposit_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deposit` decimal(18,6) DEFAULT '0.000000' COMMENT '保证金',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1，上缴，0，赎回',

  `seller_id` int(11) NOT NULL DEFAULT 0 COMMENT '卖家id',
  `seller_nick`  varchar(64) NOT NULL DEFAULT 0 COMMENT '卖家nick',
  `sell_ronin` varchar(120) NOT NULL DEFAULT 0 COMMENT '卖家ronin',

  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '赎回状态（赎回中：1，已赎回：2，已上缴：3）',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`),
  KEY `seller_id` (`seller_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;