SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ib_users_groups`
-- ----------------------------
CREATE TABLE `ib_users_groups` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL DEFAULT '0',
  `group_id` int(8) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_users_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_users_courses`
-- ----------------------------
CREATE TABLE `ib_users_courses` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL DEFAULT '0',
  `course_id` int(8) NOT NULL DEFAULT '0',
  `started` date DEFAULT NULL,
  `ended` date DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=537 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_users_courses
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_users`
-- ----------------------------
CREATE TABLE `ib_users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(200) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `role` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `comment` text,
  `last_logined` datetime DEFAULT NULL,
  `started` datetime DEFAULT NULL,
  `ended` datetime DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_id` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_users
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_settings`
-- ----------------------------
CREATE TABLE `ib_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(100) NOT NULL,
  `setting_name` varchar(100) NOT NULL,
  `setting_value` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_settings
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_records_questions`
-- ----------------------------
CREATE TABLE `ib_records_questions` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `record_id` int(8) NOT NULL DEFAULT '0',
  `question_id` int(8) NOT NULL DEFAULT '0',
  `answer` varchar(200) DEFAULT NULL,
  `correct` varchar(200) DEFAULT NULL,
  `is_correct` smallint(1) DEFAULT '0',
  `score` int(8) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17627 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_records_questions
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_records`
-- ----------------------------
CREATE TABLE `ib_records` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `group_id` int(8) NOT NULL DEFAULT '0',
  `course_id` int(8) NOT NULL DEFAULT '0',
  `user_id` int(8) NOT NULL DEFAULT '0',
  `content_id` int(8) NOT NULL,
  `full_score` int(3) DEFAULT '0',
  `pass_score` int(3) DEFAULT NULL,
  `score` int(3) DEFAULT NULL,
  `is_passed` smallint(1) DEFAULT '0',
  `is_complete` smallint(1) DEFAULT NULL,
  `progress` smallint(1) DEFAULT '0',
  `understanding` smallint(1) DEFAULT NULL,
  `study_sec` int(3) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=537 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_records
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_infos`
-- ----------------------------
CREATE TABLE `ib_infos` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `body` text,
  `opened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(8) NOT NULL,
  `group_id` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_infos
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_groups`
-- ----------------------------
CREATE TABLE `ib_groups` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `comment` text,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `logo` varchar(200) DEFAULT NULL,
  `copyright` varchar(200) DEFAULT NULL,
  `module` varchar(50) DEFAULT '00000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_courses_contents`
-- ----------------------------
CREATE TABLE `ib_courses_contents` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `course_id` int(8) NOT NULL,
  `content_id` int(8) NOT NULL,
  `label` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_courses_contents
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_courses`
-- ----------------------------
CREATE TABLE `ib_courses` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `group_id` int(8) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `opened` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `sort_no` int(8) NOT NULL DEFAULT '0',
  `comment` text,
  `user_id` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_courses
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_contents_questions`
-- ----------------------------
CREATE TABLE `ib_contents_questions` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `group_id` int(8) NOT NULL DEFAULT '0',
  `content_id` int(8) NOT NULL DEFAULT '0',
  `question_type` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `options` varchar(200) DEFAULT NULL,
  `correct` varchar(200) NOT NULL DEFAULT '',
  `score` int(8) NOT NULL DEFAULT '0',
  `explain` text,
  `comment` text,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `sort_no` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=696 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_contents_questions
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_contents`
-- ----------------------------
CREATE TABLE `ib_contents` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `group_id` int(8) NOT NULL DEFAULT '0',
  `course_id` int(8) NOT NULL DEFAULT '0',
  `user_id` int(8) NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(200) DEFAULT NULL,
  `kind` varchar(20) NOT NULL DEFAULT '',
  `body` text,
  `timelimit` int(8) DEFAULT NULL,
  `pass_rate` int(8) DEFAULT NULL,
  `opened` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `sort_no` int(8) NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_contents
-- ----------------------------

-- ----------------------------
-- Table structure for `ib_cake_sessions`
-- ----------------------------
CREATE TABLE `ib_cake_sessions` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `expires` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ib_cake_sessions
-- ----------------------------


INSERT INTO `ib_settings` VALUES ('1', 'title', '�V�X�e����', 'iroha Board');
INSERT INTO `ib_settings` VALUES ('2', 'copyright', '�R�s�[���C�g', 'Copyright (C) 2016 iroha Soft Co.,Ltd. All rights reserved.');
INSERT INTO `ib_settings` VALUES ('3', 'color', '�e�[�}�J���[', '#337ab7');
INSERT INTO `ib_settings` VALUES ('4', 'information', '���m�点', '�S�̂̂��m�点��\�����܂��B\r\n���̂��m�点�͊Ǘ��@�\�́u�V�X�e���ݒ�v�ɂĕύX�\�ł��B\r\n�w�K�����͓��t���ς��Ǝ����I�Ƀ��Z�b�g����܂��B\r\n\r\nURL�͈ȉ��̂悤�Ɏ����I�Ƀ����N�ƂȂ�܂��B\r\nhttp://irohasoft.jp/\r\n');
