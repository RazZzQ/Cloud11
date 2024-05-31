-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2024 a las 06:04:30
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `login`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarJuego` (IN `p_gameid` INT, IN `p_score` INT, IN `p_modified_by` VARCHAR(255))   BEGIN
    UPDATE Game
    SET score = p_score,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarJuego2` (IN `p_gameid` INT, IN `p_score` INT, IN `p_modified_by` VARCHAR(255))   BEGIN
    UPDATE Game2
    SET score = p_score,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarJuego3` (IN `p_gameid` INT, IN `p_score` INT, IN `p_modified_by` VARCHAR(255))   BEGIN
    UPDATE Game3
    SET score = p_score,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarLogin` (IN `p_id` INT, IN `p_usuario` VARCHAR(255), IN `p_password` VARCHAR(255), IN `p_modified_by` VARCHAR(255))   BEGIN
    UPDATE Login
    SET usuario = p_usuario,
        password = p_password,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearJuego` (IN `p_userid` INT, IN `p_score` INT, IN `p_created_by` VARCHAR(255))   BEGIN
    INSERT INTO Game (userid, score, created_by, modified_by)
    VALUES (p_userid, p_score, p_created_by, p_created_by);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearJuego2` (IN `p_userid` INT, IN `p_score` INT, IN `p_created_by` VARCHAR(255))   BEGIN
    INSERT INTO Game2 (userid, score, created_by, modified_by)
    VALUES (p_userid, p_score, p_created_by, p_created_by);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearJuego3` (IN `p_userid` INT, IN `p_score` INT, IN `p_created_by` VARCHAR(255))   BEGIN
    INSERT INTO Game3 (userid, score, created_by, modified_by)
    VALUES (p_userid, p_score, p_created_by, p_created_by);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearLogin` (IN `p_usuario` VARCHAR(255), IN `p_password` VARCHAR(255), IN `p_created_by` VARCHAR(255))   BEGIN
    INSERT INTO Login (usuario, password, created_by, modified_by)
    VALUES (p_usuario, p_password, p_created_by, p_created_by);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearUsuario` (IN `p_usuario` VARCHAR(255), IN `p_password` VARCHAR(255), IN `p_created_by` VARCHAR(255))   BEGIN
    INSERT INTO Login (usuario, password, created_by, modified_by)
    VALUES (p_usuario, p_password, p_created_by, p_created_by);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarJuego` (IN `p_gameid` INT)   BEGIN
    DELETE FROM Game WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarJuego2` (IN `p_gameid` INT)   BEGIN
    DELETE FROM Game2 WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarJuego3` (IN `p_gameid` INT)   BEGIN
    DELETE FROM Game3 WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarLogin` (IN `p_id` INT)   BEGIN
    DELETE FROM Login WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LeerJuego` (IN `p_gameid` INT)   BEGIN
    SELECT * FROM Game WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LeerJuego2` (IN `p_gameid` INT)   BEGIN
    SELECT * FROM Game2 WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LeerJuego3` (IN `p_gameid` INT)   BEGIN
    SELECT * FROM Game3 WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LeerLogin` (IN `p_id` INT)   BEGIN
    SELECT * FROM Login WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarLogin` (IN `p_usuario` VARCHAR(255), IN `p_password` VARCHAR(255))   BEGIN
    DECLARE user_count INT;

    SELECT COUNT(*) INTO user_count
    FROM Login
    WHERE usuario = p_usuario AND password = p_password;

    IF user_count = 1 THEN
        SELECT 'Login válido' AS Resultado;
    ELSE
        SELECT 'Login inválido' AS Resultado;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game`
--

CREATE TABLE `game` (
  `gameid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(255) NOT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game2`
--

CREATE TABLE `game2` (
  `gameid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(255) NOT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game3`
--

CREATE TABLE `game3` (
  `gameid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(255) NOT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(255) NOT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `usuario`, `password`, `created_at`, `created_by`, `modified_at`, `modified_by`) VALUES
