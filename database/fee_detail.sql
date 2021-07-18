

DROP TABLE IF EXISTS `t_fee`;
CREATE TABLE `t_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单id',
  `total_price` decimal(18,6) DEFAULT '0.000000' COMMENT '总价',

  `percent` int(11) NOT NULL DEFAULT 0 COMMENT '平台分成比例',
  `user_percent` int(11) NOT NULL DEFAULT 0 COMMENT '用户分成比例',
  `invitation_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '邀请人id',
  `fee` decimal(18,6) DEFAULT '0.000000' COMMENT '单价',
  `user_fee` decimal(18,6) DEFAULT '0.000000' COMMENT '总价',

  `seller_id` int(11) NOT NULL DEFAULT 0 COMMENT '卖家id',
  `seller_nick`  varchar(64) NOT NULL DEFAULT 0 COMMENT '卖家nick',
  `sell_ronin` varchar(120) NOT NULL DEFAULT 0 COMMENT '卖家ronin',

  `buyer_id` int(11) NOT NULL DEFAULT 0 COMMENT '买家id',
  `buyer_nick`  varchar(64) NOT NULL DEFAULT 0 COMMENT '买家nick',
  `buyer_ronin` varchar(120) NOT NULL DEFAULT 0 COMMENT '买家ronin',

  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '分账状态（未分给邀请人：0，已分给邀请人：1）',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`),
  KEY `invitation_user_id` (`invitation_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;