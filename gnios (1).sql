-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 24 juil. 2020 à 08:14
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gnios`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-06-08 19:36:24', '2020-06-08 19:36:24'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-06-08 19:36:24', '2020-06-08 19:36:24');

-- --------------------------------------------------------

--
-- Structure de la table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `country`
--

INSERT INTO `country` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'France', '2020-06-08 23:55:30', '2020-06-08 23:55:30'),
(2, 'Algérie', '2020-06-08 23:55:49', '2020-06-08 23:55:49'),
(3, 'Mali', '2020-06-08 23:55:59', '2020-06-08 23:55:59'),
(4, 'Benin', '2020-06-08 23:56:16', '2020-06-08 23:56:16'),
(5, 'Belgique', '2020-06-08 23:56:27', '2020-06-08 23:56:27'),
(6, 'Autriche', '2020-06-08 23:56:40', '2020-06-08 23:56:40'),
(7, 'Burkina Faso', '2020-06-08 23:56:55', '2020-06-08 23:56:55'),
(8, 'Cameroun', '2020-06-08 23:57:13', '2020-06-08 23:57:13'),
(9, 'Canada', '2020-06-08 23:57:24', '2020-06-08 23:57:24'),
(10, 'Gabon', '2020-06-08 23:57:39', '2020-06-08 23:57:39'),
(11, 'Madagascar', '2020-06-08 23:58:01', '2020-06-08 23:58:01'),
(12, 'Maroc', '2020-06-08 23:58:11', '2020-06-08 23:58:11'),
(13, 'Niger', '2020-06-08 23:58:23', '2020-06-08 23:58:23'),
(14, 'RDC', '2020-06-08 23:58:36', '2020-06-08 23:58:36'),
(15, 'Rwanda', '2020-06-08 23:58:53', '2020-06-08 23:58:53'),
(16, 'Suisse', '2020-06-08 23:59:13', '2020-06-08 23:59:13'),
(17, 'Sénégal', '2020-06-08 23:59:40', '2020-06-08 23:59:40'),
(18, 'Togo', '2020-06-08 23:59:58', '2020-06-08 23:59:58'),
(19, 'Tunisie', '2020-06-09 00:00:11', '2020-06-09 00:00:11'),
(20, 'USA', '2020-06-09 00:00:37', '2020-06-09 00:00:37'),
(21, 'Côte d\'Ivoire', '2020-06-09 00:01:07', '2020-06-09 00:01:07');

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(57, 1, 'youtube_link', 'text', 'Youtube Link', 0, 1, 1, 1, 1, 1, '{}', 12),
(58, 1, 'firstName', 'text', 'Prénom', 0, 1, 1, 1, 1, 1, '{}', 13),
(59, 1, 'lastName', 'text', 'Nom', 0, 1, 1, 1, 1, 1, '{}', 14),
(60, 1, 'facebook', 'text', 'Lien Facebook', 0, 1, 1, 1, 1, 1, '{}', 15),
(61, 1, 'linkedin', 'text', 'Lien Linkedin', 0, 1, 1, 1, 1, 1, '{}', 16),
(62, 1, 'twitter', 'text', 'Lien Twitter', 0, 1, 1, 1, 1, 1, '{}', 17),
(63, 1, 'github', 'text', 'Lien Github', 0, 1, 1, 1, 1, 1, '{}', 18),
(64, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(65, 7, 'name', 'text', 'Pays', 0, 1, 1, 1, 1, 1, '{}', 2),
(66, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(67, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(68, 1, 'country', 'text', 'Country', 0, 1, 1, 1, 1, 1, '{}', 19),
(69, 1, 'thumbnail', 'image', 'Thumbnail', 0, 1, 1, 1, 1, 1, '{}', 20),
(70, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(71, 8, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 2),
(72, 8, 'title1', 'rich_text_box', 'Titre 1', 0, 1, 1, 1, 1, 1, '{}', 3),
(73, 8, 'title2', 'rich_text_box', 'Titre 2', 0, 1, 1, 1, 1, 1, '{}', 4),
(74, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(75, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(76, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(77, 9, 'accueil_text', 'rich_text_box', 'Accueil Text', 0, 1, 1, 1, 1, 1, '{}', 2),
(78, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(79, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-06-08 19:36:16', '2020-06-17 15:38:36'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-06-08 19:36:17', '2020-06-08 19:36:17'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-06-08 19:36:17', '2020-06-08 19:36:17'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-06-08 19:36:23', '2020-06-08 19:36:23'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-06-08 19:36:24', '2020-06-08 19:36:24'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-06-08 19:36:25', '2020-06-08 19:36:25'),
(7, 'country', 'country', 'Pays', 'Pays', 'voyager-documentation', 'App\\Models\\Country', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-08 23:54:14', '2020-06-08 23:55:13'),
(8, 'slider', 'slider', 'Slider', 'Sliders', NULL, 'App\\Models\\Slider', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-19 14:51:03', '2020-06-22 11:51:06'),
(9, 'setting', 'setting', 'Paramètre', 'Paramètre', 'voyager-settings', 'App\\Models\\Setting', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-22 12:24:20', '2020-06-22 12:25:39');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 7, 'thumbnails', '1-3', '1-3.jpg', 'image/jpeg', 'public', 119249, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 1, '2020-06-18 15:14:13', '2020-06-18 15:14:22'),
(2, 'App\\User', 8, 'thumbnails', '77bb0eb050_76815_millet-canon-1069', '77bb0eb050_76815_millet-canon-1069.jpg', 'image/jpeg', 'public', 235348, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 2, '2020-07-09 08:55:03', '2020-07-09 08:55:12'),
(3, 'App\\User', 9, 'thumbnails', 'BGK', 'BGK.jpg', 'image/jpeg', 'public', 418270, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 3, '2020-07-22 07:25:52', '2020-07-22 07:25:57');

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-06-08 19:36:17', '2020-06-08 19:36:17');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-06-08 19:36:17', '2020-06-08 19:36:17', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2020-06-08 19:36:17', '2020-06-08 19:36:17', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-06-08 19:36:17', '2020-06-08 19:36:17', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-06-08 19:36:17', '2020-06-08 19:36:17', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2020-06-08 19:36:17', '2020-06-08 19:36:17', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2020-06-08 19:36:17', '2020-06-08 19:36:17', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2020-06-08 19:36:17', '2020-06-08 19:36:17', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2020-06-08 19:36:17', '2020-06-08 19:36:17', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2020-06-08 19:36:17', '2020-06-08 19:36:17', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2020-06-08 19:36:17', '2020-06-08 19:36:17', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2020-06-08 19:36:24', '2020-06-08 19:36:24', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2020-06-08 19:36:25', '2020-06-08 19:36:25', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2020-06-08 19:36:25', '2020-06-08 19:36:25', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2020-06-08 19:36:28', '2020-06-08 19:36:28', 'voyager.hooks', NULL),
(15, 1, 'Pays', '', '_self', NULL, NULL, NULL, 15, '2020-06-08 23:54:14', '2020-06-08 23:54:14', 'voyager.country.index', NULL),
(16, 1, 'Sliders', '', '_self', NULL, NULL, NULL, 16, '2020-06-19 14:51:04', '2020-06-19 14:51:04', 'voyager.slider.index', NULL),
(17, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 17, '2020-06-22 12:24:21', '2020-06-22 12:24:21', 'voyager.setting.index', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(28, '2020_06_18_151100_create_media_table', 3);

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-06-08 19:36:26', '2020-06-08 19:36:26');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(2, 'browse_bread', NULL, '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(3, 'browse_database', NULL, '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(4, 'browse_media', NULL, '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(5, 'browse_compass', NULL, '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(6, 'browse_menus', 'menus', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(7, 'read_menus', 'menus', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(8, 'edit_menus', 'menus', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(9, 'add_menus', 'menus', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(10, 'delete_menus', 'menus', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(11, 'browse_roles', 'roles', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(12, 'read_roles', 'roles', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(13, 'edit_roles', 'roles', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(14, 'add_roles', 'roles', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(15, 'delete_roles', 'roles', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(16, 'browse_users', 'users', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(17, 'read_users', 'users', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(18, 'edit_users', 'users', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(19, 'add_users', 'users', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(20, 'delete_users', 'users', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(21, 'browse_settings', 'settings', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(22, 'read_settings', 'settings', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(23, 'edit_settings', 'settings', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(24, 'add_settings', 'settings', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(25, 'delete_settings', 'settings', '2020-06-08 19:36:18', '2020-06-08 19:36:18'),
(26, 'browse_categories', 'categories', '2020-06-08 19:36:24', '2020-06-08 19:36:24'),
(27, 'read_categories', 'categories', '2020-06-08 19:36:24', '2020-06-08 19:36:24'),
(28, 'edit_categories', 'categories', '2020-06-08 19:36:24', '2020-06-08 19:36:24'),
(29, 'add_categories', 'categories', '2020-06-08 19:36:24', '2020-06-08 19:36:24'),
(30, 'delete_categories', 'categories', '2020-06-08 19:36:24', '2020-06-08 19:36:24'),
(31, 'browse_posts', 'posts', '2020-06-08 19:36:25', '2020-06-08 19:36:25'),
(32, 'read_posts', 'posts', '2020-06-08 19:36:25', '2020-06-08 19:36:25'),
(33, 'edit_posts', 'posts', '2020-06-08 19:36:25', '2020-06-08 19:36:25'),
(34, 'add_posts', 'posts', '2020-06-08 19:36:25', '2020-06-08 19:36:25'),
(35, 'delete_posts', 'posts', '2020-06-08 19:36:25', '2020-06-08 19:36:25'),
(36, 'browse_pages', 'pages', '2020-06-08 19:36:25', '2020-06-08 19:36:25'),
(37, 'read_pages', 'pages', '2020-06-08 19:36:25', '2020-06-08 19:36:25'),
(38, 'edit_pages', 'pages', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(39, 'add_pages', 'pages', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(40, 'delete_pages', 'pages', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(41, 'browse_hooks', NULL, '2020-06-08 19:36:28', '2020-06-08 19:36:28'),
(42, 'browse_country', 'country', '2020-06-08 23:54:14', '2020-06-08 23:54:14'),
(43, 'read_country', 'country', '2020-06-08 23:54:14', '2020-06-08 23:54:14'),
(44, 'edit_country', 'country', '2020-06-08 23:54:14', '2020-06-08 23:54:14'),
(45, 'add_country', 'country', '2020-06-08 23:54:14', '2020-06-08 23:54:14'),
(46, 'delete_country', 'country', '2020-06-08 23:54:14', '2020-06-08 23:54:14'),
(47, 'browse_slider', 'slider', '2020-06-19 14:51:04', '2020-06-19 14:51:04'),
(48, 'read_slider', 'slider', '2020-06-19 14:51:04', '2020-06-19 14:51:04'),
(49, 'edit_slider', 'slider', '2020-06-19 14:51:04', '2020-06-19 14:51:04'),
(50, 'add_slider', 'slider', '2020-06-19 14:51:04', '2020-06-19 14:51:04'),
(51, 'delete_slider', 'slider', '2020-06-19 14:51:04', '2020-06-19 14:51:04'),
(52, 'browse_setting', 'setting', '2020-06-22 12:24:20', '2020-06-22 12:24:20'),
(53, 'read_setting', 'setting', '2020-06-22 12:24:20', '2020-06-22 12:24:20'),
(54, 'edit_setting', 'setting', '2020-06-22 12:24:20', '2020-06-22 12:24:20'),
(55, 'add_setting', 'setting', '2020-06-22 12:24:20', '2020-06-22 12:24:20'),
(56, 'delete_setting', 'setting', '2020-06-22 12:24:20', '2020-06-22 12:24:20');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-06-08 19:36:25', '2020-06-08 19:36:25'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-06-08 19:36:25', '2020-06-08 19:36:25'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-06-08 19:36:25', '2020-06-08 19:36:25'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-06-08 19:36:25', '2020-06-08 19:36:25');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-06-08 19:36:17', '2020-06-08 19:36:17'),
(2, 'user', 'Normal User', '2020-06-08 19:36:18', '2020-06-08 19:36:18');

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `accueil_text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `accueil_text`, `created_at`, `updated_at`) VALUES
(1, '<p class=\"MsoNormal\" style=\"margin-bottom: .0001pt; line-height: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; mso-fareast-language: FR;\">Plateforme de pr&eacute;sentation des diff&eacute;rents profils r&eacute;unis au sein de l\'organisation Solidarityworld.&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: .0001pt; line-height: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: .0001pt; line-height: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; mso-fareast-language: FR;\">A terme il s\'agira d\'offrir une v&eacute;ritable Web.tv pour les adh&eacute;rents de Solidarityworld.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: .0001pt; line-height: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><strong><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: #f79646; mso-themecolor: accent6; mso-fareast-language: FR;\">Quatre parties bien distinctes&nbsp;:</span></strong></p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l1 level1 lfo1; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">50% de pr&eacute;sentation de vid&eacute;os comme Youtube</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l1 level1 lfo1; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">50% d&rsquo;&eacute;missions en direct et en diff&eacute;r&eacute;es (dont une &eacute;mission en direct pour chaque pays. L&rsquo;id&eacute;e est de pr&eacute;senter un vrai journal quotidien sur le monde international ax&eacute; sur le positif, sur ce qui va bien et non sur les probl&egrave;mes, meurtres, attentats, etc.)</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l1 level1 lfo1; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">une salle de visioconf&eacute;rence int&eacute;gr&eacute;e</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l1 level1 lfo1; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">un espace propre &agrave; tous les relais Solidarityworld dans le monde</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l1 level1 lfo1; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">un espace propre &agrave; tous les membres du staff Solidarityworld</span></p>\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"margin-left: 1.0cm; mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l1 level1 lfo1; vertical-align: baseline;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">un espace propre &agrave; tous les participants sur G.nioos</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: .0001pt; line-height: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: .0001pt; line-height: normal;\"><strong><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: #f79646; mso-themecolor: accent6; mso-fareast-language: FR;\">Pour avoir&nbsp;:</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: .0001pt; line-height: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l2 level1 lfo2; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">une pr&eacute;sentation des activit&eacute;s de tous les internautes en vid&eacute;o (selon un annuaire par pays et th&eacute;matiques)&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l2 level1 lfo2; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">Acc&egrave;s &agrave; un tutoriel pour cr&eacute;er vos vid&eacute;os de qualit&eacute; via votre espace membre</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l2 level1 lfo2; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">des &eacute;missions exclusives</span></p>\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"margin-left: 1.0cm; mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l2 level1 lfo2; vertical-align: baseline;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">un journal d&rsquo;informations positives propre &agrave; chaque pays (pour aider &agrave; un changement de paradigme dans le monde)</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\"><br />Concernant le dernier point il s&rsquo;agit d&rsquo;offrir des informations exclusivement positives, tourn&eacute;es sur les solutions en lieu et place des probl&egrave;mes dans le monde.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">Une bouff&eacute;e d&rsquo;optimisme et de comportements positifs.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">La prestigieuse universit&eacute; de Berkeley, en Californie, consacre un centre de recherches au d&eacute;veloppement de la paix et du bien-&ecirc;tre.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">Donc des &eacute;missions ax&eacute;es sur&nbsp;:</span></p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l0 level1 lfo3; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">la bont&eacute;</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l0 level1 lfo3; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">le pardon</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l0 level1 lfo3; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">la compassion</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l0 level1 lfo3; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">des t&eacute;moignages de personnes se retrouvant dans des valeurs plus citoyennes</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l0 level1 lfo3; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">des t&eacute;moignages de chefs d&rsquo;entreprise ayant une volont&eacute; citoyenne</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l0 level1 lfo3; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">des solutions &agrave; tous les probl&egrave;mes de la vie courante (par th&egrave;mes)</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l0 level1 lfo3; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">des &eacute;missions de th&eacute;&acirc;tres d&rsquo;inspiration (pour une ouverture au grand public de ce moyen d&rsquo;expression pour lib&eacute;rer l&rsquo;individu) en direct des associations</span></p>\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: normal; mso-list: l0 level1 lfo3; vertical-align: baseline; margin: 0cm 0cm .0001pt 1.0cm;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; color: black; mso-fareast-language: FR;\"><span style=\"mso-list: Ignore;\">&uuml;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; </span></span></span><!--[endif]--><span lang=\"FR\" style=\"font-size: 12.0pt; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-fareast-language: FR;\">s&eacute;lection de vid&eacute;os par th&egrave;mes (environnement, politique de la ville, emploi, sant&eacute;, &eacute;conomie, transport, nouvelles technologies, famille, voyages, agriculture durable, &eacute;nergie renouvelable, habitat, initiatives solidaires, etc..)</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Roboto; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; mso-fareast-language: FR;\"><br /></span><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Roboto; mso-bidi-font-family: Arial; color: #0070c0;\">Une alternative positive &agrave; visage humain&nbsp;!</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Roboto; mso-bidi-font-family: Arial; color: #f79646; mso-themecolor: accent6;\">Le plaisir de la d&eacute;couverte&hellip;</span></strong></p>', '2020-06-22 12:24:54', '2020-06-22 12:24:54');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'TV G.nioos', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\June2020\\mc72iKVBxcRoTJwmnK8N.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.footer_page', 'footer', '© 2020 – Solidarityworld/G.nioos - Tous droits réservés.', NULL, 'text', 6, 'Site'),
(12, 'site.description_accueil', 'description accueil', 'Plateforme de présentation des différents profils réunis au sein de l\'organisation Solidarityworld. \r\n\r\nA terme il s\'agira d\'offrir une véritable Web.tv pour les adhérents de Solidarityworld.\r\n\r\nQuatre parties bien distinctes :\r\n	50% de présentation de vidéos comme Youtube\r\n	50% d’émissions en direct et en différées (dont une émission en direct pour chaque pays. L’idée est de présenter un vrai journal quotidien sur le monde international axé sur le positif, sur ce qui va bien et non sur les problèmes, meurtres, attentats, etc.)\r\n	une salle de visioconférence intégrée\r\n	un espace propre à tous les relais Solidarityworld dans le monde\r\n	un espace propre à tous les membres du staff Solidarityworld\r\n	un espace propre à tous les participants sur G.nioos\r\n\r\nPour avoir :\r\n\r\n	une présentation des activités de tous les internautes en vidéo (selon un annuaire par pays et thématiques) \r\n	Accès à un tutoriel pour créer vos vidéos de qualité via votre espace membre\r\n	des émissions exclusives\r\n	un journal d’informations positives propre à chaque pays (pour aider à un changement de paradigme dans le monde)\r\n\r\nConcernant le dernier point il s’agit d’offrir des informations exclusivement positives, tournées sur les solutions en lieu et place des problèmes dans le monde.\r\nUne bouffée d’optimisme et de comportements positifs.\r\nLa prestigieuse université de Berkeley, en Californie, consacre un centre de recherches au développement de la paix et du bien-être.\r\nDonc des émissions axées sur :\r\n	la bonté\r\n	le pardon\r\n	la compassion\r\n	des témoignages de personnes se retrouvant dans des valeurs plus citoyennes\r\n	des témoignages de chefs d’entreprise ayant une volonté citoyenne\r\n	des solutions à tous les problèmes de la vie courante (par thèmes)\r\n	des émissions de théâtres d’inspiration (pour une ouverture au grand public de ce moyen d’expression pour libérer l’individu) en direct des associations\r\n	sélection de vidéos par thèmes (environnement, politique de la ville, emploi, santé, économie, transport, nouvelles technologies, famille, voyages, agriculture durable, énergie renouvelable, habitat, initiatives solidaires, etc..)\r\n\r\nUne alternative positive à visage humain !\r\nLe plaisir de la découverte…', NULL, 'text_area', 7, 'Site'),
(13, 'site.facebook', 'facebook', '', NULL, 'text', 8, 'Site'),
(14, 'site.youtube', 'youtube', '', NULL, 'text', 9, 'Site');

