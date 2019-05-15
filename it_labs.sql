-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 03 2019 г., 12:13
-- Версия сервера: 10.1.37-MariaDB
-- Версия PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `it_labs`
--
CREATE DATABASE IF NOT EXISTS `it_labs` DEFAULT CHARACTER SET cp1251 COLLATE cp1251_general_ci;
USE `it_labs`;

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `ID_DEPARTMENT` int(11) NOT NULL,
  `chief` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`ID_DEPARTMENT`, `chief`) VALUES
(0, 'Fedorchuk'),
(1, 'Popov'),
(2, 'Temashew');

-- --------------------------------------------------------

--
-- Структура таблицы `project`
--

CREATE TABLE `project` (
  `ID_PROJECTS` int(11) NOT NULL,
  `name` char(60) DEFAULT NULL,
  `manager` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `project`
--

INSERT INTO `project` (`ID_PROJECTS`, `name`, `manager`) VALUES
(0, 'Hospital', 'Ryban'),
(1, 'Bank', 'Scoromniy'),
(2, 'Police', 'Bura');

-- --------------------------------------------------------

--
-- Структура таблицы `work`
--

CREATE TABLE `work` (
  `FID_WORKER` int(11) DEFAULT NULL,
  `FID_PROJECTS` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `time_start` date DEFAULT NULL,
  `time_end` date DEFAULT NULL,
  `description` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `work`
--

INSERT INTO `work` (`FID_WORKER`, `FID_PROJECTS`, `date`, `time_start`, `time_end`, `description`) VALUES
(1, 2, '2019-04-10', '2019-04-10', '2019-04-14', 'dfhgjhfjshdfchzdxf'),
(3, 1, '2019-04-15', '2019-04-15', '2019-04-17', 'bank'),
(4, 1, '2019-04-16', '2019-04-15', '2019-04-17', 'new bank'),
(2, 0, '2019-04-22', '2019-04-22', '2019-04-30', 'hospital');

-- --------------------------------------------------------

--
-- Структура таблицы `worker`
--

CREATE TABLE `worker` (
  `ID_WORKER` int(11) NOT NULL,
  `FID_DEPARTMENT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `worker`
--

INSERT INTO `worker` (`ID_WORKER`, `FID_DEPARTMENT`) VALUES
(2, 0),
(1, 2),
(3, 2),
(4, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID_DEPARTMENT`);

--
-- Индексы таблицы `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ID_PROJECTS`);

--
-- Индексы таблицы `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`date`),
  ADD KEY `FID_WORKER` (`FID_WORKER`),
  ADD KEY `FID_PROJECTS` (`FID_PROJECTS`);

--
-- Индексы таблицы `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`ID_WORKER`),
  ADD KEY `FID_DEPARTMENT` (`FID_DEPARTMENT`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `worker`
--
ALTER TABLE `worker`
  MODIFY `ID_WORKER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `work_ibfk_1` FOREIGN KEY (`FID_WORKER`) REFERENCES `worker` (`ID_WORKER`),
  ADD CONSTRAINT `work_ibfk_2` FOREIGN KEY (`FID_PROJECTS`) REFERENCES `project` (`ID_PROJECTS`);

--
-- Ограничения внешнего ключа таблицы `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `worker_ibfk_1` FOREIGN KEY (`FID_DEPARTMENT`) REFERENCES `department` (`ID_DEPARTMENT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
