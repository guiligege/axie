

DROP TABLE IF EXISTS `t_action_log`;
CREATE TABLE `t_action_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单id',

  `account_id` int(11) NOT NULL DEFAULT 0 COMMENT 'userid',
  `nick`  varchar(64) NOT NULL DEFAULT 0 COMMENT 'usernick',
  `role` varchar(20) NOT NULL DEFAULT 0 COMMENT '角色',

  `action_type` int(11) NOT NULL DEFAULT 0 COMMENT '动作id',
  `action_name` int(11) NOT NULL DEFAULT 1 COMMENT '动作',

  `content`  varchar(64) NOT NULL DEFAULT 0 COMMENT 'content',

  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;