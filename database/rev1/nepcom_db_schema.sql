-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-09-2015 a las 18:27:11
-- Versión del servidor: 5.5.44-0+deb8u1
-- Versión de PHP: 5.6.12-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `nepcom_xmpp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_version`
--

CREATE TABLE IF NOT EXISTS `app_version` (
  `last_version` varchar(200) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `app_version`
--

INSERT INTO `app_version` (`last_version`, `create_date`) VALUES
('0.2', '2015-08-22 18:57:12'),
('0.3', '2015-08-23 09:44:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archive`
--

CREATE TABLE IF NOT EXISTS `archive` (
  `username` varchar(250) NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `peer` varchar(250) NOT NULL,
  `bare_peer` varchar(250) NOT NULL,
  `xml` text NOT NULL,
  `txt` text,
`id` bigint(20) unsigned NOT NULL,
  `kind` varchar(10) DEFAULT NULL,
  `nick` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archive_prefs`
--

CREATE TABLE IF NOT EXISTS `archive_prefs` (
  `username` varchar(250) NOT NULL,
  `def` text NOT NULL,
  `always` text NOT NULL,
  `never` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caps_features`
--

CREATE TABLE IF NOT EXISTS `caps_features` (
  `node` varchar(250) NOT NULL,
  `subnode` varchar(250) NOT NULL,
  `feature` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `irc_custom`
--

CREATE TABLE IF NOT EXISTS `irc_custom` (
  `jid` text NOT NULL,
  `host` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `last`
--

CREATE TABLE IF NOT EXISTS `last` (
  `username` varchar(250) NOT NULL,
  `seconds` text NOT NULL,
  `state` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `last`
--

INSERT INTO `last` (`username`, `seconds`, `state`) VALUES
('test3', '1439829231', ''),
('test6', '1441480089', ''),
('test7', '1441561675', ''),
('test9', '1441480091', ''),
('arroyes89_gmail.com', '1441569467', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motd`
--

CREATE TABLE IF NOT EXISTS `motd` (
  `username` varchar(250) NOT NULL,
  `xml` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muc_registered`
--

CREATE TABLE IF NOT EXISTS `muc_registered` (
  `jid` text NOT NULL,
  `host` text NOT NULL,
  `nick` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muc_room`
--

CREATE TABLE IF NOT EXISTS `muc_room` (
  `name` text NOT NULL,
  `host` text NOT NULL,
  `opts` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `muc_room`
--

INSERT INTO `muc_room` (`name`, `host`, `opts`, `created_at`) VALUES
('test', 'conference.ejabberd.nepcomdev.es', '[{title, <<84, 101, 115, 116>>}, {description, <<84, 101, 115, 116>>}, {allow_change_subj, true}, {allow_query_users, true}, {allow_private_messages, true}, {allow_private_messages_from_visitors, anyone}, {allow_visitor_status, true}, {allow_visitor_nickchange, true}, {public, true}, {public_list, true}, {persistent, true}, {moderated, true}, {members_by_default, true}, {members_only, false}, {allow_user_invites, false}, {password_protected, false}, {captcha_protected, false}, {password, <<>>}, {anonymous, true}, {logging, false}, {max_users, 200}, {allow_voice_requests, true}, {mam, false}, {voice_request_min_interval, 1800}, {vcard, <<>>}, {captcha_whitelist, []}, {affiliations, [{{<<116, 101, 115, 116, 55>>, <<101, 106, 97, 98, 98, 101, 114, 100, 46, 110, 101, 112, 99, 111, 109, 100, 101, 118, 46, 101, 115>>, <<>>}, {owner, <<>>}}]}, {subject, <<>>}, {subject_author, <<>>}]', '2015-08-30 17:39:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privacy_default_list`
--

CREATE TABLE IF NOT EXISTS `privacy_default_list` (
  `username` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privacy_list`
--

CREATE TABLE IF NOT EXISTS `privacy_list` (
  `username` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
`id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privacy_list_data`
--

CREATE TABLE IF NOT EXISTS `privacy_list_data` (
  `id` bigint(20) DEFAULT NULL,
  `t` char(1) NOT NULL,
  `value` text NOT NULL,
  `action` char(1) NOT NULL,
  `ord` decimal(10,0) NOT NULL,
  `match_all` tinyint(1) NOT NULL,
  `match_iq` tinyint(1) NOT NULL,
  `match_message` tinyint(1) NOT NULL,
  `match_presence_in` tinyint(1) NOT NULL,
  `match_presence_out` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `private_storage`
--

CREATE TABLE IF NOT EXISTS `private_storage` (
  `username` varchar(250) NOT NULL,
  `namespace` varchar(250) NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pubsub_item`
--

CREATE TABLE IF NOT EXISTS `pubsub_item` (
  `nodeid` bigint(20) DEFAULT NULL,
  `itemid` text,
  `publisher` text,
  `creation` text,
  `modification` text,
  `payload` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pubsub_node`
--

CREATE TABLE IF NOT EXISTS `pubsub_node` (
  `host` text,
  `node` text,
  `parent` text,
  `type` text,
`nodeid` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pubsub_node_option`
--

CREATE TABLE IF NOT EXISTS `pubsub_node_option` (
  `nodeid` bigint(20) DEFAULT NULL,
  `name` text,
  `val` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pubsub_node_owner`
--

CREATE TABLE IF NOT EXISTS `pubsub_node_owner` (
  `nodeid` bigint(20) DEFAULT NULL,
  `owner` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pubsub_state`
--

CREATE TABLE IF NOT EXISTS `pubsub_state` (
  `nodeid` bigint(20) DEFAULT NULL,
  `jid` text,
  `affiliation` char(1) DEFAULT NULL,
  `subscriptions` text,
`stateid` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pubsub_subscription_opt`
--

CREATE TABLE IF NOT EXISTS `pubsub_subscription_opt` (
  `subid` text,
  `opt_name` varchar(32) DEFAULT NULL,
  `opt_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rostergroups`
--

CREATE TABLE IF NOT EXISTS `rostergroups` (
  `username` varchar(250) NOT NULL,
  `jid` varchar(250) NOT NULL,
  `grp` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rostergroups`
--

INSERT INTO `rostergroups` (`username`, `jid`, `grp`) VALUES
('test7', 'test6@ejabberd.nepcomdev.es', 'Buddies'),
('test6', 'test7@ejabberd.nepcomdev.es', 'Buddies');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rosterusers`
--

CREATE TABLE IF NOT EXISTS `rosterusers` (
  `username` varchar(250) NOT NULL,
  `jid` varchar(250) NOT NULL,
  `nick` text NOT NULL,
  `subscription` char(1) NOT NULL,
  `ask` char(1) NOT NULL,
  `askmessage` text NOT NULL,
  `server` char(1) NOT NULL,
  `subscribe` text NOT NULL,
  `type` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rosterusers`
--

INSERT INTO `rosterusers` (`username`, `jid`, `nick`, `subscription`, `ask`, `askmessage`, `server`, `subscribe`, `type`, `created_at`) VALUES
('test7', 'test6@ejabberd.nepcomdev.es', '', 'B', 'N', '', 'N', '', 'item', '2015-09-05 21:01:16'),
('test6', 'test7@ejabberd.nepcomdev.es', '', 'B', 'N', '', 'N', '', 'item', '2015-09-05 21:01:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roster_version`
--

CREATE TABLE IF NOT EXISTS `roster_version` (
  `username` varchar(250) NOT NULL,
  `version` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sm`
--

CREATE TABLE IF NOT EXISTS `sm` (
  `usec` bigint(20) NOT NULL,
  `pid` text NOT NULL,
  `node` text NOT NULL,
  `username` varchar(250) NOT NULL,
  `resource` varchar(250) NOT NULL,
  `priority` text NOT NULL,
  `info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `spool`
--

CREATE TABLE IF NOT EXISTS `spool` (
  `username` varchar(250) NOT NULL,
  `xml` text NOT NULL,
`seq` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sr_group`
--

CREATE TABLE IF NOT EXISTS `sr_group` (
  `name` varchar(250) NOT NULL,
  `opts` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sr_user`
--

CREATE TABLE IF NOT EXISTS `sr_user` (
  `jid` varchar(250) NOT NULL,
  `grp` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `license` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`username`, `password`, `active`, `license`, `created_at`) VALUES
('admin', 'gHfpUev7XiIlSd8xqSCxv4aEsRM=', 0, '', '2015-08-30 17:23:55'),
('test6', 'MMKPpGNVfECjyKKwc3ABEL+i9hc=', 0, '', '2015-08-26 17:35:06'),
('test7', '$2y$12$aJhRvLQXl6xN1cp3QD4JA.BeBzX40fhRCN3WrjLi13P0Qs8Xijsc2', 1, '', '2015-08-26 17:43:58'),
('test8', 'JGlPBq1BsWtaG5UZzCJK9EIc8cw=', 0, '', '2015-08-26 17:44:14'),
('test9', 'WEQYtJy0SICEa8tXShtGMViCgGw=', 0, '', '2015-08-26 17:44:18'),
('arroyes89_gmail.com', '$2y$12$hR6rLjAszs6QuD8Ho6Xq6udAIQNssH4OtkLVy2SZ/ZQ0S3In0omVG', 0, '', '2015-09-08 20:27:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usersbkp`
--

CREATE TABLE IF NOT EXISTS `usersbkp` (
  `username` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `serverkey` text NOT NULL,
  `salt` text NOT NULL,
  `iterationcount` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usersbkp`
--

INSERT INTO `usersbkp` (`username`, `password`, `created_at`, `serverkey`, `salt`, `iterationcount`) VALUES
('admin', 'gHfpUev7XiIlSd8xqSCxv4aEsRM=', '2015-08-30 17:23:55', 'MQvSueAMBUhLPsl824UvizJFMNQ=', 'oymm+pju4aMUTaRtQI+9Bw==', 4096),
('test6', 'MMKPpGNVfECjyKKwc3ABEL+i9hc=', '2015-08-26 17:35:06', 'xs72TghftcNiYeEQzlYe1HJ7cjQ=', '6cBMSS9reKRMMIqCyZWiwQ==', 4096),
('test7', 'rhoV1L0J9d14RE769jw9CP7Cyik=', '2015-08-26 17:43:58', '1OUfoh7ASAEl4wj4mkhREKlOrVg=', '4FEslOKeXAiC1ArrHWfA8Q==', 4096),
('test8', 'JGlPBq1BsWtaG5UZzCJK9EIc8cw=', '2015-08-26 17:44:14', '/1gJyb757DzmxLZxJ5nbHSq5/3g=', '0r6q4EKvYx0NCd0+hMbLSA==', 4096),
('test9', 'WEQYtJy0SICEa8tXShtGMViCgGw=', '2015-08-26 17:44:18', 'hOjH3EPBRUBThH7SF+rkPU3lf9o=', '4l40FPigW9yi8TwrdJM7hQ==', 4096);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_activation`
--

CREATE TABLE IF NOT EXISTS `user_activation` (
  `username` varchar(250) NOT NULL,
  `activation_code` text NOT NULL,
  `expiration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_activation`
--

INSERT INTO `user_activation` (`username`, `activation_code`, `expiration`) VALUES
('arroyes89_gmail.com', '26706', '2015-09-09 18:27:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_state`
--

CREATE TABLE IF NOT EXISTS `user_state` (
  `jid` varchar(50) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_state`
--

INSERT INTO `user_state` (`jid`, `state_id`) VALUES
('test4', 2),
('test6', 1),
('test7', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vcard`
--

CREATE TABLE IF NOT EXISTS `vcard` (
  `username` varchar(250) NOT NULL,
  `vcard` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vcard`
--

INSERT INTO `vcard` (`username`, `vcard`, `created_at`) VALUES
('test3', '<vCard xmlns=''vcard-temp'' prodid=''-//HandGen//NONSGML vGen v1.0//EN'' version=''2.0''><FN>Juan</FN><N><FAMILY>Arroyes Romero</FAMILY><GIVEN>Juan</GIVEN></N><NICKNAME>Juan</NICKNAME><ADR><LOCALITY>Barcelona</LOCALITY><REGION>Cataluña</REGION><CTRY>España</CTRY></ADR><TEL><NUMBER>646685387</NUMBER></TEL><EMAIL><USERID>ARROYES89@GMAIL.COM</USERID></EMAIL><ORG><ORGNAME>Nepcom</ORGNAME><ORGUNIT>Dirección</ORGUNIT></ORG><TITLE>Director Técnico </TITLE></vCard>', '2015-08-23 10:31:49'),
('test6', '<vCard xmlns=''vcard-temp'' prodid=''-//HandGen//NONSGML vGen v1.0//EN'' version=''2.0''><FN>Abc</FN><N><FAMILY>aaa</FAMILY><GIVEN>aaaa</GIVEN></N></vCard>', '2015-08-30 17:29:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vcard_search`
--

CREATE TABLE IF NOT EXISTS `vcard_search` (
  `username` varchar(250) NOT NULL,
  `lusername` varchar(250) NOT NULL,
  `fn` text NOT NULL,
  `lfn` varchar(250) NOT NULL,
  `family` text NOT NULL,
  `lfamily` varchar(250) NOT NULL,
  `given` text NOT NULL,
  `lgiven` varchar(250) NOT NULL,
  `middle` text NOT NULL,
  `lmiddle` varchar(250) NOT NULL,
  `nickname` text NOT NULL,
  `lnickname` varchar(250) NOT NULL,
  `bday` text NOT NULL,
  `lbday` varchar(250) NOT NULL,
  `ctry` text NOT NULL,
  `lctry` varchar(250) NOT NULL,
  `locality` text NOT NULL,
  `llocality` varchar(250) NOT NULL,
  `email` text NOT NULL,
  `lemail` varchar(250) NOT NULL,
  `orgname` text NOT NULL,
  `lorgname` varchar(250) NOT NULL,
  `orgunit` text NOT NULL,
  `lorgunit` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vcard_search`
--

INSERT INTO `vcard_search` (`username`, `lusername`, `fn`, `lfn`, `family`, `lfamily`, `given`, `lgiven`, `middle`, `lmiddle`, `nickname`, `lnickname`, `bday`, `lbday`, `ctry`, `lctry`, `locality`, `llocality`, `email`, `lemail`, `orgname`, `lorgname`, `orgunit`, `lorgunit`) VALUES
('test3', 'test3', 'Juan', 'juan', 'Arroyes Romero', 'arroyes romero', 'Juan', 'juan', '', '', 'Juan', 'juan', '', '', 'España', 'españa', 'Barcelona', 'barcelona', 'ARROYES89@GMAIL.COM', 'arroyes89@gmail.com', 'Nepcom', 'nepcom', 'Dirección', 'dirección'),
('test2', 'test2', 'Aven', 'aven', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Nepcom', 'nepcom', '', ''),
('test6', 'test6', 'Abc', 'abc', 'aaa', 'aaa', 'aaaa', 'aaaa', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('arroyes89_gmail.com', 'arroyes89_gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'arroyes89@gmail.com', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vcard_xupdate`
--

CREATE TABLE IF NOT EXISTS `vcard_xupdate` (
  `username` varchar(250) NOT NULL,
  `hash` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archive`
--
ALTER TABLE `archive`
 ADD UNIQUE KEY `id` (`id`), ADD KEY `i_username` (`username`) USING BTREE, ADD KEY `i_timestamp` (`timestamp`) USING BTREE, ADD KEY `i_peer` (`peer`) USING BTREE, ADD KEY `i_bare_peer` (`bare_peer`) USING BTREE, ADD FULLTEXT KEY `i_text` (`txt`);

--
-- Indices de la tabla `archive_prefs`
--
ALTER TABLE `archive_prefs`
 ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `caps_features`
--
ALTER TABLE `caps_features`
 ADD KEY `i_caps_features_node_subnode` (`node`(75),`subnode`(75));

--
-- Indices de la tabla `irc_custom`
--
ALTER TABLE `irc_custom`
 ADD UNIQUE KEY `i_irc_custom_jid_host` (`jid`(75),`host`(75)) USING BTREE;

--
-- Indices de la tabla `last`
--
ALTER TABLE `last`
 ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `motd`
--
ALTER TABLE `motd`
 ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `muc_registered`
--
ALTER TABLE `muc_registered`
 ADD UNIQUE KEY `i_muc_registered_jid_host` (`jid`(75),`host`(75)) USING BTREE, ADD KEY `i_muc_registered_nick` (`nick`(75)) USING BTREE;

--
-- Indices de la tabla `muc_room`
--
ALTER TABLE `muc_room`
 ADD UNIQUE KEY `i_muc_room_name_host` (`name`(75),`host`(75)) USING BTREE;

--
-- Indices de la tabla `privacy_default_list`
--
ALTER TABLE `privacy_default_list`
 ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `privacy_list`
--
ALTER TABLE `privacy_list`
 ADD UNIQUE KEY `id` (`id`), ADD UNIQUE KEY `i_privacy_list_username_name` (`username`(75),`name`(75)) USING BTREE, ADD KEY `i_privacy_list_username` (`username`) USING BTREE;

--
-- Indices de la tabla `privacy_list_data`
--
ALTER TABLE `privacy_list_data`
 ADD KEY `i_privacy_list_data_id` (`id`);

--
-- Indices de la tabla `private_storage`
--
ALTER TABLE `private_storage`
 ADD UNIQUE KEY `i_private_storage_username_namespace` (`username`(75),`namespace`(75)) USING BTREE, ADD KEY `i_private_storage_username` (`username`) USING BTREE;

--
-- Indices de la tabla `pubsub_item`
--
ALTER TABLE `pubsub_item`
 ADD UNIQUE KEY `i_pubsub_item_tuple` (`nodeid`,`itemid`(36)), ADD KEY `i_pubsub_item_itemid` (`itemid`(36));

--
-- Indices de la tabla `pubsub_node`
--
ALTER TABLE `pubsub_node`
 ADD PRIMARY KEY (`nodeid`), ADD UNIQUE KEY `i_pubsub_node_tuple` (`host`(20),`node`(120)), ADD KEY `i_pubsub_node_parent` (`parent`(120));

--
-- Indices de la tabla `pubsub_node_option`
--
ALTER TABLE `pubsub_node_option`
 ADD KEY `i_pubsub_node_option_nodeid` (`nodeid`);

--
-- Indices de la tabla `pubsub_node_owner`
--
ALTER TABLE `pubsub_node_owner`
 ADD KEY `i_pubsub_node_owner_nodeid` (`nodeid`);

--
-- Indices de la tabla `pubsub_state`
--
ALTER TABLE `pubsub_state`
 ADD PRIMARY KEY (`stateid`), ADD UNIQUE KEY `i_pubsub_state_tuple` (`nodeid`,`jid`(60)), ADD KEY `i_pubsub_state_jid` (`jid`(60));

--
-- Indices de la tabla `pubsub_subscription_opt`
--
ALTER TABLE `pubsub_subscription_opt`
 ADD UNIQUE KEY `i_pubsub_subscription_opt` (`subid`(32),`opt_name`);

--
-- Indices de la tabla `rostergroups`
--
ALTER TABLE `rostergroups`
 ADD KEY `pk_rosterg_user_jid` (`username`(75),`jid`(75));

--
-- Indices de la tabla `rosterusers`
--
ALTER TABLE `rosterusers`
 ADD UNIQUE KEY `i_rosteru_user_jid` (`username`(75),`jid`(75)), ADD KEY `i_rosteru_username` (`username`), ADD KEY `i_rosteru_jid` (`jid`);

--
-- Indices de la tabla `roster_version`
--
ALTER TABLE `roster_version`
 ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `sm`
--
ALTER TABLE `sm`
 ADD UNIQUE KEY `i_sid` (`usec`,`pid`(75)), ADD KEY `i_node` (`node`(75)), ADD KEY `i_username` (`username`);

--
-- Indices de la tabla `spool`
--
ALTER TABLE `spool`
 ADD UNIQUE KEY `seq` (`seq`), ADD KEY `i_despool` (`username`) USING BTREE, ADD KEY `i_spool_created_at` (`created_at`) USING BTREE;

--
-- Indices de la tabla `sr_user`
--
ALTER TABLE `sr_user`
 ADD UNIQUE KEY `i_sr_user_jid_group` (`jid`(75),`grp`(75)), ADD KEY `i_sr_user_jid` (`jid`), ADD KEY `i_sr_user_grp` (`grp`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `user_activation`
--
ALTER TABLE `user_activation`
 ADD PRIMARY KEY (`username`), ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `user_state`
--
ALTER TABLE `user_state`
 ADD PRIMARY KEY (`jid`);

--
-- Indices de la tabla `vcard`
--
ALTER TABLE `vcard`
 ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `vcard_search`
--
ALTER TABLE `vcard_search`
 ADD PRIMARY KEY (`lusername`), ADD KEY `i_vcard_search_lfn` (`lfn`), ADD KEY `i_vcard_search_lfamily` (`lfamily`), ADD KEY `i_vcard_search_lgiven` (`lgiven`), ADD KEY `i_vcard_search_lmiddle` (`lmiddle`), ADD KEY `i_vcard_search_lnickname` (`lnickname`), ADD KEY `i_vcard_search_lbday` (`lbday`), ADD KEY `i_vcard_search_lctry` (`lctry`), ADD KEY `i_vcard_search_llocality` (`llocality`), ADD KEY `i_vcard_search_lemail` (`lemail`), ADD KEY `i_vcard_search_lorgname` (`lorgname`), ADD KEY `i_vcard_search_lorgunit` (`lorgunit`);

--
-- Indices de la tabla `vcard_xupdate`
--
ALTER TABLE `vcard_xupdate`
 ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archive`
--
ALTER TABLE `archive`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `privacy_list`
--
ALTER TABLE `privacy_list`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pubsub_node`
--
ALTER TABLE `pubsub_node`
MODIFY `nodeid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pubsub_state`
--
ALTER TABLE `pubsub_state`
MODIFY `stateid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `spool`
--
ALTER TABLE `spool`
MODIFY `seq` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
