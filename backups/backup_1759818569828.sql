/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: about_us
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `about_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `home_heading` varchar(255) DEFAULT NULL,
  `home_description` text,
  `home_image` varchar(255) DEFAULT NULL,
  `comparison_heading` varchar(255) DEFAULT NULL,
  `comparison_description` text,
  `comparison_image` varchar(255) DEFAULT NULL,
  `reviews_heading` varchar(255) DEFAULT NULL,
  `reviews_description` text,
  `reviews_image` varchar(255) DEFAULT NULL,
  `loan_heading` varchar(255) DEFAULT NULL,
  `loan_description` text,
  `loan_image` varchar(255) DEFAULT NULL,
  `expertise_heading` varchar(255) DEFAULT NULL,
  `expertise_description` text,
  `expertise_image` varchar(255) DEFAULT NULL,
  `about_heading` varchar(255) DEFAULT NULL,
  `about_description` longtext,
  `about_image` varchar(255) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: admin_logins
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `admin_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: contact_submissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `contact_submissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: faq_section
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `faq_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_subtitle` varchar(255) DEFAULT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: faqs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: hero_services
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `hero_services` (
  `id` int NOT NULL DEFAULT '1',
  `hero_header` varchar(255) NOT NULL,
  `hero_description` text NOT NULL,
  `hero_image` varchar(255) DEFAULT NULL,
  `services_heading` varchar(255) NOT NULL,
  `services_description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: home_counts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `home_counts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_services_heading` varchar(255) DEFAULT NULL,
  `total_services_number` int DEFAULT NULL,
  `total_services_image` varchar(255) DEFAULT NULL,
  `customer_satisfaction_heading` varchar(255) DEFAULT NULL,
  `customer_satisfaction_number` int DEFAULT NULL,
  `customer_satisfaction_image` varchar(255) DEFAULT NULL,
  `compare_loan_heading` varchar(255) DEFAULT NULL,
  `compare_loan_number` int DEFAULT NULL,
  `compare_loan_image` varchar(255) DEFAULT NULL,
  `awards_won_heading` varchar(255) DEFAULT NULL,
  `awards_won_number` int DEFAULT NULL,
  `awards_won_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(191) DEFAULT NULL,
  `logo_url` varchar(1024) DEFAULT NULL,
  `favicon_url` varchar(1024) DEFAULT NULL,
  `facebook_url` varchar(1024) DEFAULT NULL,
  `instagram_url` varchar(1024) DEFAULT NULL,
  `whatsapp_url` varchar(1024) DEFAULT NULL,
  `twitter_url` varchar(1024) DEFAULT NULL,
  `youtube_url` varchar(1024) DEFAULT NULL,
  `emails` text,
  `address` text,
  `phone_numbers` text,
  `meta` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: testimonials
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: testimonials_section
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `testimonials_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_subtitle` varchar(255) DEFAULT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: why_choose_us
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `why_choose_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_heading` varchar(255) DEFAULT NULL,
  `section_description` text,
  `section_image` varchar(500) DEFAULT NULL,
  `point_1` varchar(255) DEFAULT NULL,
  `point_2` varchar(255) DEFAULT NULL,
  `point_3` varchar(255) DEFAULT NULL,
  `point_4` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: about_us
# ------------------------------------------------------------

INSERT INTO
  `about_us` (
    `id`,
    `home_heading`,
    `home_description`,
    `home_image`,
    `comparison_heading`,
    `comparison_description`,
    `comparison_image`,
    `reviews_heading`,
    `reviews_description`,
    `reviews_image`,
    `loan_heading`,
    `loan_description`,
    `loan_image`,
    `expertise_heading`,
    `expertise_description`,
    `expertise_image`,
    `about_heading`,
    `about_description`,
    `about_image`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Your Trusted Source for Loan Reviews and  Comparison  ',
    '<p>We are dedicated to providing you with a reliable and user-friendly platform for loan reviews and comparison. With a mission to simplify the loan selection&nbsp;</p>\r\n<p>&nbsp;</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759740656/hero_images/q5kgg3e9bmpczwr1hopg.png',
    'Transparent Comparison',
    '<p>Our user-friendly loan comparison tools allow you to effortlessly</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759741851/hero_images/xf8a278gzn3xdcme2itj.svg',
    'Reviews and Ratings',
    '<p>We pride ourselves on providing unbiased loan reviews&nbsp;</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759741853/hero_images/zo1qc7bm3n4fh9k2jezf.svg',
    'Loan Database',
    '<p>We have curated a comprehensive database of loan products</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759741855/hero_images/uwweedl1bwy1nre8qowj.svg',
    'Expertise & Objectivity',
    '<p>With years of experience in the financial industry</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759741655/hero_images/qgk6dh9w06lowojc9azc.svg',
    'Your Trusted Source for Loan Reviews and Comparisons.',
    '<p>At My Loan <strong>Bazaar</strong>, we simplify the complex world of borrowing by offering a reliable, transparent, and user-friendly platform for loan reviews and comparisons. Our mission is to empower individuals and businesses with the right knowledge, tools, and insights to make informed financial decisions.<br><br></p>\r\n<p>With years of expertise in the financial industry, our team is committed to bringing you comprehensive loan databases, unbiased reviews, and side-by-side comparisons of loan products across categories&mdash;from personal loans, home loans, and business loans to education loans, mortgages, car loans, LAP loans, credit cards, and more.<br><br></p>\r\n<p>We believe in expertise, objectivity, and transparency. That&rsquo;s why our platform is built on thorough research and data-driven insights, ensuring that you get accurate, up-to-date, and easy-to-understand information.<br><br></p>\r\n<p>At My Loan Bazaar, we don&rsquo;t just list loan options&mdash;we help you find the perfect loan for your needs by combining expert guidance, real customer reviews, and interactive comparison tools.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759729272/hero_images/lmr331hefq9leaktnfd8.avif',
    '2025-10-06 11:04:53',
    '2025-10-06 14:40:56'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: admin
# ------------------------------------------------------------

INSERT INTO
  `admin` (`id`, `username`, `password`, `created_at`)
VALUES
  (
    1,
    'admin',
    '$2b$10$7ZN4qKNH291kCxt/Aqocde6YrQhp.IHFewAO54EGWcNYEnalkKJ3C',
    '2025-10-07 11:26:31'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: admin_logins
# ------------------------------------------------------------

INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    1,
    'admin',
    '127.0.0.1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/141.0.0.0 Safari/537.36',
    '2025-10-07 11:41:35'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    2,
    'admin',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-07 11:44:29'
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
    1,
    'John Doe',
    'johndoe@example.com',
    '+1234567890',
    'Inquiry about loans',
    'Hello, I would like to know more about your loan services. Please contact me.',
    '2025-10-07 11:52:30'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: faq_section
# ------------------------------------------------------------

INSERT INTO
  `faq_section` (
    `id`,
    `section_subtitle`,
    `section_title`,
    `section_description`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Frequently Asked Questions ',
    'Find Answers to Common Questions',
    'We\'ve compiled a list of frequently asked questions to provide you with quick and helpful answers. If you have a question that is not addressed below',
    '2025-10-06 17:50:26',
    '2025-10-06 18:53:14'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: faqs
# ------------------------------------------------------------

INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'How do I apply for a loan through your platform?  ',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 18:57:47'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    'What types of loans do you review and compare?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3,
    'Can I trust the information provided on your website?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    4,
    'Do you offer financial advice or recommendations?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    5,
    'Can I get a loan with bad credit?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    6,
    'Are there any fees associated with taking out a loan?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    7,
    'What happens if I miss a loan payment?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    8,
    'Can I repay my loan early?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    9,
    'Can I refinance my existing loan?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: hero_services
# ------------------------------------------------------------

INSERT INTO
  `hero_services` (
    `id`,
    `hero_header`,
    `hero_description`,
    `hero_image`,
    `services_heading`,
    `services_description`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Find the Perfect Loan for Your Needs  ',
    'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator. \r\n',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759743298/hero_images/xxq6cmmctlno122uaxfk.png',
    'Empowering You with Loan Knowledge and Comparison Tools ',
    'We are dedicated to providing you with valuable services that simplify your loan search and empower you to make informed borrowing decisions. Our comprehensive range of services ',
    '2025-10-04 12:51:55',
    '2025-10-06 15:04:58'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: home_counts
# ------------------------------------------------------------

INSERT INTO
  `home_counts` (
    `id`,
    `total_services_heading`,
    `total_services_number`,
    `total_services_image`,
    `customer_satisfaction_heading`,
    `customer_satisfaction_number`,
    `customer_satisfaction_image`,
    `compare_loan_heading`,
    `compare_loan_number`,
    `compare_loan_image`,
    `awards_won_heading`,
    `awards_won_number`,
    `awards_won_image`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Total Services ',
    10,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759745143/hero_images/l5lmhxtcp2bajyqtajks.svg',
    'Customer Satisfaction',
    1,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759745145/hero_images/i9vxvnh1uvozze9a4qf3.svg',
    'Compare Loan',
    1,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759745146/hero_images/vtdydicl0vpjb6lwvjcg.svg',
    'Awards Won',
    4,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759745308/hero_images/i8peroo2e5vhr4hrois0.svg',
    '2025-10-06 14:43:22',
    '2025-10-06 15:39:51'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: settings
# ------------------------------------------------------------

INSERT INTO
  `settings` (
    `id`,
    `site_name`,
    `logo_url`,
    `favicon_url`,
    `facebook_url`,
    `instagram_url`,
    `whatsapp_url`,
    `twitter_url`,
    `youtube_url`,
    `emails`,
    `address`,
    `phone_numbers`,
    `meta`,
    `is_active`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'My Loan Bazar',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759816081/hero_images/fjg3534v3tnkvjsxvzrr.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759815294/favicon_gbj4o7.png',
    'https://my-loan-bazar.com/facebook',
    'https://my-loan-bazar.com/instagram',
    'https://my-loan-bazar.com/whatsapp',
    'https://my-loan-bazar.com/twitter',
    'https://my-loan-bazar.com/youtube',
    'info@myloanbazar.com, support@myloanbazar.com',
    'Royal Ln. Mesa, New Jersey 45463',
    '(123) 456-7891, (907) 456-7891',
    NULL,
    1,
    '2025-10-07 10:12:26',
    '2025-10-07 11:18:02'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: testimonials
# ------------------------------------------------------------

INSERT INTO
  `testimonials` (
    `id`,
    `name`,
    `designation`,
    `content`,
    `image`,
    `created_at`
  )
VALUES
  (
    1,
    'John Doe  ',
    'CEO, Example Corp',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759752684/hero_images/gbbxbgh2adqzb3qnmk7y.png',
    '2025-10-06 16:36:36'
  );
INSERT INTO
  `testimonials` (
    `id`,
    `name`,
    `designation`,
    `content`,
    `image`,
    `created_at`
  )
VALUES
  (
    2,
    'Jane Smith',
    'Marketing Manager',
    'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.',
    '/images/testimonials2.png',
    '2025-10-06 16:36:36'
  );
INSERT INTO
  `testimonials` (
    `id`,
    `name`,
    `designation`,
    `content`,
    `image`,
    `created_at`
  )
VALUES
  (
    3,
    'Michael Johnson',
    'Product Designer',
    'Our experience with this company has been exceptional, delivering quality services consistently.',
    '/images/testimonials3.png',
    '2025-10-06 16:36:36'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: testimonials_section
# ------------------------------------------------------------

INSERT INTO
  `testimonials_section` (
    `id`,
    `section_subtitle`,
    `section_title`,
    `section_description`,
    `created_at`
  )
VALUES
  (
    1,
    'Client Testimonials   ',
    'Success Stories Shared by Our Customers',
    'Feel free to customize the text with actual client testimonials, ensuring you have their permission to use their names and occupations',
    '2025-10-06 16:35:50'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: why_choose_us
# ------------------------------------------------------------

INSERT INTO
  `why_choose_us` (
    `id`,
    `section_heading`,
    `section_description`,
    `section_image`,
    `point_1`,
    `point_2`,
    `point_3`,
    `point_4`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Experience Excellence in Loan Review and Comparison  ',
    'Our dedicated team of experts conducts thorough research and analysis to provide you with comprehensive and unbiased reviews of various loan options.',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759748155/hero_images/awyvm3sidxblexhwto3o.jpg',
    'Comprehensive and Reviews',
    'Expert Guidance and Insights',
    'User-Friendly Comparison',
    'Trusted User Reviews',
    '2025-10-06 15:44:19',
    '2025-10-06 16:25:56'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
