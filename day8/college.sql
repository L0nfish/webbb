-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 19 2020 г., 11:38
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `college`
--

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_classroom`
--

CREATE TABLE `gromov_classroom` (
  `classroom_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_classroom`
--

INSERT INTO `gromov_classroom` (`classroom_id`, `name`) VALUES
(1, 'Информатика'),
(2, 'ООП программирование'),
(3, 'Веб-программирование');

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_course`
--

CREATE TABLE `gromov_course` (
  `course_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_id` int(11) NOT NULL,
  `hours` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_course`
--

INSERT INTO `gromov_course` (`course_id`, `name`, `special_id`, `hours`) VALUES
(1, 'Основы алгоритмизации', 1, 90),
(2, 'Электротехника ', 3, 106),
(3, 'Основы алгоритмизации', 5, 52),
(4, 'Мультимедия технологии', 1, 36),
(5, 'Техническая механика', 6, 96),
(6, 'Промышленная электротехника', 4, 108),
(7, 'Автоматизированные информационные системы', 1, 86);

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_day`
--

CREATE TABLE `gromov_day` (
  `day_id` tinyint(4) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_day`
--

INSERT INTO `gromov_day` (`day_id`, `name`) VALUES
(1, 'понедельник'),
(2, 'вторник'),
(3, 'среда'),
(4, 'четверг'),
(5, 'пятница'),
(6, 'суббота'),
(7, 'воскресенье');

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_gender`
--

CREATE TABLE `gromov_gender` (
  `gender_id` tinyint(4) NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_gender`
--

INSERT INTO `gromov_gender` (`gender_id`, `name`) VALUES
(1, 'мужской'),
(2, 'женский');

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_graduate`
--

CREATE TABLE `gromov_graduate` (
  `graduate_id` int(11) NOT NULL,
  `gruppa_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_graduate`
--

INSERT INTO `gromov_graduate` (`graduate_id`, `gruppa_id`, `course_id`, `user_id`) VALUES
(1, 4, 3, 3),
(2, 2, 4, 5),
(3, 1, 7, 2),
(4, 6, 5, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_graduate_time`
--

CREATE TABLE `gromov_graduate_time` (
  `graduate_time_id` int(11) NOT NULL,
  `graduate_id` int(11) NOT NULL,
  `day_id` tinyint(4) NOT NULL,
  `lesson_num_id` int(11) NOT NULL,
  `calssroom_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_graduate_time`
--

INSERT INTO `gromov_graduate_time` (`graduate_time_id`, `graduate_id`, `day_id`, `lesson_num_id`, `calssroom_id`) VALUES
(1, 1, 2, 1, 1),
(2, 3, 5, 3, 1),
(3, 2, 5, 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_gruppa`
--

CREATE TABLE `gromov_gruppa` (
  `gruppa_id` int(11) NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_id` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_gruppa`
--

INSERT INTO `gromov_gruppa` (`gruppa_id`, `name`, `special_id`, `date_begin`, `date_end`) VALUES
(1, '101 ИС', 1, '2016-09-01', '2020-07-01'),
(2, '102 АС', 3, '2016-09-01', '2020-07-01'),
(3, '302 ИС', 1, '2014-09-01', '2018-07-01'),
(4, '302 АС', 3, '2014-09-01', '2018-07-01'),
(5, '202 С', 6, '2015-09-01', '2019-07-01'),
(6, '404 П', 5, '2014-09-01', '2017-07-01'),
(7, '303 Эл', 4, '2014-09-01', '2018-07-01');

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_lesson_num`
--

CREATE TABLE `gromov_lesson_num` (
  `lesson_num_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_lesson` time NOT NULL,
  `year_lesson` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_lesson_num`
--

INSERT INTO `gromov_lesson_num` (`lesson_num_id`, `name`, `time_lesson`, `year_lesson`) VALUES
(1, 'Информационные системы', '13:32:32', 2014),
(2, 'Автоматизация и управление', '13:33:17', 2015),
(3, 'Электротехника', '18:33:43', 2015),
(4, 'Техническая механика', '17:34:51', 2015);

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_otdel`
--

CREATE TABLE `gromov_otdel` (
  `otdel_id` smallint(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_otdel`
--

INSERT INTO `gromov_otdel` (`otdel_id`, `name`) VALUES
(1, 'Информационные системы'),
(2, 'Технические специальности'),
(3, 'Автоматизация и управление');

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_special`
--

CREATE TABLE `gromov_special` (
  `special_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otdel_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_special`
--

INSERT INTO `gromov_special` (`special_id`, `name`, `otdel_id`) VALUES
(1, 'Информационные системы', 1),
(2, 'Нефтегазовое дело', 2),
(3, 'Автоматизация и управление', 3),
(4, 'Электроснабжение', 3),
(5, 'программное обеспечение ВТ и ПО', 1),
(6, 'Строительство и эксплуатация зданий и сооружений', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_student`
--

CREATE TABLE `gromov_student` (
  `user_id` bigint(20) NOT NULL,
  `gruppa_id` int(11) NOT NULL,
  `nm_zach` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_student`
--

INSERT INTO `gromov_student` (`user_id`, `gruppa_id`, `nm_zach`) VALUES
(6, 1, 'K1020'),
(7, 2, 'A5292'),
(8, 2, 'B8578'),
(9, 5, 'P5285'),
(10, 4, 'F5285'),
(11, 1, 'K7485'),
(12, 3, 'A2585');

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_teacher`
--

CREATE TABLE `gromov_teacher` (
  `user_id` bigint(20) NOT NULL,
  `otdel_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_teacher`
--

INSERT INTO `gromov_teacher` (`user_id`, `otdel_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(5, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_user`
--

CREATE TABLE `gromov_user` (
  `user_id` bigint(20) NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronomic` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender_id` tinyint(4) NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_user`
--

INSERT INTO `gromov_user` (`user_id`, `lastname`, `firstname`, `patronomic`, `login`, `pass`, `gender_id`, `birthday`) VALUES
(1, 'Иванов', 'Иван', 'Иванович', 'ivan', 'ivannn', 1, '1975-05-25'),
(2, 'Петров ', 'Петр', 'Петрович', 'pett', 'tetet', 1, '1980-08-06'),
(3, 'Козлов', 'Иван', 'Афанасьевич', 'viviv', 'vevev', 1, '1985-04-15'),
(4, 'Чурюмова', 'Кристина', 'Федорова', 'kris', 'kriskris', 2, '1990-05-20'),
(5, 'Васильев', 'Феофан', 'Александрович', 'vaa', 'vasss', 1, '1991-01-13'),
(6, 'Федорова', 'Милана', 'Андреевна', 'milk', 'millll', 2, '1998-04-15'),
(7, 'Нуржанов', 'Нуржан', 'Нуржанович', 'nere', 'nurzh', 1, '1999-09-18'),
(8, 'Канатов', 'Канат', 'Канатович', 'kan', 'kanakan', 1, '1999-07-07'),
(9, 'Золотая', 'Ирина', 'Кайратовна', 'irrr', 'irara', 2, '2000-09-14'),
(10, 'Серая', 'Арина', 'Родионовна', 'arrr', 'ararar', 2, '2001-10-29'),
(11, 'Петухов', 'Виталий', 'Фадеевич', 'vit', 'vittt', 1, '2000-02-20'),
(12, 'Котова', 'Аурелия', 'Ароновна', 'aurrrw', 'asdsd', 2, '2002-12-19');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `gromov_classroom`
--
ALTER TABLE `gromov_classroom`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Индексы таблицы `gromov_course`
--
ALTER TABLE `gromov_course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `FK_gromov_course_gromov_special_special_id` (`special_id`);

--
-- Индексы таблицы `gromov_day`
--
ALTER TABLE `gromov_day`
  ADD PRIMARY KEY (`day_id`);

--
-- Индексы таблицы `gromov_gender`
--
ALTER TABLE `gromov_gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `gromov_graduate`
--
ALTER TABLE `gromov_graduate`
  ADD PRIMARY KEY (`graduate_id`),
  ADD KEY `FK_gromov_graduate_gromov_teacher_user_id` (`user_id`),
  ADD KEY `FK_gromov_graduate_gromov_gruppa_gruppa_id` (`gruppa_id`),
  ADD KEY `FK_gromov_graduate_gromov_course_course_id` (`course_id`);

--
-- Индексы таблицы `gromov_graduate_time`
--
ALTER TABLE `gromov_graduate_time`
  ADD PRIMARY KEY (`graduate_time_id`),
  ADD KEY `FK_gromov_graduate_time_gromov_classroom_classroom_id` (`calssroom_id`),
  ADD KEY `FK_gromov_graduate_time_gromov_graduate_graduate_id` (`graduate_id`),
  ADD KEY `FK_gromov_graduate_time_gromov_day_day_id` (`day_id`),
  ADD KEY `FK_gromov_graduate_time_gromov_lesson_num_lesson_num_id` (`lesson_num_id`);

--
-- Индексы таблицы `gromov_gruppa`
--
ALTER TABLE `gromov_gruppa`
  ADD PRIMARY KEY (`gruppa_id`),
  ADD KEY `FK_gromov_gruppa_gromov_special_special_id` (`special_id`);

--
-- Индексы таблицы `gromov_lesson_num`
--
ALTER TABLE `gromov_lesson_num`
  ADD PRIMARY KEY (`lesson_num_id`);

--
-- Индексы таблицы `gromov_otdel`
--
ALTER TABLE `gromov_otdel`
  ADD PRIMARY KEY (`otdel_id`);

--
-- Индексы таблицы `gromov_special`
--
ALTER TABLE `gromov_special`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `FK_gromov_special_gromov_otdel_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `gromov_student`
--
ALTER TABLE `gromov_student`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_gromov_student_gromov_gruppa_gruppa_id` (`gruppa_id`);

--
-- Индексы таблицы `gromov_teacher`
--
ALTER TABLE `gromov_teacher`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_gromov_teacher_gromov_otdel_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `gromov_user`
--
ALTER TABLE `gromov_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_gromov_user_gromov_gender_gender_id` (`gender_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `gromov_classroom`
--
ALTER TABLE `gromov_classroom`
  MODIFY `classroom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gromov_course`
--
ALTER TABLE `gromov_course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `gromov_day`
--
ALTER TABLE `gromov_day`
  MODIFY `day_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `gromov_gender`
--
ALTER TABLE `gromov_gender`
  MODIFY `gender_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `gromov_graduate`
--
ALTER TABLE `gromov_graduate`
  MODIFY `graduate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `gromov_graduate_time`
--
ALTER TABLE `gromov_graduate_time`
  MODIFY `graduate_time_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gromov_gruppa`
--
ALTER TABLE `gromov_gruppa`
  MODIFY `gruppa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `gromov_lesson_num`
--
ALTER TABLE `gromov_lesson_num`
  MODIFY `lesson_num_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `gromov_otdel`
--
ALTER TABLE `gromov_otdel`
  MODIFY `otdel_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gromov_special`
--
ALTER TABLE `gromov_special`
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `gromov_user`
--
ALTER TABLE `gromov_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gromov_course`
--
ALTER TABLE `gromov_course`
  ADD CONSTRAINT `FK_gromov_course_gromov_special_special_id` FOREIGN KEY (`special_id`) REFERENCES `gromov_special` (`special_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_graduate`
--
ALTER TABLE `gromov_graduate`
  ADD CONSTRAINT `FK_gromov_graduate_gromov_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `gromov_course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_graduate_gromov_gruppa_gruppa_id` FOREIGN KEY (`gruppa_id`) REFERENCES `gromov_gruppa` (`gruppa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_graduate_gromov_teacher_user_id` FOREIGN KEY (`user_id`) REFERENCES `gromov_teacher` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_graduate_time`
--
ALTER TABLE `gromov_graduate_time`
  ADD CONSTRAINT `FK_gromov_graduate_time_gromov_classroom_classroom_id` FOREIGN KEY (`calssroom_id`) REFERENCES `gromov_classroom` (`classroom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_graduate_time_gromov_day_day_id` FOREIGN KEY (`day_id`) REFERENCES `gromov_day` (`day_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_graduate_time_gromov_graduate_graduate_id` FOREIGN KEY (`graduate_id`) REFERENCES `gromov_graduate` (`graduate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_graduate_time_gromov_lesson_num_lesson_num_id` FOREIGN KEY (`lesson_num_id`) REFERENCES `gromov_lesson_num` (`lesson_num_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_gruppa`
--
ALTER TABLE `gromov_gruppa`
  ADD CONSTRAINT `FK_gromov_gruppa_gromov_special_special_id` FOREIGN KEY (`special_id`) REFERENCES `gromov_special` (`special_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_special`
--
ALTER TABLE `gromov_special`
  ADD CONSTRAINT `FK_gromov_special_gromov_otdel_otdel_id` FOREIGN KEY (`otdel_id`) REFERENCES `gromov_otdel` (`otdel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_student`
--
ALTER TABLE `gromov_student`
  ADD CONSTRAINT `FK_gromov_student_gromov_gruppa_gruppa_id` FOREIGN KEY (`gruppa_id`) REFERENCES `gromov_gruppa` (`gruppa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_student_gromov_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `gromov_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_teacher`
--
ALTER TABLE `gromov_teacher`
  ADD CONSTRAINT `FK_gromov_teacher_gromov_otdel_otdel_id` FOREIGN KEY (`otdel_id`) REFERENCES `gromov_otdel` (`otdel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_teacher_gromov_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `gromov_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_user`
--
ALTER TABLE `gromov_user`
  ADD CONSTRAINT `FK_gromov_user_gromov_gender_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `gromov_gender` (`gender_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
