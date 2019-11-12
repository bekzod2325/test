-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 06 2019 г., 18:28
-- Версия сервера: 5.6.37
-- Версия PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `abc`
--

CREATE TABLE `abc` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `abc`
--

INSERT INTO `abc` (`id`, `name`, `image`) VALUES
(1, 'werty', '');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `keywords`, `description`) VALUES
(1, 0, 'Sportswear', NULL, NULL),
(2, 0, 'Mens', NULL, NULL),
(3, 0, 'Womens', NULL, NULL),
(4, 1, 'Nike', NULL, NULL),
(5, 1, 'Under Armour', NULL, NULL),
(6, 1, 'Adiddas', '', ''),
(7, 1, 'Puma', NULL, NULL),
(8, 1, 'Asics', NULL, NULL),
(9, 2, 'Fendi', '', ''),
(10, 2, 'Guess', NULL, NULL),
(11, 2, 'Valentino', NULL, NULL),
(12, 2, 'Dior', NULL, NULL),
(13, 2, 'Versace', NULL, NULL),
(14, 2, 'Armani', NULL, NULL),
(15, 2, 'Prada', NULL, NULL),
(16, 2, 'Dolce and Gabbana', NULL, NULL),
(17, 2, 'Chanel', NULL, NULL),
(18, 2, 'Gucci', NULL, NULL),
(19, 3, 'Fendi', NULL, NULL),
(20, 3, 'Guess', NULL, NULL),
(21, 3, 'Valentino', NULL, NULL),
(22, 3, 'Dior', NULL, NULL),
(23, 3, 'Versace', NULL, NULL),
(24, 0, 'Kids', NULL, NULL),
(25, 0, 'Fashion', NULL, NULL),
(26, 0, 'Households', NULL, NULL),
(27, 0, 'Interiors', NULL, NULL),
(28, 0, 'Clothing', NULL, NULL),
(29, 0, 'Bags', 'Sumka', 'Sumka haqida tekst'),
(30, 0, 'Shoes', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `filePath` varchar(400) NOT NULL,
  `itemId` int(11) DEFAULT NULL,
  `isMain` tinyint(1) DEFAULT NULL,
  `modelName` varchar(150) NOT NULL,
  `urlAlias` varchar(400) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1565896351),
('m140622_111540_create_image_table', 1565896374),
('m140622_111545_add_name_to_image_table', 1565896375);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `qty` int(10) NOT NULL,
  `sum` float NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `created_at`, `updated_at`, `qty`, `sum`, `status`, `name`, `email`, `phone`, `address`) VALUES
