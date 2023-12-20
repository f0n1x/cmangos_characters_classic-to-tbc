-- Add the `arena_team` table
DROP TABLE IF EXISTS `arena_team`;
CREATE TABLE `arena_team` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` char(255) NOT NULL,
  `captainguid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BackgroundColor` int(10) unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` int(10) unsigned NOT NULL DEFAULT '0',
  `EmblemColor` int(10) unsigned NOT NULL DEFAULT '0',
  `BorderStyle` int(10) unsigned NOT NULL DEFAULT '0',
  `BorderColor` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Add the `arena_team_member` table
DROP TABLE IF EXISTS `arena_team_member`;
CREATE TABLE `arena_team_member` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `played_week` int(10) unsigned NOT NULL DEFAULT '0',
  `wons_week` int(10) unsigned NOT NULL DEFAULT '0',
  `played_season` int(10) unsigned NOT NULL DEFAULT '0',
  `wons_season` int(10) unsigned NOT NULL DEFAULT '0',
  `personal_rating` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Add the `arena_team_stats` table
DROP TABLE IF EXISTS `arena_team_stats`;
CREATE TABLE `arena_team_stats` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` int(10) unsigned NOT NULL DEFAULT '0',
  `games_week` int(10) unsigned NOT NULL DEFAULT '0',
  `wins_week` int(10) unsigned NOT NULL DEFAULT '0',
  `games_season` int(10) unsigned NOT NULL DEFAULT '0',
  `wins_season` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Change the `character_db_version` table to match TBC
DROP TABLE IF EXISTS `character_db_version`;
CREATE TABLE `character_db_version` (
  `required_s2452_01_characters_fishingSteps` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Last applied sql update to DB';
LOCK TABLES `character_db_version` WRITE;
INSERT INTO `character_db_version` VALUES (NULL);
UNLOCK TABLES;

-- Add the `character_declinedname` table
DROP TABLE IF EXISTS `character_declinedname`;
CREATE TABLE `character_declinedname` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) NOT NULL DEFAULT '',
  `dative` varchar(15) NOT NULL DEFAULT '',
  `accusative` varchar(15) NOT NULL DEFAULT '',
  `instrumental` varchar(15) NOT NULL DEFAULT '',
  `prepositional` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Remove the classic-only `character_forgotten_skills` table
DROP TABLE IF EXISTS `character_forgotten_skills`;

-- Remove the classic-only `character_honor_cp` table
DROP TABLE IF EXISTS `character_honor_cp`;

-- Add the `character_pet_declinedname` table
DROP TABLE IF EXISTS `character_pet_declinedname`;
CREATE TABLE `character_pet_declinedname` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `genitive` varchar(12) NOT NULL DEFAULT '',
  `dative` varchar(12) NOT NULL DEFAULT '',
  `accusative` varchar(12) NOT NULL DEFAULT '',
  `instrumental` varchar(12) NOT NULL DEFAULT '',
  `prepositional` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner_key` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Add the `character_queststatus_daily` table
DROP TABLE IF EXISTS `character_queststatus_daily`;
CREATE TABLE `character_queststatus_daily` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Add the `character_queststatus_monthly` table
DROP TABLE IF EXISTS `character_queststatus_monthly`;
CREATE TABLE `character_queststatus_monthly` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Modify `character_social` to add an additional column
ALTER TABLE `character_social` ADD COLUMN `note` varchar(48) NOT NULL DEFAULT '' AFTER `flags`;

-- Modify `character_stats` to add additional columns
ALTER TABLE `character_stats` ADD COLUMN `spellCritPct` float unsigned NOT NULL DEFAULT '0' AFTER `rangedCritPct`;
ALTER TABLE `character_stats` ADD COLUMN `spellPower` int(10) unsigned NOT NULL DEFAULT '0' AFTER `rangedAttackPower`;

