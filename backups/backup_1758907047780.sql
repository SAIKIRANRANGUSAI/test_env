/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: about_page_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `about_page_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `years_experience` int DEFAULT '0',
  `employees` int DEFAULT '0',
  `projects_completed` int DEFAULT '0',
  `happy_clients` int DEFAULT '0',
  `vision_heading` varchar(255) DEFAULT NULL,
  `vision_description` longtext,
  `mission_heading` varchar(255) DEFAULT NULL,
  `mission_description` longtext,
  `goal_heading` varchar(255) DEFAULT NULL,
  `goal_description` longtext,
  `choose_heading` varchar(255) DEFAULT NULL,
  `choose_description` longtext,
  `choose_image1_url` varchar(255) DEFAULT NULL,
  `choose_image2_url` varchar(255) DEFAULT NULL,
  `choose_image3_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: about_us
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `about_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `heading` text NOT NULL,
  `description` longtext NOT NULL,
  `image1_url` varchar(255) DEFAULT NULL,
  `image2_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: admin
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: clients
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `public_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 31 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: contact_submissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `contact_submissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 32 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: gallery
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(500) NOT NULL,
  `public_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: home_page_banners
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `home_page_banners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hero1` varchar(255) NOT NULL,
  `hero2` varchar(255) NOT NULL,
  `hero3` varchar(255) NOT NULL,
  `offer_title` varchar(255) NOT NULL,
  `offer_description` text NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: seo_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `seo_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_slug` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `keywords` text,
  `og_title` varchar(255) DEFAULT NULL,
  `og_description` text,
  `og_image` varchar(255) DEFAULT NULL,
  `twitter_title` varchar(255) DEFAULT NULL,
  `twitter_description` text,
  `twitter_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_slug` (`page_slug`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: services
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: site_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `site_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) NOT NULL,
  `description` text,
  `logo1_url` varchar(255) DEFAULT NULL,
  `public_id_logo1` varchar(255) DEFAULT NULL,
  `logo2_url` varchar(255) DEFAULT NULL,
  `public_id_logo2` varchar(255) DEFAULT NULL,
  `favicon_url` varchar(255) DEFAULT NULL,
  `public_id_favicon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text,
  `facebook_url` varchar(255) DEFAULT NULL,
  `whatsapp_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: testimonial_entries
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `testimonial_entries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `testimonial_text` text NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `client_image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `public_id` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: testimonial_section
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `testimonial_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `side_image1` varchar(500) DEFAULT NULL,
  `side_image2` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `subtitle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: who_we_are_section
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `who_we_are_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `description` text,
  `image1` varchar(500) DEFAULT NULL,
  `image2` varchar(500) DEFAULT NULL,
  `image3` varchar(500) DEFAULT NULL,
  `custom_heading` varchar(255) DEFAULT NULL,
  `custom_description` text,
  `technical_heading` varchar(255) DEFAULT NULL,
  `technical_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT 'active',
  `is_active` tinyint(1) DEFAULT '1',
  `public_id1` varchar(255) DEFAULT NULL,
  `public_id2` varchar(255) DEFAULT NULL,
  `public_id3` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: about_page_details
# ------------------------------------------------------------