(3, '2019-08-10 23:05:12', '2019-08-10 23:05:12', 2, 33, '1', 'bmn', 'b@m.uz', '123', 'qwerty'),
(4, '2019-08-11 15:36:18', '2019-08-11 15:36:18', 1, 50, '0', 'bmn', 'b@m.uz', '123', '4564as'),
(5, '2019-08-13 13:49:23', '2019-08-13 13:49:23', 4, 200, '1', 'bmn', 'b@m.uz', '123134', '4564as'),
(6, '2019-08-15 23:10:58', '2019-08-15 23:10:58', 3, 260, '0', 'bmn', 'b@m.uz', '123134', '4564as');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `qty_item` int(11) NOT NULL,
  `sum_item` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name`, `price`, `qty_item`, `sum_item`) VALUES
(1, 3, 7, 'Bularga kimyoviy tuzilishi va taʼsir mexanizmi turlicha dori moddalari kiradi.', 20, 1, 20),
(2, 3, 6, 'Bularga kimyoviy tuzilishi va taʼsir mexanizmi turlicha dori moddalari kiradi.', 13, 1, 13),
(3, 4, 10, 'Dorivor preparatlar – ishlatiladigan dorilar. Ular toksik, kuchli va umumiy maqsadlarga ajratiladi. Davolanish vaqtida doza tugri tekshirilishi muhim ahamiyatga ega.', 50, 1, 50),
(4, 5, 10, 'Dorivor preparatlar – ishlatiladigan dorilar. Ular toksik, kuchli va umumiy maqsadlarga ajratiladi. Davolanish vaqtida doza tugri tekshirilishi muhim ahamiyatga ega.', 50, 4, 200),
(5, 6, 13, 'asdfg', 123, 2, 246),
(6, 6, 3, 'Dorilar', 14, 1, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text,
  `price` float NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `hit` enum('0','1') NOT NULL,
  `new` enum('0','1') NOT NULL,
  `sale` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `content`, `price`, `keywords`, `description`, `img`, `hit`, `new`, `sale`) VALUES
(1, 29, 'Jinsi sumka', '\'query\' => Product::find()->with(\'category\'), --- xatolik chiqarishi mumkin', 15, '', '', 'product1.jpg', '0', '0', '0'),
(2, 27, 'Futbolka', 'Dorilar odatda tabletkalar, iksirlar, changlar va boshqalar deb ataladi. Biroq, bular faqat shu yoki boshqa terapevtik agentlarning dorivor shakllari.', 20, '', '', 'product2.jpg', '1', '0', '0'),
(3, 9, 'Ayollar ko`ylagi', '<p>odatda tabletkalar, iksirlar, changlar va boshqalar deb ataladi. Biroq, bular faqat shu yoki boshqa terapevtik agentlarning dorivor shakllari.</p>\r\n', 14, '', '', 'product3.jpg', '1', '1', '0'),
(4, 21, 'Bazm ko`ylagi', 'moddalarining dorivor dozalari odatda milligramdan va hatto milligramning fraktsiyalaridan iborat bulib, natijada butunlay bunday moddadan tashkil topgan planshet mikroskopik hajmga ega buladi', 25, NULL, NULL, 'product4.jpg', '1', '0', '1'),
(5, 25, 'Ko`k ko`fta', '<p>Bularga kimyoviy tuzilishi va taʼsir mexanizmi turlicha dori moddalari kiradi.</p>\r\n', 30, '', '', 'product5.jpg', '1', '0', '0'),
(6, 28, 'Oq futbolka', ' Bularga kimyoviy tuzilishi va taʼsir mexanizmi turlicha dori moddalari kiradi.', 13, NULL, NULL, 'product6.jpg', '1', '0', '0'),
(7, 28, 'Qora shim', ' Bularga kimyoviy tuzilishi va taʼsir mexanizmi turlicha dori moddalari kiradi.', 20, NULL, NULL, 'no-image.png', '1', '1', '0'),
(8, 26, 'Qora shim', 'Dorilar odatda tabletkalar, iksirlar, changlar va boshqalar deb ataladi. Biroq, bular faqat shu yoki boshqa terapevtik agentlarning dorivor shakllari.', 66, NULL, NULL, 'no-image.png', '0', '0', '1'),
(9, 26, 'Ayollar ko`ylagi', 'Ananaviy tabletka butunlay faol moddadan iborat bulishi mumkin, lekin kupincha yordamchi, dorivor bulmagan moddalar bilan aralashmasidir.', 90, NULL, NULL, 'product3.jpg', '0', '0', '0'),
(10, 29, 'Sumka', 'Dorivor preparatlar – ishlatiladigan dorilar. Ular toksik, kuchli va umumiy maqsadlarga ajratiladi. Davolanish vaqtida doza tugri tekshirilishi muhim ahamiyatga ega.', 50, NULL, NULL, 'product4.jpg', '0', '1', '0'),
(11, 29, 'Qora sumka', 'Ogʻriq qoldiruvchi dorilar - ogʻriq sezgisini yoʻqotuvchi yoki kamaytiruvchi dorilar. Bularga kimyoviy tuzilishi va taʼsir mexanizmi turlicha dori moddalari kiradi.', 45, NULL, NULL, 'no-image.png', '0', '0', '1'),
(12, 29, 'Qora shim', 'Ogʻriq qoldiruvchi dorilar - ogʻriq sezgisini yoʻqotuvchi yoki kamaytiruvchi dorilar. Bularga kimyoviy tuzilishi va taʼsir mexanizmi turlicha dori moddalari kiradi.', 60, NULL, NULL, 'no-image.png', '0', '0', '0'),
(13, 14, 'Bazm ko`ylagi', '<p><strong>aesdzfddsd</strong></p>\r\n', 123, '', '', 'product4.jpg', '0', '1', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `auth_key`) VALUES
(1, 'admin', '$2y$13$eee1Cv6u7inko03xX9rK8OU6e7fyAQxrQISrtdq8Nzpjcq4uyfOsK', 'dYLKlzJ3klqS3ErBh07G99BZ260uFAtM');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `abc`
--
ALTER TABLE `abc`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `abc`
--
ALTER TABLE `abc`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
