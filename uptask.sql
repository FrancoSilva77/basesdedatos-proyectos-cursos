/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `proyectos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proyecto` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `url` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `propietarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propietario_id_idx` (`propietarioId`),
  CONSTRAINT `propietario_id` FOREIGN KEY (`propietarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `tareas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `proyectoId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proyecto_id_idx` (`proyectoId`),
  CONSTRAINT `proyecto_id` FOREIGN KEY (`proyectoId`) REFERENCES `proyectos` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `token` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `proyectos` (`id`, `proyecto`, `url`, `propietarioId`) VALUES
(1, ' Establecimientos Cuacnopalan', '7da8b1692c24bad36eab85105450fb95', 1);


INSERT INTO `tareas` (`id`, `nombre`, `estado`, `proyectoId`) VALUES
(1, 'Realizar el diseño de la interfaz', 0, 1);
INSERT INTO `tareas` (`id`, `nombre`, `estado`, `proyectoId`) VALUES
(2, 'Elegir stack de tecnologias para realizarlo', 0, 1);


INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `token`, `confirmado`) VALUES
(1, ' Franco Silva', 'frang@mail.com', '$2y$10$jwX1uw1urPLX5wOSG7BwEOhS/l/gItExXqaQ2da6Zk8qbk/16FAR2', '', 1);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;