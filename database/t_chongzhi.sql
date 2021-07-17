

DROP TABLE IF EXISTS `t_chongzhi`;
CREATE TABLE `t_chongzhi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,

  `seller_id` int(11) NOT NULL DEFAULT 0 COMMENT '卖家id',
  `seller_nick`  varchar(64) NOT NULL DEFAULT 0 COMMENT '卖家nick',
  `seller_ronin` varchar(120) NOT NULL DEFAULT 0 COMMENT '卖家ronin',

  `platform_ronin` varchar(120) NOT NULL DEFAULT 0 COMMENT '买家ronin',
  `chongzhi_price` decimal(18,6) DEFAULT '0.000000' COMMENT '金额',

  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1、已充值(待平台确认充值)；2、已确认到账，开通服务；3、未到账；4、待提现，暂停服务；5、已提现成功）',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`),
  KEY `seller_id` (`seller_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;