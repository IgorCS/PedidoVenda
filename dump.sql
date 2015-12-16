/*
SQLyog Ultimate v8.71 
MySQL - 5.6.27-log : Database - javaee
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`javaee` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `javaee`;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) NOT NULL,
  `categoria_pai_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fkuqkgkisyom8dxthrqo1ttix` (`categoria_pai_id`),
  CONSTRAINT `FK_fkuqkgkisyom8dxthrqo1ttix` FOREIGN KEY (`categoria_pai_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `categoria` */

insert  into `categoria`(`id`,`descricao`,`categoria_pai_id`) values (1,'Informática',NULL),(2,'Eletrodomésticos',NULL),(3,'Móveis',NULL),(4,'Computadores',1),(5,'Notebooks',1),(6,'Tablets',1),(7,'Monitores',1),(8,'Impressoras',1),(9,'Acessórios',1),(10,'Ar condicionados',2),(11,'Fogões',2),(12,'Fornos elétricos',2),(13,'Microondas',2),(14,'Refrigeradores',2),(15,'Cadeiras',3),(16,'Mesas',3),(17,'Racks',3),(18,'Sofás',3);

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_receita_federal` varchar(14) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `cliente` */

insert  into `cliente`(`id`,`doc_receita_federal`,`email`,`nome`,`tipo`) values (1,'XX8888','testes@testes','TESTES','FISICA');

/*Table structure for table `endereco` */

DROP TABLE IF EXISTS `endereco`;

CREATE TABLE `endereco` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cep` varchar(9) NOT NULL,
  `cidade` varchar(60) NOT NULL,
  `complemento` varchar(150) DEFAULT NULL,
  `logradouro` varchar(150) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `uf` varchar(60) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5hhg2rsvgex3ulsdy1svy8s62` (`cliente_id`),
  CONSTRAINT `FK_5hhg2rsvgex3ulsdy1svy8s62` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `endereco` */

/*Table structure for table `grupo` */

DROP TABLE IF EXISTS `grupo`;

CREATE TABLE `grupo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(80) NOT NULL,
  `nome` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `grupo` */

insert  into `grupo`(`id`,`descricao`,`nome`) values (1,'ADMINISTRADORES','ADMINISTRADORES'),(2,'VENDEDORES','VENDEDORES'),(3,'AUXILIARES','AUXILIARES');

/*Table structure for table `item_pedido` */

DROP TABLE IF EXISTS `item_pedido`;

CREATE TABLE `item_pedido` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `produto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4ql24iphly75cwd5vx596mx8v` (`pedido_id`),
  KEY `FK_r5pmilksmhlmh5mccbvplg8b7` (`produto_id`),
  CONSTRAINT `FK_4ql24iphly75cwd5vx596mx8v` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `FK_r5pmilksmhlmh5mccbvplg8b7` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `item_pedido` */

insert  into `item_pedido`(`id`,`quantidade`,`valor_unitario`,`pedido_id`,`produto_id`) values (1,1,'1000.00',1,1),(2,5,'1000.00',2,1),(3,2,'1000.00',3,1);

/*Table structure for table `pedido` */

DROP TABLE IF EXISTS `pedido`;

CREATE TABLE `pedido` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_criacao` datetime NOT NULL,
  `data_entrega` date NOT NULL,
  `entrega_cep` varchar(9) NOT NULL,
  `entrega_cidade` varchar(60) NOT NULL,
  `entrega_complemento` varchar(150) DEFAULT NULL,
  `entrega_logradouro` varchar(150) NOT NULL,
  `entrega_numero` varchar(20) NOT NULL,
  `entrega_uf` varchar(60) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `observacao` text,
  `status` varchar(20) NOT NULL,
  `valor_desconto` decimal(10,2) NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `vendedor_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jvfwgjbqjdp5sk1qto0trgpla` (`cliente_id`),
  KEY `FK_k1yq38ro8cntr2av6fllk3xwt` (`vendedor_id`),
  CONSTRAINT `FK_jvfwgjbqjdp5sk1qto0trgpla` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FK_k1yq38ro8cntr2av6fllk3xwt` FOREIGN KEY (`vendedor_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `pedido` */

insert  into `pedido`(`id`,`data_criacao`,`data_entrega`,`entrega_cep`,`entrega_cidade`,`entrega_complemento`,`entrega_logradouro`,`entrega_numero`,`entrega_uf`,`forma_pagamento`,`observacao`,`status`,`valor_desconto`,`valor_frete`,`valor_total`,`cliente_id`,`vendedor_id`) values (1,'2015-12-15 14:46:11','2015-12-15','64007-150','the','testes','TESTES','123','PI','DINHEIRO','','EMITIDO','10.00','1.00','991.00',1,1),(2,'2015-12-15 14:54:11','2015-12-15','64007150','THE','testes','testes','1111','PI','CARTAO_CREDITO','','EMITIDO','42.22','12.22','4970.00',1,3),(3,'2015-12-15 17:37:44','2015-12-15','64000-001','THE','testes','the','1122','PI','BOLETO_BANCARIO','','EMITIDO','23.00','14.50','1991.50',1,2);

/*Table structure for table `produto` */

DROP TABLE IF EXISTS `produto`;

CREATE TABLE `produto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `quantidade_estoque` int(11) NOT NULL,
  `sku` varchar(20) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_j6npst3feop938l4x5h675kyv` (`sku`),
  KEY `FK_el0d58htywfs914w4grf6aoa0` (`categoria_id`),
  CONSTRAINT `FK_el0d58htywfs914w4grf6aoa0` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `produto` */

insert  into `produto`(`id`,`nome`,`quantidade_estoque`,`sku`,`valor_unitario`,`categoria_id`) values (1,'Dell',48,'XX1299','1000.00',5);

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `senha` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5171l57faosmj8myawaucatdw` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `usuario` */

insert  into `usuario`(`id`,`email`,`nome`,`senha`) values (1,'mail.com','igor','igor'),(2,'mail1.com','user','user'),(3,'mail_','aux','aux');

/*Table structure for table `usuario_grupo` */

DROP TABLE IF EXISTS `usuario_grupo`;

CREATE TABLE `usuario_grupo` (
  `usuario_id` bigint(20) NOT NULL,
  `grupo_id` bigint(20) NOT NULL,
  KEY `FK_5p20y5panoea7wc040qm6eemd` (`grupo_id`),
  KEY `FK_m32it4c8rkf6t8nno481k43q4` (`usuario_id`),
  CONSTRAINT `FK_5p20y5panoea7wc040qm6eemd` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`),
  CONSTRAINT `FK_m32it4c8rkf6t8nno481k43q4` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usuario_grupo` */

insert  into `usuario_grupo`(`usuario_id`,`grupo_id`) values (1,1),(2,2),(3,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