-- --------------------------------------------------------

--
-- Structure de la table `slider`
--

DROP TABLE IF EXISTS `slider`;
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title1` text COLLATE utf8mb4_unicode_ci,
  `title2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `slider`
--

INSERT INTO `slider` (`id`, `image`, `title1`, `title2`, `created_at`, `updated_at`) VALUES
(1, 'slider\\June2020\\z21YSW2BRYbSIjSMPxOi.jpg', '<p><strong style=\"text-align: center;\"><span lang=\"FR\" style=\"font-size: 12pt; font-family: Roboto; color: #0070c0;\">Un &eacute;cosyst&egrave;me dynamique&nbsp;</span></strong><strong><span lang=\"FR\" style=\"font-size: 12pt; font-family: Roboto; color: #f79646;\">pour l&rsquo;&eacute;closion d&rsquo;une nouvelle &egrave;re</span></strong></p>', NULL, '2020-06-22 12:04:44', '2020-06-22 12:04:44'),
(2, 'slider\\June2020\\OV6empEnDIyx8S4HOAP1.jpg', '<p><strong style=\"text-align: center;\"><span lang=\"FR\" style=\"font-size: 12pt; font-family: Roboto; color: #0070c0;\">Un &eacute;cosyst&egrave;me dynamique&nbsp;</span></strong><strong><span lang=\"FR\" style=\"font-size: 12pt; font-family: Roboto; color: #f79646;\">pour l&rsquo;&eacute;closion d&rsquo;une nouvelle &egrave;re</span></strong></p>', NULL, '2020-06-22 12:10:59', '2020-06-22 12:10:59'),
(3, 'slider\\June2020\\cp8ulA1grJhUxex6pXHp.jpg', '<p><strong style=\"text-align: center;\"><span lang=\"FR\" style=\"font-size: 12pt; font-family: Roboto; color: #0070c0;\">Un &eacute;cosyst&egrave;me dynamique&nbsp;</span></strong><strong><span lang=\"FR\" style=\"font-size: 12pt; font-family: Roboto; color: #f79646;\">pour l&rsquo;&eacute;closion d&rsquo;une nouvelle &egrave;re</span></strong></p>', NULL, '2020-06-22 12:44:26', '2020-06-22 12:44:26');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-06-08 19:36:26', '2020-06-08 19:36:26'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-06-08 19:36:27', '2020-06-08 19:36:27'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-06-08 19:36:27', '2020-06-08 19:36:27'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-06-08 19:36:27', '2020-06-08 19:36:27'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-06-08 19:36:27', '2020-06-08 19:36:27'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-06-08 19:36:27', '2020-06-08 19:36:27'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-06-08 19:36:27', '2020-06-08 19:36:27'),
(31, 'data_rows', 'display_name', 1, 'en', 'ID', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(32, 'data_rows', 'display_name', 21, 'en', 'Role', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(33, 'data_rows', 'display_name', 2, 'en', 'Name', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(34, 'data_rows', 'display_name', 3, 'en', 'Email', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(35, 'data_rows', 'display_name', 8, 'en', 'Avatar', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(36, 'data_rows', 'display_name', 4, 'en', 'Password', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(37, 'data_rows', 'display_name', 5, 'en', 'Remember Token', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(38, 'data_rows', 'display_name', 11, 'en', 'Settings', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(39, 'data_rows', 'display_name', 6, 'en', 'Created At', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(40, 'data_rows', 'display_name', 7, 'en', 'Updated At', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(41, 'data_rows', 'display_name', 9, 'en', 'Role', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(42, 'data_rows', 'display_name', 10, 'en', 'Roles', '2020-06-08 23:18:35', '2020-06-08 23:18:35'),
(43, 'data_types', 'display_name_singular', 1, 'en', 'User', '2020-06-08 23:18:36', '2020-06-08 23:18:36'),
(44, 'data_types', 'display_name_plural', 1, 'en', 'Users', '2020-06-08 23:18:36', '2020-06-08 23:18:36'),
(45, 'data_rows', 'display_name', 64, 'en', 'Id', '2020-06-08 23:55:13', '2020-06-08 23:55:13'),
(46, 'data_rows', 'display_name', 65, 'en', 'Pays', '2020-06-08 23:55:13', '2020-06-08 23:55:13'),
(47, 'data_rows', 'display_name', 66, 'en', 'Created At', '2020-06-08 23:55:13', '2020-06-08 23:55:13'),
(48, 'data_rows', 'display_name', 67, 'en', 'Updated At', '2020-06-08 23:55:13', '2020-06-08 23:55:13'),
(49, 'data_types', 'display_name_singular', 7, 'en', 'Pays', '2020-06-08 23:55:13', '2020-06-08 23:55:13'),
(50, 'data_types', 'display_name_plural', 7, 'en', 'Pays', '2020-06-08 23:55:13', '2020-06-08 23:55:13'),
(51, 'data_rows', 'display_name', 56, 'en', 'Email Verified At', '2020-06-17 15:38:36', '2020-06-17 15:38:36'),
(52, 'data_rows', 'display_name', 57, 'en', 'Youtube Link', '2020-06-17 15:38:36', '2020-06-17 15:38:36'),
(53, 'data_rows', 'display_name', 58, 'en', 'Prénom', '2020-06-17 15:38:36', '2020-06-17 15:38:36'),
(54, 'data_rows', 'display_name', 59, 'en', 'Nom', '2020-06-17 15:38:36', '2020-06-17 15:38:36'),
(55, 'data_rows', 'display_name', 60, 'en', 'Lien Facebook', '2020-06-17 15:38:36', '2020-06-17 15:38:36'),
(56, 'data_rows', 'display_name', 61, 'en', 'Lien Linkedin', '2020-06-17 15:38:36', '2020-06-17 15:38:36'),
(57, 'data_rows', 'display_name', 62, 'en', 'Lien Twitter', '2020-06-17 15:38:36', '2020-06-17 15:38:36'),
(58, 'data_rows', 'display_name', 63, 'en', 'Lien Github', '2020-06-17 15:38:36', '2020-06-17 15:38:36'),
(59, 'data_rows', 'display_name', 70, 'en', 'Id', '2020-06-22 11:51:06', '2020-06-22 11:51:06'),
(60, 'data_rows', 'display_name', 71, 'en', 'Image', '2020-06-22 11:51:06', '2020-06-22 11:51:06'),
(61, 'data_rows', 'display_name', 72, 'en', 'Titre 1', '2020-06-22 11:51:06', '2020-06-22 11:51:06'),
(62, 'data_rows', 'display_name', 73, 'en', 'Titre 2', '2020-06-22 11:51:06', '2020-06-22 11:51:06'),
(63, 'data_rows', 'display_name', 74, 'en', 'Created At', '2020-06-22 11:51:06', '2020-06-22 11:51:06'),
(64, 'data_rows', 'display_name', 75, 'en', 'Updated At', '2020-06-22 11:51:06', '2020-06-22 11:51:06'),
(65, 'data_types', 'display_name_singular', 8, 'en', 'Slider', '2020-06-22 11:51:06', '2020-06-22 11:51:06'),
(66, 'data_types', 'display_name_plural', 8, 'en', 'Sliders', '2020-06-22 11:51:06', '2020-06-22 11:51:06'),
(67, 'data_rows', 'display_name', 76, 'en', 'Id', '2020-06-22 12:25:39', '2020-06-22 12:25:39'),
(68, 'data_rows', 'display_name', 77, 'en', 'Accueil Text', '2020-06-22 12:25:39', '2020-06-22 12:25:39'),
(69, 'data_rows', 'display_name', 78, 'en', 'Created At', '2020-06-22 12:25:39', '2020-06-22 12:25:39'),
(70, 'data_rows', 'display_name', 79, 'en', 'Updated At', '2020-06-22 12:25:39', '2020-06-22 12:25:39'),
(71, 'data_types', 'display_name_singular', 9, 'en', 'Setting', '2020-06-22 12:25:39', '2020-06-22 12:25:39'),
(72, 'data_types', 'display_name_plural', 9, 'en', 'Settings', '2020-06-22 12:25:39', '2020-06-22 12:25:39');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `membership_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `youtube_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `membership_type`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `youtube_link`, `firstName`, `lastName`, `facebook`, `linkedin`, `twitter`, `github`, `country_id`, `thumbnail`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '', NULL, '$2y$10$NpuZjndpTS8cTBOsRpZ00uwEgVfRr/PSob.fQOHFMQuAJ0Hjr7oTm', 'aZph7yzvclL9Jb6oGj2z2QyUDMlvzMN9c2CwidJ5Hp8PYkFl5nS5Ho7Wrw7i', '{\"locale\":\"fr\"}', '2020-06-08 19:36:24', '2020-06-08 23:19:47', 'https://www.youtube.com/watch?v=CRuw7ZqnKgg', 'Moussa', 'Doumbia', NULL, NULL, NULL, NULL, '2', NULL),
(2, 2, 'Wasstel', 'kantediakante@gmail.com', 'users/default.png', 'Membres Solidarityworld', NULL, '$2y$10$R30Tia8wO8iJUJd26sSiL.WJ2lwf8kIsl0XKn39JvFTTDXOVDegke', 'MiCyBcFyoN6IQKZZgE9MiSLx0jjEK9uXTyTEkIHJna3wNpzhMKaqiJoD1am0', NULL, '2020-06-09 01:04:01', '2020-06-19 10:50:33', 'https://www.youtube.com/watch?v=CRuw7ZqnKgg', 'Diakaridia', 'KANTE', 'http://127.0.0.1:8000/profile/update', 'http://127.0.0.1:8000/profile/update', 'http://127.0.0.1:8000/profile/update', 'http://127.0.0.1:8000/profile/update', '5', NULL),
(3, 2, 'Ramata', 'ramata1kante@gmail.com', 'users/default.png', 'Participants G.nioos ', NULL, '$2y$10$kKTjoStabuJ7KfKTPk6IY.B26Kucn5ckVZMIfxPlSYU8FcV4Yvj.S', NULL, NULL, '2020-06-17 15:57:45', '2020-06-17 15:57:45', 'https://www.youtube.com/watch?v=aV0ztPuyNLQ&list=RD5dbEhBKGOtY&index=12', 'Ramata', 'KANTE', NULL, NULL, NULL, NULL, '13', NULL),
(4, 2, 'rose', 'dkante@consultingkeith.com', 'users/default.png', 'Participants G.nioos ', NULL, '$2y$10$S7OvjUvTzFIW/zJzEg9N6uITQ2KV/fL4OUoV6EIA8m8oWQJJmnNqi', NULL, NULL, '2020-06-17 16:12:01', '2020-06-17 16:12:01', 'https://www.youtube.com/watch?v=xyQT2pnv_4E', 'Wasstel', 'Wasstel', NULL, NULL, NULL, NULL, '12', NULL),
(5, 2, 'zeo', 'zero@gmail.com', 'users/default.png', 'Membres Solidarityworld', NULL, '$2y$10$mJtyHmGDOKQGincUeePQs.A0zVBKp/vh.nil39ylc6sWNt6UWoQXq', NULL, NULL, '2020-06-17 16:22:43', '2020-06-17 16:22:43', 'https://www.youtube.com/watch?v=xyQT2pnv_4E', 'zero', 'Zero', NULL, NULL, NULL, NULL, '11', NULL),
(6, 2, 'ddd', 'dkante2@consultingkeith.com', 'users/default.png', 'Participants G.nioos ', NULL, '$2y$10$.UfdH4QDEAtUcG.cu7bG4.uiKcJyNvMdzi0z44Ji6chmAZuCw0t7K', NULL, NULL, '2020-06-17 16:47:07', '2020-06-17 16:47:07', 'racineoly@yahoo.fr', 'QZE', 'EERRR', NULL, NULL, NULL, NULL, '17', NULL),
(7, 2, 'bauer', 'buarer@gmail.com', 'users/default.png', 'Participants G.nioos ', NULL, '$2y$10$KzmWB0qm90cWHlDR4pMOHeoySqAqVQaH7W35mpDZlJqRuqF1Eb7o.', NULL, NULL, '2020-06-18 15:14:12', '2020-06-18 15:14:13', 'https://www.youtube.com/watch?v=5dmVD_Q4CJA&list=RDMM5dbEhBKGOtY&index=5', 'Wasstel', 'Wasstel', NULL, NULL, NULL, NULL, '17', NULL),
(8, 2, 'zaho', 'delat@gmail.com', 'users/default.png', 'Membres Solidarityworld', NULL, '$2y$10$87j5eqq7ev9/MD7IGw3Pde1lY8M7.2l5AlNhvyogFhJeveurTSoM.', NULL, NULL, '2020-07-09 08:55:02', '2020-07-09 08:55:02', 'https://www.youtube.com/watch?v=vPM89mLydt4', 'delata', 'delata', NULL, NULL, NULL, NULL, '12', NULL),
(9, 2, 'Wasstel', 'wasstelmali@gmail.com', 'users/default.png', 'Membres Solidarityworld', NULL, '$2y$10$bqoyV5jcy9z9pbsd6r.hueMT1KUC0YSNeIDl.yelSG82GSepeSfPS', NULL, NULL, '2020-07-22 07:25:51', '2020-07-22 07:56:22', 'https://www.youtube.com/watch?v=ZkE1A2w0MAc', 'Diack', 'kante', 'https://www.facebook.com/wasstelmali2019/', NULL, NULL, NULL, '12', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
