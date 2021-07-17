

DROP TABLE IF EXISTS `t_withdraw`;
CREATE TABLE `t_withdraw` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,

  `seller_id` int(11) NOT NULL DEFAULT 0 COMMENT '卖家id',
  `seller_nick`  varchar(64) NOT NULL DEFAULT 0 COMMENT '卖家nick',
  `seller_ronin` varchar(120) NOT NULL DEFAULT 0 COMMENT '卖家ronin',

  `chongzhi_price` decimal(18,6) DEFAULT '0.000000' COMMENT '金额',
  `fee_price` decimal(18,6) DEFAULT '0.000000' COMMENT 'fee金额',
  `withdraw_price` decimal(18,6) DEFAULT '0.000000' COMMENT '提现金额',

  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1、待提现；2、提现成功；',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`),
  KEY `seller_id` (`seller_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;