INSERT INTO
  `about_page_details` (
    `id`,
    `years_experience`,
    `employees`,
    `projects_completed`,
    `happy_clients`,
    `vision_heading`,
    `vision_description`,
    `mission_heading`,
    `mission_description`,
    `goal_heading`,
    `goal_description`,
    `choose_heading`,
    `choose_description`,
    `choose_image1_url`,
    `choose_image2_url`,
    `choose_image3_url`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    12,
    20,
    8,
    20,
    'Our Vision',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters , as opposed to using \'Content here, content here\', making it look like readable English.',
    'Our Mission',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters , as opposed to using \'Content here, content here\', making it look like readable English.',
    'Our Goal',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters , as opposed to using \'Content here, content here\', making it look like readable English.',
    'Commitment Beyond Expectations',
    '<p class=\"wow fadeInUp\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n<p class=\"wow fadeInUp\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758824608/about_page/bqvmgickdhcrxvi3r1gy.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758824610/about_page/ailf3uphnclqj8z2r9ru.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758826571/about_page/j8iirrjjorxsiycvjrvi.jpg',
    '2025-09-25 23:44:32',
    '2025-09-26 00:26:13'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: about_us
# ------------------------------------------------------------

INSERT INTO
  `about_us` (
    `id`,
    `heading`,
    `description`,
    `image1_url`,
    `image2_url`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'About Visakha Industrial Security Force  ',
    '<p data-wow-delay=\".2s\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.</p>\r\n<p data-wow-delay=\".2s\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.&nbsp;</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758818220/about_us/usyxoono6msm3e8umjq4.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758818222/about_us/pdxkihd79bhjqfe2t4bt.jpg',
    '2025-09-25 18:23:25',
    '2025-09-25 23:44:24'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: admin
# ------------------------------------------------------------

INSERT INTO
  `admin` (
    `id`,
    `username`,
    `password`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'admin',
    '$2b$10$FF47BGoEYdZ4Qvv.xlX.xun4mO6kRLgwII0eV71t15x9RbHVWfzJ.',
    '2025-09-24 22:08:39',
    '2025-09-26 18:50:32'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: clients
# ------------------------------------------------------------

INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    3,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758863766/clients/eemwp8nhlm7iw1el9eq7.jpg',
    '2025-09-26 10:46:07',
    'clients/eemwp8nhlm7iw1el9eq7'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    4,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758863767/clients/fb8j4yjenuh4slu3vyut.jpg',
    '2025-09-26 10:46:08',
    'clients/fb8j4yjenuh4slu3vyut'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    5,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758864492/clients/thue4c2aulegqzopuhyy.jpg',
    '2025-09-26 10:58:13',
    'clients/thue4c2aulegqzopuhyy'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    6,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758864980/clients/acczmmamjbgkvtifvwai.jpg',
    '2025-09-26 11:06:21',
    'clients/acczmmamjbgkvtifvwai'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    7,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758868844/clients/uegg2nlkthkzt8tg8rzx.jpg',
    '2025-09-26 12:10:45',
    'clients/uegg2nlkthkzt8tg8rzx'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    8,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758868845/clients/ffpbycynqv39f72e5hnc.jpg',
    '2025-09-26 12:10:46',
    'clients/ffpbycynqv39f72e5hnc'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    9,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758868846/clients/fsw716tmzht60xk09yoj.jpg',
    '2025-09-26 12:10:47',
    'clients/fsw716tmzht60xk09yoj'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    11,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758868849/clients/j4b3ku2gqltmavrc6tfw.jpg',
    '2025-09-26 12:10:49',
    'clients/j4b3ku2gqltmavrc6tfw'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    12,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758868850/clients/wn91cxotvh66yje9ozry.jpg',
    '2025-09-26 12:10:51',
    'clients/wn91cxotvh66yje9ozry'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    13,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758868852/clients/dz9ykj2egni80jlr4opg.jpg',
    '2025-09-26 12:10:52',
    'clients/dz9ykj2egni80jlr4opg'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    14,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758868853/clients/ewd839da0hyebxccgyb1.jpg',
    '2025-09-26 12:10:53',
    'clients/ewd839da0hyebxccgyb1'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    15,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758868854/clients/ijpwekgtcy7pqumaefni.jpg',
    '2025-09-26 12:10:55',
    'clients/ijpwekgtcy7pqumaefni'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    17,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758871286/clients/hf2zucjpumescy12jhnp.png',
    '2025-09-26 12:51:27',
    'clients/hf2zucjpumescy12jhnp'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    18,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758871287/clients/qvtkbe95l3elvmgjkdaz.png',
    '2025-09-26 12:51:28',
    'clients/qvtkbe95l3elvmgjkdaz'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    20,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758871289/clients/gm9e0t0iockztowgofvs.png',
    '2025-09-26 12:51:30',
    'clients/gm9e0t0iockztowgofvs'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    21,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758871290/clients/emeazbarjt4ywnmyoqvz.png',
    '2025-09-26 12:51:31',
    'clients/emeazbarjt4ywnmyoqvz'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    22,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758877030/clients/fh9cwurtwjkuzkrz3dzv.jpg',
    '2025-09-26 14:27:11',
    'clients/fh9cwurtwjkuzkrz3dzv'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    23,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758877031/clients/xy4i1rdtwctgpzviesxe.jpg',
    '2025-09-26 14:27:12',
    'clients/xy4i1rdtwctgpzviesxe'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    24,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758877032/clients/b5vtwros14km2oeroixw.jpg',
    '2025-09-26 14:27:13',
    'clients/b5vtwros14km2oeroixw'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    25,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758877034/clients/juurzb8dpexokn8rued9.jpg',
    '2025-09-26 14:27:14',
    'clients/juurzb8dpexokn8rued9'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    26,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758877035/clients/uldduhh6zx0lbxiass7j.jpg',
    '2025-09-26 14:27:15',
    'clients/uldduhh6zx0lbxiass7j'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    27,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758877036/clients/weltlkw5207tmzax0bei.jpg',
    '2025-09-26 14:27:16',
    'clients/weltlkw5207tmzax0bei'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    28,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758877037/clients/hscdqikm52y6serqdzpv.jpg',
    '2025-09-26 14:27:17',
    'clients/hscdqikm52y6serqdzpv'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    29,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758877038/clients/sqhsxhvktmzelu0rhmex.jpg',
    '2025-09-26 14:27:18',
    'clients/sqhsxhvktmzelu0rhmex'
  );
INSERT INTO
  `clients` (
    `id`,
    `client_name`,
    `image_url`,
    `created_at`,
    `public_id`
  )
VALUES
  (
    30,
    NULL,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758877039/clients/jzahnncbus54n2qwsrgs.jpg',
    '2025-09-26 14:27:20',
    'clients/jzahnncbus54n2qwsrgs'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: contact_submissions
# ------------------------------------------------------------

INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    2,
    'Chris Johnson',
    'chris@example.com',
    '',
    'Security guards',
    'Inquiry about night shift guards.',
    '2025-09-24 22:54:35'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    3,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '0878553778',
    'Security guards',
    'hjkl',
    '2025-09-24 23:37:31'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    6,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '8978553778',
    'Data Entry Operator',
    '&lt;script&gt;alert(\'XSS-test\')&lt;/script&gt;',
    '2025-09-25 10:08:06'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    7,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Security guards',
    'test',
    '2025-09-25 11:51:01'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    10,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Security guards',
    'const [rows] = await db.execute(\'SELECT * FROM users WHERE email = ?\', [email]);',
    '2025-09-26 19:20:38'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    11,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Security guards',
    'test',
    '2025-09-26 21:12:28'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    12,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'All types of Manpower Services',
    'test',
    '2025-09-26 21:20:05'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    13,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Data Entry Operator',
    '\r\n',
    '2025-09-26 21:22:59'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    14,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Security guards',
    'test',
    '2025-09-26 21:23:14'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    15,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Housekeeping and Conservancy',
    '\r\n',
    '2025-09-26 21:23:32'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    16,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Housekeeping and Conservancy',
    '\r\n',
    '2025-09-26 21:24:48'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    17,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Security guards',
    '\r\n',
    '2025-09-26 21:28:56'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    19,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'All types of Manpower Services',
    '\n',
    '2025-09-26 21:30:41'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    20,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Security guards',
    'test \r\n aftee malicouse',
    '2025-09-26 21:34:05'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    23,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '089785537786',
    'Security guards',
    'twst',
    '2025-09-26 21:40:48'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    24,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Security guards',
    'test',
    '2025-09-26 21:47:40'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    25,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Security guards',
    'jai shree ram',
    '2025-09-26 22:06:26'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    26,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Security guards',
    '\r\n',
    '2025-09-26 22:09:52'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    27,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Housekeeping and Conservancy',
    'test',
    '2025-09-26 22:10:32'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    28,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Housekeeping and Conservancy',
    'test2',
    '2025-09-26 22:14:57'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    29,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Data Entry Operator',
    'test',
    '2025-09-26 22:17:32'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    30,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Security guards',
    'ttest34\n\n',
    '2025-09-26 22:18:10'
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    31,
    'sai kiran',
    'saikiran.cmoon@gmail.com',
    '08978553778',
    'Data Entry Operator',
    'jia hanuman',
    '2025-09-26 22:21:56'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: gallery
# ------------------------------------------------------------

INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    4,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758871335/gallery/peatucjyyztkr2uffulu.png',
    'gallery/peatucjyyztkr2uffulu',
    '2025-09-26 12:52:15'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    5,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758871336/gallery/yskgjwmaqutbhgyyjtay.png',
    'gallery/yskgjwmaqutbhgyyjtay',
    '2025-09-26 12:52:17'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    6,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758871339/gallery/gdfo0vyeksevpzz0g5sm.png',
    'gallery/gdfo0vyeksevpzz0g5sm',
    '2025-09-26 12:52:19'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    7,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758871340/gallery/qt1zgguasbskqtamh0ll.png',
    'gallery/qt1zgguasbskqtamh0ll',
    '2025-09-26 12:52:21'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    8,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758871341/gallery/mnmo7yrejr2i1t5zybrx.png',
    'gallery/mnmo7yrejr2i1t5zybrx',
    '2025-09-26 12:52:22'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    9,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758871343/gallery/filg8ie2ojd7bdvdgfso.png',
    'gallery/filg8ie2ojd7bdvdgfso',
    '2025-09-26 12:52:23'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    14,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758879161/gallery/gsxgvd2pzpaw0tudxo2z.png',
    'gallery/gsxgvd2pzpaw0tudxo2z',
    '2025-09-26 15:02:41'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    15,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758879164/gallery/ofca9rclroguotunj4dj.png',
    'gallery/ofca9rclroguotunj4dj',
    '2025-09-26 15:02:45'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    16,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758879169/gallery/op1kzmhmlghuini6wzgx.png',
    'gallery/op1kzmhmlghuini6wzgx',
    '2025-09-26 15:02:50'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    17,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758879178/gallery/hkrdgqfznknmagxsp2k2.png',
    'gallery/hkrdgqfznknmagxsp2k2',
    '2025-09-26 15:02:58'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    18,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758879184/gallery/aaphtu2nwbt3jysdlayl.png',
    'gallery/aaphtu2nwbt3jysdlayl',
    '2025-09-26 15:03:05'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    19,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758879188/gallery/mxizffwz4j7vh6vpucb1.png',
    'gallery/mxizffwz4j7vh6vpucb1',
    '2025-09-26 15:03:08'
  );
INSERT INTO
  `gallery` (`id`, `image_url`, `public_id`, `created_at`)
VALUES
  (
    20,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758879192/gallery/nr4ftkvy6u6ocktiojwr.png',
    'gallery/nr4ftkvy6u6ocktiojwr',
    '2025-09-26 15:03:13'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: home_page_banners
# ------------------------------------------------------------

INSERT INTO
  `home_page_banners` (
    `id`,
    `hero1`,
    `hero2`,
    `hero3`,
    `offer_title`,
    `offer_description`,
    `updated_at`
  )
VALUES
  (
    1,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758864009/home_banners/vgxlek3pmz87vocb987q.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758789764/home_banners/zr9athtp03qoqa0rg6h4.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758790000/home_banners/qlfaa9jk6bptwl2i0mly.jpg',
    'Comprehensive Protection Solutions',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
    '2025-09-26 10:50:11'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: seo_settings
# ------------------------------------------------------------

INSERT INTO
  `seo_settings` (
    `id`,
    `page_slug`,
    `title`,
    `description`,
    `keywords`,
    `og_title`,
    `og_description`,
    `og_image`,
    `twitter_title`,
    `twitter_description`,
    `twitter_image`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'home',
    'Visakha Industrial Security Force | Trusted Industrial Security Services',
    'Visakha Industrial Security Force provides reliable and professional industrial security solutions for factories, warehouses, and corporate sectors. Trusted protection, 24/7 vigilance.',
    'Visakha Industrial Security Force, industrial security services, factory security, warehouse protection, corporate security solutions, private security force, professional security guards, industrial safety, 24/7 security services',
    'Visakha Industrial Security Force | Trusted Industrial Security Services',
    'Reliable and professional industrial security solutions for factories, warehouses, and corporates. 24/7 protection you can trust.',
    'https://www.visakhasecurityforce.com/images/og-banner.jpg',
    'Visakha Industrial Security Force | Trusted Industrial Security Services',
    'Reliable and professional industrial security solutions for factories, warehouses, and corporates. 24/7 protection you can trust.',
    'https://www.visakhasecurityforce.com/images/og-banner.jpg',
    '2025-09-26 19:04:38',
    '2025-09-26 19:04:38'
  );
INSERT INTO
  `seo_settings` (
    `id`,
    `page_slug`,
    `title`,
    `description`,
    `keywords`,
    `og_title`,
    `og_description`,
    `og_image`,
    `twitter_title`,
    `twitter_description`,
    `twitter_image`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    'services',
    'Our Security Services | Visakha Industrial Security Force',
    'Explore our industrial security services including factory security, warehouse protection, and corporate safety solutions tailored to your needs.',
    'industrial security, factory security, warehouse protection, corporate security solutions, professional security guards',
    'Our Security Services | Visakha Industrial Security Force',
    'Comprehensive industrial security services for factories, warehouses, and corporate sectors. 24/7 professional security.',
    'https://www.visakhasecurityforce.com/images/services-og.jpg',
    'Our Security Services | Visakha Industrial Security Force',
    'Comprehensive industrial security services for factories, warehouses, and corporate sectors. 24/7 professional security.',
    'https://www.visakhasecurityforce.com/images/services-og.jpg',
    '2025-09-26 19:04:38',
    '2025-09-26 19:04:38'
  );
INSERT INTO
  `seo_settings` (
    `id`,
    `page_slug`,
    `title`,
    `description`,
    `keywords`,
    `og_title`,
    `og_description`,
    `og_image`,
    `twitter_title`,
    `twitter_description`,
    `twitter_image`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3,
    'contact',
    'Contact Us | Visakha Industrial Security Force',
    'Get in touch with Visakha Industrial Security Force for inquiries, quotes, or consultations regarding our industrial security services.',
    'contact Visakha Industrial Security Force, industrial security inquiries, security services consultation',
    'Contact Us | Visakha Industrial Security Force',
    'Reach out to Visakha Industrial Security Force for professional industrial security solutions. We are here to help 24/7.',
    'https://www.visakhasecurityforce.com/images/contact-og.jpg',
    'Contact Us | Visakha Industrial Security Force',
    'Reach out to Visakha Industrial Security Force for professional industrial security solutions. We are here to help 24/7.',
    'https://www.visakhasecurityforce.com/images/contact-og.jpg',
    '2025-09-26 19:04:38',
    '2025-09-26 19:04:38'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: services
# ------------------------------------------------------------

INSERT INTO
  `services` (
    `id`,
    `title`,
    `description`,
    `image_url`,
    `slug`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    4,
    'Security Guards ',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &amp;#39;Content here, content here&amp;#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &amp;#39;lorem ipsum&amp;#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
    '/images/service-1.jpg',
    'security-guards',
    '2025-09-25 15:59:14',
    '2025-09-25 22:05:00'
  );
INSERT INTO
  `services` (
    `id`,
    `title`,
    `description`,
    `image_url`,
    `slug`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    5,
    'Housekeeping and Conservancy',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
    '/images/service-2.jpg',
    'housekeeping-and-conservancy',
    '2025-09-25 15:59:14',
    '2025-09-25 15:59:14'
  );
INSERT INTO
  `services` (
    `id`,
    `title`,
    `description`,
    `image_url`,
    `slug`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    6,
    'Data Entry Operator',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
    '/images/service-3.jpg',
    'data-entry-operator',
    '2025-09-25 15:59:14',
    '2025-09-25 15:59:14'
  );
INSERT INTO
  `services` (
    `id`,
    `title`,
    `description`,
    `image_url`,
    `slug`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    7,
    'All Types of Manpower Services',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
    '/images/service-4.jpg',
    'manpower-services',
    '2025-09-25 15:59:14',
    '2025-09-25 15:59:14'
  );
INSERT INTO
  `services` (
    `id`,
    `title`,
    `description`,
    `image_url`,
    `slug`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    8,
    'IT and Consulting Services',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
    '/images/service-5.jpg',
    'it-and-consulting-services',
    '2025-09-25 15:59:14',
    '2025-09-25 15:59:14'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: site_settings
# ------------------------------------------------------------

INSERT INTO
  `site_settings` (
    `id`,
    `site_name`,
    `description`,
    `logo1_url`,
    `public_id_logo1`,
    `logo2_url`,
    `public_id_logo2`,
    `favicon_url`,
    `public_id_favicon`,
    `email`,
    `phone`,
    `address`,
    `facebook_url`,
    `whatsapp_url`,
    `instagram_url`,
    `twitter_url`,
    `linkedin_url`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Vishaka Industrial ',
    'Leading industrial solutions provider specialized in high-quality products.',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758892295/site_settings/hz422a94yblujc2zrz16.png',
    'site_settings/hz422a94yblujc2zrz16',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758892296/site_settings/lpomnggswaq4fhur8fyr.png',
    'site_settings/lpomnggswaq4fhur8fyr',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758892297/site_settings/jmhwxflfd9mya2topyai.png',
    'site_settings/jmhwxflfd9mya2topyai',
    'info@vishaka.com',
    '+91-9876543210',
    '123 Industrial Road, Mumbai, India',
    'https://facebook.com/vishaka',
    'https://wa.me/919876543210',
    'https://instagram.com/vishaka',
    'https://twitter.com/vishaka',
    'https://linkedin.com/company/vishaka',
    '2025-09-26 18:02:27',
    '2025-09-26 18:41:38'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: testimonial_entries
# ------------------------------------------------------------

INSERT INTO
  `testimonial_entries` (
    `id`,
    `testimonial_text`,
    `client_name`,
    `designation`,
    `client_image`,
    `created_at`,
    `public_id`,
    `updated_at`
  )
VALUES
  (
    1,
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.',
    'Revathimaheshwar ',
    'Designation here',
    '/images/testimonial/testi_4_1.png',
    '2025-09-26 15:22:07',
    NULL,
    '2025-09-26 16:10:59'
  );
INSERT INTO
  `testimonial_entries` (
    `id`,
    `testimonial_text`,
    `client_name`,
    `designation`,
    `client_image`,
    `created_at`,
    `public_id`,
    `updated_at`
  )
VALUES
  (
    2,
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod, urna eu tincidunt consectetur, nisi nunc consectetur nisi, euismod euismod nisi nunc euismod nisi.',
    'John Doe',
    'CEO, Company X',
    '/images/testimonial/testi_4_2.png',
    '2025-09-26 15:22:07',
    NULL,
    '2025-09-26 15:36:41'
  );
INSERT INTO
  `testimonial_entries` (
    `id`,
    `testimonial_text`,
    `client_name`,
    `designation`,
    `client_image`,
    `created_at`,
    `public_id`,
    `updated_at`
  )
VALUES
  (
    3,
    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    'Jane Smith ',
    'Marketing Head',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758882833/testimonials/g6t4bzydk7ujeswc7gju.png',
    '2025-09-26 15:22:07',
    'testimonials/g6t4bzydk7ujeswc7gju',
    '2025-09-26 16:03:53'
  );
INSERT INTO
  `testimonial_entries` (
    `id`,
    `testimonial_text`,
    `client_name`,
    `designation`,
    `client_image`,
    `created_at`,
    `public_id`,
    `updated_at`
  )
VALUES
  (
    4,
    'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.',
    'Michael Lee',
    'CTO, Company Y',
    '/images/testimonial/testi_4_4.png',
    '2025-09-26 15:22:07',
    NULL,
    '2025-09-26 15:36:41'
  );
INSERT INTO
  `testimonial_entries` (
    `id`,
    `testimonial_text`,
    `client_name`,
    `designation`,
    `client_image`,
    `created_at`,
    `public_id`,
    `updated_at`
  )
VALUES
  (
    5,
    'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.',
    'Emily Clark ',
    'Manager',
    '/images/testimonial/testi_4_1.png',
    '2025-09-26 15:22:07',
    NULL,
    '2025-09-26 16:11:06'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: testimonial_section
# ------------------------------------------------------------

INSERT INTO
  `testimonial_section` (
    `id`,
    `sub_title`,
    `title`,
    `side_image1`,
    `side_image2`,
    `created_at`,
    `subtitle`,
    `description`
  )
VALUES
  (
    1,
    'What Client Say About us',
    'Testimonial ',
    '/images/testimonial/testi-img1.jpg',
    '/images/testimonial/testi-img2.jpg',
    '2025-09-26 15:21:54',
    'p',
    'p'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: who_we_are_section
# ------------------------------------------------------------

INSERT INTO
  `who_we_are_section` (
    `id`,
    `title`,
    `sub_title`,
    `description`,
    `image1`,
    `image2`,
    `image3`,
    `custom_heading`,
    `custom_description`,
    `technical_heading`,
    `technical_description`,
    `created_at`,
    `status`,
    `is_active`,
    `public_id1`,
    `public_id2`,
    `public_id3`,
    `updated_at`
  )
VALUES
  (
    1,
    'Who We Are ',
    'Because Security Deserves Experts',
    '<p>A software development company specializes in designing, developing, and deploying software applications tailored to meet specific client needs. These companies combine technical expertise with innovative strategies to deliver cutting-edge solutions for businesses across various industries. From mobile apps to enterprise software, their services ensure that clients can achieve operational efficiency, scalability.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758888914/who_we_are/m9tvhtrifmaupot1kpqt.jpg',
    '/images/why-image-3.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758888915/who_we_are/krnpeqpdrbpyqnhvwjhr.jpg',
    'Custom Solutions',
    '<p>Development tailored to specific business needs, ensuring better alignment with goals.</p>',
    'Technical Expertise',
    '<p>Access to a team of skilled developers, designers, and project managers.&nbsp;<br>&nbsp;</p>',
    '2025-09-26 16:56:55',
    'active',
    1,
    'who_we_are/m9tvhtrifmaupot1kpqt',
    NULL,
    'who_we_are/krnpeqpdrbpyqnhvwjhr',
    '2025-09-26 17:45:16'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
