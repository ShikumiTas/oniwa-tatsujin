/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user` (
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ad_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_address` (
  `id` int NOT NULL DEFAULT '0',
  `ken_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `town_id` int DEFAULT NULL,
  `zip` varchar(8) DEFAULT NULL,
  `office_flg` tinyint(1) DEFAULT NULL,
  `delete_flg` tinyint(1) DEFAULT NULL,
  `ken_name` varchar(8) DEFAULT NULL,
  `ken_furi` varchar(8) DEFAULT NULL,
  `city_name` varchar(24) DEFAULT NULL,
  `city_furi` varchar(24) DEFAULT NULL,
  `town_name` varchar(32) DEFAULT NULL,
  `town_furi` varchar(32) DEFAULT NULL,
  `town_memo` varchar(16) DEFAULT NULL,
  `kyoto_street` varchar(32) DEFAULT NULL,
  `block_name` varchar(64) DEFAULT NULL,
  `block_furi` varchar(64) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `office_name` varchar(255) DEFAULT NULL,
  `office_furi` varchar(255) DEFAULT NULL,
  `office_address` varchar(255) DEFAULT NULL,
  `new_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `area_configuration_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_configuration_cities` (
  `area_configuration_city_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `area_id` bigint NOT NULL,
  `area_code` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`area_configuration_city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `area_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gm_site_id` bigint NOT NULL,
  `regional_area_kubun` int NOT NULL,
  `area_pref_cd` bigint NOT NULL,
  `area_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bis_partner_regional_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bis_partner_regional_ranges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bp_code` int NOT NULL,
  `is_approval` tinyint(1) NOT NULL DEFAULT '1',
  `which_season` int NOT NULL DEFAULT '1',
  `area_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_automatic_raising_hand` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bis_partner_regional_ranges_bp_code_index` (`bp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bis_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bis_partners` (
  `bis_partner_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `division_id` bigint DEFAULT NULL,
  `bp_code` int NOT NULL,
  `is_approval` tinyint(1) DEFAULT NULL,
  `bp_status` int DEFAULT NULL,
  `which_season` int NOT NULL DEFAULT '1',
  `bp_type` int NOT NULL DEFAULT '1',
  `is_direct_store` tinyint(1) NOT NULL DEFAULT '0',
  `corporate_private_kbn` tinyint(1) NOT NULL,
  `bp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp_name_kana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp_corporate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_manager_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp_manager_name_kana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_display_bp_manager_name` tinyint(1) NOT NULL DEFAULT '0',
  `bp_zip` int NOT NULL,
  `bp_pref` bigint NOT NULL,
  `bp_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp_block` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp_building_room_name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_address_kana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_display_address` tinyint(1) NOT NULL DEFAULT '0',
  `bp_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp_phone_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp_city_cd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp_line_id` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_gmo_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_credit_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_urgency_contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_related` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_urgency_contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_bank_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_branch_office_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_branch_office_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_bank_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_bank_account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_bank_account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp_lat` double(9,6) NOT NULL,
  `bp_lng` double(9,6) NOT NULL,
  `bp_contract_date` date DEFAULT NULL,
  `training_period` int NOT NULL DEFAULT '0',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `landscaping_starting_date` date DEFAULT NULL,
  `facility_starting_date` date DEFAULT NULL,
  `plan_change_date` date DEFAULT NULL,
  `failure_cause_code` int DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `area` int DEFAULT NULL,
  `customer_rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `which_industries_major` int DEFAULT NULL,
  `which_industries_within` int DEFAULT NULL,
  `which_industries_little` int DEFAULT NULL,
  `address_type` int DEFAULT NULL,
  `branch_office_sales_office_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax_not_possible` tinyint(1) DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `introducer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `email_not_possible` tinyint(1) NOT NULL DEFAULT '0',
  `supervision_experience_years_starting_date` date DEFAULT NULL,
  `is_SG` tinyint(1) NOT NULL DEFAULT '0',
  `is_EX` tinyint(1) NOT NULL DEFAULT '0',
  `is_GTM` tinyint(1) NOT NULL DEFAULT '0',
  `is_GJ` tinyint(1) NOT NULL DEFAULT '0',
  `is_GM` tinyint(1) NOT NULL DEFAULT '0',
  `is_GA` tinyint(1) NOT NULL DEFAULT '0',
  `is_OTHER` tinyint(1) NOT NULL DEFAULT '0',
  `is_course1` tinyint(1) NOT NULL DEFAULT '0',
  `is_course2` tinyint(1) NOT NULL DEFAULT '0',
  `is_course3` tinyint(1) NOT NULL DEFAULT '0',
  `is_course4` tinyint(1) NOT NULL DEFAULT '0',
  `is_course5` tinyint(1) NOT NULL DEFAULT '0',
  `is_course6` tinyint(1) NOT NULL DEFAULT '0',
  `is_course7` tinyint(1) NOT NULL DEFAULT '0',
  `is_course8` tinyint(1) NOT NULL DEFAULT '0',
  `is_course9` tinyint(1) NOT NULL DEFAULT '0',
  `list_earn_type` int DEFAULT NULL,
  `list_earn_method` int DEFAULT NULL,
  `document_submission_existence` int DEFAULT NULL,
  `progress_date_1` date DEFAULT NULL,
  `progress_date_2` date DEFAULT NULL,
  `progress_date_3` date DEFAULT NULL,
  `progress_date_4` date DEFAULT NULL,
  `progress_date_5` date DEFAULT NULL,
  `progress_date_6` date DEFAULT NULL,
  `progress_date_7` date DEFAULT NULL,
  `progress_date_8` date DEFAULT NULL,
  `progress_date_9` date DEFAULT NULL,
  `progress_date_10` date DEFAULT NULL,
  `act_result_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_result_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_result_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_result_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_result_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_result_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_result_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_result_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_result_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_result_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bis_partner_id`),
  UNIQUE KEY `bis_partners_bp_code_is_approval_unique` (`bp_code`,`is_approval`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `biz_partner_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_partner_details` (
  `biz_partner_detail_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bp_code` int NOT NULL,
  `is_approval` tinyint(1) NOT NULL,
  `bp_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_manager_image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `character_sex` tinyint DEFAULT NULL,
  `bp_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `before_construction_case_path_1_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `before_construction_case_path_1_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `after_construction_case_path_1_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `after_construction_case_path_1_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `construction_case_comment_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `before_construction_case_path_2_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `before_construction_case_path_2_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `after_construction_case_path_2_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `after_construction_case_path_2_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `construction_case_comment_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `before_construction_case_path_3_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `before_construction_case_path_3_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `after_construction_case_path_3_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `after_construction_case_path_3_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `construction_case_comment_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `between_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headquarters_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quote_period` int NOT NULL DEFAULT '0',
  `work_period` int NOT NULL DEFAULT '0',
  `vehicle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_count` int NOT NULL DEFAULT '0',
  `cooperator_count` int NOT NULL DEFAULT '0',
  `subcontractor_number` int NOT NULL DEFAULT '0',
  `business_hours_from` time DEFAULT NULL,
  `business_hours_to` time DEFAULT NULL,
  `is_no_regular_holiday` tinyint(1) NOT NULL DEFAULT '0',
  `is_no_temporary_holiday` tinyint(1) NOT NULL DEFAULT '0',
  `is_at_this_time_estimate_up_to_shortest_period_none` tinyint(1) NOT NULL DEFAULT '0',
  `is_at_this_time_work_up_to_shortest_period_none` tinyint(1) NOT NULL DEFAULT '0',
  `is_automatic_raising_hand` tinyint(1) NOT NULL DEFAULT '0',
  `introducer_franchised_store_code` int DEFAULT NULL,
  `is_introduction_complete` tinyint(1) NOT NULL DEFAULT '0',
  `is_reward_paid` tinyint(1) NOT NULL DEFAULT '0',
  `bp_image_id_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_check_1` tinyint(1) NOT NULL,
  `bp_image_id_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_check_2` tinyint(1) NOT NULL,
  `bp_image_id_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_3_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_check_3` tinyint(1) NOT NULL,
  `bp_image_id_expiration_date_3` date DEFAULT NULL,
  `bp_image_id_4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_check_4` tinyint(1) NOT NULL,
  `bp_image_id_expiration_date_4` date DEFAULT NULL,
  `bp_image_id_5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_5_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_check_5` tinyint(1) NOT NULL,
  `bp_image_id_expiration_date_5` date DEFAULT NULL,
  `bp_image_id_6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_check_6` tinyint(1) NOT NULL,
  `bp_image_id_expiration_date_6` date DEFAULT NULL,
  `bp_image_id_7` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_7_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_check_7` tinyint(1) NOT NULL,
  `bp_image_id_expiration_date_7` date DEFAULT NULL,
  `bp_image_id_8` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_check_8` tinyint(1) NOT NULL,
  `bp_image_id_expiration_date_8` date DEFAULT NULL,
  `bp_image_id_9` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_check_9` tinyint(1) NOT NULL,
  `bp_image_id_11` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_image_id_check_11` tinyint(1) NOT NULL,
  `bp_image_id_expiration_date_11` date DEFAULT NULL,
  `bp_certification_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_1` tinyint(1) NOT NULL,
  `bp_certification_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_2` tinyint(1) NOT NULL,
  `bp_certification_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_3` tinyint(1) NOT NULL,
  `bp_certification_4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_4` tinyint(1) NOT NULL,
  `bp_certification_5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_5` tinyint(1) NOT NULL,
  `bp_certification_6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_6` tinyint(1) NOT NULL,
  `bp_certification_7` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_7` tinyint(1) NOT NULL,
  `bp_certification_8` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_8` tinyint(1) NOT NULL,
  `bp_certification_9` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_9` tinyint(1) NOT NULL,
  `bp_certification_10` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_10` tinyint(1) NOT NULL,
  `bp_certification_11` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_11` tinyint(1) NOT NULL,
  `bp_certification_12` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_12` tinyint(1) NOT NULL,
  `bp_certification_13` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_13` tinyint(1) NOT NULL,
  `bp_certification_14` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_14` tinyint(1) NOT NULL,
  `bp_certification_15` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_15` tinyint(1) NOT NULL,
  `bp_certification_16` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_16` tinyint(1) NOT NULL,
  `bp_certification_17` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_17` tinyint(1) NOT NULL,
  `bp_certification_18` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_18` tinyint(1) NOT NULL,
  `bp_certification_19` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_19` tinyint(1) NOT NULL,
  `bp_certification_20` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_20` tinyint(1) NOT NULL,
  `bp_certification_21` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_21` tinyint(1) NOT NULL,
  `bp_certification_22` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_22` tinyint(1) NOT NULL,
  `bp_certification_23` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_23` tinyint(1) NOT NULL,
  `bp_certification_24` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_24` tinyint(1) NOT NULL,
  `bp_certification_25` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_25` tinyint(1) NOT NULL,
  `bp_certification_26` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_26` tinyint(1) NOT NULL,
  `bp_certification_27` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_27` tinyint(1) NOT NULL,
  `bp_certification_28` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_28` tinyint(1) NOT NULL,
  `bp_certification_29` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_29` tinyint(1) NOT NULL,
  `bp_certification_30` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_30` tinyint(1) NOT NULL,
  `bp_certification_31` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_31` tinyint(1) NOT NULL,
  `bp_certification_32` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_32` tinyint(1) NOT NULL,
  `bp_certification_33` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_33` tinyint(1) NOT NULL,
  `bp_certification_34` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_34` tinyint(1) NOT NULL,
  `bp_certification_35` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_35` tinyint(1) NOT NULL,
  `bp_certification_36` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bp_certification_check_36` tinyint(1) NOT NULL,
  `bp_certification_37` tinyint(1) NOT NULL,
  `bp_certification_check_37` tinyint(1) NOT NULL,
  `bp_certification_38` tinyint(1) NOT NULL,
  `bp_certification_check_38` tinyint(1) NOT NULL,
  `bp_certification_39` tinyint(1) NOT NULL,
  `bp_certification_check_39` tinyint(1) NOT NULL,
  `bp_certification_40` tinyint(1) NOT NULL,
  `bp_certification_check_40` tinyint(1) NOT NULL,
  `bp_certification_41` tinyint(1) NOT NULL,
  `bp_certification_check_41` tinyint(1) NOT NULL,
  `bp_certification_42` tinyint(1) NOT NULL,
  `bp_certification_check_42` tinyint(1) NOT NULL,
  `bp_certification_43` tinyint(1) NOT NULL,
  `bp_certification_check_43` tinyint(1) NOT NULL,
  `bp_certification_44` tinyint(1) NOT NULL,
  `bp_certification_check_44` tinyint(1) NOT NULL,
  `bp_certification_45` tinyint(1) NOT NULL,
  `bp_certification_check_45` tinyint(1) NOT NULL,
  `bp_certification_46` tinyint(1) NOT NULL,
  `bp_certification_check_46` tinyint(1) NOT NULL,
  `bp_certification_47` tinyint(1) NOT NULL,
  `bp_certification_check_47` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `message_to_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_individual_small_corporative` tinyint(1) NOT NULL DEFAULT '0',
  `is_set_housing_apartment` tinyint(1) NOT NULL DEFAULT '0',
  `is_set_housing_mansion` tinyint(1) NOT NULL DEFAULT '0',
  `is_medium_scale_facilities` tinyint(1) NOT NULL DEFAULT '0',
  `is_large_scale_facility_factory_system` tinyint(1) NOT NULL DEFAULT '0',
  `which_working_time` tinyint DEFAULT NULL,
  `raising_hand_count` int DEFAULT NULL,
  PRIMARY KEY (`biz_partner_detail_id`),
  UNIQUE KEY `biz_partner_details_bp_code_is_approval_unique` (`bp_code`,`is_approval`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bp_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bp_events` (
  `bp_event_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bp_code` bigint NOT NULL,
  `is_approval` tinyint(1) NOT NULL DEFAULT '1',
  `event_type` int NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bp_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bp_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bp_expenses` (
  `bp_expense_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bp_code` bigint NOT NULL,
  `bp_expense_type` int NOT NULL,
  `bp_expense_status` int NOT NULL,
  `plan_type` tinyint NOT NULL,
  `is_affiliation` tinyint(1) NOT NULL DEFAULT '0',
  `is_business_system_training` tinyint(1) NOT NULL DEFAULT '0',
  `is_landscaping_technology_training` tinyint(1) NOT NULL DEFAULT '0',
  `is_landscaping_integration_training` tinyint(1) NOT NULL DEFAULT '0',
  `is_outdoor_facility_integration_training` tinyint(1) NOT NULL DEFAULT '0',
  `is_landscaping_senior_accompanying_training` tinyint(1) NOT NULL DEFAULT '0',
  `is_gm_upgrade` tinyint(1) NOT NULL DEFAULT '0',
  `is_after_2_store_spot` tinyint(1) NOT NULL DEFAULT '0',
  `items_code_1` bigint NOT NULL,
  `items_code_2` bigint NOT NULL,
  `items_code_3` bigint NOT NULL,
  `items_code_4` bigint NOT NULL,
  `items_code_5` bigint NOT NULL,
  `items_code_6` bigint NOT NULL,
  `items_code_7` bigint NOT NULL,
  `items_code_8` bigint NOT NULL,
  `items_code_9` bigint NOT NULL,
  `items_code_10` bigint NOT NULL,
  `items_quantity_1` int NOT NULL,
  `items_quantity_2` int NOT NULL,
  `items_quantity_3` int NOT NULL,
  `items_quantity_4` int NOT NULL,
  `items_quantity_5` int NOT NULL,
  `items_quantity_6` int NOT NULL,
  `items_quantity_7` int NOT NULL,
  `items_quantity_8` int NOT NULL,
  `items_quantity_9` int NOT NULL,
  `items_quantity_10` int NOT NULL,
  `items_price_1` decimal(8,0) NOT NULL,
  `items_price_2` decimal(8,0) NOT NULL,
  `items_price_3` decimal(8,0) NOT NULL,
  `items_price_4` decimal(8,0) NOT NULL,
  `items_price_5` decimal(8,0) NOT NULL,
  `items_price_6` decimal(8,0) NOT NULL,
  `items_price_7` decimal(8,0) NOT NULL,
  `items_price_8` decimal(8,0) NOT NULL,
  `items_price_9` decimal(8,0) NOT NULL,
  `items_price_10` decimal(8,0) NOT NULL,
  `option_code_1` bigint NOT NULL,
  `option_code_2` bigint NOT NULL,
  `option_code_3` bigint NOT NULL,
  `option_code_4` bigint NOT NULL,
  `option_code_5` bigint NOT NULL,
  `option_code_6` bigint NOT NULL,
  `option_code_7` bigint NOT NULL,
  `option_code_8` bigint NOT NULL,
  `option_code_9` bigint NOT NULL,
  `option_code_10` bigint NOT NULL,
  `option_quantity_1` int NOT NULL,
  `option_quantity_2` int NOT NULL,
  `option_quantity_3` int NOT NULL,
  `option_quantity_4` int NOT NULL,
  `option_quantity_5` int NOT NULL,
  `option_quantity_6` int NOT NULL,
  `option_quantity_7` int NOT NULL,
  `option_quantity_8` int NOT NULL,
  `option_quantity_9` int NOT NULL,
  `option_quantity_10` int NOT NULL,
  `option_price_1` decimal(8,0) NOT NULL DEFAULT '0',
  `option_price_2` decimal(8,0) NOT NULL DEFAULT '0',
  `option_price_3` decimal(8,0) NOT NULL DEFAULT '0',
  `option_price_4` decimal(8,0) NOT NULL DEFAULT '0',
  `option_price_5` decimal(8,0) NOT NULL DEFAULT '0',
  `option_price_6` decimal(8,0) NOT NULL DEFAULT '0',
  `option_price_7` decimal(8,0) NOT NULL DEFAULT '0',
  `option_price_8` decimal(8,0) NOT NULL DEFAULT '0',
  `option_price_9` decimal(8,0) NOT NULL DEFAULT '0',
  `option_price_10` decimal(8,0) NOT NULL DEFAULT '0',
  `due_date_1` date DEFAULT NULL,
  `due_date_2` date DEFAULT NULL,
  `due_date_3` date DEFAULT NULL,
  `due_date_4` date DEFAULT NULL,
  `due_date_5` date DEFAULT NULL,
  `due_date_6` date DEFAULT NULL,
  `due_date_7` date DEFAULT NULL,
  `due_date_8` date DEFAULT NULL,
  `due_date_9` date DEFAULT NULL,
  `due_date_10` date DEFAULT NULL,
  `payment_price_1` decimal(8,0) NOT NULL DEFAULT '0',
  `payment_price_2` decimal(8,0) NOT NULL DEFAULT '0',
  `payment_price_3` decimal(8,0) NOT NULL DEFAULT '0',
  `payment_price_4` decimal(8,0) NOT NULL DEFAULT '0',
  `payment_price_5` decimal(8,0) NOT NULL DEFAULT '0',
  `payment_price_6` decimal(8,0) NOT NULL DEFAULT '0',
  `payment_price_7` decimal(8,0) NOT NULL DEFAULT '0',
  `payment_price_8` decimal(8,0) NOT NULL DEFAULT '0',
  `payment_price_9` decimal(8,0) NOT NULL DEFAULT '0',
  `payment_price_10` decimal(8,0) NOT NULL DEFAULT '0',
  `is_offsetting_1` tinyint(1) NOT NULL DEFAULT '0',
  `is_offsetting_2` tinyint(1) NOT NULL DEFAULT '0',
  `is_offsetting_3` tinyint(1) NOT NULL DEFAULT '0',
  `is_offsetting_4` tinyint(1) NOT NULL DEFAULT '0',
  `is_offsetting_5` tinyint(1) NOT NULL DEFAULT '0',
  `is_offsetting_6` tinyint(1) NOT NULL DEFAULT '0',
  `is_offsetting_7` tinyint(1) NOT NULL DEFAULT '0',
  `is_offsetting_8` tinyint(1) NOT NULL DEFAULT '0',
  `is_offsetting_9` tinyint(1) NOT NULL DEFAULT '0',
  `is_offsetting_10` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_fee` decimal(8,0) NOT NULL,
  `total_amount` decimal(8,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_date_1` date DEFAULT NULL,
  `payment_date_2` date DEFAULT NULL,
  `payment_date_3` date DEFAULT NULL,
  `payment_date_4` date DEFAULT NULL,
  `payment_date_5` date DEFAULT NULL,
  `payment_date_6` date DEFAULT NULL,
  `payment_date_7` date DEFAULT NULL,
  `payment_date_8` date DEFAULT NULL,
  `payment_date_9` date DEFAULT NULL,
  `payment_date_10` date DEFAULT NULL,
  PRIMARY KEY (`bp_expense_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bp_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bp_sequence` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bp_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bp_services` (
  `bp_service_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bis_partner_id` bigint DEFAULT NULL,
  `is_approval` tinyint(1) NOT NULL,
  `is_automatic_raising_hand` tinyint(1) NOT NULL DEFAULT '0',
  `scale` int NOT NULL DEFAULT '0',
  `service_code` int DEFAULT NULL,
  `service_code_2` int DEFAULT NULL,
  `is_individual_small_corporative` tinyint(1) DEFAULT '0',
  `is_set_housing_apartment` tinyint(1) DEFAULT '0',
  `is_set_housing_mansion` tinyint(1) DEFAULT '0',
  `is_medium_scale_facilities` tinyint(1) DEFAULT '0',
  `is_large_scale_facility_factory_system` tinyint(1) DEFAULT '0',
  `is_less_than_5m` tinyint(1) DEFAULT '0',
  `is_5m_or_more` tinyint(1) DEFAULT '0',
  `is_7m_or_more` tinyint(1) DEFAULT '0',
  `is_trunk_around_15cm_less_than_diameter_5cm_less_than` tinyint(1) DEFAULT '0',
  `is_trunk_around_15cm_or_more_diameter_5cm_or_more` tinyint(1) DEFAULT '0',
  `is_one_pole` tinyint(1) DEFAULT '0',
  `is_two_pole` tinyint(1) DEFAULT '0',
  `is_two_legs_torii` tinyint(1) DEFAULT '0',
  `is_yatsugake_bamboo` tinyint(1) DEFAULT '0',
  `is_pole_for_hedge` tinyint(1) DEFAULT '0',
  `is_mushirogake` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bp_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bp_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bp_targets` (
  `bp_target_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bp_code` bigint NOT NULL,
  `alliance_code` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bp_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `business_alliance_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_alliance_targets` (
  `alliance_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `alliance_code` int NOT NULL,
  `alliance_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alliance_division_etc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alliance_name_short` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_own_corporate` tinyint(1) NOT NULL,
  `is_to_enduser` tinyint(1) NOT NULL,
  `billing_alliance_code` int NOT NULL,
  `charge_rate_less_than_10` double(2,2) DEFAULT NULL,
  `charge_rate_less_than_20` double(2,2) DEFAULT NULL,
  `charge_rate_less_than_30` double(2,2) DEFAULT NULL,
  `charge_rate_less_than_50` double(2,2) DEFAULT NULL,
  `charge_rate_less_than_100` double(2,2) DEFAULT NULL,
  `charge_rate_less_than_999` double(2,2) DEFAULT NULL,
  `alliance_zip` int NOT NULL,
  `alliance_pref` int NOT NULL,
  `alliance_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alliance_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alliance_phone2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alliance_fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alliance_bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alliance_bank_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alliance_branch_office_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alliance_branch_office_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alliance_bank_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alliance_bank_account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alliance_bank_account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alliance_closing_type` int DEFAULT NULL,
  `alliance_closing_date` int DEFAULT NULL,
  `alliance_expected_type` int DEFAULT NULL,
  `alliance_expected_date` int DEFAULT NULL,
  `display_order` int NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alliance_store_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`alliance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns` (
  `campaign_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `campaign_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `chat_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `demand_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `bp_code` bigint DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bp_pref` bigint NOT NULL,
  `city_cd` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `claim_layer2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claim_layer2` (
  `claim_layer2_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `claim_code` int NOT NULL,
  `claim_code2` int NOT NULL,
  `claim_name2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`claim_layer2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claims` (
  `claim_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `claim_code` int NOT NULL,
  `claim_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_order` int NOT NULL,
  PRIMARY KEY (`claim_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_method` tinyint NOT NULL DEFAULT '0',
  `client_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `clients_client_email_unique` (`client_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `contact_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int NOT NULL,
  `email_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_category` int NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `contents_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents_tags` (
  `contents_tag_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `site_content_id` bigint NOT NULL,
  `tag_code` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`contents_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costs` (
  `cost_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cost_type` int NOT NULL,
  `bp_type` int NOT NULL,
  `cost_from` date DEFAULT NULL,
  `cost_to` date DEFAULT NULL,
  `from` decimal(8,0) DEFAULT NULL,
  `to` decimal(8,0) DEFAULT NULL,
  `consignment_expenses` double(2,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alliance_code` int DEFAULT NULL,
  PRIMARY KEY (`cost_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_type` tinyint DEFAULT NULL,
  `corporate_private_kbn` tinyint(1) DEFAULT NULL,
  `legal_personality_front_rear_kbn` tinyint(1) DEFAULT NULL,
  `legal_personality_code` bigint DEFAULT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name_kana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name_after` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `customer_name_kana_after` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `representative` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `representative_kana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `customer_zip` int NOT NULL,
  `customer_pref` bigint NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address_kana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_city_cd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_fixed_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_line_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_bank_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_branch_office_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_branch_office_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_bank_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_bank_account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_bank_account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_lat` double(9,6) NOT NULL,
  `customer_lng` double(9,6) NOT NULL,
  `guest_type` tinyint DEFAULT NULL,
  `guest_type_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` tinyint DEFAULT NULL,
  `birthyear_month` int DEFAULT NULL,
  `birthyear_date` int DEFAULT NULL,
  `is_dm` tinyint(1) DEFAULT NULL,
  `is_terms_agreement` tinyint DEFAULT NULL,
  `is_achievement_preferred` tinyint(1) DEFAULT NULL,
  `is_near_preferred` tinyint(1) DEFAULT NULL,
  `is_review_evaluation_preferred` tinyint(1) DEFAULT NULL,
  `is_mail_magazine_subscription` tinyint(1) DEFAULT NULL,
  `is_no_estimate_reception_count_limit` tinyint(1) DEFAULT NULL,
  `customer_gmo_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_credit_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `search_customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `search_customer_name_kana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `search_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customers_customer_email_unique` (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `demand_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demand_campaigns` (
  `demand_campaign_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `demand_id` bigint DEFAULT NULL,
  `campaign_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`demand_campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `demand_candidacies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demand_candidacies` (
  `demand_candidacy_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `demand_id` bigint NOT NULL,
  `bp_code` bigint NOT NULL,
  `raising_hand_date` date DEFAULT NULL,
  `raising_hand_period` date DEFAULT NULL,
  `quote_submission_period` date DEFAULT NULL,
  `appeal_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quote_order_time` datetime DEFAULT NULL,
  `quote_order_receiving_time` datetime DEFAULT NULL,
  `matching_time` datetime DEFAULT NULL,
  `formal_trust_agreement_date` date DEFAULT NULL,
  `refusal_date` date DEFAULT NULL,
  `is_automatic_raising_hand` tinyint(1) NOT NULL DEFAULT '0',
  `is_designation_order` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_expired` tinyint(1) NOT NULL DEFAULT '0',
  `is_registrant_expired` tinyint(1) NOT NULL DEFAULT '0',
  `is_repeat` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`demand_candidacy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `demand_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demand_claims` (
  `demand_claim_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `demand_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  `claim_code` int NOT NULL,
  `claim_code2` int NOT NULL,
  `body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`demand_claim_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `demand_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demand_services` (
  `demand_service_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `demand_id` bigint DEFAULT NULL,
  `service_code` int DEFAULT NULL,
  `service_code_2` int DEFAULT NULL,
  `is_individual_small_corporative` tinyint(1) DEFAULT '0',
  `is_set_housing_apartment` tinyint(1) DEFAULT '0',
  `is_set_housing_mansion` tinyint(1) DEFAULT '0',
  `is_medium_scale_facilities` tinyint(1) DEFAULT '0',
  `is_large_scale_facility_factory_system` tinyint(1) DEFAULT '0',
  `is_less_than_5m` tinyint(1) DEFAULT '0',
  `is_5m_or_more` tinyint(1) DEFAULT '0',
  `is_7m_or_more` tinyint(1) DEFAULT '0',
  `is_trunk_around_15cm_less_than_diameter_5cm_less_than` tinyint(1) DEFAULT '0',
  `is_trunk_around_15cm_or_more_diameter_5cm_or_more` tinyint(1) DEFAULT '0',
  `is_one_pole` tinyint(1) DEFAULT '0',
  `is_two_pole` tinyint(1) DEFAULT '0',
  `is_two_legs_torii` tinyint(1) DEFAULT '0',
  `is_yatsugake_bamboo` tinyint(1) DEFAULT '0',
  `is_pole_for_hedge` tinyint(1) DEFAULT '0',
  `is_mushirogake` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`demand_service_id`),
  KEY `demand_services_demand_id_index` (`demand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `demand_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demand_types` (
  `demand_type_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `demand_type_code` int NOT NULL,
  `demand_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` int NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`demand_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `demands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demands` (
  `demand_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `division_id` int DEFAULT '5',
  `demand_status` int DEFAULT '0',
  `demand_abend_status` int DEFAULT NULL,
  `demand_title` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_type` int DEFAULT NULL,
  `ad_type` int DEFAULT NULL,
  `demand_via` int DEFAULT NULL,
  `demand_type` int DEFAULT NULL,
  `work_details` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_management_id` bigint DEFAULT NULL,
  `annual_times` int DEFAULT NULL,
  `demand_billing_format` int DEFAULT '1',
  `customer_id` int DEFAULT NULL,
  `bis_partner_id` bigint DEFAULT NULL,
  `is_difference_destination` int NOT NULL DEFAULT '1',
  `demand_customer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `demand_zip` int DEFAULT NULL,
  `demand_pref` bigint DEFAULT NULL,
  `demand_address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `demand_address_kana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_cd` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `demand_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `demand_lat` double(9,6) DEFAULT NULL,
  `demand_lng` double(9,6) DEFAULT NULL,
  `contact_preferred_date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote_preferred_date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `construction_complete_desired_date` date DEFAULT NULL,
  `first_tel_date` date DEFAULT NULL,
  `witness_date` datetime DEFAULT NULL,
  `quote_date` date DEFAULT NULL,
  `formal_agreement_confirmation` tinyint(1) DEFAULT NULL,
  `represent_work_code` int DEFAULT NULL,
  `construction_date` datetime DEFAULT NULL,
  `construction_complete_date` date DEFAULT NULL,
  `guest_construction_complete_confirmation_date` date DEFAULT NULL,
  `construction_complete_sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `demand_closing_type` int DEFAULT NULL,
  `demand_closing_date` int DEFAULT NULL,
  `payment_expected_type` int DEFAULT NULL,
  `demand_closing_actual_date` date DEFAULT NULL,
  `demand_introduction_fee` decimal(8,0) DEFAULT NULL,
  `payment_expected_date` int DEFAULT NULL,
  `payment_methods` int DEFAULT NULL,
  `is_difference_addressee` int DEFAULT NULL,
  `invoice_destination` int DEFAULT NULL,
  `invoice_zip` int DEFAULT NULL,
  `invoice_pref` int DEFAULT NULL,
  `invoice_address` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_addressee` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `demand_consignment_expenses_rate` double(2,2) DEFAULT NULL,
  `quotation_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_complete_report_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provision_doc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provision_img1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provision_img2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provision_img3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provision_img4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before_doc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before_img1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before_img2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before_img3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before_img4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_doc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_img1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_img2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_img3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_img4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_for_site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_display_to_site` tinyint(1) DEFAULT '0',
  `alliance_reception_number` int DEFAULT NULL,
  `building_type` tinyint DEFAULT NULL,
  `building_type_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relationship_type` tinyint DEFAULT NULL,
  `relationship_type_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suggested_service` tinyint DEFAULT NULL,
  `is_parking` tinyint(1) NOT NULL DEFAULT '0',
  `is_garbage_collection` tinyint(1) NOT NULL DEFAULT '0',
  `parking_space` tinyint DEFAULT NULL,
  `parking_space_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_order` tinyint(1) DEFAULT NULL,
  `working_desired_time` tinyint DEFAULT NULL,
  `working_desired_time_other` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` tinyint DEFAULT NULL,
  `budget_other` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updater` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `master_count` int DEFAULT NULL,
  PRIMARY KEY (`demand_id`),
  KEY `demands_demand_status_index` (`demand_status`),
  KEY `demands_customer_id_index` (`customer_id`),
  KEY `demands_bis_partner_id_index` (`bis_partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `division_id` int NOT NULL,
  `division_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_name_short` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`user_id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees` (
  `fee_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fee_type` int NOT NULL,
  `bp_type` int NOT NULL,
  `fee_from` date DEFAULT NULL,
  `fee_to` date DEFAULT NULL,
  `price_from` decimal(8,0) DEFAULT NULL,
  `price_to` decimal(8,0) DEFAULT NULL,
  `fee` decimal(8,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `file_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_list` (
  `file_list_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookies` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`file_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `gm_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gm_sites` (
  `gm_site_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gm_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `demand_id` bigint DEFAULT NULL,
  `invoice_status` int NOT NULL DEFAULT '0',
  `invoice_date` date DEFAULT NULL,
  `invoice_amount` decimal(8,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_temporary_registration` tinyint(1) NOT NULL DEFAULT '0',
  `transfer_order_persons_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote_header_id` bigint NOT NULL,
  `return_payment_fee` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `issuings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issuings` (
  `issuing_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `cost_unit_price` decimal(8,0) NOT NULL,
  `issuing_number` int NOT NULL,
  `issuing_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`issuing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `legal_personalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legal_personalities` (
  `legal_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `legal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `legal_name_short` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `legal_kana_short_head` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `legal_kana_short_mid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `legal_kana_short_foot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`legal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `masters_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `masters_status` (
  `masters_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bp_code` int NOT NULL,
  `certified_rank` int NOT NULL,
  `earned_points` int NOT NULL,
  `required_point_up_to_next_term_title` int NOT NULL,
  `current_month_construction_project_number` int NOT NULL,
  `current_month_sales_amount` decimal(8,0) DEFAULT NULL,
  `sales_amount_1` decimal(8,0) DEFAULT NULL,
  `sales_amount_2` decimal(8,0) DEFAULT NULL,
  `sales_amount_3` decimal(8,0) DEFAULT NULL,
  `sales_amount_4` decimal(8,0) DEFAULT NULL,
  `sales_amount_5` decimal(8,0) DEFAULT NULL,
  `sales_amount_6` decimal(8,0) DEFAULT NULL,
  `sales_amount_7` decimal(8,0) DEFAULT NULL,
  `sales_amount_8` decimal(8,0) DEFAULT NULL,
  `sales_amount_9` decimal(8,0) DEFAULT NULL,
  `sales_amount_10` decimal(8,0) DEFAULT NULL,
  `sales_amount_11` decimal(8,0) DEFAULT NULL,
  `sales_amount_12` decimal(8,0) DEFAULT NULL,
  `current_month_reward_amount` decimal(8,0) DEFAULT NULL,
  `current_term_title_rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_term_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_term_construction_project_number` int NOT NULL,
  `current_term_sales_amount` decimal(8,0) DEFAULT NULL,
  `current_term_reward_amount` decimal(8,0) DEFAULT NULL,
  `current_term_estimate_rate` double(2,2) DEFAULT NULL,
  `current_term_order_rate` double(2,2) DEFAULT NULL,
  `current_term_order_count` int NOT NULL,
  `current_term_average_review_evaluation` int NOT NULL,
  `current_term_review_number` int NOT NULL,
  `level_up_count` int NOT NULL,
  `level_up_rate` double(2,2) DEFAULT NULL,
  `downloaded_at` date DEFAULT NULL,
  `login_days` int NOT NULL,
  `last_login_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`masters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bp_code` bigint NOT NULL,
  `order_status` int NOT NULL,
  `product_id` bigint NOT NULL,
  `product_quantity` int NOT NULL,
  `payment_price` decimal(8,0) NOT NULL DEFAULT '0',
  `shipping_fee` decimal(8,0) NOT NULL,
  `is_offsetting` tinyint(1) NOT NULL DEFAULT '0',
  `is_destination` int DEFAULT NULL,
  `destination_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quote_order_date` date DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `partner_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_me` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `partner_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `partner_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `demand_id` bigint DEFAULT NULL,
  `payment_status` int NOT NULL,
  `consignment_expenses` decimal(8,0) DEFAULT NULL,
  `system_use_fee` decimal(8,0) DEFAULT NULL,
  `disposal_subtotal_price` decimal(8,0) DEFAULT NULL,
  `ad_fee` decimal(8,0) DEFAULT NULL,
  `offsetting_expenses` decimal(8,0) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `pay_amount` decimal(8,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transfer_target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consignment_expenses_rate` double(2,2) DEFAULT NULL,
  `payment_type` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prefs` (
  `pref_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pref_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_id` bigint NOT NULL,
  PRIMARY KEY (`pref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,0) NOT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `quote_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote_headers` (
  `quote_header_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `demand_id` bigint DEFAULT NULL,
  `quote_status` int NOT NULL,
  `discount_price` decimal(8,0) DEFAULT NULL,
  `working_subtotal_price` decimal(8,0) DEFAULT NULL,
  `disposal_subtotal_price` decimal(8,0) DEFAULT NULL,
  `total_price` decimal(8,0) DEFAULT NULL,
  `allience_charge_rate` double(2,2) DEFAULT NULL,
  `allience_total_price` decimal(8,0) DEFAULT NULL,
  `tax` double(2,2) DEFAULT NULL,
  `bill_creation_date` date DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cvs_fee` decimal(8,0) DEFAULT NULL,
  `stamp_tax` decimal(8,0) DEFAULT NULL,
  `cvs_total_price` decimal(8,0) DEFAULT NULL,
  `billing_before_construction` decimal(8,0) DEFAULT NULL,
  `introduction_fee` decimal(8,0) DEFAULT NULL,
  `bp_code` bigint NOT NULL,
  PRIMARY KEY (`quote_header_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `quote_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote_items` (
  `quote_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quote_header_id` bigint DEFAULT NULL,
  `major_category` int DEFAULT NULL,
  `middle_category` int DEFAULT NULL,
  `minor_category_3` int DEFAULT NULL,
  `minor_category_4` int DEFAULT NULL,
  `minor_category_5` int DEFAULT NULL,
  `minor_category_6` int DEFAULT NULL,
  `quote_item_memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_unit_price` decimal(8,0) DEFAULT NULL,
  `working_quantity` decimal(8,0) DEFAULT NULL,
  `working_total_price` decimal(8,0) DEFAULT NULL,
  `disposal_quantity` int DEFAULT NULL,
  `disposal_unit_price` decimal(8,0) DEFAULT NULL,
  `disposal_total_price` decimal(8,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`quote_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rankings` (
  `ranking_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp_code` int NOT NULL,
  `city_cd` int NOT NULL,
  `working_item` int NOT NULL,
  `point` int NOT NULL,
  `sales_amount` decimal(8,0) DEFAULT NULL,
  `order_rate` double(2,2) DEFAULT NULL,
  `estimate_rate` double(2,2) DEFAULT NULL,
  `review_count` int NOT NULL,
  `working_title_rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complex_title_rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ranking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `demand_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `bp_code` bigint DEFAULT NULL,
  `evaluation` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `speed` int DEFAULT NULL,
  `voc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `master_voice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `service_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_details` (
  `service_detail_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_code` int NOT NULL,
  `service_detail_code` int NOT NULL,
  `service_detail_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,0) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `display_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`service_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `service_layer2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_layer2` (
  `service_layer2_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_code` int NOT NULL,
  `service_code_2` int NOT NULL,
  `service_name_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`service_layer2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `service_layer3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_layer3` (
  `service_layer3_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_code_2` int NOT NULL,
  `service_code_3` int NOT NULL,
  `service_name_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`service_layer3_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `service_layer4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_layer4` (
  `service_layer4_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_code_3` int NOT NULL,
  `service_code_4` int NOT NULL,
  `service_name_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`service_layer4_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `service_layer5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_layer5` (
  `service_layer5_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_code_4` int NOT NULL,
  `service_code_5` int NOT NULL,
  `service_name_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`service_layer5_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `service_layer6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_layer6` (
  `service_layer6_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_code_5` int NOT NULL,
  `service_code_6` int NOT NULL,
  `service_name_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`service_layer6_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `service_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_prices` (
  `service_price_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_code` int NOT NULL,
  `service_code_2` int NOT NULL,
  `service_code_3` int NOT NULL,
  `service_code_4` int NOT NULL,
  `service_code_5` int NOT NULL,
  `service_code_6` int NOT NULL,
  `amount` decimal(8,0) NOT NULL,
  `is_site_display` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`service_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_code` int NOT NULL,
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` int NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `site_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_contents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `site_content_id` bigint NOT NULL,
  `site_content_sub_id` bigint NOT NULL,
  `category` int NOT NULL,
  `related_number` bigint DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pref_cd` bigint DEFAULT NULL,
  `content1_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content2_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `posting_start_date` date DEFAULT NULL,
  `posting_end_date` date DEFAULT NULL,
  `is_floating` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting_sg` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting_ex` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting_noen` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting_sgex` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting_gj` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting_madoguchi` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting_gm` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting_ueki` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting_tatsujin_mypage` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting_tatsujin_bp` tinyint(1) NOT NULL DEFAULT '0',
  `is_posting_all` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_association` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued` int NOT NULL,
  `lifetime` int NOT NULL,
  `assoc_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_nonce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int NOT NULL,
  `salt` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_partial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_step` smallint unsigned NOT NULL,
  `backend` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`),
  CONSTRAINT `social_auth_partial_chk_1` CHECK ((`next_step` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersoci_user_id_17d28448_fk_accounts_` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersoci_user_id_17d28448_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `stock_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `cost_unit_price` decimal(8,0) NOT NULL,
  `stock_quantity` int NOT NULL,
  `arrival_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `division_id` bigint NOT NULL,
  `tag_code` int NOT NULL,
  `major_category` int NOT NULL,
  `middle_category` int NOT NULL,
  `minor_category` int NOT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tags_tag_code_unique` (`tag_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int DEFAULT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `access_auth` int DEFAULT NULL,
  `bp_code` int DEFAULT NULL,
  `last_name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_ataff` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_superuser` tinyint(1) DEFAULT NULL,
  `date_joined` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `first_name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `virtual_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtual_accounts` (
  `virtual_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `virtual_account_id` int NOT NULL,
  `virtual_account_status` int NOT NULL,
  `demand_id` bigint NOT NULL DEFAULT '0',
  `customer_id` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`virtual_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `migrations` VALUES (1,'2021_09_16_114028_create_site_content',1);
INSERT INTO `migrations` VALUES (2,'2021_09_16_114947_create_site_conten',2);
INSERT INTO `migrations` VALUES (3,'2021_09_16_115729_create_bis_partners',3);
INSERT INTO `migrations` VALUES (4,'2021_09_16_115822_create_biz_partner_details',3);
INSERT INTO `migrations` VALUES (5,'2021_09_16_115846_create_bp_events',3);
INSERT INTO `migrations` VALUES (6,'2021_09_16_115900_create_bp_services',3);
INSERT INTO `migrations` VALUES (7,'2021_09_16_115942_create_bis_partner_regional_ranges',3);
INSERT INTO `migrations` VALUES (8,'2021_09_16_120047_create_divisions',3);
INSERT INTO `migrations` VALUES (9,'2021_09_16_121524_create_site_contents',4);
INSERT INTO `migrations` VALUES (10,'2021_09_16_122335_create_customers',4);
INSERT INTO `migrations` VALUES (11,'2021_09_16_131134_create_demand_candidacies',5);
INSERT INTO `migrations` VALUES (12,'2021_09_16_133023_create_demands',6);
INSERT INTO `migrations` VALUES (13,'2021_09_16_135533_create_customers',6);
INSERT INTO `migrations` VALUES (14,'2021_09_16_234541_create_contacts',7);
INSERT INTO `migrations` VALUES (15,'2021_09_17_005245_create_demand_candidacies',7);
INSERT INTO `migrations` VALUES (16,'2021_09_17_005308_create_reviews',7);
INSERT INTO `migrations` VALUES (17,'2021_09_17_010543_create_chats',7);
INSERT INTO `migrations` VALUES (18,'2021_10_08_092950_create_biz_partner_details',8);
INSERT INTO `migrations` VALUES (19,'2021_10_13_143133_create_bis_partners',9);
INSERT INTO `migrations` VALUES (20,'2021_10_13_160328_create_bis_partners',10);
INSERT INTO `migrations` VALUES (21,'2021_10_13_161107_create_bis_partners',11);
INSERT INTO `migrations` VALUES (22,'2019_12_14_000001_create_personal_access_tokens_table',12);
INSERT INTO `migrations` VALUES (23,'2022_06_11_091731_add_message_to_biz_partner_details_table',13);
INSERT INTO `migrations` VALUES (24,'2022_06_22_111921_add_hand_to_biz_partner_details_table',14);
INSERT INTO `migrations` VALUES (25,'2022_06_22_112001_add_hand_to_bis_partner_regional_ranges_table',14);
INSERT INTO `migrations` VALUES (26,'2022_07_11_144510_add_bpcode_to_quote_headers_table',15);
