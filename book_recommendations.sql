-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 15, 2024 at 05:54 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_recommendations`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `description` text,
  `rating` float DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `genre`, `description`, `rating`, `cover_image`) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 'A novel set in the Roaring Twenties.', 4.5, 'gatsby.jpeg'),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 'A story about racial injustice in the Deep South.', 4.8, 'mockingbird.jpeg'),
(3, '1984', 'George Orwell', 'Dystopian', 'A novel about a totalitarian regime.', 4.7, '1984.jpeg'),
(4, 'The magic of the lost temple', 'Sudha Murty', 'interesting stories', 'It consist of several interesting tales and stories ', 5, 'losttemple.jpeg'),
(5, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 'A fantasy novel about the journey of Bilbo Baggins, a hobbit who becomes an unlikely hero.', 4.8, 'hobbit.jpeg'),
(6, 'Dune', 'Frank Herbert', 'Science Fiction', 'Set in the distant future, Dune tells the story of a young nobleman caught in a struggle for control of the desert planet Arrakis.', 4.7, 'dune.jpeg'),
(7, 'Murder on the Orient Express', 'Agatha Christie', 'Mystery', 'A detective novel featuring Hercule Poirot, who must solve a murder aboard the luxurious Orient Express train.', 4.5, 'orient_express.jpeg'),
(8, 'Pride and Prejudice', 'Jane Austen', 'Romance', 'A classic romance novel exploring the themes of love, marriage, and social class in 19th-century England.', 4.7, 'pride_prejudice.jpeg'),
(9, 'The Catcher in the Rye', 'J.D. Salinger', 'Classic', 'A novel that captures the struggles of teenage rebellion and alienation through the eyes of Holden Caulfield.', 4.3, 'catcher_rye.jpeg'),
(10, 'The Da Vinci Code', 'Dan Brown', 'Thriller', 'A thrilling mystery involving secret societies, religious symbology, and a fast-paced chase through Europe.', 4.2, 'da_vinci_code.jpeg'),
(11, 'The Road', 'Cormac McCarthy', 'Post-Apocalyptic', 'A haunting tale of a father and son journeying through a bleak, post-apocalyptic world.', 4.1, 'the_road.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `review` text NOT NULL,
  `rating` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `review`, `rating`, `created_at`) VALUES
(1, NULL, 'nice', 4, '2024-08-14 05:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'mansi', '#@123');

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
CREATE TABLE IF NOT EXISTS `user_interests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `favorite_genre` varchar(255) DEFAULT NULL,
  `favorite_author` varchar(255) DEFAULT NULL,
  `reading_frequency` varchar(50) DEFAULT NULL,
  `preferred_language` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_interests`
--

INSERT INTO `user_interests` (`id`, `favorite_genre`, `favorite_author`, `reading_frequency`, `preferred_language`, `user_id`) VALUES
(1, 'thriller', 'Ruskin Bond', 'Weekly', 'english', 0),
(3, 'Fantasy', 'J.R.R. Tolkien', 'Weekly', 'English', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