-- Modify `characters` to add additional columns and remove classic-only columns
ALTER TABLE `characters` ADD COLUMN `dungeon_difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0' AFTER `map`;
ALTER TABLE `characters` ADD COLUMN `arenaPoints` int(10) unsigned NOT NULL DEFAULT '0' AFTER `taxi_path`;
ALTER TABLE `characters` ADD COLUMN `totalHonorPoints` int(10) unsigned NOT NULL DEFAULT '0' AFTER `arenaPoints`;
ALTER TABLE `characters` ADD COLUMN `todayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0' AFTER `totalHonorPoints`;
ALTER TABLE `characters` ADD COLUMN `yesterdayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0' AFTER `todayHonorPoints`;
ALTER TABLE `characters` ADD COLUMN `totalKills` int(10) unsigned NOT NULL DEFAULT '0' AFTER `yesterdayHonorPoints`;
ALTER TABLE `characters` ADD COLUMN `todayKills` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `totalKills`;
ALTER TABLE `characters` ADD COLUMN `yesterdayKills` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `todayKills`;
ALTER TABLE `characters` ADD COLUMN `chosenTitle` int(10) unsigned NOT NULL DEFAULT '0' AFTER `yesterdayKills`;
ALTER TABLE `characters` ADD COLUMN `knownTitles` longtext AFTER `ammoId`;
ALTER TABLE `characters` DROP COLUMN `honor_highest_rank`;
ALTER TABLE `characters` DROP COLUMN `honor_standing`;
ALTER TABLE `characters` DROP COLUMN `stored_honor_rating`;
ALTER TABLE `characters` DROP COLUMN `stored_dishonorable_kills`;
ALTER TABLE `characters` DROP COLUMN `stored_honorable_kills`;

-- Add the `event_group_chosen` table
DROP TABLE IF EXISTS `event_group_chosen`;
CREATE TABLE `event_group_chosen` (
`eventGroup` mediumint(8) unsigned NOT NULL DEFAULT '0',
`entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
PRIMARY KEY (`eventGroup`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest Group picked';

-- Modify `groups` to add an additional column
ALTER TABLE `groups` ADD COLUMN `difficulty` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `isRaid`;

-- Modify `guild` to add an additional column
ALTER TABLE `guild` ADD COLUMN `BankMoney` bigint(20) unsigned NOT NULL DEFAULT '0' AFTER `createdate`;

-- Add the `guild_bank_eventlog` table
DROP TABLE IF EXISTS `guild_bank_eventlog`;
CREATE TABLE `guild_bank_eventlog` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Guild bank TabId',
  `EventType` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `ItemOrMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `ItemStackCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DestTabId` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Destination Tab Id',
  `TimeStamp` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`,`TabId`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Add the `guild_bank_item` table
DROP TABLE IF EXISTS `guild_bank_item`;
CREATE TABLE `guild_bank_item` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SlotId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_entry` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  KEY `Idx_item_guid` (`item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Add the `guild_bank_right` table
DROP TABLE IF EXISTS `guild_bank_right`;
CREATE TABLE `guild_bank_right` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rid` int(11) unsigned NOT NULL DEFAULT '0',
  `gbright` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SlotPerDay` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Add the `guild_bank_tab` table
DROP TABLE IF EXISTS `guild_bank_tab`;
CREATE TABLE `guild_bank_tab` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `TabName` varchar(100) NOT NULL DEFAULT '',
  `TabIcon` varchar(100) NOT NULL DEFAULT '',
  `TabText` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`guildid`,`TabId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Modify `guild_member` to add additional columns
ALTER TABLE `guild_member` ADD COLUMN `BankResetTimeMoney` int(11) unsigned NOT NULL DEFAULT '0' AFTER `offnote`;
ALTER TABLE `guild_member` ADD COLUMN `BankRemMoney` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankResetTimeMoney`;
ALTER TABLE `guild_member` ADD COLUMN `BankResetTimeTab0` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankRemMoney`;
ALTER TABLE `guild_member` ADD COLUMN `BankRemSlotsTab0` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankResetTimeTab0`;
ALTER TABLE `guild_member` ADD COLUMN `BankResetTimeTab1` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankRemSlotsTab0`;
ALTER TABLE `guild_member` ADD COLUMN `BankRemSlotsTab1` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankResetTimeTab1`;
ALTER TABLE `guild_member` ADD COLUMN `BankResetTimeTab2` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankRemSlotsTab1`;
ALTER TABLE `guild_member` ADD COLUMN `BankRemSlotsTab2` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankResetTimeTab2`;
ALTER TABLE `guild_member` ADD COLUMN `BankResetTimeTab3` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankRemSlotsTab2`;
ALTER TABLE `guild_member` ADD COLUMN `BankRemSlotsTab3` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankResetTimeTab3`;
ALTER TABLE `guild_member` ADD COLUMN `BankResetTimeTab4` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankRemSlotsTab3`;
ALTER TABLE `guild_member` ADD COLUMN `BankRemSlotsTab4` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankResetTimeTab4`;
ALTER TABLE `guild_member` ADD COLUMN `BankResetTimeTab5` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankRemSlotsTab4`;
ALTER TABLE `guild_member` ADD COLUMN `BankRemSlotsTab5` int(11) unsigned NOT NULL DEFAULT '0' AFTER `BankResetTimeTab5`;

-- Modify `guild_rank` to add an additional column
ALTER TABLE `guild_rank` ADD COLUMN `BankMoneyPerDay` int(11) unsigned NOT NULL DEFAULT '0' AFTER `rights`;

-- Modify `instance` to add an additional column
ALTER TABLE `instance` ADD COLUMN `difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0' AFTER `encountersMask`;

-- Modify `item_loot` to add an additional column
ALTER TABLE `item_loot` ADD COLUMN `suffix` int(11) unsigned NOT NULL DEFAULT '0' AFTER `amount`;

-- Modify `petition` to add an additional column and set primary keys
ALTER TABLE `petition` ADD COLUMN `type` int(10) unsigned NOT NULL DEFAULT '0' AFTER `name`;
ALTER TABLE `petition` DROP PRIMARY KEY, ADD PRIMARY KEY (`ownerguid`,`type`);

-- Modify `petition_sign` to add an additional column
ALTER TABLE `petition_sign` ADD COLUMN `type` int(10) unsigned NOT NULL DEFAULT '0' AFTER `player_account`;

-- Modify `playerbot_saved_data` to add additional columns
ALTER TABLE `playerbot_saved_data` ADD COLUMN `auto_follow` int(11) unsigned NOT NULL DEFAULT '1' AFTER `combat_delay`;
ALTER TABLE `playerbot_saved_data` ADD COLUMN `autoequip` tinyint(1) NOT NULL DEFAULT '0' AFTER `auto_follow`;

-- Modify `saved_variables` to add additional columns and remove classic-only column
ALTER TABLE `saved_variables` ADD COLUMN `NextArenaPointDistributionTime` bigint(40) unsigned NOT NULL DEFAULT '0' FIRST;
ALTER TABLE `saved_variables` ADD COLUMN `NextDailyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT '0' AFTER `NextArenaPointDistributionTime`;
ALTER TABLE `saved_variables` ADD COLUMN `NextMonthlyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT '0' AFTER `NextWeeklyQuestResetTime`;
ALTER TABLE `saved_variables` DROP COLUMN `NextMaintenanceDate`;
