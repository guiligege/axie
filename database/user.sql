

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,

  `nick` varchar(64) NOT NULL DEFAULT '' COMMENT '昵称',
  `ronin` varchar(120) NOT NULL DEFAULT '' COMMENT 'ronin钱包',
  `tag` varchar(100) NOT NULL DEFAULT '' COMMENT 'ronin钱包',
  `sell_count` int(11) DEFAULT 0 COMMENT '售卖成功次数',
  `sell_fail_count` int(11) DEFAULT 0 COMMENT '售卖失败次数',
  `deposit` decimal(18,6) DEFAULT '0.000000' COMMENT '账户保证金',

  `password` varchar(64) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `type`  varchar(20) NOT NULL DEFAULT 'player',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: 正常 -1: 已删除 0以外非正常状态',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `settlement_time` datetime DEFAULT NULL,
  `percentage` int(11) DEFAULT '0' COMMENT '抽成比例（千分之几）',
  `daili_code` varchar(8) DEFAULT '' COMMENT '上级代理',
  `my_daily_code` varchar(8) DEFAULT NULL COMMENT '代理号',

  PRIMARY KEY (`id`),
  UNIQUE KEY `nick` (`nick`),
  UNIQUE KEY `ronin` (`ronin`),
  UNIQUE KEY `my_daili_code` (`my_daily_code`) USING BTREE,
  KEY `daili_code` (`daili_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;