/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `usuarioId` int DEFAULT NULL,
  `horaId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuarioId`),
  KEY `citas_ibfk_2_idx` (`horaId`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`horaId`) REFERENCES `horas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `citasservicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citaId` int DEFAULT NULL,
  `servicioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citaId` (`citaId`),
  KEY `servicioId` (`servicioId`),
  CONSTRAINT `citasservicios_ibfk_3` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `citasservicios_ibfk_4` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `horas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hora` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

INSERT INTO `citas` (`id`, `fecha`, `usuarioId`, `horaId`) VALUES
(1, '2023-06-01', NULL, 2);
INSERT INTO `citas` (`id`, `fecha`, `usuarioId`, `horaId`) VALUES
(2, '2023-06-01', NULL, 9);


INSERT INTO `citasservicios` (`id`, `citaId`, `servicioId`) VALUES
(1, 1, 5);
INSERT INTO `citasservicios` (`id`, `citaId`, `servicioId`) VALUES
(2, 2, 6);


INSERT INTO `horas` (`id`, `hora`) VALUES
(1, '10:00 - 10:30');
INSERT INTO `horas` (`id`, `hora`) VALUES
(2, '10:30 - 11:00');
INSERT INTO `horas` (`id`, `hora`) VALUES
(3, '11:30 - 12:00');
INSERT INTO `horas` (`id`, `hora`) VALUES
(4, '12:00 - 12:30'),
(5, '12:30 - 13:00'),
(6, '13:00 - 13:30'),
(7, '13:30 - 14:00'),
(8, '14:00 - 14:30'),
(9, '14:30 - 15:00'),
(10, '15:00 - 15:30'),
(11, '15:30 - 16:00'),
(12, '16:00 - 16:30'),
(13, '16:30 - 17:00'),
(14, '17:00 - 17:30'),
(15, '17:30 - 18:00'),
(16, '18:00 - 18:30'),
(17, '18:30 - 19:00'),
(18, '19:00 - 19:30'),
(19, '19:30 - 20:00'),
(20, '20:00 - 20:30');

INSERT INTO `servicios` (`id`, `nombre`, `precio`) VALUES
(1, 'Corte de Cabello Mujer ACTUALIZADO', '120.00');
INSERT INTO `servicios` (`id`, `nombre`, `precio`) VALUES
(2, 'Corte de Cabello Hombre', '80.00');
INSERT INTO `servicios` (`id`, `nombre`, `precio`) VALUES
(3, 'Corte de Cabello Niño', '60.00');
INSERT INTO `servicios` (`id`, `nombre`, `precio`) VALUES
(4, 'Peinado Mujer', '80.00'),
(5, 'Peinado Hombre', '60.00'),
(6, 'Peinado Niño', '60.00'),
(7, 'Corte de Barba', '60.00'),
(10, 'Lavado de Cabello', '50.00'),
(11, 'Tratamiento Capilar 2', '150.00'),
(15, ' Uñas', '200.00');

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `telefono`, `admin`, `confirmado`, `token`) VALUES
(1, ' Franco', 'Silva', 'fran@fran.com', '$2y$10$.hyat/xVJc8FwQ1Iu11L.efs/ASCyq/yn1RR3Tm6cBao4XQYeFlnG', '123456789', 1, 1, '');
INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `telefono`, `admin`, `confirmado`, `token`) VALUES
(2, ' Kevin', 'De Bruyne', 'kevin@kevin.com', '$2y$10$ytzglD6r8XAqE0D6Li9YzONxa6.j4WWYQd1evY0Ad951.o20/Lu0a', '2121212121', 0, 1, '');
INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `telefono`, `admin`, `confirmado`, `token`) VALUES
(16, ' Franco', 'Silva', 'aspermasterone@gmail.com', '$2y$10$wDa2mjgJu15NxdrECELZrO5Yb2m73rdBPXMgQKgURARuKYcFcn8NK', '', 0, 0, '6595a1eee4aa4 ');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;