(1321, 'Wasaa', '123', '2024-05-30 22:56:49', '123', '2024-05-30 22:56:49', '41');

--
-- Disparadores `login`
--
DELIMITER $$
CREATE TRIGGER `before_insert_Login` BEFORE INSERT ON `login` FOR EACH ROW BEGIN
    SET NEW.created_at = CURRENT_TIMESTAMP;
    SET NEW.modified_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_Login` BEFORE UPDATE ON `login` FOR EACH ROW BEGIN
    SET NEW.modified_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistapuntajes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistapuntajes` (
`gameid` int(11)
,`userid` int(11)
,`score` int(11)
,`created_at` datetime
,`created_by` varchar(255)
,`modified_at` datetime
,`modified_by` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistapuntajes2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistapuntajes2` (
`gameid` int(11)
,`userid` int(11)
,`score` int(11)
,`created_at` datetime
,`created_by` varchar(255)
,`modified_at` datetime
,`modified_by` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistapuntajes3`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistapuntajes3` (
`gameid` int(11)
,`userid` int(11)
,`score` int(11)
,`created_at` datetime
,`created_by` varchar(255)
,`modified_at` datetime
,`modified_by` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistausuarios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistausuarios` (
`id` int(11)
,`usuario` varchar(255)
,`created_at` datetime
,`created_by` varchar(255)
,`modified_at` datetime
,`modified_by` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vistapuntajes`
--
DROP TABLE IF EXISTS `vistapuntajes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistapuntajes`  AS SELECT `game`.`gameid` AS `gameid`, `game`.`userid` AS `userid`, `game`.`score` AS `score`, `game`.`created_at` AS `created_at`, `game`.`created_by` AS `created_by`, `game`.`modified_at` AS `modified_at`, `game`.`modified_by` AS `modified_by` FROM `game` ORDER BY `game`.`score` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistapuntajes2`
--
DROP TABLE IF EXISTS `vistapuntajes2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistapuntajes2`  AS SELECT `game2`.`gameid` AS `gameid`, `game2`.`userid` AS `userid`, `game2`.`score` AS `score`, `game2`.`created_at` AS `created_at`, `game2`.`created_by` AS `created_by`, `game2`.`modified_at` AS `modified_at`, `game2`.`modified_by` AS `modified_by` FROM `game2` ORDER BY `game2`.`score` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistapuntajes3`
--
DROP TABLE IF EXISTS `vistapuntajes3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistapuntajes3`  AS SELECT `game3`.`gameid` AS `gameid`, `game3`.`userid` AS `userid`, `game3`.`score` AS `score`, `game3`.`created_at` AS `created_at`, `game3`.`created_by` AS `created_by`, `game3`.`modified_at` AS `modified_at`, `game3`.`modified_by` AS `modified_by` FROM `game3` ORDER BY `game3`.`score` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistausuarios`
--
DROP TABLE IF EXISTS `vistausuarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistausuarios`  AS SELECT `id` AS `id`, `usuario` AS `usuario`, `created_at` AS `created_at`, `created_by` AS `created_by`, `modified_at` AS `modified_at`, `modified_by` AS `modified_by` FROM `login` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`gameid`),
  ADD KEY `userid` (`userid`);

--
-- Indices de la tabla `game2`
--
ALTER TABLE `game2`
  ADD PRIMARY KEY (`gameid`),
  ADD KEY `userid` (`userid`);

--
-- Indices de la tabla `game3`
--
ALTER TABLE `game3`
  ADD PRIMARY KEY (`gameid`),
  ADD KEY `userid` (`userid`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `game`
--
ALTER TABLE `game`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `game2`
--
ALTER TABLE `game2`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `game3`
--
ALTER TABLE `game3`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1322;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `login` (`id`);

--
-- Filtros para la tabla `game2`
--
ALTER TABLE `game2`
  ADD CONSTRAINT `game2_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `login` (`id`);

--
-- Filtros para la tabla `game3`
--
ALTER TABLE `game3`
  ADD CONSTRAINT `game3_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `login` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
