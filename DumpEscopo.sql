CREATE DATABASE  IF NOT EXISTS `db_escopo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_escopo`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: db_escopo
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aprovacao`
--

DROP TABLE IF EXISTS `aprovacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprovacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `documento_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aprovacao_documento` (`documento_id`),
  KEY `fk_aprovacao_usuario` (`usuario_id`),
  CONSTRAINT `fk_aprovacao_documento` FOREIGN KEY (`documento_id`) REFERENCES `documento` (`id`),
  CONSTRAINT `fk_aprovacao_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprovacao`
--

LOCK TABLES `aprovacao` WRITE;
/*!40000 ALTER TABLE `aprovacao` DISABLE KEYS */;
INSERT INTO `aprovacao` VALUES (1,'2025-01-01 03:00:00',1,1),(2,'2025-01-01 03:00:00',2,2);
/*!40000 ALTER TABLE `aprovacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assinatura`
--

DROP TABLE IF EXISTS `assinatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assinatura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_inicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_fim` timestamp NULL DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `plano_id` int NOT NULL,
  `assinatura_status_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_assinatura_usuario` (`usuario_id`),
  KEY `fk_assinatura_plano` (`plano_id`),
  KEY `fk_assinatura_status_assinatura` (`assinatura_status_id`),
  CONSTRAINT `fk_assinatura_plano` FOREIGN KEY (`plano_id`) REFERENCES `plano` (`id`),
  CONSTRAINT `fk_assinatura_status_assinatura` FOREIGN KEY (`assinatura_status_id`) REFERENCES `assinatura_status` (`id`),
  CONSTRAINT `fk_assinatura_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assinatura`
--

LOCK TABLES `assinatura` WRITE;
/*!40000 ALTER TABLE `assinatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `assinatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assinatura_status`
--

DROP TABLE IF EXISTS `assinatura_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assinatura_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assinatura_status`
--

LOCK TABLES `assinatura_status` WRITE;
/*!40000 ALTER TABLE `assinatura_status` DISABLE KEYS */;
INSERT INTO `assinatura_status` VALUES (1,'ativo'),(2,'expirado'),(3,'cancelado');
/*!40000 ALTER TABLE `assinatura_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficio`
--

DROP TABLE IF EXISTS `beneficio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficio`
--

LOCK TABLES `beneficio` WRITE;
/*!40000 ALTER TABLE `beneficio` DISABLE KEYS */;
INSERT INTO `beneficio` VALUES (1,'colaboradores','Quantidade de colaboradores em um projeto'),(2,'clientes','Quantidade de clientes em um projeto'),(3,'transcricao','acesso a transcricao de reunioes');
/*!40000 ALTER TABLE `beneficio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `projeto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categoria_projeto` (`projeto_id`),
  CONSTRAINT `fk_categoria_projeto` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Plataforma Web',1),(2,'Aplicativo Mobile',1),(3,'Documentos Gerais',2),(4,'Aplicativo Usuarios',2),(5,'Aplicativo Entregadores',2),(6,'Banco de Dados',3),(7,'Back-end',3),(8,'Front-end',3),(9,'Organização',4),(10,'Banco de Dados',4),(11,'Back-End',4),(12,'Front-End',4),(13,'Mobile',4);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conteudo` text NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parent_id` int DEFAULT NULL,
  `registro_referencia_id` int DEFAULT NULL,
  `criador_id` int NOT NULL,
  `documento_id` int NOT NULL,
  `comentario_tipo_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_comentario_tipo_comentario` (`comentario_tipo_id`),
  KEY `fk_comentario_parent_id` (`parent_id`),
  KEY `fk_comentario_registro_referencia` (`registro_referencia_id`),
  KEY `fk_comentario_usuario_criador` (`criador_id`),
  KEY `fk_comentario_documento` (`documento_id`),
  CONSTRAINT `fk_comentario_documento` FOREIGN KEY (`documento_id`) REFERENCES `documento` (`id`),
  CONSTRAINT `fk_comentario_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `comentario` (`id`),
  CONSTRAINT `fk_comentario_registro_referencia` FOREIGN KEY (`registro_referencia_id`) REFERENCES `registro` (`id`),
  CONSTRAINT `fk_comentario_tipo_comentario` FOREIGN KEY (`comentario_tipo_id`) REFERENCES `comentario_tipo` (`id`),
  CONSTRAINT `fk_comentario_usuario_criador` FOREIGN KEY (`criador_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Comentário sobre Documento de Requisitos','2025-01-03 06:00:00',NULL,NULL,1,1,1),(2,'Comentário sobre Manual do Usuário Web','2025-01-04 22:15:00',NULL,NULL,1,2,1),(3,'Comentário sobre Documento de Requisitos','2025-01-03 18:00:00',NULL,NULL,2,1,1),(4,'Comentário sobre Manual do Usuário Web','2025-01-04 20:15:00',NULL,NULL,2,2,1),(5,'Comentário sobre Documento de Requisitos','2025-01-03 22:00:00',NULL,NULL,3,1,1),(6,'Comentário sobre Manual do Usuário Web','2025-01-03 21:15:00',NULL,NULL,3,2,1),(7,'Comentário sobre Documento de Requisitos','2025-01-04 11:00:00',NULL,NULL,4,1,1),(8,'Comentário sobre Manual do Usuário Web','2025-01-03 16:15:00',NULL,NULL,4,2,1),(9,'Comentário sobre Documento de Requisitos','2025-01-03 21:00:00',NULL,NULL,5,1,1),(10,'Comentário sobre Manual do Usuário Web','2025-01-03 05:15:00',NULL,NULL,5,2,1),(11,'Comentário sobre Especificação Mobile','2025-01-08 09:22:00',NULL,NULL,1,3,1),(12,'Comentário sobre Checklist de Testes Mobile','2025-01-09 07:22:00',NULL,NULL,1,4,1),(13,'Comentário sobre Especificação Mobile','2025-01-08 17:22:00',NULL,NULL,2,3,1),(14,'Comentário sobre Checklist de Testes Mobile','2025-01-09 22:22:00',NULL,NULL,2,4,1),(15,'Comentário sobre Especificação Mobile','2025-01-09 01:22:00',NULL,NULL,3,3,1),(16,'Comentário sobre Checklist de Testes Mobile','2025-01-09 13:22:00',NULL,NULL,3,4,1),(17,'Comentário sobre Especificação Mobile','2025-01-08 03:22:00',NULL,NULL,4,3,1),(18,'Comentário sobre Checklist de Testes Mobile','2025-01-08 06:22:00',NULL,NULL,4,4,1),(19,'Comentário sobre Especificação Mobile','2025-01-08 09:22:00',NULL,NULL,5,3,1),(20,'Comentário sobre Checklist de Testes Mobile','2025-01-09 09:22:00',NULL,NULL,5,4,1),(21,'Comentário sobre Plano de Projeto','2025-02-13 17:17:00',NULL,NULL,5,5,1),(22,'Comentário sobre Cronograma','2025-02-15 17:17:00',NULL,NULL,5,6,1),(23,'Comentário sobre Relatório de Progresso','2025-02-28 08:17:00',NULL,NULL,5,7,1),(24,'Comentário sobre Plano de Projeto','2025-02-13 14:17:00',NULL,NULL,1,5,1),(25,'Comentário sobre Cronograma','2025-02-14 22:17:00',NULL,NULL,1,6,1),(26,'Comentário sobre Relatório de Progresso','2025-02-28 18:17:00',NULL,NULL,1,7,1),(27,'Comentário sobre Plano de Projeto','2025-02-14 05:17:00',NULL,NULL,6,5,1),(28,'Comentário sobre Cronograma','2025-02-14 13:17:00',NULL,NULL,6,6,1),(29,'Comentário sobre Relatório de Progresso','2025-02-28 23:17:00',NULL,NULL,6,7,1),(30,'Comentário sobre Plano de Projeto','2025-02-14 10:17:00',NULL,NULL,7,5,1),(31,'Comentário sobre Cronograma','2025-02-15 00:17:00',NULL,NULL,7,6,1),(32,'Comentário sobre Relatório de Progresso','2025-02-28 16:17:00',NULL,NULL,7,7,1),(33,'Comentário sobre Fluxo de Navegação do Usuário','2025-02-13 00:15:00',NULL,NULL,5,8,1),(34,'Comentário sobre Casos de Uso - Usuário','2025-02-14 05:30:00',NULL,NULL,5,9,1),(35,'Comentário sobre Fluxo de Navegação do Usuário','2025-02-13 04:15:00',NULL,NULL,1,8,1),(36,'Comentário sobre Casos de Uso - Usuário','2025-02-13 05:30:00',NULL,NULL,1,9,1),(37,'Comentário sobre Fluxo de Navegação do Usuário','2025-02-13 17:15:00',NULL,NULL,6,8,1),(38,'Comentário sobre Casos de Uso - Usuário','2025-02-12 22:30:00',NULL,NULL,6,9,1),(39,'Comentário sobre Fluxo de Navegação do Usuário','2025-02-12 13:15:00',NULL,NULL,7,8,1),(40,'Comentário sobre Casos de Uso - Usuário','2025-02-13 23:30:00',NULL,NULL,7,9,1),(41,'Comentário sobre Fluxo de Entregas','2025-02-14 03:45:00',NULL,NULL,5,10,1),(42,'Comentário sobre Casos de Uso - Entregador','2025-02-13 15:00:00',NULL,NULL,5,11,1),(43,'Comentário sobre Fluxo de Entregas','2025-02-13 22:45:00',NULL,NULL,1,10,1),(44,'Comentário sobre Casos de Uso - Entregador','2025-02-14 20:00:00',NULL,NULL,1,11,1),(45,'Comentário sobre Fluxo de Entregas','2025-02-14 12:45:00',NULL,NULL,6,10,1),(46,'Comentário sobre Casos de Uso - Entregador','2025-02-14 00:00:00',NULL,NULL,6,11,1),(47,'Comentário sobre Fluxo de Entregas','2025-02-14 16:45:00',NULL,NULL,7,10,1),(48,'Comentário sobre Casos de Uso - Entregador','2025-02-13 10:00:00',NULL,NULL,7,11,1),(49,'Comentário sobre Modelo Entidade-Relacionamento','2025-04-02 01:15:00',NULL,NULL,6,12,1),(50,'Comentário sobre Dicionário de Dados','2025-04-02 15:00:00',NULL,NULL,6,13,1),(51,'Comentário sobre Modelo Entidade-Relacionamento','2025-04-03 06:15:00',NULL,NULL,8,12,1),(52,'Comentário sobre Dicionário de Dados','2025-04-02 22:00:00',NULL,NULL,8,13,1),(53,'Comentário sobre Modelo Entidade-Relacionamento','2025-04-02 23:15:00',NULL,NULL,5,12,1),(54,'Comentário sobre Dicionário de Dados','2025-04-02 13:00:00',NULL,NULL,5,13,1),(55,'Comentário sobre Documentação da API','2025-04-02 06:15:00',NULL,NULL,6,14,1),(56,'Comentário sobre Arquitetura do Sistema','2025-04-03 19:10:00',NULL,NULL,6,15,1),(57,'Comentário sobre Documentação da API','2025-04-03 14:15:00',NULL,NULL,8,14,1),(58,'Comentário sobre Arquitetura do Sistema','2025-04-03 14:10:00',NULL,NULL,8,15,1),(59,'Comentário sobre Documentação da API','2025-04-02 14:15:00',NULL,NULL,5,14,1),(60,'Comentário sobre Arquitetura do Sistema','2025-04-03 04:10:00',NULL,NULL,5,15,1),(61,'Comentário sobre Guia de Componentes UI','2025-04-03 08:06:00',NULL,NULL,6,16,1),(62,'Comentário sobre Padrões de Estilo','2025-04-02 08:19:00',NULL,NULL,6,17,1),(63,'Comentário sobre Guia de Componentes UI','2025-04-01 16:06:00',NULL,NULL,8,16,1),(64,'Comentário sobre Padrões de Estilo','2025-04-01 22:19:00',NULL,NULL,8,17,1),(65,'Comentário sobre Guia de Componentes UI','2025-04-02 15:06:00',NULL,NULL,5,16,1),(66,'Comentário sobre Padrões de Estilo','2025-04-02 02:19:00',NULL,NULL,5,17,1),(67,'Comentário sobre TAP - Termo de Abertura de Projeto','2026-03-04 07:10:00',NULL,NULL,11,18,1),(68,'Comentário sobre Lista de demandas','2026-03-05 13:10:00',NULL,NULL,11,19,1),(69,'Comentário sobre TAP - Termo de Abertura de Projeto','2026-03-04 19:10:00',NULL,NULL,10,18,1),(70,'Comentário sobre Lista de demandas','2026-03-05 15:10:00',NULL,NULL,10,19,1),(71,'Comentário sobre TAP - Termo de Abertura de Projeto','2026-03-03 18:10:00',NULL,NULL,12,18,1),(72,'Comentário sobre Lista de demandas','2026-03-06 02:10:00',NULL,NULL,12,19,1),(73,'Comentário sobre TAP - Termo de Abertura de Projeto','2026-03-05 03:10:00',NULL,NULL,13,18,1),(74,'Comentário sobre Lista de demandas','2026-03-05 17:10:00',NULL,NULL,13,19,1),(75,'Comentário sobre Modelo Conceitual','2026-03-12 00:30:00',NULL,NULL,11,22,1),(76,'Comentário sobre Modelo Lógico','2026-03-17 01:10:00',NULL,NULL,11,23,1),(77,'Comentário sobre Scripts Criação de tabelas','2026-03-19 12:10:00',NULL,NULL,11,24,1),(78,'Comentário sobre Scripts Recursos (Triggers, Procedures, Views)','2026-03-30 12:32:00',NULL,NULL,11,25,1),(79,'Comentário sobre Scripts Inserts','2026-04-05 20:54:00',NULL,NULL,11,26,1),(80,'Comentário sobre Modelo Conceitual','2026-03-11 18:30:00',NULL,NULL,10,22,1),(81,'Comentário sobre Modelo Lógico','2026-03-17 00:10:00',NULL,NULL,10,23,1),(82,'Comentário sobre Scripts Criação de tabelas','2026-03-20 03:10:00',NULL,NULL,10,24,1),(83,'Comentário sobre Scripts Recursos (Triggers, Procedures, Views)','2026-03-31 18:32:00',NULL,NULL,10,25,1),(84,'Comentário sobre Scripts Inserts','2026-04-06 06:54:00',NULL,NULL,10,26,1),(85,'Comentário sobre Modelo Conceitual','2026-03-12 02:30:00',NULL,NULL,12,22,1),(86,'Comentário sobre Modelo Lógico','2026-03-15 11:10:00',NULL,NULL,12,23,1),(87,'Comentário sobre Scripts Criação de tabelas','2026-03-19 11:10:00',NULL,NULL,12,24,1),(88,'Comentário sobre Scripts Recursos (Triggers, Procedures, Views)','2026-03-30 20:32:00',NULL,NULL,12,25,1),(89,'Comentário sobre Scripts Inserts','2026-04-05 16:54:00',NULL,NULL,12,26,1),(90,'Comentário sobre Modelo Conceitual','2026-03-12 00:30:00',NULL,NULL,13,22,1),(91,'Comentário sobre Modelo Lógico','2026-03-16 19:10:00',NULL,NULL,13,23,1),(92,'Comentário sobre Scripts Criação de tabelas','2026-03-20 06:10:00',NULL,NULL,13,24,1),(93,'Comentário sobre Scripts Recursos (Triggers, Procedures, Views)','2026-03-30 21:32:00',NULL,NULL,13,25,1),(94,'Comentário sobre Scripts Inserts','2026-04-05 15:54:00',NULL,NULL,13,26,1),(95,'Comentário sobre Requisitos Funcionais','2026-03-06 06:40:00',NULL,NULL,11,20,1),(96,'Comentário sobre Requisitos não Funcionais','2026-03-08 04:10:00',NULL,NULL,11,21,1),(97,'Comentário sobre Swagger API','2026-03-10 15:00:00',NULL,NULL,11,27,1),(98,'Comentário sobre Roteiro de Testes (Back-End)','2026-03-12 22:45:00',NULL,NULL,11,28,1),(99,'Comentário sobre Requisitos Funcionais','2026-03-06 20:40:00',NULL,NULL,10,20,1),(100,'Comentário sobre Requisitos não Funcionais','2026-03-08 09:10:00',NULL,NULL,10,21,1),(101,'Comentário sobre Swagger API','2026-03-11 17:00:00',NULL,NULL,10,27,1),(102,'Comentário sobre Roteiro de Testes (Back-End)','2026-03-11 20:45:00',NULL,NULL,10,28,1),(103,'Comentário sobre Requisitos Funcionais','2026-03-06 04:40:00',NULL,NULL,12,20,1),(104,'Comentário sobre Requisitos não Funcionais','2026-03-08 07:10:00',NULL,NULL,12,21,1),(105,'Comentário sobre Swagger API','2026-03-11 09:00:00',NULL,NULL,12,27,1),(106,'Comentário sobre Roteiro de Testes (Back-End)','2026-03-12 10:45:00',NULL,NULL,12,28,1),(107,'Comentário sobre Requisitos Funcionais','2026-03-06 02:40:00',NULL,NULL,13,20,1),(108,'Comentário sobre Requisitos não Funcionais','2026-03-08 02:10:00',NULL,NULL,13,21,1),(109,'Comentário sobre Swagger API','2026-03-10 13:00:00',NULL,NULL,13,27,1),(110,'Comentário sobre Roteiro de Testes (Back-End)','2026-03-12 19:45:00',NULL,NULL,13,28,1),(111,'Comentário sobre Protótipos','2026-03-08 07:15:00',NULL,NULL,11,29,1),(112,'Comentário sobre Roteiro de Testes (Front-End)','2026-03-21 21:30:00',NULL,NULL,11,30,1),(113,'Comentário sobre Protótipos','2026-03-07 06:15:00',NULL,NULL,10,29,1),(114,'Comentário sobre Roteiro de Testes (Front-End)','2026-03-23 04:30:00',NULL,NULL,10,30,1),(115,'Comentário sobre Protótipos','2026-03-08 18:15:00',NULL,NULL,12,29,1),(116,'Comentário sobre Roteiro de Testes (Front-End)','2026-03-22 19:30:00',NULL,NULL,12,30,1),(117,'Comentário sobre Protótipos','2026-03-08 07:15:00',NULL,NULL,13,29,1),(118,'Comentário sobre Roteiro de Testes (Front-End)','2026-03-23 16:30:00',NULL,NULL,13,30,1),(119,'Comentário sobre Roteiro de Testes (Mobile)','2026-03-25 14:45:00',NULL,NULL,11,31,1),(120,'Comentário sobre Roteiro de Testes (Mobile)','2026-03-24 14:45:00',NULL,NULL,10,31,1),(121,'Comentário sobre Roteiro de Testes (Mobile)','2026-03-25 15:45:00',NULL,NULL,12,31,1),(122,'Comentário sobre Roteiro de Testes (Mobile)','2026-03-25 21:45:00',NULL,NULL,13,31,1),(128,'Resposta ao comentário 1','2025-01-04 01:00:00',1,NULL,1,1,2),(129,'Resposta ao comentário 3','2025-01-04 11:00:00',3,NULL,1,1,2),(130,'Resposta ao comentário 5','2025-01-04 03:00:00',5,NULL,1,1,2),(131,'Resposta ao comentário 7','2025-01-05 10:00:00',7,NULL,1,1,2),(132,'Resposta ao comentário 9','2025-01-03 23:00:00',9,NULL,1,1,2),(133,'Resposta ao comentário 2','2025-01-05 09:15:00',2,NULL,1,2,2),(134,'Resposta ao comentário 4','2025-01-04 21:15:00',4,NULL,1,2,2),(135,'Resposta ao comentário 6','2025-01-04 17:15:00',6,NULL,1,2,2),(136,'Resposta ao comentário 8','2025-01-04 15:15:00',8,NULL,1,2,2),(137,'Resposta ao comentário 10','2025-01-03 15:15:00',10,NULL,1,2,2),(138,'Resposta ao comentário 1','2025-01-03 07:00:00',1,NULL,2,1,2),(139,'Resposta ao comentário 3','2025-01-04 18:00:00',3,NULL,2,1,2),(140,'Resposta ao comentário 5','2025-01-04 20:00:00',5,NULL,2,1,2),(141,'Resposta ao comentário 7','2025-01-05 01:00:00',7,NULL,2,1,2),(142,'Resposta ao comentário 9','2025-01-03 23:00:00',9,NULL,2,1,2),(143,'Resposta ao comentário 2','2025-01-05 12:15:00',2,NULL,2,2,2),(144,'Resposta ao comentário 4','2025-01-05 12:15:00',4,NULL,2,2,2),(145,'Resposta ao comentário 6','2025-01-04 13:15:00',6,NULL,2,2,2),(146,'Resposta ao comentário 8','2025-01-03 20:15:00',8,NULL,2,2,2),(147,'Resposta ao comentário 10','2025-01-04 03:15:00',10,NULL,2,2,2),(148,'Resposta ao comentário 1','2025-01-04 06:00:00',1,NULL,3,1,2),(149,'Resposta ao comentário 3','2025-01-03 23:00:00',3,NULL,3,1,2),(150,'Resposta ao comentário 5','2025-01-03 23:00:00',5,NULL,3,1,2),(151,'Resposta ao comentário 7','2025-01-04 23:00:00',7,NULL,3,1,2),(152,'Resposta ao comentário 9','2025-01-04 06:00:00',9,NULL,3,1,2),(153,'Resposta ao comentário 2','2025-01-05 08:15:00',2,NULL,3,2,2),(154,'Resposta ao comentário 4','2025-01-05 17:15:00',4,NULL,3,2,2),(155,'Resposta ao comentário 6','2025-01-04 00:15:00',6,NULL,3,2,2),(156,'Resposta ao comentário 8','2025-01-03 17:15:00',8,NULL,3,2,2),(157,'Resposta ao comentário 10','2025-01-03 23:15:00',10,NULL,3,2,2),(158,'Resposta ao comentário 1','2025-01-03 21:00:00',1,NULL,4,1,2),(159,'Resposta ao comentário 3','2025-01-04 16:00:00',3,NULL,4,1,2),(160,'Resposta ao comentário 5','2025-01-04 15:00:00',5,NULL,4,1,2),(161,'Resposta ao comentário 7','2025-01-05 04:00:00',7,NULL,4,1,2),(162,'Resposta ao comentário 9','2025-01-04 05:00:00',9,NULL,4,1,2),(163,'Resposta ao comentário 2','2025-01-05 12:15:00',2,NULL,4,2,2),(164,'Resposta ao comentário 4','2025-01-05 18:15:00',4,NULL,4,2,2),(165,'Resposta ao comentário 6','2025-01-04 17:15:00',6,NULL,4,2,2),(166,'Resposta ao comentário 8','2025-01-04 02:15:00',8,NULL,4,2,2),(167,'Resposta ao comentário 10','2025-01-03 19:15:00',10,NULL,4,2,2),(168,'Resposta ao comentário 1','2025-01-03 19:00:00',1,NULL,5,1,2),(169,'Resposta ao comentário 3','2025-01-03 20:00:00',3,NULL,5,1,2),(170,'Resposta ao comentário 5','2025-01-04 13:00:00',5,NULL,5,1,2),(171,'Resposta ao comentário 7','2025-01-05 10:00:00',7,NULL,5,1,2),(172,'Resposta ao comentário 9','2025-01-04 17:00:00',9,NULL,5,1,2),(173,'Resposta ao comentário 2','2025-01-05 05:15:00',2,NULL,5,2,2),(174,'Resposta ao comentário 4','2025-01-05 19:15:00',4,NULL,5,2,2),(175,'Resposta ao comentário 6','2025-01-04 19:15:00',6,NULL,5,2,2),(176,'Resposta ao comentário 8','2025-01-04 09:15:00',8,NULL,5,2,2),(177,'Resposta ao comentário 10','2025-01-04 00:15:00',10,NULL,5,2,2),(178,'Resposta ao comentário 11','2025-01-09 04:22:00',11,NULL,1,3,2),(179,'Resposta ao comentário 13','2025-01-09 07:22:00',13,NULL,1,3,2),(180,'Resposta ao comentário 15','2025-01-09 13:22:00',15,NULL,1,3,2),(181,'Resposta ao comentário 17','2025-01-08 22:22:00',17,NULL,1,3,2),(182,'Resposta ao comentário 19','2025-01-08 18:22:00',19,NULL,1,3,2),(183,'Resposta ao comentário 12','2025-01-09 19:22:00',12,NULL,1,4,2),(184,'Resposta ao comentário 14','2025-01-10 05:22:00',14,NULL,1,4,2),(185,'Resposta ao comentário 16','2025-01-09 14:22:00',16,NULL,1,4,2),(186,'Resposta ao comentário 18','2025-01-08 14:22:00',18,NULL,1,4,2),(187,'Resposta ao comentário 20','2025-01-09 21:22:00',20,NULL,1,4,2),(188,'Resposta ao comentário 11','2025-01-08 18:22:00',11,NULL,2,3,2),(189,'Resposta ao comentário 13','2025-01-09 04:22:00',13,NULL,2,3,2),(190,'Resposta ao comentário 15','2025-01-09 02:22:00',15,NULL,2,3,2),(191,'Resposta ao comentário 17','2025-01-08 23:22:00',17,NULL,2,3,2),(192,'Resposta ao comentário 19','2025-01-09 09:22:00',19,NULL,2,3,2),(193,'Resposta ao comentário 12','2025-01-09 20:22:00',12,NULL,2,4,2),(194,'Resposta ao comentário 14','2025-01-10 15:22:00',14,NULL,2,4,2),(195,'Resposta ao comentário 16','2025-01-10 09:22:00',16,NULL,2,4,2),(196,'Resposta ao comentário 18','2025-01-08 09:22:00',18,NULL,2,4,2),(197,'Resposta ao comentário 20','2025-01-10 09:22:00',20,NULL,2,4,2),(198,'Resposta ao comentário 11','2025-01-09 02:22:00',11,NULL,3,3,2),(199,'Resposta ao comentário 13','2025-01-09 05:22:00',13,NULL,3,3,2),(200,'Resposta ao comentário 15','2025-01-09 07:22:00',15,NULL,3,3,2),(201,'Resposta ao comentário 17','2025-01-08 23:22:00',17,NULL,3,3,2),(202,'Resposta ao comentário 19','2025-01-08 19:22:00',19,NULL,3,3,2),(203,'Resposta ao comentário 12','2025-01-09 18:22:00',12,NULL,3,4,2),(204,'Resposta ao comentário 14','2025-01-10 22:22:00',14,NULL,3,4,2),(205,'Resposta ao comentário 16','2025-01-10 04:22:00',16,NULL,3,4,2),(206,'Resposta ao comentário 18','2025-01-08 07:22:00',18,NULL,3,4,2),(207,'Resposta ao comentário 20','2025-01-09 19:22:00',20,NULL,3,4,2),(208,'Resposta ao comentário 11','2025-01-09 05:22:00',11,NULL,4,3,2),(209,'Resposta ao comentário 13','2025-01-09 14:22:00',13,NULL,4,3,2),(210,'Resposta ao comentário 15','2025-01-10 00:22:00',15,NULL,4,3,2),(211,'Resposta ao comentário 17','2025-01-08 06:22:00',17,NULL,4,3,2),(212,'Resposta ao comentário 19','2025-01-09 01:22:00',19,NULL,4,3,2),(213,'Resposta ao comentário 12','2025-01-10 05:22:00',12,NULL,4,4,2),(214,'Resposta ao comentário 14','2025-01-10 12:22:00',14,NULL,4,4,2),(215,'Resposta ao comentário 16','2025-01-09 16:22:00',16,NULL,4,4,2),(216,'Resposta ao comentário 18','2025-01-09 02:22:00',18,NULL,4,4,2),(217,'Resposta ao comentário 20','2025-01-10 06:22:00',20,NULL,4,4,2),(218,'Resposta ao comentário 11','2025-01-09 05:22:00',11,NULL,5,3,2),(219,'Resposta ao comentário 13','2025-01-09 04:22:00',13,NULL,5,3,2),(220,'Resposta ao comentário 15','2025-01-09 22:22:00',15,NULL,5,3,2),(221,'Resposta ao comentário 17','2025-01-09 02:22:00',17,NULL,5,3,2),(222,'Resposta ao comentário 19','2025-01-08 12:22:00',19,NULL,5,3,2),(223,'Resposta ao comentário 12','2025-01-10 01:22:00',12,NULL,5,4,2),(224,'Resposta ao comentário 14','2025-01-10 06:22:00',14,NULL,5,4,2),(225,'Resposta ao comentário 16','2025-01-09 21:22:00',16,NULL,5,4,2),(226,'Resposta ao comentário 18','2025-01-08 22:22:00',18,NULL,5,4,2),(227,'Resposta ao comentário 20','2025-01-09 16:22:00',20,NULL,5,4,2),(228,'Resposta ao comentário 21','2025-02-14 02:17:00',21,NULL,5,5,2),(229,'Resposta ao comentário 24','2025-02-13 16:17:00',24,NULL,5,5,2),(230,'Resposta ao comentário 27','2025-02-14 11:17:00',27,NULL,5,5,2),(231,'Resposta ao comentário 30','2025-02-15 10:17:00',30,NULL,5,5,2),(232,'Resposta ao comentário 22','2025-02-15 21:17:00',22,NULL,5,6,2),(233,'Resposta ao comentário 25','2025-02-15 16:17:00',25,NULL,5,6,2),(234,'Resposta ao comentário 28','2025-02-14 22:17:00',28,NULL,5,6,2),(235,'Resposta ao comentário 31','2025-02-15 14:17:00',31,NULL,5,6,2),(236,'Resposta ao comentário 23','2025-03-01 02:17:00',23,NULL,5,7,2),(237,'Resposta ao comentário 26','2025-03-01 17:17:00',26,NULL,5,7,2),(238,'Resposta ao comentário 29','2025-03-01 13:17:00',29,NULL,5,7,2),(239,'Resposta ao comentário 32','2025-02-28 17:17:00',32,NULL,5,7,2),(240,'Resposta ao comentário 21','2025-02-14 01:17:00',21,NULL,1,5,2),(241,'Resposta ao comentário 24','2025-02-14 06:17:00',24,NULL,1,5,2),(242,'Resposta ao comentário 27','2025-02-14 10:17:00',27,NULL,1,5,2),(243,'Resposta ao comentário 30','2025-02-15 09:17:00',30,NULL,1,5,2),(244,'Resposta ao comentário 22','2025-02-15 22:17:00',22,NULL,1,6,2),(245,'Resposta ao comentário 25','2025-02-15 03:17:00',25,NULL,1,6,2),(246,'Resposta ao comentário 28','2025-02-14 23:17:00',28,NULL,1,6,2),(247,'Resposta ao comentário 31','2025-02-15 10:17:00',31,NULL,1,6,2),(248,'Resposta ao comentário 23','2025-03-01 05:17:00',23,NULL,1,7,2),(249,'Resposta ao comentário 26','2025-03-01 18:17:00',26,NULL,1,7,2),(250,'Resposta ao comentário 29','2025-03-01 10:17:00',29,NULL,1,7,2),(251,'Resposta ao comentário 32','2025-02-28 23:17:00',32,NULL,1,7,2),(252,'Resposta ao comentário 21','2025-02-14 16:17:00',21,NULL,6,5,2),(253,'Resposta ao comentário 24','2025-02-14 11:17:00',24,NULL,6,5,2),(254,'Resposta ao comentário 27','2025-02-14 16:17:00',27,NULL,6,5,2),(255,'Resposta ao comentário 30','2025-02-15 03:17:00',30,NULL,6,5,2),(256,'Resposta ao comentário 22','2025-02-15 22:17:00',22,NULL,6,6,2),(257,'Resposta ao comentário 25','2025-02-15 18:17:00',25,NULL,6,6,2),(258,'Resposta ao comentário 28','2025-02-15 01:17:00',28,NULL,6,6,2),(259,'Resposta ao comentário 31','2025-02-15 23:17:00',31,NULL,6,6,2),(260,'Resposta ao comentário 23','2025-02-28 14:17:00',23,NULL,6,7,2),(261,'Resposta ao comentário 26','2025-03-01 04:17:00',26,NULL,6,7,2),(262,'Resposta ao comentário 29','2025-03-01 04:17:00',29,NULL,6,7,2),(263,'Resposta ao comentário 32','2025-03-01 12:17:00',32,NULL,6,7,2),(264,'Resposta ao comentário 21','2025-02-14 06:17:00',21,NULL,7,5,2),(265,'Resposta ao comentário 24','2025-02-13 20:17:00',24,NULL,7,5,2),(266,'Resposta ao comentário 27','2025-02-14 18:17:00',27,NULL,7,5,2),(267,'Resposta ao comentário 30','2025-02-15 07:17:00',30,NULL,7,5,2),(268,'Resposta ao comentário 22','2025-02-16 12:17:00',22,NULL,7,6,2),(269,'Resposta ao comentário 25','2025-02-15 04:17:00',25,NULL,7,6,2),(270,'Resposta ao comentário 28','2025-02-15 09:17:00',28,NULL,7,6,2),(271,'Resposta ao comentário 31','2025-02-15 09:17:00',31,NULL,7,6,2),(272,'Resposta ao comentário 23','2025-02-28 16:17:00',23,NULL,7,7,2),(273,'Resposta ao comentário 26','2025-03-01 06:17:00',26,NULL,7,7,2),(274,'Resposta ao comentário 29','2025-03-01 09:17:00',29,NULL,7,7,2),(275,'Resposta ao comentário 32','2025-03-01 09:17:00',32,NULL,7,7,2),(276,'Resposta ao comentário 33','2025-02-13 06:15:00',33,NULL,5,8,2),(277,'Resposta ao comentário 35','2025-02-13 06:15:00',35,NULL,5,8,2),(278,'Resposta ao comentário 37','2025-02-14 10:15:00',37,NULL,5,8,2),(279,'Resposta ao comentário 39','2025-02-12 17:15:00',39,NULL,5,8,2),(280,'Resposta ao comentário 34','2025-02-14 22:30:00',34,NULL,5,9,2),(281,'Resposta ao comentário 36','2025-02-13 08:30:00',36,NULL,5,9,2),(282,'Resposta ao comentário 38','2025-02-13 08:30:00',38,NULL,5,9,2),(283,'Resposta ao comentário 40','2025-02-14 15:30:00',40,NULL,5,9,2),(284,'Resposta ao comentário 33','2025-02-13 02:15:00',33,NULL,1,8,2),(285,'Resposta ao comentário 35','2025-02-13 12:15:00',35,NULL,1,8,2),(286,'Resposta ao comentário 37','2025-02-14 05:15:00',37,NULL,1,8,2),(287,'Resposta ao comentário 39','2025-02-12 21:15:00',39,NULL,1,8,2),(288,'Resposta ao comentário 34','2025-02-14 12:30:00',34,NULL,1,9,2),(289,'Resposta ao comentário 36','2025-02-13 13:30:00',36,NULL,1,9,2),(290,'Resposta ao comentário 38','2025-02-13 19:30:00',38,NULL,1,9,2),(291,'Resposta ao comentário 40','2025-02-14 07:30:00',40,NULL,1,9,2),(292,'Resposta ao comentário 33','2025-02-13 23:15:00',33,NULL,6,8,2),(293,'Resposta ao comentário 35','2025-02-13 23:15:00',35,NULL,6,8,2),(294,'Resposta ao comentário 37','2025-02-13 21:15:00',37,NULL,6,8,2),(295,'Resposta ao comentário 39','2025-02-12 20:15:00',39,NULL,6,8,2),(296,'Resposta ao comentário 34','2025-02-14 06:30:00',34,NULL,6,9,2),(297,'Resposta ao comentário 36','2025-02-13 10:30:00',36,NULL,6,9,2),(298,'Resposta ao comentário 38','2025-02-13 19:30:00',38,NULL,6,9,2),(299,'Resposta ao comentário 40','2025-02-14 17:30:00',40,NULL,6,9,2),(300,'Resposta ao comentário 33','2025-02-13 04:15:00',33,NULL,7,8,2),(301,'Resposta ao comentário 35','2025-02-13 18:15:00',35,NULL,7,8,2),(302,'Resposta ao comentário 37','2025-02-14 00:15:00',37,NULL,7,8,2),(303,'Resposta ao comentário 39','2025-02-13 07:15:00',39,NULL,7,8,2),(304,'Resposta ao comentário 34','2025-02-15 03:30:00',34,NULL,7,9,2),(305,'Resposta ao comentário 36','2025-02-13 09:30:00',36,NULL,7,9,2),(306,'Resposta ao comentário 38','2025-02-13 03:30:00',38,NULL,7,9,2),(307,'Resposta ao comentário 40','2025-02-14 09:30:00',40,NULL,7,9,2),(308,'Resposta ao comentário 41','2025-02-14 15:45:00',41,NULL,5,10,2),(309,'Resposta ao comentário 43','2025-02-14 04:45:00',43,NULL,5,10,2),(310,'Resposta ao comentário 45','2025-02-15 03:45:00',45,NULL,5,10,2),(311,'Resposta ao comentário 47','2025-02-15 02:45:00',47,NULL,5,10,2),(312,'Resposta ao comentário 42','2025-02-13 21:00:00',42,NULL,5,11,2),(313,'Resposta ao comentário 44','2025-02-15 18:00:00',44,NULL,5,11,2),(314,'Resposta ao comentário 46','2025-02-14 20:00:00',46,NULL,5,11,2),(315,'Resposta ao comentário 48','2025-02-13 19:00:00',48,NULL,5,11,2),(316,'Resposta ao comentário 41','2025-02-14 12:45:00',41,NULL,1,10,2),(317,'Resposta ao comentário 43','2025-02-14 14:45:00',43,NULL,1,10,2),(318,'Resposta ao comentário 45','2025-02-14 15:45:00',45,NULL,1,10,2),(319,'Resposta ao comentário 47','2025-02-15 10:45:00',47,NULL,1,10,2),(320,'Resposta ao comentário 42','2025-02-13 23:00:00',42,NULL,1,11,2),(321,'Resposta ao comentário 44','2025-02-15 05:00:00',44,NULL,1,11,2),(322,'Resposta ao comentário 46','2025-02-14 19:00:00',46,NULL,1,11,2),(323,'Resposta ao comentário 48','2025-02-14 06:00:00',48,NULL,1,11,2),(324,'Resposta ao comentário 41','2025-02-14 23:45:00',41,NULL,6,10,2),(325,'Resposta ao comentário 43','2025-02-14 13:45:00',43,NULL,6,10,2),(326,'Resposta ao comentário 45','2025-02-15 02:45:00',45,NULL,6,10,2),(327,'Resposta ao comentário 47','2025-02-15 15:45:00',47,NULL,6,10,2),(383,'Sugestão baseada no registro Levantamento inicial','2025-01-03 03:00:00',NULL,1,1,1,3),(384,'Sugestão baseada no registro Levantamento inicial','2025-01-03 20:15:00',NULL,1,1,2,3),(385,'Sugestão baseada no registro Definição de escopo','2025-01-03 17:00:00',NULL,2,1,1,3),(386,'Sugestão baseada no registro Definição de escopo','2025-01-03 23:15:00',NULL,2,1,2,3),(387,'Sugestão baseada no registro Modelagem inicial','2025-01-05 12:00:00',NULL,3,1,1,3),(388,'Sugestão baseada no registro Modelagem inicial','2025-01-03 15:15:00',NULL,3,1,2,3),(389,'Sugestão baseada no registro Validação com cliente','2025-01-04 09:00:00',NULL,4,1,1,3),(390,'Sugestão baseada no registro Validação com cliente','2025-01-05 00:15:00',NULL,4,1,2,3),(391,'Sugestão baseada no registro Versão preliminar','2025-01-05 18:00:00',NULL,5,1,1,3),(392,'Sugestão baseada no registro Versão preliminar','2025-01-04 14:15:00',NULL,5,1,2,3),(393,'Sugestão baseada no registro Levantamento inicial','2025-01-05 16:00:00',NULL,1,2,1,3),(394,'Sugestão baseada no registro Levantamento inicial','2025-01-05 11:15:00',NULL,1,2,2,3),(395,'Sugestão baseada no registro Definição de escopo','2025-01-04 02:00:00',NULL,2,2,1,3),(396,'Sugestão baseada no registro Definição de escopo','2025-01-04 01:15:00',NULL,2,2,2,3),(397,'Sugestão baseada no registro Modelagem inicial','2025-01-04 18:00:00',NULL,3,2,1,3),(398,'Sugestão baseada no registro Modelagem inicial','2025-01-05 15:15:00',NULL,3,2,2,3),(399,'Sugestão baseada no registro Validação com cliente','2025-01-04 18:00:00',NULL,4,2,1,3),(400,'Sugestão baseada no registro Validação com cliente','2025-01-03 18:15:00',NULL,4,2,2,3),(401,'Sugestão baseada no registro Versão preliminar','2025-01-04 10:00:00',NULL,5,2,1,3),(402,'Sugestão baseada no registro Versão preliminar','2025-01-04 19:15:00',NULL,5,2,2,3),(403,'Sugestão baseada no registro Levantamento inicial','2025-01-04 14:00:00',NULL,1,3,1,3),(404,'Sugestão baseada no registro Levantamento inicial','2025-01-05 09:15:00',NULL,1,3,2,3),(405,'Sugestão baseada no registro Definição de escopo','2025-01-03 23:00:00',NULL,2,3,1,3),(406,'Sugestão baseada no registro Definição de escopo','2025-01-03 17:15:00',NULL,2,3,2,3),(407,'Sugestão baseada no registro Modelagem inicial','2025-01-03 11:00:00',NULL,3,3,1,3),(408,'Sugestão baseada no registro Modelagem inicial','2025-01-03 03:15:00',NULL,3,3,2,3),(409,'Sugestão baseada no registro Validação com cliente','2025-01-05 05:00:00',NULL,4,3,1,3),(410,'Sugestão baseada no registro Validação com cliente','2025-01-04 12:15:00',NULL,4,3,2,3),(411,'Sugestão baseada no registro Versão preliminar','2025-01-03 18:00:00',NULL,5,3,1,3),(412,'Sugestão baseada no registro Versão preliminar','2025-01-05 02:15:00',NULL,5,3,2,3),(413,'Sugestão baseada no registro Levantamento inicial','2025-01-05 04:00:00',NULL,1,4,1,3),(414,'Sugestão baseada no registro Levantamento inicial','2025-01-04 10:15:00',NULL,1,4,2,3),(415,'Sugestão baseada no registro Definição de escopo','2025-01-03 12:00:00',NULL,2,4,1,3),(416,'Sugestão baseada no registro Definição de escopo','2025-01-04 04:15:00',NULL,2,4,2,3),(417,'Sugestão baseada no registro Modelagem inicial','2025-01-04 03:00:00',NULL,3,4,1,3),(418,'Sugestão baseada no registro Modelagem inicial','2025-01-05 02:15:00',NULL,3,4,2,3),(419,'Sugestão baseada no registro Validação com cliente','2025-01-04 00:00:00',NULL,4,4,1,3),(420,'Sugestão baseada no registro Validação com cliente','2025-01-04 16:15:00',NULL,4,4,2,3),(421,'Sugestão baseada no registro Versão preliminar','2025-01-05 02:00:00',NULL,5,4,1,3),(422,'Sugestão baseada no registro Versão preliminar','2025-01-05 10:15:00',NULL,5,4,2,3),(423,'Sugestão baseada no registro Levantamento inicial','2025-01-05 19:00:00',NULL,1,5,1,3),(424,'Sugestão baseada no registro Levantamento inicial','2025-01-03 12:15:00',NULL,1,5,2,3),(425,'Sugestão baseada no registro Definição de escopo','2025-01-06 01:00:00',NULL,2,5,1,3),(426,'Sugestão baseada no registro Definição de escopo','2025-01-04 13:15:00',NULL,2,5,2,3),(427,'Sugestão baseada no registro Modelagem inicial','2025-01-04 13:00:00',NULL,3,5,1,3),(428,'Sugestão baseada no registro Modelagem inicial','2025-01-06 01:15:00',NULL,3,5,2,3),(429,'Sugestão baseada no registro Validação com cliente','2025-01-04 11:00:00',NULL,4,5,1,3),(430,'Sugestão baseada no registro Validação com cliente','2025-01-04 01:15:00',NULL,4,5,2,3),(431,'Sugestão baseada no registro Versão preliminar','2025-01-03 19:00:00',NULL,5,5,1,3),(432,'Sugestão baseada no registro Versão preliminar','2025-01-03 17:15:00',NULL,5,5,2,3),(433,'Sugestão baseada no registro Levantamento inicial','2025-01-09 02:22:00',NULL,1,1,3,3),(434,'Sugestão baseada no registro Levantamento inicial','2025-01-08 05:22:00',NULL,1,1,4,3),(435,'Sugestão baseada no registro Definição de escopo','2025-01-08 08:22:00',NULL,2,1,3,3),(436,'Sugestão baseada no registro Definição de escopo','2025-01-09 07:22:00',NULL,2,1,4,3),(437,'Sugestão baseada no registro Modelagem inicial','2025-01-09 22:22:00',NULL,3,1,3,3),(438,'Sugestão baseada no registro Modelagem inicial','2025-01-10 21:22:00',NULL,3,1,4,3),(439,'Sugestão baseada no registro Validação com cliente','2025-01-10 04:22:00',NULL,4,1,3,3),(440,'Sugestão baseada no registro Validação com cliente','2025-01-10 12:22:00',NULL,4,1,4,3),(441,'Sugestão baseada no registro Versão preliminar','2025-01-10 09:22:00',NULL,5,1,3,3),(442,'Sugestão baseada no registro Versão preliminar','2025-01-09 16:22:00',NULL,5,1,4,3),(443,'Sugestão baseada no registro Levantamento inicial','2025-01-08 16:22:00',NULL,1,2,3,3),(444,'Sugestão baseada no registro Levantamento inicial','2025-01-09 14:22:00',NULL,1,2,4,3),(445,'Sugestão baseada no registro Definição de escopo','2025-01-10 09:22:00',NULL,2,2,3,3),(446,'Sugestão baseada no registro Definição de escopo','2025-01-09 08:22:00',NULL,2,2,4,3),(447,'Sugestão baseada no registro Modelagem inicial','2025-01-10 01:22:00',NULL,3,2,3,3),(448,'Sugestão baseada no registro Modelagem inicial','2025-01-08 10:22:00',NULL,3,2,4,3),(449,'Sugestão baseada no registro Validação com cliente','2025-01-09 11:22:00',NULL,4,2,3,3),(450,'Sugestão baseada no registro Validação com cliente','2025-01-08 08:22:00',NULL,4,2,4,3),(451,'Sugestão baseada no registro Versão preliminar','2025-01-10 19:22:00',NULL,5,2,3,3),(452,'Sugestão baseada no registro Versão preliminar','2025-01-09 03:22:00',NULL,5,2,4,3),(453,'Sugestão baseada no registro Levantamento inicial','2025-01-10 19:22:00',NULL,1,3,3,3),(454,'Sugestão baseada no registro Levantamento inicial','2025-01-09 18:22:00',NULL,1,3,4,3),(455,'Sugestão baseada no registro Definição de escopo','2025-01-10 19:22:00',NULL,2,3,3,3),(456,'Sugestão baseada no registro Definição de escopo','2025-01-11 02:22:00',NULL,2,3,4,3),(457,'Sugestão baseada no registro Modelagem inicial','2025-01-08 09:22:00',NULL,3,3,3,3),(458,'Sugestão baseada no registro Modelagem inicial','2025-01-10 00:22:00',NULL,3,3,4,3),(459,'Sugestão baseada no registro Validação com cliente','2025-01-10 05:22:00',NULL,4,3,3,3),(460,'Sugestão baseada no registro Validação com cliente','2025-01-10 10:22:00',NULL,4,3,4,3),(461,'Sugestão baseada no registro Versão preliminar','2025-01-09 20:22:00',NULL,5,3,3,3),(462,'Sugestão baseada no registro Versão preliminar','2025-01-10 06:22:00',NULL,5,3,4,3),(463,'Sugestão baseada no registro Levantamento inicial','2025-01-10 06:22:00',NULL,1,4,3,3),(464,'Sugestão baseada no registro Levantamento inicial','2025-01-09 16:22:00',NULL,1,4,4,3),(465,'Sugestão baseada no registro Definição de escopo','2025-01-09 00:22:00',NULL,2,4,3,3),(466,'Sugestão baseada no registro Definição de escopo','2025-01-08 07:22:00',NULL,2,4,4,3),(467,'Sugestão baseada no registro Modelagem inicial','2025-01-08 21:22:00',NULL,3,4,3,3),(468,'Sugestão baseada no registro Modelagem inicial','2025-01-08 19:22:00',NULL,3,4,4,3),(469,'Sugestão baseada no registro Validação com cliente','2025-01-08 20:22:00',NULL,4,4,3,3),(470,'Sugestão baseada no registro Validação com cliente','2025-01-10 01:22:00',NULL,4,4,4,3),(471,'Sugestão baseada no registro Versão preliminar','2025-01-09 02:22:00',NULL,5,4,3,3),(472,'Sugestão baseada no registro Versão preliminar','2025-01-10 12:22:00',NULL,5,4,4,3),(473,'Sugestão baseada no registro Levantamento inicial','2025-01-10 20:22:00',NULL,1,5,3,3),(474,'Sugestão baseada no registro Levantamento inicial','2025-01-08 21:22:00',NULL,1,5,4,3),(475,'Sugestão baseada no registro Definição de escopo','2025-01-09 09:22:00',NULL,2,5,3,3),(476,'Sugestão baseada no registro Definição de escopo','2025-01-09 11:22:00',NULL,2,5,4,3),(477,'Sugestão baseada no registro Modelagem inicial','2025-01-10 16:22:00',NULL,3,5,3,3),(478,'Sugestão baseada no registro Modelagem inicial','2025-01-08 05:22:00',NULL,3,5,4,3),(479,'Sugestão baseada no registro Validação com cliente','2025-01-09 11:22:00',NULL,4,5,3,3),(480,'Sugestão baseada no registro Validação com cliente','2025-01-09 00:22:00',NULL,4,5,4,3),(481,'Sugestão baseada no registro Versão preliminar','2025-01-11 02:22:00',NULL,5,5,3,3),(482,'Sugestão baseada no registro Versão preliminar','2025-01-08 16:22:00',NULL,5,5,4,3),(483,'Sugestão baseada no registro Kickoff do app','2025-02-15 01:17:00',NULL,6,5,5,3),(484,'Sugestão baseada no registro Kickoff do app','2025-02-15 12:17:00',NULL,6,5,6,3),(485,'Sugestão baseada no registro Kickoff do app','2025-03-01 04:17:00',NULL,6,5,7,3),(486,'Sugestão baseada no registro Definição de funcionalidades','2025-02-14 13:17:00',NULL,7,5,5,3),(487,'Sugestão baseada no registro Definição de funcionalidades','2025-02-16 01:17:00',NULL,7,5,6,3),(488,'Sugestão baseada no registro Definição de funcionalidades','2025-03-02 13:17:00',NULL,7,5,7,3),(489,'Sugestão baseada no registro Fluxo do usuário','2025-02-13 17:17:00',NULL,8,5,5,3),(490,'Sugestão baseada no registro Fluxo do usuário','2025-02-13 18:17:00',NULL,8,5,6,3),(491,'Sugestão baseada no registro Fluxo do usuário','2025-03-02 15:17:00',NULL,8,5,7,3),(492,'Sugestão baseada no registro Integração backend','2025-02-14 21:17:00',NULL,9,5,5,3),(493,'Sugestão baseada no registro Integração backend','2025-02-16 13:17:00',NULL,9,5,6,3),(494,'Sugestão baseada no registro Integração backend','2025-03-01 00:17:00',NULL,9,5,7,3),(495,'Sugestão baseada no registro Revisão geral','2025-02-13 12:17:00',NULL,10,5,5,3),(496,'Sugestão baseada no registro Revisão geral','2025-02-14 07:17:00',NULL,10,5,6,3),(497,'Sugestão baseada no registro Revisão geral','2025-02-27 21:17:00',NULL,10,5,7,3),(498,'Sugestão baseada no registro Kickoff do app','2025-02-14 18:17:00',NULL,6,1,5,3),(499,'Sugestão baseada no registro Kickoff do app','2025-02-14 23:17:00',NULL,6,1,6,3),(500,'Sugestão baseada no registro Kickoff do app','2025-03-02 12:17:00',NULL,6,1,7,3),(501,'Sugestão baseada no registro Definição de funcionalidades','2025-02-13 19:17:00',NULL,7,1,5,3),(502,'Sugestão baseada no registro Definição de funcionalidades','2025-02-14 07:17:00',NULL,7,1,6,3),(503,'Sugestão baseada no registro Definição de funcionalidades','2025-03-01 22:17:00',NULL,7,1,7,3),(504,'Sugestão baseada no registro Fluxo do usuário','2025-02-12 21:17:00',NULL,8,1,5,3),(505,'Sugestão baseada no registro Fluxo do usuário','2025-02-14 14:17:00',NULL,8,1,6,3),(506,'Sugestão baseada no registro Fluxo do usuário','2025-02-28 03:17:00',NULL,8,1,7,3),(507,'Sugestão baseada no registro Integração backend','2025-02-15 01:17:00',NULL,9,1,5,3),(508,'Sugestão baseada no registro Integração backend','2025-02-15 18:17:00',NULL,9,1,6,3),(509,'Sugestão baseada no registro Integração backend','2025-03-02 14:17:00',NULL,9,1,7,3),(510,'Sugestão baseada no registro Revisão geral','2025-02-14 18:17:00',NULL,10,1,5,3),(511,'Sugestão baseada no registro Revisão geral','2025-02-15 20:17:00',NULL,10,1,6,3),(512,'Sugestão baseada no registro Revisão geral','2025-02-28 23:17:00',NULL,10,1,7,3),(513,'Sugestão baseada no registro Kickoff do app','2025-02-15 07:17:00',NULL,6,6,5,3),(514,'Sugestão baseada no registro Kickoff do app','2025-02-14 12:17:00',NULL,6,6,6,3),(515,'Sugestão baseada no registro Kickoff do app','2025-03-01 12:17:00',NULL,6,6,7,3),(516,'Sugestão baseada no registro Definição de funcionalidades','2025-02-13 06:17:00',NULL,7,6,5,3),(517,'Sugestão baseada no registro Definição de funcionalidades','2025-02-14 12:17:00',NULL,7,6,6,3),(518,'Sugestão baseada no registro Definição de funcionalidades','2025-03-01 18:17:00',NULL,7,6,7,3),(519,'Sugestão baseada no registro Fluxo do usuário','2025-02-14 08:17:00',NULL,8,6,5,3),(520,'Sugestão baseada no registro Fluxo do usuário','2025-02-16 09:17:00',NULL,8,6,6,3),(521,'Sugestão baseada no registro Fluxo do usuário','2025-03-01 18:17:00',NULL,8,6,7,3),(522,'Sugestão baseada no registro Integração backend','2025-02-14 20:17:00',NULL,9,6,5,3),(523,'Sugestão baseada no registro Integração backend','2025-02-15 17:17:00',NULL,9,6,6,3),(524,'Sugestão baseada no registro Integração backend','2025-02-27 23:17:00',NULL,9,6,7,3),(525,'Sugestão baseada no registro Revisão geral','2025-02-13 20:17:00',NULL,10,6,5,3),(526,'Sugestão baseada no registro Revisão geral','2025-02-16 04:17:00',NULL,10,6,6,3),(527,'Sugestão baseada no registro Revisão geral','2025-03-02 06:17:00',NULL,10,6,7,3),(528,'Sugestão baseada no registro Kickoff do app','2025-02-14 22:17:00',NULL,6,7,5,3),(529,'Sugestão baseada no registro Kickoff do app','2025-02-14 18:17:00',NULL,6,7,6,3),(530,'Sugestão baseada no registro Kickoff do app','2025-02-28 19:17:00',NULL,6,7,7,3),(531,'Sugestão baseada no registro Definição de funcionalidades','2025-02-14 23:17:00',NULL,7,7,5,3),(532,'Sugestão baseada no registro Definição de funcionalidades','2025-02-16 06:17:00',NULL,7,7,6,3),(533,'Sugestão baseada no registro Definição de funcionalidades','2025-03-02 06:17:00',NULL,7,7,7,3),(534,'Sugestão baseada no registro Fluxo do usuário','2025-02-14 15:17:00',NULL,8,7,5,3),(535,'Sugestão baseada no registro Fluxo do usuário','2025-02-16 08:17:00',NULL,8,7,6,3),(536,'Sugestão baseada no registro Fluxo do usuário','2025-02-28 16:17:00',NULL,8,7,7,3),(537,'Sugestão baseada no registro Integração backend','2025-02-15 13:17:00',NULL,9,7,5,3),(538,'Sugestão baseada no registro Integração backend','2025-02-16 14:17:00',NULL,9,7,6,3),(539,'Sugestão baseada no registro Integração backend','2025-03-02 04:17:00',NULL,9,7,7,3),(540,'Sugestão baseada no registro Revisão geral','2025-02-13 08:17:00',NULL,10,7,5,3),(541,'Sugestão baseada no registro Revisão geral','2025-02-15 23:17:00',NULL,10,7,6,3),(542,'Sugestão baseada no registro Revisão geral','2025-03-02 15:17:00',NULL,10,7,7,3),(543,'Sugestão baseada no registro Kickoff do app','2025-02-14 01:15:00',NULL,6,5,8,3),(544,'Sugestão baseada no registro Kickoff do app','2025-02-13 12:30:00',NULL,6,5,9,3),(545,'Sugestão baseada no registro Definição de funcionalidades','2025-02-13 13:15:00',NULL,7,5,8,3),(546,'Sugestão baseada no registro Definição de funcionalidades','2025-02-14 04:30:00',NULL,7,5,9,3),(547,'Sugestão baseada no registro Fluxo do usuário','2025-02-12 08:15:00',NULL,8,5,8,3),(548,'Sugestão baseada no registro Fluxo do usuário','2025-02-15 04:30:00',NULL,8,5,9,3),(549,'Sugestão baseada no registro Integração backend','2025-02-15 01:15:00',NULL,9,5,8,3),(550,'Sugestão baseada no registro Integração backend','2025-02-13 19:30:00',NULL,9,5,9,3),(551,'Sugestão baseada no registro Revisão geral','2025-02-14 23:15:00',NULL,10,5,8,3),(552,'Sugestão baseada no registro Revisão geral','2025-02-14 08:30:00',NULL,10,5,9,3),(553,'Sugestão baseada no registro Kickoff do app','2025-02-15 01:15:00',NULL,6,1,8,3),(554,'Sugestão baseada no registro Kickoff do app','2025-02-13 05:30:00',NULL,6,1,9,3),(555,'Sugestão baseada no registro Definição de funcionalidades','2025-02-15 01:15:00',NULL,7,1,8,3),(556,'Sugestão baseada no registro Definição de funcionalidades','2025-02-13 14:30:00',NULL,7,1,9,3),(557,'Sugestão baseada no registro Fluxo do usuário','2025-02-13 22:15:00',NULL,8,1,8,3),(558,'Sugestão baseada no registro Fluxo do usuário','2025-02-12 22:30:00',NULL,8,1,9,3),(559,'Sugestão baseada no registro Integração backend','2025-02-14 00:15:00',NULL,9,1,8,3),(560,'Sugestão baseada no registro Integração backend','2025-02-15 04:30:00',NULL,9,1,9,3),(561,'Sugestão baseada no registro Revisão geral','2025-02-13 02:15:00',NULL,10,1,8,3),(562,'Sugestão baseada no registro Revisão geral','2025-02-12 22:30:00',NULL,10,1,9,3),(563,'Sugestão baseada no registro Kickoff do app','2025-02-13 12:15:00',NULL,6,6,8,3),(564,'Sugestão baseada no registro Kickoff do app','2025-02-12 19:30:00',NULL,6,6,9,3),(565,'Sugestão baseada no registro Definição de funcionalidades','2025-02-14 14:15:00',NULL,7,6,8,3),(566,'Sugestão baseada no registro Definição de funcionalidades','2025-02-15 13:30:00',NULL,7,6,9,3),(567,'Sugestão baseada no registro Fluxo do usuário','2025-02-13 02:15:00',NULL,8,6,8,3),(568,'Sugestão baseada no registro Fluxo do usuário','2025-02-14 21:30:00',NULL,8,6,9,3),(569,'Sugestão baseada no registro Integração backend','2025-02-14 08:15:00',NULL,9,6,8,3),(570,'Sugestão baseada no registro Integração backend','2025-02-13 23:30:00',NULL,9,6,9,3),(571,'Sugestão baseada no registro Revisão geral','2025-02-14 21:15:00',NULL,10,6,8,3),(572,'Sugestão baseada no registro Revisão geral','2025-02-13 16:30:00',NULL,10,6,9,3),(573,'Sugestão baseada no registro Kickoff do app','2025-02-14 18:15:00',NULL,6,7,8,3),(574,'Sugestão baseada no registro Kickoff do app','2025-02-13 21:30:00',NULL,6,7,9,3),(575,'Sugestão baseada no registro Definição de funcionalidades','2025-02-13 05:15:00',NULL,7,7,8,3),(576,'Sugestão baseada no registro Definição de funcionalidades','2025-02-14 12:30:00',NULL,7,7,9,3),(577,'Sugestão baseada no registro Fluxo do usuário','2025-02-14 23:15:00',NULL,8,7,8,3),(578,'Sugestão baseada no registro Fluxo do usuário','2025-02-15 09:30:00',NULL,8,7,9,3),(579,'Sugestão baseada no registro Integração backend','2025-02-14 01:15:00',NULL,9,7,8,3),(580,'Sugestão baseada no registro Integração backend','2025-02-14 05:30:00',NULL,9,7,9,3),(581,'Sugestão baseada no registro Revisão geral','2025-02-14 01:15:00',NULL,10,7,8,3),(582,'Sugestão baseada no registro Revisão geral','2025-02-14 16:30:00',NULL,10,7,9,3),(638,'Boa ideia!','2025-01-01 03:05:00',1,NULL,2,1,2);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_comentario_notificacao` AFTER INSERT ON `comentario` FOR EACH ROW BEGIN
    INSERT INTO notificacao (descricao, comentario_id, usuario_id)
    SELECT DISTINCT
        CONCAT(
            usuario.nome,
            ' comentou no documento "',
            documento.titulo,
            '"'
        ) AS descricao,
        NEW.id,
        documento_versao.criador_id
    FROM documento_versao
    JOIN documento ON documento.id = documento_versao.documento_id
    JOIN usuario usuario ON usuario.id = NEW.criador_id
    WHERE documento_versao.documento_id = NEW.documento_id
    AND documento_versao.criador_id != NEW.criador_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `comentario_tipo`
--

DROP TABLE IF EXISTS `comentario_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario_tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario_tipo`
--

LOCK TABLES `comentario_tipo` WRITE;
/*!40000 ALTER TABLE `comentario_tipo` DISABLE KEYS */;
INSERT INTO `comentario_tipo` VALUES (1,'comentario'),(2,'resposta'),(3,'sugestao');
/*!40000 ALTER TABLE `comentario_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convidado_reuniao`
--

DROP TABLE IF EXISTS `convidado_reuniao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convidado_reuniao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `reuniao_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_convidado_reuniao_reuniao` (`reuniao_id`),
  CONSTRAINT `fk_convidado_reuniao_reuniao` FOREIGN KEY (`reuniao_id`) REFERENCES `reuniao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convidado_reuniao`
--

LOCK TABLES `convidado_reuniao` WRITE;
/*!40000 ALTER TABLE `convidado_reuniao` DISABLE KEYS */;
INSERT INTO `convidado_reuniao` VALUES (1,'Mozart','Compositor Musical',1),(2,'Ana Souza','Cliente',1),(3,'Carlos Mendes','Consultor Externo',1),(4,'Adalberto Lima','Cliente Profissional',2),(5,'Fernanda Alves','Product Owner',2),(6,'Ricardo Gomes','Diretor',3),(7,'Juliana Castro','Stakeholder',3),(8,'Patrícia Lima','Especialista de Negócio',3),(9,'Bruno Rocha','Investidor',4),(10,'Camila Freitas','UX Researcher',4),(11,'Eduardo Martins','Arquiteto de Software',5),(12,'Larissa Nogueira','Analista de Sistemas',5),(13,'Roberto Dias','Consultor Técnico',5),(14,'Marcos Vinicius','Scrum Advisor',6),(15,'Aline Ribeiro','Agile Coach',6),(16,'Thiago Fernandes','RH',7),(17,'Beatriz Cardoso','Coordenadora',7),(18,'Gustavo Pinto','Mentor',7),(19,'Renata Teixeira','Designer',8),(20,'Felipe Barros','Inovação',8),(21,'Sérgio Lopes','Cliente Final',9),(22,'Vanessa Duarte','Gerente Comercial',9),(23,'Hugo Carvalho','Consultor Estratégico',9),(24,'Daniela Moura','Stakeholder',10),(25,'Lucas Tavares','Engenheiro de Software',10),(26,'Paulo Henrique','Analista de Negócios',11),(27,'Tatiane Gomes','Cliente',11),(28,'Igor Santana','Consultor',11),(29,'Rafaela Campos','Product Manager',12),(30,'Diego Azevedo','Tech Lead',12);
/*!40000 ALTER TABLE `convidado_reuniao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convite`
--

DROP TABLE IF EXISTS `convite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `projeto_id` int NOT NULL,
  `destinatario_id` int NOT NULL,
  `nivel_acesso_id` int DEFAULT NULL,
  `remetente_id` int NOT NULL,
  `convite_status_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_convite_projeto` (`projeto_id`),
  KEY `convite_usuario_destino` (`destinatario_id`),
  KEY `convite_usuario_remetente` (`remetente_id`),
  KEY `fk_convite_nivel_acesso` (`nivel_acesso_id`),
  KEY `fk_convite_status_convite` (`convite_status_id`),
  CONSTRAINT `convite_usuario_destino` FOREIGN KEY (`destinatario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `convite_usuario_remetente` FOREIGN KEY (`remetente_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_convite_nivel_acesso` FOREIGN KEY (`nivel_acesso_id`) REFERENCES `nivel_acesso` (`id`),
  CONSTRAINT `fk_convite_projeto` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`id`),
  CONSTRAINT `fk_convite_status_convite` FOREIGN KEY (`convite_status_id`) REFERENCES `convite_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convite`
--

LOCK TABLES `convite` WRITE;
/*!40000 ALTER TABLE `convite` DISABLE KEYS */;
INSERT INTO `convite` VALUES (1,'2025-01-01 04:15:00',1,2,1,1,6),(2,'2025-01-01 06:48:00',1,3,2,1,6),(3,'2025-01-01 10:21:00',1,4,3,1,6),(4,'2025-01-02 14:43:00',1,5,4,1,6),(5,'2025-02-13 17:15:00',2,1,2,5,6),(6,'2025-02-15 19:50:00',2,3,2,5,1),(7,'2025-02-17 22:25:00',2,6,2,5,6),(8,'2025-02-21 00:36:00',2,4,3,5,1),(9,'2025-02-25 13:58:00',2,7,4,5,6),(10,'2025-04-01 14:05:00',3,8,1,6,6),(11,'2025-04-01 14:20:00',3,7,2,6,1),(12,'2025-04-01 14:53:00',3,5,3,6,6),(13,'2025-04-01 16:18:00',3,3,4,6,1),(14,'2026-02-27 13:31:00',4,10,2,11,6),(15,'2026-02-27 13:32:00',4,12,2,11,6),(16,'2026-02-27 13:33:00',4,13,2,11,6),(17,'2026-02-27 13:43:00',4,15,4,11,1),(18,'2026-03-19 13:43:00',4,14,3,11,1);
/*!40000 ALTER TABLE `convite` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_convite_aceito` AFTER UPDATE ON `convite` FOR EACH ROW BEGIN
		-- Caso um convite pendente seja aceito
        IF OLD.convite_status_id = 1 AND NEW.convite_status_id = 6 THEN 
            
            -- Enviando "Convite" aviso de que o usuário aceitou o convite
            -- INSERT INTO convite(projeto_id, destinatario_id, remetente_id, convite_status_id)
            -- VALUES(NEW.projeto_id, NEW.remetente_id, NEW.destinatario_id, 4);
				-- Retrabalhar como vai funcionar isso
            
            -- Adicionando usuario ao projeto
            INSERT INTO usuario_projeto(usuario_id, projeto_id, nivel_acesso_id)
            VALUES(NEW.destinatario_id, NEW.projeto_id, NEW.nivel_acesso_id);
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `convite_status`
--

DROP TABLE IF EXISTS `convite_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convite_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convite_status`
--

LOCK TABLES `convite_status` WRITE;
/*!40000 ALTER TABLE `convite_status` DISABLE KEYS */;
INSERT INTO `convite_status` VALUES (1,'pendente'),(2,'recusado'),(3,'expirado'),(4,'não-lido'),(5,'lido'),(6,'aceito');
/*!40000 ALTER TABLE `convite_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categoria_id` int NOT NULL,
  `deletado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_documento_categoria` (`categoria_id`),
  CONSTRAINT `fk_documento_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (1,'Documento de Requisitos','2025-01-03 03:00:00',1,NULL),(2,'Manual do Usuário Web','2025-01-03 03:15:00',1,NULL),(3,'Especificação Mobile','2025-01-08 03:22:00',2,NULL),(4,'Checklist de Testes Mobile','2025-01-08 05:22:00',2,NULL),(5,'Plano de Projeto','2025-02-12 15:17:00',3,NULL),(6,'Cronograma','2025-02-13 18:17:00',3,NULL),(7,'Relatório de Progresso','2025-02-27 18:17:00',3,NULL),(8,'Fluxo de Navegação do Usuário','2025-02-12 04:15:00',4,NULL),(9,'Casos de Uso - Usuário','2025-02-12 17:30:00',4,NULL),(10,'Fluxo de Entregas','2025-02-12 20:45:00',5,NULL),(11,'Casos de Uso - Entregador','2025-02-13 01:00:00',5,NULL),(12,'Modelo Entidade-Relacionamento','2025-04-01 15:15:00',6,NULL),(13,'Dicionário de Dados','2025-04-01 16:00:00',6,NULL),(14,'Documentação da API','2025-04-01 18:15:00',7,NULL),(15,'Arquitetura do Sistema','2025-04-01 22:10:00',7,NULL),(16,'Guia de Componentes UI','2025-04-01 16:06:00',8,NULL),(17,'Padrões de Estilo','2025-04-01 18:19:00',8,NULL),(18,'TAP - Termo de Abertura de Projeto','2026-03-03 11:10:00',9,NULL),(19,'Lista de demandas','2026-03-04 09:10:00',9,NULL),(20,'Requisitos Funcionais','2026-03-05 06:40:00',11,NULL),(21,'Requisitos não Funcionais','2026-03-07 04:10:00',11,NULL),(22,'Modelo Conceitual','2026-03-10 11:30:00',10,NULL),(23,'Modelo Lógico','2026-03-15 06:10:00',10,NULL),(24,'Scripts Criação de tabelas','2026-03-19 04:10:00',10,NULL),(25,'Scripts Recursos (Triggers, Procedures, Views)','2026-03-30 03:32:00',10,NULL),(26,'Scripts Inserts','2026-04-04 23:54:00',10,NULL),(27,'Swagger API','2026-03-10 12:00:00',11,NULL),(28,'Roteiro de Testes (Back-End)','2026-03-11 08:45:00',11,NULL),(29,'Protótipos','2026-03-07 00:15:00',12,NULL),(30,'Roteiro de Testes (Front-End)','2026-03-21 21:30:00',12,NULL),(31,'Roteiro de Testes (Mobile)','2026-03-24 12:45:00',13,NULL);
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento_versao`
--

DROP TABLE IF EXISTS `documento_versao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento_versao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conteudo` text NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `criador_id` int NOT NULL,
  `documento_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_documento_versao_usuario_criador` (`criador_id`),
  KEY `fk_documento_versao_documento` (`documento_id`),
  CONSTRAINT `fk_documento_versao_documento` FOREIGN KEY (`documento_id`) REFERENCES `documento` (`id`),
  CONSTRAINT `fk_documento_versao_usuario_criador` FOREIGN KEY (`criador_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento_versao`
--

LOCK TABLES `documento_versao` WRITE;
/*!40000 ALTER TABLE `documento_versao` DISABLE KEYS */;
INSERT INTO `documento_versao` VALUES (1,'v1 - Levantamento inicial de requisitos.','2025-01-03 04:00:00',1,1),(2,'v2 - Ajustes após reunião com cliente.','2025-01-03 04:30:00',2,1),(3,'v3 - Redefinindo ordem.','2025-01-03 05:00:00',3,1),(4,'v4 - Versão final aprovada','2025-01-03 05:30:00',1,1),(5,'v1 - Estrutura inicial do app mobile.','2025-01-03 04:15:00',1,2),(6,'v2 - Inclusão de novas funcionalidades.','2025-01-03 04:45:00',2,2),(7,'v1 - Protótipo inicial das telas web.','2025-01-08 04:22:00',2,3),(8,'v1 - Manual básico do usuário.','2025-01-08 06:22:00',3,4),(9,'v2 - Manual revisado com melhorias.','2025-01-08 06:52:00',1,4),(10,'v1 - Guia de instalação mobile.','2025-02-12 16:17:00',1,5),(11,'v1 - Relatório de testes iniciais.','2025-02-13 19:17:00',2,6),(12,'v2 - Correções após testes.','2025-02-13 19:47:00',3,6),(13,'v1 - Planejamento do projeto.','2025-02-27 19:17:00',1,7),(14,'v1 - Cronograma inicial.','2025-02-12 05:15:00',2,8),(15,'v2 - Cronograma atualizado.','2025-02-12 05:45:00',3,8),(16,'v1 - Relatório de progresso semanal.','2025-02-12 18:30:00',3,9),(17,'v1 - Fluxo de navegação do usuário.','2025-02-12 21:45:00',1,10),(18,'v1 - Casos de uso do usuário.','2025-02-13 02:00:00',2,1),(19,'v1 - Fluxo de entregas.','2025-04-01 16:15:00',3,12),(20,'v1 - Casos de uso do entregador.','2025-04-01 17:00:00',1,13),(21,'v1 - Modelo ER inicial.','2025-04-01 19:15:00',2,14),(22,'v1 - Dicionário de dados.','2025-04-01 23:10:00',3,15),(23,'v1 - Documentação da API.','2025-04-01 17:06:00',1,16),(24,'v2 - Inclusão de novos endpoints.','2025-04-01 17:36:00',2,16),(25,'v1 - Arquitetura backend.','2025-04-01 19:19:00',2,17),(26,'v1 - TAP - Escopo[...]','2026-03-03 12:10:00',10,18),(27,'v2 - TAP - Escopo[...] Cronograma[...]','2026-03-03 12:40:00',2,18),(28,'v3 - TAP - Escopo[...] Cronograma[...] Participantes[...] Orçamento[...]','2026-03-03 13:10:00',2,18),(29,'v4 - Inclusão de riscos e stakeholders','2026-03-03 13:40:00',11,18),(30,'v5 - Ajustes finais aprovados pelo professor','2026-03-03 14:10:00',15,18),(31,'v1 - Levantamento inicial de demandas','2026-03-04 10:10:00',11,19),(32,'v2 - Priorização inicial','2026-03-04 10:40:00',10,19),(33,'v3 - Refinamento com equipe','2026-03-04 11:10:00',12,19),(34,'v1 - Levantamento inicial','2026-03-05 07:40:00',11,20),(35,'v2 - Validação com stakeholders','2026-03-05 08:10:00',13,20),(36,'v3 - Ajustes pós reunião','2026-03-05 08:40:00',10,20),(37,'v1 - Definição de performance','2026-03-07 05:10:00',12,21),(38,'v2 - Inclusão de segurança','2026-03-07 05:40:00',13,21),(39,'v1 - Estrutura inicial','2026-03-10 12:30:00',10,22),(40,'v2 - Ajustes nas entidades','2026-03-10 13:00:00',11,22),(41,'v1 - Conversão do modelo','2026-03-15 07:10:00',10,23),(42,'v2 - Normalização aplicada','2026-03-15 07:40:00',12,23),(43,'v1 - Criação inicial','2026-03-19 05:10:00',11,24),(44,'v2 - Ajustes de constraints','2026-03-19 05:40:00',10,24),(45,'v1 - Triggers iniciais','2026-03-30 04:32:00',12,25),(46,'v2 - Procedures adicionadas','2026-03-30 05:02:00',11,25),(47,'v1 - Inserts iniciais','2026-04-05 00:54:00',10,26),(48,'v2 - Ajustes nos dados','2026-04-05 01:24:00',12,26),(49,'v1 - Documentação inicial','2026-03-10 13:00:00',11,27),(50,'v2 - Inclusão de endpoints','2026-03-10 13:30:00',12,27),(51,'v1 - Testes unitários','2026-03-11 09:45:00',10,28),(52,'v2 - Testes de integração','2026-03-11 10:15:00',11,28),(53,'v1 - Wireframes','2026-03-07 01:15:00',13,29),(54,'v2 - Protótipos navegáveis','2026-03-07 01:45:00',12,29),(55,'v1 - Testes de usabilidade','2026-03-21 22:30:00',13,30),(56,'v2 - Ajustes pós testes','2026-03-21 23:00:00',12,30),(57,'v1 - Testes iniciais mobile','2026-03-24 13:45:00',13,31),(58,'v2 - Correções pós testes','2026-03-24 14:15:00',12,31);
/*!40000 ALTER TABLE `documento_versao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `tipo_link_id` int NOT NULL,
  `reuniao_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_link_tipo_link` (`tipo_link_id`),
  KEY `fk_link_reuniao` (`reuniao_id`),
  CONSTRAINT `fk_link_reuniao` FOREIGN KEY (`reuniao_id`) REFERENCES `reuniao` (`id`),
  CONSTRAINT `fk_link_tipo_link` FOREIGN KEY (`tipo_link_id`) REFERENCES `tipo_link` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,'https://meet.google.com/aaa-111','Google Meet',1,1),(2,'https://docs.google.com/document/d/aaa1','Documento Inicial',2,1),(3,'https://meet.google.com/bbb-222','Google Meet',1,2),(4,'https://docs.google.com/document/d/bbb2','Requisitos',2,2),(5,'https://miro.com/app/board/bbb2','Quadro Miro',2,2),(6,'https://meet.google.com/ccc-333','Google Meet',1,3),(7,'https://teams.microsoft.com/l/meetup-join/ddd-444','Microsoft Teams',1,4),(8,'https://docs.google.com/presentation/d/ddd4','Apresentação',2,4),(9,'https://meet.google.com/eee-555','Google Meet',1,5),(10,'https://docs.google.com/document/d/eee5','Funcionalidades',2,5),(11,'https://zoom.us/j/fff-666','Zoom',1,6),(12,'https://jira.com/browse/fff6','Tarefas Jira',2,6),(13,'https://confluence.com/display/fff6','Documentação',2,6),(14,'https://meet.google.com/ggg-777','Google Meet',1,7),(15,'https://meet.google.com/hhh-888','Google Meet',1,8),(16,'https://miro.com/app/board/hhh8','Brainstorming',2,8),(17,'https://teams.microsoft.com/l/meetup-join/iii-999','Microsoft Teams',1,9),(18,'https://docs.google.com/document/d/iii9','Decisão Final',2,9),(19,'https://meet.google.com/jjj-101','Google Meet',1,10),(20,'https://docs.google.com/presentation/d/jjj10','Kickoff Slides',2,10),(21,'https://zoom.us/j/kkk-202','Zoom',1,11),(22,'https://docs.google.com/document/d/kkk11','Levantamento',2,11),(23,'https://miro.com/app/board/kkk11','Mapa de Requisitos',2,11),(24,'https://teams.microsoft.com/l/meetup-join/lll-303','Microsoft Teams',1,12),(25,'https://jira.com/browse/lll12','Planejamento Sprint',2,12);
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_acesso`
--

DROP TABLE IF EXISTS `nivel_acesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel_acesso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_acesso`
--

LOCK TABLES `nivel_acesso` WRITE;
/*!40000 ALTER TABLE `nivel_acesso` DISABLE KEYS */;
INSERT INTO `nivel_acesso` VALUES (1,'Gerente de Projeto'),(2,'Analista de Requisitos'),(3,'Desenvolvedor'),(4,'Cliente');
/*!40000 ALTER TABLE `nivel_acesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacao`
--

DROP TABLE IF EXISTS `notificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(300) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aberto` tinyint(1) DEFAULT '0',
  `comentario_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notificacao_comentario` (`comentario_id`),
  KEY `fk_notificacao_usuario` (`usuario_id`),
  CONSTRAINT `fk_notificacao_comentario` FOREIGN KEY (`comentario_id`) REFERENCES `comentario` (`id`),
  CONSTRAINT `fk_notificacao_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacao`
--

LOCK TABLES `notificacao` WRITE;
/*!40000 ALTER TABLE `notificacao` DISABLE KEYS */;
INSERT INTO `notificacao` VALUES (1,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,1,2),(2,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,1,3),(4,'Ana Livia comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,2,2),(5,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,3,1),(6,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,3,3),(8,'Larissa Lemos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,4,1),(9,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,5,1),(10,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,5,2),(12,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,6,1),(13,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,6,2),(15,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,7,1),(16,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,7,2),(17,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,7,3),(18,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,8,1),(19,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,8,2),(21,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,9,1),(22,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,9,2),(23,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,9,3),(24,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,10,1),(25,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,10,2),(27,'Ana Livia comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,11,2),(28,'Ana Livia comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,12,3),(29,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,14,3),(30,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,14,1),(32,'Marcos Santos comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,15,2),(33,'Marcos Santos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,16,1),(34,'Carlos Ribeiro comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,17,2),(35,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,18,3),(36,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,18,1),(38,'João Silva comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,19,2),(39,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,20,3),(40,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,20,1),(42,'João Silva comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,21,1),(43,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,22,2),(44,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,22,3),(46,'João Silva comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,23,1),(47,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,25,2),(48,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,25,3),(50,'Maria Souza comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,27,1),(51,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,28,2),(52,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,28,3),(54,'Maria Souza comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,29,1),(55,'Bernardo Pereira comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,30,1),(56,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,31,2),(57,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,31,3),(59,'Bernardo Pereira comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,32,1),(60,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,33,2),(61,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,33,3),(63,'João Silva comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,34,3),(64,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,35,2),(65,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,35,3),(67,'Ana Livia comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,36,3),(68,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,37,2),(69,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,37,3),(71,'Maria Souza comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,38,3),(72,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,39,2),(73,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,39,3),(75,'Bernardo Pereira comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,40,3),(76,'João Silva comentou no documento \"Fluxo de Entregas\"','2026-05-06 00:21:16',0,41,1),(77,'Maria Souza comentou no documento \"Fluxo de Entregas\"','2026-05-06 00:21:16',0,45,1),(78,'Bernardo Pereira comentou no documento \"Fluxo de Entregas\"','2026-05-06 00:21:16',0,47,1),(79,'Maria Souza comentou no documento \"Modelo Entidade-Relacionamento\"','2026-05-06 00:21:16',0,49,3),(80,'Maria Souza comentou no documento \"Dicionário de Dados\"','2026-05-06 00:21:16',0,50,1),(81,'Manuela Ferreira comentou no documento \"Modelo Entidade-Relacionamento\"','2026-05-06 00:21:16',0,51,3),(82,'Manuela Ferreira comentou no documento \"Dicionário de Dados\"','2026-05-06 00:21:16',0,52,1),(83,'João Silva comentou no documento \"Modelo Entidade-Relacionamento\"','2026-05-06 00:21:16',0,53,3),(84,'João Silva comentou no documento \"Dicionário de Dados\"','2026-05-06 00:21:16',0,54,1),(85,'Maria Souza comentou no documento \"Documentação da API\"','2026-05-06 00:21:16',0,55,2),(86,'Maria Souza comentou no documento \"Arquitetura do Sistema\"','2026-05-06 00:21:16',0,56,3),(87,'Manuela Ferreira comentou no documento \"Documentação da API\"','2026-05-06 00:21:16',0,57,2),(88,'Manuela Ferreira comentou no documento \"Arquitetura do Sistema\"','2026-05-06 00:21:16',0,58,3),(89,'João Silva comentou no documento \"Documentação da API\"','2026-05-06 00:21:16',0,59,2),(90,'João Silva comentou no documento \"Arquitetura do Sistema\"','2026-05-06 00:21:16',0,60,3),(91,'Maria Souza comentou no documento \"Guia de Componentes UI\"','2026-05-06 00:21:16',0,61,1),(92,'Maria Souza comentou no documento \"Guia de Componentes UI\"','2026-05-06 00:21:16',0,61,2),(94,'Maria Souza comentou no documento \"Padrões de Estilo\"','2026-05-06 00:21:16',0,62,2),(95,'Manuela Ferreira comentou no documento \"Guia de Componentes UI\"','2026-05-06 00:21:16',0,63,1),(96,'Manuela Ferreira comentou no documento \"Guia de Componentes UI\"','2026-05-06 00:21:16',0,63,2),(98,'Manuela Ferreira comentou no documento \"Padrões de Estilo\"','2026-05-06 00:21:16',0,64,2),(99,'João Silva comentou no documento \"Guia de Componentes UI\"','2026-05-06 00:21:16',0,65,1),(100,'João Silva comentou no documento \"Guia de Componentes UI\"','2026-05-06 00:21:16',0,65,2),(102,'João Silva comentou no documento \"Padrões de Estilo\"','2026-05-06 00:21:16',0,66,2),(103,'Edvan Alves comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,67,10),(104,'Edvan Alves comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,67,2),(105,'Edvan Alves comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,67,15),(106,'Edvan Alves comentou no documento \"Lista de demandas\"','2026-05-06 00:21:16',0,68,10),(107,'Edvan Alves comentou no documento \"Lista de demandas\"','2026-05-06 00:21:16',0,68,12),(109,'André Roberto comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,69,2),(110,'André Roberto comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,69,11),(111,'André Roberto comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,69,15),(112,'André Roberto comentou no documento \"Lista de demandas\"','2026-05-06 00:21:16',0,70,11),(113,'André Roberto comentou no documento \"Lista de demandas\"','2026-05-06 00:21:16',0,70,12),(115,'Nathan da Silva comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,71,10),(116,'Nathan da Silva comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,71,2),(117,'Nathan da Silva comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,71,11),(118,'Nathan da Silva comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,71,15),(122,'Nathan da Silva comentou no documento \"Lista de demandas\"','2026-05-06 00:21:16',0,72,11),(123,'Nathan da Silva comentou no documento \"Lista de demandas\"','2026-05-06 00:21:16',0,72,10),(125,'Samara Rolim comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,73,10),(126,'Samara Rolim comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,73,2),(127,'Samara Rolim comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,73,11),(128,'Samara Rolim comentou no documento \"TAP - Termo de Abertura de Projeto\"','2026-05-06 00:21:16',0,73,15),(132,'Samara Rolim comentou no documento \"Lista de demandas\"','2026-05-06 00:21:16',0,74,11),(133,'Samara Rolim comentou no documento \"Lista de demandas\"','2026-05-06 00:21:16',0,74,10),(134,'Samara Rolim comentou no documento \"Lista de demandas\"','2026-05-06 00:21:16',0,74,12),(135,'Edvan Alves comentou no documento \"Modelo Conceitual\"','2026-05-06 00:21:16',0,75,10),(136,'Edvan Alves comentou no documento \"Modelo Lógico\"','2026-05-06 00:21:16',0,76,10),(137,'Edvan Alves comentou no documento \"Modelo Lógico\"','2026-05-06 00:21:16',0,76,12),(139,'Edvan Alves comentou no documento \"Scripts Criação de tabelas\"','2026-05-06 00:21:16',0,77,10),(140,'Edvan Alves comentou no documento \"Scripts Recursos (Triggers, Procedures, Views)\"','2026-05-06 00:21:16',0,78,12),(141,'Edvan Alves comentou no documento \"Scripts Inserts\"','2026-05-06 00:21:16',0,79,10),(142,'Edvan Alves comentou no documento \"Scripts Inserts\"','2026-05-06 00:21:16',0,79,12),(144,'André Roberto comentou no documento \"Modelo Conceitual\"','2026-05-06 00:21:16',0,80,11),(145,'André Roberto comentou no documento \"Modelo Lógico\"','2026-05-06 00:21:16',0,81,12),(146,'André Roberto comentou no documento \"Scripts Criação de tabelas\"','2026-05-06 00:21:16',0,82,11),(147,'André Roberto comentou no documento \"Scripts Recursos (Triggers, Procedures, Views)\"','2026-05-06 00:21:16',0,83,12),(148,'André Roberto comentou no documento \"Scripts Recursos (Triggers, Procedures, Views)\"','2026-05-06 00:21:16',0,83,11),(150,'André Roberto comentou no documento \"Scripts Inserts\"','2026-05-06 00:21:16',0,84,12),(151,'Nathan da Silva comentou no documento \"Modelo Conceitual\"','2026-05-06 00:21:16',0,85,10),(152,'Nathan da Silva comentou no documento \"Modelo Conceitual\"','2026-05-06 00:21:16',0,85,11),(154,'Nathan da Silva comentou no documento \"Modelo Lógico\"','2026-05-06 00:21:16',0,86,10),(155,'Nathan da Silva comentou no documento \"Scripts Criação de tabelas\"','2026-05-06 00:21:16',0,87,11),(156,'Nathan da Silva comentou no documento \"Scripts Criação de tabelas\"','2026-05-06 00:21:16',0,87,10),(158,'Nathan da Silva comentou no documento \"Scripts Recursos (Triggers, Procedures, Views)\"','2026-05-06 00:21:16',0,88,11),(159,'Nathan da Silva comentou no documento \"Scripts Inserts\"','2026-05-06 00:21:16',0,89,10),(160,'Samara Rolim comentou no documento \"Modelo Conceitual\"','2026-05-06 00:21:16',0,90,10),(161,'Samara Rolim comentou no documento \"Modelo Conceitual\"','2026-05-06 00:21:16',0,90,11),(163,'Samara Rolim comentou no documento \"Modelo Lógico\"','2026-05-06 00:21:16',0,91,10),(164,'Samara Rolim comentou no documento \"Modelo Lógico\"','2026-05-06 00:21:16',0,91,12),(166,'Samara Rolim comentou no documento \"Scripts Criação de tabelas\"','2026-05-06 00:21:16',0,92,11),(167,'Samara Rolim comentou no documento \"Scripts Criação de tabelas\"','2026-05-06 00:21:16',0,92,10),(169,'Samara Rolim comentou no documento \"Scripts Recursos (Triggers, Procedures, Views)\"','2026-05-06 00:21:16',0,93,12),(170,'Samara Rolim comentou no documento \"Scripts Recursos (Triggers, Procedures, Views)\"','2026-05-06 00:21:16',0,93,11),(172,'Samara Rolim comentou no documento \"Scripts Inserts\"','2026-05-06 00:21:16',0,94,10),(173,'Samara Rolim comentou no documento \"Scripts Inserts\"','2026-05-06 00:21:16',0,94,12),(175,'Edvan Alves comentou no documento \"Requisitos Funcionais\"','2026-05-06 00:21:16',0,95,13),(176,'Edvan Alves comentou no documento \"Requisitos Funcionais\"','2026-05-06 00:21:16',0,95,10),(178,'Edvan Alves comentou no documento \"Requisitos não Funcionais\"','2026-05-06 00:21:16',0,96,12),(179,'Edvan Alves comentou no documento \"Requisitos não Funcionais\"','2026-05-06 00:21:16',0,96,13),(181,'Edvan Alves comentou no documento \"Swagger API\"','2026-05-06 00:21:16',0,97,12),(182,'Edvan Alves comentou no documento \"Roteiro de Testes (Back-End)\"','2026-05-06 00:21:16',0,98,10),(183,'André Roberto comentou no documento \"Requisitos Funcionais\"','2026-05-06 00:21:16',0,99,11),(184,'André Roberto comentou no documento \"Requisitos Funcionais\"','2026-05-06 00:21:16',0,99,13),(186,'André Roberto comentou no documento \"Requisitos não Funcionais\"','2026-05-06 00:21:16',0,100,12),(187,'André Roberto comentou no documento \"Requisitos não Funcionais\"','2026-05-06 00:21:16',0,100,13),(189,'André Roberto comentou no documento \"Swagger API\"','2026-05-06 00:21:16',0,101,11),(190,'André Roberto comentou no documento \"Swagger API\"','2026-05-06 00:21:16',0,101,12),(192,'André Roberto comentou no documento \"Roteiro de Testes (Back-End)\"','2026-05-06 00:21:16',0,102,11),(193,'Nathan da Silva comentou no documento \"Requisitos Funcionais\"','2026-05-06 00:21:16',0,103,11),(194,'Nathan da Silva comentou no documento \"Requisitos Funcionais\"','2026-05-06 00:21:16',0,103,13),(195,'Nathan da Silva comentou no documento \"Requisitos Funcionais\"','2026-05-06 00:21:16',0,103,10),(196,'Nathan da Silva comentou no documento \"Requisitos não Funcionais\"','2026-05-06 00:21:16',0,104,13),(197,'Nathan da Silva comentou no documento \"Swagger API\"','2026-05-06 00:21:16',0,105,11),(198,'Nathan da Silva comentou no documento \"Roteiro de Testes (Back-End)\"','2026-05-06 00:21:16',0,106,10),(199,'Nathan da Silva comentou no documento \"Roteiro de Testes (Back-End)\"','2026-05-06 00:21:16',0,106,11),(201,'Samara Rolim comentou no documento \"Requisitos Funcionais\"','2026-05-06 00:21:16',0,107,11),(202,'Samara Rolim comentou no documento \"Requisitos Funcionais\"','2026-05-06 00:21:16',0,107,10),(204,'Samara Rolim comentou no documento \"Requisitos não Funcionais\"','2026-05-06 00:21:16',0,108,12),(205,'Samara Rolim comentou no documento \"Swagger API\"','2026-05-06 00:21:16',0,109,11),(206,'Samara Rolim comentou no documento \"Swagger API\"','2026-05-06 00:21:16',0,109,12),(208,'Samara Rolim comentou no documento \"Roteiro de Testes (Back-End)\"','2026-05-06 00:21:16',0,110,10),(209,'Samara Rolim comentou no documento \"Roteiro de Testes (Back-End)\"','2026-05-06 00:21:16',0,110,11),(211,'Edvan Alves comentou no documento \"Protótipos\"','2026-05-06 00:21:16',0,111,13),(212,'Edvan Alves comentou no documento \"Protótipos\"','2026-05-06 00:21:16',0,111,12),(214,'Edvan Alves comentou no documento \"Roteiro de Testes (Front-End)\"','2026-05-06 00:21:16',0,112,13),(215,'Edvan Alves comentou no documento \"Roteiro de Testes (Front-End)\"','2026-05-06 00:21:16',0,112,12),(217,'André Roberto comentou no documento \"Protótipos\"','2026-05-06 00:21:16',0,113,13),(218,'André Roberto comentou no documento \"Protótipos\"','2026-05-06 00:21:16',0,113,12),(220,'André Roberto comentou no documento \"Roteiro de Testes (Front-End)\"','2026-05-06 00:21:16',0,114,13),(221,'André Roberto comentou no documento \"Roteiro de Testes (Front-End)\"','2026-05-06 00:21:16',0,114,12),(223,'Nathan da Silva comentou no documento \"Protótipos\"','2026-05-06 00:21:16',0,115,13),(224,'Nathan da Silva comentou no documento \"Roteiro de Testes (Front-End)\"','2026-05-06 00:21:16',0,116,13),(225,'Samara Rolim comentou no documento \"Protótipos\"','2026-05-06 00:21:16',0,117,12),(226,'Samara Rolim comentou no documento \"Roteiro de Testes (Front-End)\"','2026-05-06 00:21:16',0,118,12),(227,'Edvan Alves comentou no documento \"Roteiro de Testes (Mobile)\"','2026-05-06 00:21:16',0,119,13),(228,'Edvan Alves comentou no documento \"Roteiro de Testes (Mobile)\"','2026-05-06 00:21:16',0,119,12),(230,'André Roberto comentou no documento \"Roteiro de Testes (Mobile)\"','2026-05-06 00:21:16',0,120,13),(231,'André Roberto comentou no documento \"Roteiro de Testes (Mobile)\"','2026-05-06 00:21:16',0,120,12),(233,'Nathan da Silva comentou no documento \"Roteiro de Testes (Mobile)\"','2026-05-06 00:21:16',0,121,13),(234,'Samara Rolim comentou no documento \"Roteiro de Testes (Mobile)\"','2026-05-06 00:21:16',0,122,12),(235,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,128,2),(236,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,128,3),(238,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,129,2),(239,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,129,3),(241,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,130,2),(242,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,130,3),(244,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,131,2),(245,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,131,3),(247,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,132,2),(248,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,132,3),(250,'Ana Livia comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,133,2),(251,'Ana Livia comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,134,2),(252,'Ana Livia comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,135,2),(253,'Ana Livia comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,136,2),(254,'Ana Livia comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,137,2),(255,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,138,1),(256,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,138,3),(258,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,139,1),(259,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,139,3),(261,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,140,1),(262,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,140,3),(264,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,141,1),(265,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,141,3),(267,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,142,1),(268,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,142,3),(270,'Larissa Lemos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,143,1),(271,'Larissa Lemos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,144,1),(272,'Larissa Lemos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,145,1),(273,'Larissa Lemos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,146,1),(274,'Larissa Lemos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,147,1),(275,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,148,1),(276,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,148,2),(278,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,149,1),(279,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,149,2),(281,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,150,1),(282,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,150,2),(284,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,151,1),(285,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,151,2),(287,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,152,1),(288,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,152,2),(290,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,153,1),(291,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,153,2),(293,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,154,1),(294,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,154,2),(296,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,155,1),(297,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,155,2),(299,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,156,1),(300,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,156,2),(302,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,157,1),(303,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,157,2),(305,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,158,1),(306,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,158,2),(307,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,158,3),(308,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,159,1),(309,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,159,2),(310,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,159,3),(311,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,160,1),(312,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,160,2),(313,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,160,3),(314,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,161,1),(315,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,161,2),(316,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,161,3),(317,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,162,1),(318,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,162,2),(319,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,162,3),(320,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,163,1),(321,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,163,2),(323,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,164,1),(324,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,164,2),(326,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,165,1),(327,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,165,2),(329,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,166,1),(330,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,166,2),(332,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,167,1),(333,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,167,2),(335,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,168,1),(336,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,168,2),(337,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,168,3),(338,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,169,1),(339,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,169,2),(340,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,169,3),(341,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,170,1),(342,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,170,2),(343,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,170,3),(344,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,171,1),(345,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,171,2),(346,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,171,3),(347,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,172,1),(348,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,172,2),(349,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:16',0,172,3),(350,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,173,1),(351,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,173,2),(353,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,174,1),(354,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,174,2),(356,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,175,1),(357,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,175,2),(359,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,176,1),(360,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,176,2),(362,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,177,1),(363,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:16',0,177,2),(365,'Ana Livia comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,178,2),(366,'Ana Livia comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,179,2),(367,'Ana Livia comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,180,2),(368,'Ana Livia comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,181,2),(369,'Ana Livia comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,182,2),(370,'Ana Livia comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,183,3),(371,'Ana Livia comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,184,3),(372,'Ana Livia comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,185,3),(373,'Ana Livia comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,186,3),(374,'Ana Livia comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,187,3),(375,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,193,3),(376,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,193,1),(378,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,194,3),(379,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,194,1),(381,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,195,3),(382,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,195,1),(384,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,196,3),(385,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,196,1),(387,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,197,3),(388,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,197,1),(390,'Marcos Santos comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,198,2),(391,'Marcos Santos comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,199,2),(392,'Marcos Santos comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,200,2),(393,'Marcos Santos comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,201,2),(394,'Marcos Santos comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,202,2),(395,'Marcos Santos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,203,1),(396,'Marcos Santos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,204,1),(397,'Marcos Santos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,205,1),(398,'Marcos Santos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,206,1),(399,'Marcos Santos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,207,1),(400,'Carlos Ribeiro comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,208,2),(401,'Carlos Ribeiro comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,209,2),(402,'Carlos Ribeiro comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,210,2),(403,'Carlos Ribeiro comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,211,2),(404,'Carlos Ribeiro comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,212,2),(405,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,213,3),(406,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,213,1),(408,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,214,3),(409,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,214,1),(411,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,215,3),(412,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,215,1),(414,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,216,3),(415,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,216,1),(417,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,217,3),(418,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,217,1),(420,'João Silva comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,218,2),(421,'João Silva comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,219,2),(422,'João Silva comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,220,2),(423,'João Silva comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,221,2),(424,'João Silva comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:16',0,222,2),(425,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,223,3),(426,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,223,1),(428,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,224,3),(429,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,224,1),(431,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,225,3),(432,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,225,1),(434,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,226,3),(435,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,226,1),(437,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,227,3),(438,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:16',0,227,1),(440,'João Silva comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,228,1),(441,'João Silva comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,229,1),(442,'João Silva comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,230,1),(443,'João Silva comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,231,1),(444,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,232,2),(445,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,232,3),(447,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,233,2),(448,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,233,3),(450,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,234,2),(451,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,234,3),(453,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,235,2),(454,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,235,3),(456,'João Silva comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,236,1),(457,'João Silva comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,237,1),(458,'João Silva comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,238,1),(459,'João Silva comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,239,1),(460,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,244,2),(461,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,244,3),(463,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,245,2),(464,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,245,3),(466,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,246,2),(467,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,246,3),(469,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,247,2),(470,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,247,3),(472,'Maria Souza comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,252,1),(473,'Maria Souza comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,253,1),(474,'Maria Souza comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,254,1),(475,'Maria Souza comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,255,1),(476,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,256,2),(477,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,256,3),(479,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,257,2),(480,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,257,3),(482,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,258,2),(483,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,258,3),(485,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,259,2),(486,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,259,3),(488,'Maria Souza comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,260,1),(489,'Maria Souza comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,261,1),(490,'Maria Souza comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,262,1),(491,'Maria Souza comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,263,1),(492,'Bernardo Pereira comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,264,1),(493,'Bernardo Pereira comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,265,1),(494,'Bernardo Pereira comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,266,1),(495,'Bernardo Pereira comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:16',0,267,1),(496,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,268,2),(497,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,268,3),(499,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,269,2),(500,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,269,3),(502,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,270,2),(503,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,270,3),(505,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,271,2),(506,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:16',0,271,3),(508,'Bernardo Pereira comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,272,1),(509,'Bernardo Pereira comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,273,1),(510,'Bernardo Pereira comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,274,1),(511,'Bernardo Pereira comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:16',0,275,1),(512,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,276,2),(513,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,276,3),(515,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,277,2),(516,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,277,3),(518,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,278,2),(519,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,278,3),(521,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,279,2),(522,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,279,3),(524,'João Silva comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,280,3),(525,'João Silva comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,281,3),(526,'João Silva comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,282,3),(527,'João Silva comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,283,3),(528,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,284,2),(529,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,284,3),(531,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,285,2),(532,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,285,3),(534,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,286,2),(535,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,286,3),(537,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,287,2),(538,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,287,3),(540,'Ana Livia comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,288,3),(541,'Ana Livia comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,289,3),(542,'Ana Livia comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,290,3),(543,'Ana Livia comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,291,3),(544,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,292,2),(545,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,292,3),(547,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,293,2),(548,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,293,3),(550,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,294,2),(551,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,294,3),(553,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,295,2),(554,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,295,3),(556,'Maria Souza comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,296,3),(557,'Maria Souza comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,297,3),(558,'Maria Souza comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,298,3),(559,'Maria Souza comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,299,3),(560,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,300,2),(561,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,300,3),(563,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,301,2),(564,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,301,3),(566,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,302,2),(567,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,302,3),(569,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,303,2),(570,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:16',0,303,3),(572,'Bernardo Pereira comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,304,3),(573,'Bernardo Pereira comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,305,3),(574,'Bernardo Pereira comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,306,3),(575,'Bernardo Pereira comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:16',0,307,3),(576,'João Silva comentou no documento \"Fluxo de Entregas\"','2026-05-06 00:21:16',0,308,1),(577,'João Silva comentou no documento \"Fluxo de Entregas\"','2026-05-06 00:21:16',0,309,1),(578,'João Silva comentou no documento \"Fluxo de Entregas\"','2026-05-06 00:21:16',0,310,1),(579,'João Silva comentou no documento \"Fluxo de Entregas\"','2026-05-06 00:21:16',0,311,1),(580,'Maria Souza comentou no documento \"Fluxo de Entregas\"','2026-05-06 00:21:16',0,324,1),(581,'Maria Souza comentou no documento \"Fluxo de Entregas\"','2026-05-06 00:21:16',0,325,1),(582,'Maria Souza comentou no documento \"Fluxo de Entregas\"','2026-05-06 00:21:16',0,326,1),(583,'Maria Souza comentou no documento \"Fluxo de Entregas\"','2026-05-06 00:21:16',0,327,1),(584,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,383,2),(585,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,383,3),(587,'Ana Livia comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,384,2),(588,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,385,2),(589,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,385,3),(591,'Ana Livia comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,386,2),(592,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,387,2),(593,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,387,3),(595,'Ana Livia comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,388,2),(596,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,389,2),(597,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,389,3),(599,'Ana Livia comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,390,2),(600,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,391,2),(601,'Ana Livia comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,391,3),(603,'Ana Livia comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,392,2),(604,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,393,1),(605,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,393,3),(607,'Larissa Lemos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,394,1),(608,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,395,1),(609,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,395,3),(611,'Larissa Lemos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,396,1),(612,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,397,1),(613,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,397,3),(615,'Larissa Lemos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,398,1),(616,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,399,1),(617,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,399,3),(619,'Larissa Lemos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,400,1),(620,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,401,1),(621,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,401,3),(623,'Larissa Lemos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,402,1),(624,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,403,1),(625,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,403,2),(627,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,404,1),(628,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,404,2),(630,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,405,1),(631,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,405,2),(633,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,406,1),(634,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,406,2),(636,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,407,1),(637,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,407,2),(639,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,408,1),(640,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,408,2),(642,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,409,1),(643,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,409,2),(645,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,410,1),(646,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,410,2),(648,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,411,1),(649,'Marcos Santos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,411,2),(651,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,412,1),(652,'Marcos Santos comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,412,2),(654,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,413,1),(655,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,413,2),(656,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,413,3),(657,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,414,1),(658,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,414,2),(660,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,415,1),(661,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,415,2),(662,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,415,3),(663,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,416,1),(664,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,416,2),(666,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,417,1),(667,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,417,2),(668,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,417,3),(669,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,418,1),(670,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,418,2),(672,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,419,1),(673,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,419,2),(674,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,419,3),(675,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,420,1),(676,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,420,2),(678,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,421,1),(679,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,421,2),(680,'Carlos Ribeiro comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,421,3),(681,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,422,1),(682,'Carlos Ribeiro comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,422,2),(684,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,423,1),(685,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,423,2),(686,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,423,3),(687,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,424,1),(688,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,424,2),(690,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,425,1),(691,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,425,2),(692,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,425,3),(693,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,426,1),(694,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,426,2),(696,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,427,1),(697,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,427,2),(698,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,427,3),(699,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,428,1),(700,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,428,2),(702,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,429,1),(703,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,429,2),(704,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,429,3),(705,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,430,1),(706,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,430,2),(708,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,431,1),(709,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,431,2),(710,'João Silva comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,431,3),(711,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,432,1),(712,'João Silva comentou no documento \"Manual do Usuário Web\"','2026-05-06 00:21:17',0,432,2),(714,'Ana Livia comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,433,2),(715,'Ana Livia comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,434,3),(716,'Ana Livia comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,435,2),(717,'Ana Livia comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,436,3),(718,'Ana Livia comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,437,2),(719,'Ana Livia comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,438,3),(720,'Ana Livia comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,439,2),(721,'Ana Livia comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,440,3),(722,'Ana Livia comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,441,2),(723,'Ana Livia comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,442,3),(724,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,444,3),(725,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,444,1),(727,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,446,3),(728,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,446,1),(730,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,448,3),(731,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,448,1),(733,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,450,3),(734,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,450,1),(736,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,452,3),(737,'Larissa Lemos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,452,1),(739,'Marcos Santos comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,453,2),(740,'Marcos Santos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,454,1),(741,'Marcos Santos comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,455,2),(742,'Marcos Santos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,456,1),(743,'Marcos Santos comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,457,2),(744,'Marcos Santos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,458,1),(745,'Marcos Santos comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,459,2),(746,'Marcos Santos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,460,1),(747,'Marcos Santos comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,461,2),(748,'Marcos Santos comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,462,1),(749,'Carlos Ribeiro comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,463,2),(750,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,464,3),(751,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,464,1),(753,'Carlos Ribeiro comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,465,2),(754,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,466,3),(755,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,466,1),(757,'Carlos Ribeiro comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,467,2),(758,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,468,3),(759,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,468,1),(761,'Carlos Ribeiro comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,469,2),(762,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,470,3),(763,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,470,1),(765,'Carlos Ribeiro comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,471,2),(766,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,472,3),(767,'Carlos Ribeiro comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,472,1),(769,'João Silva comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,473,2),(770,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,474,3),(771,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,474,1),(773,'João Silva comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,475,2),(774,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,476,3),(775,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,476,1),(777,'João Silva comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,477,2),(778,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,478,3),(779,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,478,1),(781,'João Silva comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,479,2),(782,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,480,3),(783,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,480,1),(785,'João Silva comentou no documento \"Especificação Mobile\"','2026-05-06 00:21:17',0,481,2),(786,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,482,3),(787,'João Silva comentou no documento \"Checklist de Testes Mobile\"','2026-05-06 00:21:17',0,482,1),(789,'João Silva comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,483,1),(790,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,484,2),(791,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,484,3),(793,'João Silva comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,485,1),(794,'João Silva comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,486,1),(795,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,487,2),(796,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,487,3),(798,'João Silva comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,488,1),(799,'João Silva comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,489,1),(800,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,490,2),(801,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,490,3),(803,'João Silva comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,491,1),(804,'João Silva comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,492,1),(805,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,493,2),(806,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,493,3),(808,'João Silva comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,494,1),(809,'João Silva comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,495,1),(810,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,496,2),(811,'João Silva comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,496,3),(813,'João Silva comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,497,1),(814,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,499,2),(815,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,499,3),(817,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,502,2),(818,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,502,3),(820,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,505,2),(821,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,505,3),(823,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,508,2),(824,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,508,3),(826,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,511,2),(827,'Ana Livia comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,511,3),(829,'Maria Souza comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,513,1),(830,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,514,2),(831,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,514,3),(833,'Maria Souza comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,515,1),(834,'Maria Souza comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,516,1),(835,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,517,2),(836,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,517,3),(838,'Maria Souza comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,518,1),(839,'Maria Souza comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,519,1),(840,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,520,2),(841,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,520,3),(843,'Maria Souza comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,521,1),(844,'Maria Souza comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,522,1),(845,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,523,2),(846,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,523,3),(848,'Maria Souza comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,524,1),(849,'Maria Souza comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,525,1),(850,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,526,2),(851,'Maria Souza comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,526,3),(853,'Maria Souza comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,527,1),(854,'Bernardo Pereira comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,528,1),(855,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,529,2),(856,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,529,3),(858,'Bernardo Pereira comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,530,1),(859,'Bernardo Pereira comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,531,1),(860,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,532,2),(861,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,532,3),(863,'Bernardo Pereira comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,533,1),(864,'Bernardo Pereira comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,534,1),(865,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,535,2),(866,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,535,3),(868,'Bernardo Pereira comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,536,1),(869,'Bernardo Pereira comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,537,1),(870,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,538,2),(871,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,538,3),(873,'Bernardo Pereira comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,539,1),(874,'Bernardo Pereira comentou no documento \"Plano de Projeto\"','2026-05-06 00:21:17',0,540,1),(875,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,541,2),(876,'Bernardo Pereira comentou no documento \"Cronograma\"','2026-05-06 00:21:17',0,541,3),(878,'Bernardo Pereira comentou no documento \"Relatório de Progresso\"','2026-05-06 00:21:17',0,542,1),(879,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,543,2),(880,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,543,3),(882,'João Silva comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,544,3),(883,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,545,2),(884,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,545,3),(886,'João Silva comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,546,3),(887,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,547,2),(888,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,547,3),(890,'João Silva comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,548,3),(891,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,549,2),(892,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,549,3),(894,'João Silva comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,550,3),(895,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,551,2),(896,'João Silva comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,551,3),(898,'João Silva comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,552,3),(899,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,553,2),(900,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,553,3),(902,'Ana Livia comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,554,3),(903,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,555,2),(904,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,555,3),(906,'Ana Livia comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,556,3),(907,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,557,2),(908,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,557,3),(910,'Ana Livia comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,558,3),(911,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,559,2),(912,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,559,3),(914,'Ana Livia comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,560,3),(915,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,561,2),(916,'Ana Livia comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,561,3),(918,'Ana Livia comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,562,3),(919,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,563,2),(920,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,563,3),(922,'Maria Souza comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,564,3),(923,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,565,2),(924,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,565,3),(926,'Maria Souza comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,566,3),(927,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,567,2),(928,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,567,3),(930,'Maria Souza comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,568,3),(931,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,569,2),(932,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,569,3),(934,'Maria Souza comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,570,3),(935,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,571,2),(936,'Maria Souza comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,571,3),(938,'Maria Souza comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,572,3),(939,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,573,2),(940,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,573,3),(942,'Bernardo Pereira comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,574,3),(943,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,575,2),(944,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,575,3),(946,'Bernardo Pereira comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,576,3),(947,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,577,2),(948,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,577,3),(950,'Bernardo Pereira comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,578,3),(951,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,579,2),(952,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,579,3),(954,'Bernardo Pereira comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,580,3),(955,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,581,2),(956,'Bernardo Pereira comentou no documento \"Fluxo de Navegação do Usuário\"','2026-05-06 00:21:17',0,581,3),(958,'Bernardo Pereira comentou no documento \"Casos de Uso - Usuário\"','2026-05-06 00:21:17',0,582,3),(959,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,638,1),(960,'Larissa Lemos comentou no documento \"Documento de Requisitos\"','2026-05-06 00:21:17',0,638,3);
/*!40000 ALTER TABLE `notificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano`
--

DROP TABLE IF EXISTS `plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plano` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano`
--

LOCK TABLES `plano` WRITE;
/*!40000 ALTER TABLE `plano` DISABLE KEYS */;
INSERT INTO `plano` VALUES (1,'Free','Uso Acadêmico',0.00),(2,'Standard','Uso Comercial',50.00),(3,'Premium','Uso Comercial',75.00);
/*!40000 ALTER TABLE `plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano_beneficio`
--

DROP TABLE IF EXISTS `plano_beneficio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plano_beneficio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plano_id` int NOT NULL,
  `beneficio_id` int NOT NULL,
  `val_numerico` int DEFAULT NULL,
  `val_boolean` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plano_beneficio_plano` (`plano_id`),
  KEY `fk_plano_beneficio_beneficio` (`beneficio_id`),
  CONSTRAINT `fk_plano_beneficio_beneficio` FOREIGN KEY (`beneficio_id`) REFERENCES `beneficio` (`id`),
  CONSTRAINT `fk_plano_beneficio_plano` FOREIGN KEY (`plano_id`) REFERENCES `plano` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_beneficio`
--

LOCK TABLES `plano_beneficio` WRITE;
/*!40000 ALTER TABLE `plano_beneficio` DISABLE KEYS */;
INSERT INTO `plano_beneficio` VALUES (1,1,1,3,NULL),(2,1,2,2,NULL),(3,1,3,NULL,0),(4,2,1,4,NULL),(5,2,2,4,NULL),(6,2,3,NULL,1),(7,3,1,999,NULL),(8,3,2,999,NULL),(9,3,3,NULL,1);
/*!40000 ALTER TABLE `plano_beneficio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descricao` text,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1',
  `criador_id` int NOT NULL,
  `deletado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projeto_usuario_criador` (`criador_id`),
  CONSTRAINT `fk_projeto_usuario_criador` FOREIGN KEY (`criador_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,'Sistema de Gestão','Plataforma web para gestão de requisitos','2025-01-01 03:00:00',1,1,NULL),(2,'App Delivery','Aplicativo mobile de delivery','2025-02-11 15:00:00',1,5,NULL),(3,'Hackaton 2026','Plataforma para resolver o desafio proposto pela banca','2025-04-01 14:00:00',1,6,NULL),(4,'Projeto Escopo','Plataforma colaborativa de documentos para auxiliar no levantamento de requisitos e desenvolvimento de projetos de software','2026-02-27 13:30:00',1,11,NULL);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_projeto_criado` AFTER INSERT ON `projeto` FOR EACH ROW BEGIN
        INSERT INTO usuario_projeto(usuario_id, projeto_id, nivel_acesso_id)
        VALUES (NEW.criador_id, NEW.id, 1);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NULL DEFAULT NULL,
  `conteudo` text NOT NULL,
  `criador_id` int NOT NULL,
  `projeto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_registro_usuario_criador` (`criador_id`),
  KEY `fk_registro_projeto` (`projeto_id`),
  CONSTRAINT `fk_registro_projeto` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`id`),
  CONSTRAINT `fk_registro_usuario_criador` FOREIGN KEY (`criador_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (1,'Levantamento inicial','2025-01-02 03:00:00',NULL,'Requisitos coletados com cliente',2,1),(2,'Definição de escopo','2025-01-01 06:00:00',NULL,'Escopo inicial do sistema',3,1),(3,'Modelagem inicial','2025-01-01 09:00:00',NULL,'Definição das entidades principais',4,1),(4,'Validação com cliente','2025-01-01 13:00:00',NULL,'Ajustes após reunião',1,1),(5,'Versão preliminar','2025-01-01 18:00:00',NULL,'Documento inicial consolidado',2,1),(6,'Kickoff do app','2025-02-12 16:00:00',NULL,'Definição inicial do produto',5,2),(7,'Definição de funcionalidades','2025-02-11 19:00:00',NULL,'Features principais do app',3,2),(8,'Fluxo do usuário','2025-02-11 22:00:00',NULL,'Mapeamento da jornada',1,2),(9,'Integração backend','2025-02-12 02:00:00',NULL,'Planejamento da API',6,2),(10,'Revisão geral','2025-02-12 07:00:00',NULL,'Ajustes finais antes do dev',5,2),(11,'Kickoff Escopo','2026-02-28 14:30:00',NULL,'Apresentação do projeto',11,4),(12,'Levantamento de requisitos','2026-02-27 17:30:00',NULL,'Discussão com stakeholders',12,4),(13,'Definição de arquitetura','2026-02-27 20:30:00',NULL,'Estrutura inicial do sistema',10,4),(14,'Planejamento de entregas','2026-02-28 00:30:00',NULL,'Divisão por sprints',13,4),(15,'Revisão geral','2026-02-28 05:30:00',NULL,'Ajustes estratégicos',11,4),(16,'Formação do time','2025-04-01 15:10:00',NULL,'Definição dos participantes',6,3),(17,'Ideação','2025-04-01 15:30:00',NULL,'Discussão das ideias iniciais',7,3),(18,'Escolha da solução','2025-04-01 16:00:00',NULL,'Definição do projeto final',5,3),(19,'Divisão de tarefas','2025-04-01 16:40:00',NULL,'Responsabilidades distribuídas',3,3),(20,'Início desenvolvimento','2025-04-01 17:30:00',NULL,'Primeiros commits',8,3),(21,'Kickoff Escopo','2026-02-28 14:30:00',NULL,'Apresentação do projeto',11,4),(22,'Levantamento de requisitos','2026-02-27 17:30:00',NULL,'Discussão com stakeholders',12,4),(23,'Definição de arquitetura','2026-02-27 20:30:00',NULL,'Estrutura inicial do sistema',10,4),(24,'Planejamento de entregas','2026-02-28 00:30:00',NULL,'Divisão por sprints',13,4),(25,'Revisão geral','2026-02-28 05:30:00',NULL,'Ajustes estratégicos',11,4);
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reuniao`
--

DROP TABLE IF EXISTS `reuniao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reuniao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `transcricao` text,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `projeto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reuniao_projeto` (`projeto_id`),
  CONSTRAINT `fk_reuniao_projeto` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reuniao`
--

LOCK TABLES `reuniao` WRITE;
/*!40000 ALTER TABLE `reuniao` DISABLE KEYS */;
INSERT INTO `reuniao` VALUES (1,'Reunião Kickoff','Discussão inicial do projeto...','2025-01-02 03:00:00',1),(2,'Reunião de Requisitos','Detalhamento das funcionalidades...','2025-01-01 06:00:00',1),(3,'Reunião de Validação','Aprovação com cliente...','2025-01-01 09:00:00',1),(4,'Kickoff do App','Alinhamento inicial...','2025-02-12 16:00:00',2),(5,'Reunião de Funcionalidades','Discussão das features...','2025-02-11 19:00:00',2),(6,'Revisão de Progresso','Acompanhamento do desenvolvimento...','2025-02-11 22:00:00',2),(7,'Formação do Time','Organização inicial...','2025-04-01 15:10:00',3),(8,'Discussão de Ideias','Brainstorming...','2025-04-01 15:30:00',3),(9,'Definição Final','Escolha da solução...','2025-04-01 16:00:00',3),(10,'Kickoff Escopo','Apresentação do projeto...','2026-02-28 14:30:00',4),(11,'Levantamento de Requisitos','Discussão com stakeholders...','2026-02-27 17:30:00',4),(12,'Planejamento de Entregas','Definição das sprints...','2026-02-27 20:30:00',4);
/*!40000 ALTER TABLE `reuniao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reuniao_usuario`
--

DROP TABLE IF EXISTS `reuniao_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reuniao_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `reuniao_id` int NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reuniao_usuario_usuario` (`usuario_id`),
  KEY `fk_reuniao_usuario_reuniao` (`reuniao_id`),
  CONSTRAINT `fk_reuniao_usuario_reuniao` FOREIGN KEY (`reuniao_id`) REFERENCES `reuniao` (`id`),
  CONSTRAINT `fk_reuniao_usuario_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reuniao_usuario`
--

LOCK TABLES `reuniao_usuario` WRITE;
/*!40000 ALTER TABLE `reuniao_usuario` DISABLE KEYS */;
INSERT INTO `reuniao_usuario` VALUES (1,1,1,'Gerente de Projeto'),(2,2,1,'Desenvolvedor'),(3,3,1,'Analista'),(4,1,2,'Gerente de Projeto'),(5,2,2,'Desenvolvedor'),(6,3,2,'Analista'),(7,1,3,'Gerente de Projeto'),(8,2,3,'Desenvolvedor'),(9,3,3,'Analista'),(10,1,5,'Gerente de Projeto'),(11,3,5,'Analista'),(12,1,8,'Gerente de Projeto'),(13,3,8,'Analista'),(14,2,4,'Gerente de Projeto'),(15,5,4,'Desenvolvedor'),(16,6,4,'Scrum Master'),(17,2,5,'Gerente de Projeto'),(18,5,5,'Desenvolvedor'),(19,2,6,'Gerente de Projeto'),(20,5,6,'Desenvolvedor'),(21,3,7,'Gerente de Projeto'),(22,1,7,'Stakeholder'),(23,3,8,'Gerente de Projeto'),(24,1,8,'Stakeholder'),(25,3,9,'Gerente de Projeto'),(26,1,9,'Stakeholder'),(27,4,10,'Gerente de Projeto'),(28,2,10,'Desenvolvedor'),(29,4,11,'Gerente de Projeto'),(30,2,11,'Desenvolvedor'),(31,4,12,'Gerente de Projeto'),(32,2,12,'Desenvolvedor'),(33,1,1,'Stakeholder'),(34,2,1,'QA'),(35,1,2,'Stakeholder'),(36,3,2,'QA'),(37,1,3,'Stakeholder'),(38,2,3,'QA'),(39,2,4,'QA'),(40,5,4,'UX'),(41,2,5,'QA'),(42,5,5,'UX'),(43,2,6,'QA'),(44,5,6,'UX'),(45,3,7,'QA'),(46,1,7,'UX'),(47,3,8,'QA'),(48,1,8,'UX'),(49,3,9,'QA'),(50,1,9,'UX'),(51,4,10,'QA'),(52,2,10,'UX'),(53,4,11,'QA'),(54,2,11,'UX'),(55,4,12,'QA'),(56,2,12,'UX');
/*!40000 ALTER TABLE `reuniao_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_link`
--

DROP TABLE IF EXISTS `tipo_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_link`
--

LOCK TABLES `tipo_link` WRITE;
/*!40000 ALTER TABLE `tipo_link` DISABLE KEYS */;
INSERT INTO `tipo_link` VALUES (1,'reuniao'),(2,'link_adicional');
/*!40000 ALTER TABLE `tipo_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `deletado_em` timestamp NULL DEFAULT NULL,
  `foto_perfil` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Ana Livia','ana@email.com','$2b$10$ijgM/z8Uei4tUWvHkcejo.xXGxUtWJAcPC1.m2ifq5IA3.HjRsqQW',1,NULL,NULL),(2,'Larissa Lemos','larissa@email.com','$2b$10$1euKWKJ5Aghe2eBuC6rmUeYXeLDxZAqhU8aUtP5SOkOjAkC.N0SGS',1,NULL,NULL),(3,'Marcos Santos','marcos@email.com','$2b$10$uefAkuE/K56yBfWRBaVUO.ph.pbakwAj3qUzuucBfLPR0tKZj1Z8m',1,NULL,NULL),(4,'Carlos Ribeiro','carlos@email.com','$2b$10$kdi7Om/SU6D9ZRVu3U5rfe3rHFha7UBbJp7HTasHlcjIpCE.r5lNG',1,NULL,NULL),(5,'João Silva','joao@email.com','$2b$10$rN5jmJOewgRbJmvwdziyw.gF3o43qc8WpW0jM5PW8l7p/TovgCNB.',1,NULL,NULL),(6,'Maria Souza','maria@email.com','$2b$10$wXRMzcn.2iFix33toW0oTurv.9z4J95GcqOYk60d1RYhkvf8Zdhee',1,NULL,NULL),(7,'Bernardo Pereira','bernardo@email.com','$2b$10$sysiPGW1.Al5jDxiCCyNLuMfyv006aHeBIinglAUdvVjfSefOYhdO',1,NULL,NULL),(8,'Manuela Ferreira','manuela@email.com','$2b$10$V.T35W.V83LqIkwZKv82.uq8GtdhBhcNPfALgTG8T.EOJL4H5vrFC',1,NULL,NULL),(9,'Amanda Costa','amanda@email.com','$2b$10$UpaDYFdThvh0pTmliGlNheGWJFWBYee4nc.l3AR0dV.5oHCpqS.hm',1,NULL,NULL),(10,'André Roberto','andre@email.com','$2b$10$CC5yWSHSiSx0Fv5ICRyeS.0K9fuB9LXGGEa4xeWncmNl5S/PALPnG',1,NULL,NULL),(11,'Edvan Alves','edvan@email.com','$2b$10$VhpHPjpwvhOj5P3jd2UT5eXr8MQg5AXHGQvPFc3DCzChGJc2.ree6',1,NULL,NULL),(12,'Nathan da Silva','nathan@email.com','$2b$10$df/pH6dtCOYewFs2ghjMpeLZvBzynw28dIqNR/Qt70xAyhw.Rp/j.',1,NULL,NULL),(13,'Samara Rolim','samara@email.com','$2b$10$F4EA4KXYp9xp1OO6BAJdEO5/xbxH5Du0dm1VATQZOWbn.3LsheHMW',1,NULL,NULL),(14,'Estagiário','estagiario@email.com','$2b$10$QAB8N1bqe0nNUgN4ZSeyOuAfpXFho/Y9rTntoj0wcBAAIS7bVi90i',1,NULL,NULL),(15,'Professor','professor@email.com','$2b$10$eUyOl783n1NHtSRryRK.keJvPIB2IQzatpei.UPS3Bf7vuhFfh8OK',1,NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_projeto`
--

DROP TABLE IF EXISTS `usuario_projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_projeto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `projeto_id` int NOT NULL,
  `nivel_acesso_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_projeto_usuario` (`usuario_id`),
  KEY `fk_usuario_projeto_projeto` (`projeto_id`),
  KEY `fk_usuario_projeto_nivel_acesso` (`nivel_acesso_id`),
  CONSTRAINT `fk_usuario_projeto_nivel_acesso` FOREIGN KEY (`nivel_acesso_id`) REFERENCES `nivel_acesso` (`id`),
  CONSTRAINT `fk_usuario_projeto_projeto` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`id`),
  CONSTRAINT `fk_usuario_projeto_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_projeto`
--

LOCK TABLES `usuario_projeto` WRITE;
/*!40000 ALTER TABLE `usuario_projeto` DISABLE KEYS */;
INSERT INTO `usuario_projeto` VALUES (1,1,1,1),(2,5,2,1),(3,6,3,1),(4,11,4,1),(5,2,1,1),(6,3,1,2),(7,4,1,3),(8,5,1,4),(9,1,2,2),(10,6,2,2),(11,7,2,4),(12,8,3,1),(13,5,3,3),(14,10,4,2),(15,12,4,2),(16,13,4,2);
/*!40000 ALTER TABLE `usuario_projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_categorias_com_documentos`
--

DROP TABLE IF EXISTS `vw_categorias_com_documentos`;
/*!50001 DROP VIEW IF EXISTS `vw_categorias_com_documentos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_categorias_com_documentos` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `projeto_id`,
 1 AS `documentos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_comentarios`
--

DROP TABLE IF EXISTS `vw_comentarios`;
/*!50001 DROP VIEW IF EXISTS `vw_comentarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_comentarios` AS SELECT 
 1 AS `id`,
 1 AS `autor_id`,
 1 AS `autor_nome`,
 1 AS `conteudo`,
 1 AS `documento_id`,
 1 AS `criado_em`,
 1 AS `parent`,
 1 AS `registro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_convites_ativos`
--

DROP TABLE IF EXISTS `vw_convites_ativos`;
/*!50001 DROP VIEW IF EXISTS `vw_convites_ativos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_convites_ativos` AS SELECT 
 1 AS `id`,
 1 AS `criado_em`,
 1 AS `projeto_id`,
 1 AS `destinatario_id`,
 1 AS `nivel_acesso_id`,
 1 AS `remetente_id`,
 1 AS `convite_status_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_convites_pendentes_projetos`
--

DROP TABLE IF EXISTS `vw_convites_pendentes_projetos`;
/*!50001 DROP VIEW IF EXISTS `vw_convites_pendentes_projetos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_convites_pendentes_projetos` AS SELECT 
 1 AS `usuario_id`,
 1 AS `nome`,
 1 AS `email`,
 1 AS `foto_perfil`,
 1 AS `convite_id`,
 1 AS `projeto_id`,
 1 AS `nivel_acesso_id`,
 1 AS `nivel_acesso`,
 1 AS `convidado_em`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_convites_usuario`
--

DROP TABLE IF EXISTS `vw_convites_usuario`;
/*!50001 DROP VIEW IF EXISTS `vw_convites_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_convites_usuario` AS SELECT 
 1 AS `id`,
 1 AS `nome_remetente`,
 1 AS `projeto`,
 1 AS `criado_em`,
 1 AS `projeto_id`,
 1 AS `destinatario_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_documento_detalhes`
--

DROP TABLE IF EXISTS `vw_documento_detalhes`;
/*!50001 DROP VIEW IF EXISTS `vw_documento_detalhes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_documento_detalhes` AS SELECT 
 1 AS `id`,
 1 AS `titulo`,
 1 AS `categoria`,
 1 AS `projeto`,
 1 AS `conteudo`,
 1 AS `ultima_alteracao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_documentos_recentes`
--

DROP TABLE IF EXISTS `vw_documentos_recentes`;
/*!50001 DROP VIEW IF EXISTS `vw_documentos_recentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_documentos_recentes` AS SELECT 
 1 AS `id`,
 1 AS `projeto`,
 1 AS `categoria`,
 1 AS `documento`,
 1 AS `ultima_edicao`,
 1 AS `criador_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_participantes_projetos`
--

DROP TABLE IF EXISTS `vw_participantes_projetos`;
/*!50001 DROP VIEW IF EXISTS `vw_participantes_projetos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_participantes_projetos` AS SELECT 
 1 AS `usuario_id`,
 1 AS `nome`,
 1 AS `email`,
 1 AS `foto_perfil`,
 1 AS `usuario_projeto_id`,
 1 AS `projeto_id`,
 1 AS `nivel_acesso_id`,
 1 AS `nivel_acesso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_projetos_com_usuarios`
--

DROP TABLE IF EXISTS `vw_projetos_com_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_projetos_com_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_projetos_com_usuarios` AS SELECT 
 1 AS `id`,
 1 AS `titulo`,
 1 AS `descricao`,
 1 AS `foto_usuarios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_projetos_detalhes`
--

DROP TABLE IF EXISTS `vw_projetos_detalhes`;
/*!50001 DROP VIEW IF EXISTS `vw_projetos_detalhes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_projetos_detalhes` AS SELECT 
 1 AS `id`,
 1 AS `titulo`,
 1 AS `descricao`,
 1 AS `status`,
 1 AS `data_criacao`,
 1 AS `criador_id`,
 1 AS `nome_responsavel`,
 1 AS `ultima_atualizacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_reuniao_detalhes`
--

DROP TABLE IF EXISTS `vw_reuniao_detalhes`;
/*!50001 DROP VIEW IF EXISTS `vw_reuniao_detalhes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_reuniao_detalhes` AS SELECT 
 1 AS `id`,
 1 AS `titulo`,
 1 AS `criado_em`,
 1 AS `projeto_id`,
 1 AS `links`,
 1 AS `convidados`,
 1 AS `usuarios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_reunioes_com_usuarios`
--

DROP TABLE IF EXISTS `vw_reunioes_com_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_reunioes_com_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_reunioes_com_usuarios` AS SELECT 
 1 AS `id`,
 1 AS `titulo`,
 1 AS `criado_em`,
 1 AS `projeto_id`,
 1 AS `foto_usuarios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_usuarios_projetos`
--

DROP TABLE IF EXISTS `vw_usuarios_projetos`;
/*!50001 DROP VIEW IF EXISTS `vw_usuarios_projetos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_usuarios_projetos` AS SELECT 
 1 AS `projeto_id`,
 1 AS `participantes`,
 1 AS `pendentes`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'db_escopo'
--
/*!50003 DROP PROCEDURE IF EXISTS `criar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_usuario`(
    IN u_nome VARCHAR(100),
    IN u_email VARCHAR(150),
    IN u_senha VARCHAR(255)
)
BEGIN
    DECLARE email_existe INT;

    -- verifica se já existe um usuário com o e-mail
    SELECT COUNT(*) INTO email_existe
    FROM usuario
    WHERE email = u_email;

    -- se existir, lança erro
    IF email_existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email já cadastrado';
    ELSE
        -- se não existir, insere
        INSERT INTO usuario(nome, email, senha)
        VALUES (u_nome, u_email, u_senha);

        SELECT last_insert_id() as id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `enviar_convite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `enviar_convite`(
	IN in_projeto_id INT,
	IN in_destinatario_id INT,
    IN in_nivel_acesso_id INT,
    IN in_remetente_id INT
)
BEGIN
    DECLARE projeto_existe INT;
    DECLARE destinatario_existe INT;
    DECLARE nivel_acesso_existe INT;
    DECLARE remetente_existe INT;
	DECLARE usuario_pertence_projeto INT;
    DECLARE nivel_acesso_remetente INT;
    DECLARE convite_existe INT;



    main: BEGIN
		-- Consultas para validações iniciais
        SELECT COUNT(id) FROM projeto WHERE projeto.id = in_projeto_id INTO projeto_existe;
		SELECT COUNT(id) FROM usuario WHERE usuario.id = in_destinatario_id INTO destinatario_existe;
		SELECT COUNT(id) FROM nivel_acesso WHERE nivel_acesso.id = in_nivel_acesso_id INTO nivel_acesso_existe;
		SELECT COUNT(id) FROM usuario WHERE usuario.id = in_remetente_id INTO remetente_existe;
		SELECT COUNT(usuario_id) FROM usuario_projeto WHERE usuario_id = in_destinatario_id AND projeto_id = in_projeto_id INTO usuario_pertence_projeto;

		-- 404, algum dos itens não existe no banco
		IF (projeto_existe = 0  OR destinatario_existe = 0 OR nivel_acesso_existe = 0 OR remetente_existe = 0) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERRO 404: Um ou mais dos campos inseridos para o usuario não foram encontrado no banco';
            LEAVE main;
		END IF;

		SELECT nivel_acesso_id FROM usuario_projeto WHERE usuario_id = in_remetente_id AND projeto_id = in_projeto_id INTO nivel_acesso_remetente;
        -- 403, sem permissão
		IF nivel_acesso_remetente > 1 THEN
			LEAVE main;
        END IF;

        -- Usuário já participa do projeto
		IF usuario_pertence_projeto > 0 THEN
            LEAVE main;
		END IF;

        SELECT COUNT(id) FROM convite WHERE convite.projeto_id = in_projeto_id AND convite.destinatario_id = in_destinatario_id AND convite.convite_status_id =1
        INTO convite_existe;
		-- Usuário já tem um convite pendente do projeto
        IF convite_existe > 0 THEN
            SIGNAL SQLSTATE '45003'
            SET MESSAGE_TEXT = 'Um usuario já tem um convite pendente do projeto.';
            LEAVE main;
        END IF;

        -- 201 sucesso
		INSERT INTO convite(projeto_id, destinatario_id, nivel_acesso_id, remetente_id)
		VALUES (in_projeto_id, in_destinatario_id, in_nivel_acesso_id, in_remetente_id);
	END main;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_categorias_com_documentos`
--

/*!50001 DROP VIEW IF EXISTS `vw_categorias_com_documentos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_categorias_com_documentos` AS select `c`.`id` AS `id`,`c`.`titulo` AS `nome`,`c`.`projeto_id` AS `projeto_id`,coalesce((select json_arrayagg(json_object('id',`d`.`id`,'titulo',`d`.`titulo`,'quantidade_versoes',(select count(`dv`.`id`) from `documento_versao` `dv` where (`dv`.`documento_id` = `d`.`id`)),'ultima_alteracao',(select `dv`.`criado_em` from `documento_versao` `dv` where (`dv`.`documento_id` = `d`.`id`) order by `dv`.`criado_em` desc limit 1))) from `documento` `d` where (`d`.`categoria_id` = `c`.`id`)),json_array()) AS `documentos` from `categoria` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_comentarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_comentarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_comentarios` AS select `comentario`.`id` AS `id`,`comentario`.`criador_id` AS `autor_id`,`usuario`.`nome` AS `autor_nome`,`comentario`.`conteudo` AS `conteudo`,`comentario`.`documento_id` AS `documento_id`,`comentario`.`criado_em` AS `criado_em`,coalesce((select json_object('parent_id',`comentario_respondido`.`id`,'parent_autor_id',`comentario_respondido`.`criador_id`,'parent_autor_nome',`usuario_parent`.`nome`,'parent_autor_nivel_acesso_id',`usuario_projeto_parent`.`nivel_acesso_id`,'parent_autor_nivel_acesso',`nivel_acesso_parent`.`nome`) from (((`comentario` `comentario_respondido` join `usuario` `usuario_parent` on((`comentario_respondido`.`criador_id` = `usuario_parent`.`id`))) join `usuario_projeto` `usuario_projeto_parent` on((`comentario_respondido`.`criador_id` = `usuario_projeto_parent`.`usuario_id`))) join `nivel_acesso` `nivel_acesso_parent` on((`usuario_projeto_parent`.`nivel_acesso_id` = `nivel_acesso_parent`.`id`))) where ((`comentario_respondido`.`id` = `comentario`.`parent_id`) and (`usuario_projeto_parent`.`projeto_id` = `projeto`.`id`))),json_object()) AS `parent`,coalesce((select json_object('registro_id',`registro`.`id`,'registro_titulo',`registro`.`titulo`) from `registro` where (`comentario`.`registro_referencia_id` = `registro`.`id`)),json_object()) AS `registro` from ((((`comentario` join `usuario` on((`comentario`.`criador_id` = `usuario`.`id`))) join `documento` on((`comentario`.`documento_id` = `documento`.`id`))) join `categoria` on((`documento`.`categoria_id` = `categoria`.`id`))) join `projeto` on((`categoria`.`projeto_id` = `projeto`.`id`))) order by `comentario`.`criado_em` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_convites_ativos`
--

/*!50001 DROP VIEW IF EXISTS `vw_convites_ativos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_convites_ativos` AS select `convite`.`id` AS `id`,`convite`.`criado_em` AS `criado_em`,`convite`.`projeto_id` AS `projeto_id`,`convite`.`destinatario_id` AS `destinatario_id`,`convite`.`nivel_acesso_id` AS `nivel_acesso_id`,`convite`.`remetente_id` AS `remetente_id`,`convite`.`convite_status_id` AS `convite_status_id` from `convite` where ((`convite`.`convite_status_id` = 1) or (`convite`.`convite_status_id` = 4)) order by `convite`.`criado_em` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_convites_pendentes_projetos`
--

/*!50001 DROP VIEW IF EXISTS `vw_convites_pendentes_projetos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_convites_pendentes_projetos` AS select `usuario`.`id` AS `usuario_id`,`usuario`.`nome` AS `nome`,`usuario`.`email` AS `email`,`usuario`.`foto_perfil` AS `foto_perfil`,`convite`.`id` AS `convite_id`,`convite`.`projeto_id` AS `projeto_id`,`convite`.`nivel_acesso_id` AS `nivel_acesso_id`,`nivel_acesso`.`nome` AS `nivel_acesso`,`convite`.`criado_em` AS `convidado_em` from ((`convite` join `usuario` on((`convite`.`destinatario_id` = `usuario`.`id`))) join `nivel_acesso` on((`convite`.`nivel_acesso_id` = `nivel_acesso`.`id`))) where (`convite`.`convite_status_id` = 1) order by `convite`.`nivel_acesso_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_convites_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vw_convites_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_convites_usuario` AS select `convite`.`id` AS `id`,`usuario`.`nome` AS `nome_remetente`,`projeto`.`titulo` AS `projeto`,`convite`.`criado_em` AS `criado_em`,`convite`.`projeto_id` AS `projeto_id`,`convite`.`destinatario_id` AS `destinatario_id`,coalesce((select json_object('id',`convite_status`.`id`,'nome',`convite_status`.`nome`) from `convite_status` where (`convite`.`convite_status_id` = `convite_status`.`id`)),json_object()) AS `status` from ((`convite` join `projeto` on((`convite`.`projeto_id` = `projeto`.`id`))) join `usuario` on((`convite`.`remetente_id` = `usuario`.`id`))) where (`convite`.`convite_status_id` in (1,4)) order by `convite`.`criado_em` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_documento_detalhes`
--

/*!50001 DROP VIEW IF EXISTS `vw_documento_detalhes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_documento_detalhes` AS select `d`.`id` AS `id`,`d`.`titulo` AS `titulo`,`c`.`titulo` AS `categoria`,`p`.`titulo` AS `projeto`,`dv`.`conteudo` AS `conteudo`,`dv`.`criado_em` AS `ultima_alteracao` from (((`documento` `d` join `categoria` `c` on((`d`.`categoria_id` = `c`.`id`))) join `projeto` `p` on((`p`.`id` = `c`.`projeto_id`))) join `documento_versao` `dv` on((`dv`.`documento_id` = `d`.`id`))) where (`dv`.`id` = (select `dv2`.`id` from `documento_versao` `dv2` where (`dv2`.`documento_id` = `d`.`id`) order by `dv2`.`criado_em` desc,`dv2`.`id` desc limit 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_documentos_recentes`
--

/*!50001 DROP VIEW IF EXISTS `vw_documentos_recentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_documentos_recentes` AS select `documento`.`id` AS `id`,`projeto`.`titulo` AS `projeto`,`categoria`.`titulo` AS `categoria`,`documento`.`titulo` AS `documento`,`documento_versao`.`criado_em` AS `ultima_edicao`,`documento_versao`.`criador_id` AS `criador_id` from (((`documento` join `documento_versao` on((`documento_versao`.`documento_id` = `documento`.`id`))) join `categoria` on((`categoria`.`id` = `documento`.`categoria_id`))) join `projeto` on((`categoria`.`projeto_id` = `projeto`.`id`))) where (`documento`.`deletado_em` is null) order by `documento_versao`.`criado_em` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_participantes_projetos`
--

/*!50001 DROP VIEW IF EXISTS `vw_participantes_projetos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_participantes_projetos` AS select `usuario`.`id` AS `usuario_id`,`usuario`.`nome` AS `nome`,`usuario`.`email` AS `email`,`usuario`.`foto_perfil` AS `foto_perfil`,`usuario_projeto`.`id` AS `usuario_projeto_id`,`usuario_projeto`.`projeto_id` AS `projeto_id`,`usuario_projeto`.`nivel_acesso_id` AS `nivel_acesso_id`,`nivel_acesso`.`nome` AS `nivel_acesso` from ((`usuario_projeto` join `usuario` on((`usuario_projeto`.`usuario_id` = `usuario`.`id`))) join `nivel_acesso` on((`usuario_projeto`.`nivel_acesso_id` = `nivel_acesso`.`id`))) where (`usuario`.`status` = 1) order by `usuario_projeto`.`nivel_acesso_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_projetos_com_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_projetos_com_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_projetos_com_usuarios` AS select `projeto`.`id` AS `id`,`projeto`.`titulo` AS `titulo`,`projeto`.`descricao` AS `descricao`,json_arrayagg(`usuario`.`foto_perfil`) AS `foto_usuarios` from ((`projeto` join `usuario_projeto` on((`usuario_projeto`.`projeto_id` = `projeto`.`id`))) join `usuario` on((`usuario_projeto`.`usuario_id` = `usuario`.`id`))) group by `projeto`.`id`,`projeto`.`titulo`,`projeto`.`descricao` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_projetos_detalhes`
--

/*!50001 DROP VIEW IF EXISTS `vw_projetos_detalhes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_projetos_detalhes` AS select `projeto`.`id` AS `id`,`projeto`.`titulo` AS `titulo`,`projeto`.`descricao` AS `descricao`,`projeto`.`status` AS `status`,`projeto`.`data_criacao` AS `data_criacao`,`projeto`.`criador_id` AS `criador_id`,`usuario`.`nome` AS `nome_responsavel`,max(`documento_versao`.`criado_em`) AS `ultima_atualizacao` from ((((`projeto` join `usuario` on((`usuario`.`id` = `projeto`.`criador_id`))) join `categoria` on((`categoria`.`projeto_id` = `projeto`.`id`))) join `documento` on((`documento`.`categoria_id` = `categoria`.`id`))) join `documento_versao` on((`documento_versao`.`documento_id` = `documento`.`id`))) group by `projeto`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_reuniao_detalhes`
--

/*!50001 DROP VIEW IF EXISTS `vw_reuniao_detalhes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_reuniao_detalhes` AS select `r`.`id` AS `id`,`r`.`titulo` AS `titulo`,`r`.`criado_em` AS `criado_em`,`r`.`projeto_id` AS `projeto_id`,coalesce((select json_arrayagg(json_object('id',`l`.`id`,'url',`l`.`url`,'nome',`l`.`nome`,'tipo_link',(select `tl`.`nome` from `tipo_link` `tl` where (`tl`.`id` = `l`.`tipo_link_id`)))) from `link` `l` where (`l`.`reuniao_id` = `r`.`id`)),json_array()) AS `links`,coalesce((select json_arrayagg(json_object('id',`cr`.`id`,'cargo',`cr`.`cargo`,'nome',`cr`.`nome`)) from `convidado_reuniao` `cr` where (`cr`.`reuniao_id` = `r`.`id`)),json_array()) AS `convidados`,coalesce((select json_arrayagg(json_object('id',`u`.`id`,'cargo',`ru`.`cargo`,'nome',`u`.`nome`,'foto_perfil',`u`.`foto_perfil`)) from ((`reuniao_usuario` `ru` join `usuario` `u` on((`u`.`id` = `ru`.`usuario_id`))) join `nivel_acesso` `na` on((`na`.`id` = `ru`.`cargo`))) where (`ru`.`reuniao_id` = `r`.`id`)),json_array()) AS `usuarios` from `reuniao` `r` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_reunioes_com_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_reunioes_com_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_reunioes_com_usuarios` AS select `reuniao`.`id` AS `id`,`reuniao`.`titulo` AS `titulo`,`reuniao`.`criado_em` AS `criado_em`,`reuniao`.`projeto_id` AS `projeto_id`,group_concat(`usuario`.`foto_perfil` separator ',') AS `foto_usuarios` from ((`reuniao` join `reuniao_usuario` on((`reuniao_usuario`.`reuniao_id` = `reuniao`.`id`))) join `usuario` on((`reuniao_usuario`.`usuario_id` = `reuniao_usuario`.`usuario_id`))) group by `reuniao_usuario`.`reuniao_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_usuarios_projetos`
--

/*!50001 DROP VIEW IF EXISTS `vw_usuarios_projetos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_usuarios_projetos` AS select `projeto`.`id` AS `projeto_id`,coalesce((select json_arrayagg(json_object('usuario_id',`vw_participantes_projetos`.`usuario_id`,'nome',`vw_participantes_projetos`.`nome`,'email',`vw_participantes_projetos`.`email`,'foto_perfil',`vw_participantes_projetos`.`foto_perfil`,'usuario_projeto_id',`vw_participantes_projetos`.`usuario_projeto_id`,'projeto_id',`vw_participantes_projetos`.`projeto_id`,'nivel_acesso_id',`vw_participantes_projetos`.`nivel_acesso_id`,'nivel_acesso',`vw_participantes_projetos`.`nivel_acesso`)) from `vw_participantes_projetos` where (`vw_participantes_projetos`.`projeto_id` = `projeto`.`id`)),json_array()) AS `participantes`,coalesce((select json_arrayagg(json_object('usuario_id',`vw_convites_pendentes_projetos`.`usuario_id`,'nome',`vw_convites_pendentes_projetos`.`nome`,'email',`vw_convites_pendentes_projetos`.`email`,'foto_perfil',`vw_convites_pendentes_projetos`.`foto_perfil`,'projeto_id',`vw_convites_pendentes_projetos`.`projeto_id`,'nivel_acesso_id',`vw_convites_pendentes_projetos`.`nivel_acesso_id`,'nivel_acesso',`vw_convites_pendentes_projetos`.`nivel_acesso`,'convidado_em',`vw_convites_pendentes_projetos`.`convidado_em`)) from `vw_convites_pendentes_projetos` where (`vw_convites_pendentes_projetos`.`projeto_id` = `projeto`.`id`)),json_array()) AS `pendentes` from `projeto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-12 22:35:38
