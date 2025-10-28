CREATE TABLE `LIBRO`(
    `id_libro` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `titulo` VARCHAR(255) NOT NULL,
    `autor` VARCHAR(255) NOT NULL,
    `categoria` VARCHAR(255) NOT NULL,
    `editorial` VARCHAR(255) NOT NULL,
    `precio` BIGINT NOT NULL,
    `fecha de publicacion` BIGINT NOT NULL,
    `ISBN` BIGINT NOT NULL,
    `cantidad en Stock` BIGINT NOT NULL
);
CREATE TABLE `AUTOR`(
    `id_autor` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `nacionalidad` VARCHAR(255) NOT NULL,
    `fecha de nacimiento` BIGINT NOT NULL
);
CREATE TABLE `CLIENTE`(
    `id_cliente` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `teléfono` BIGINT NOT NULL,
    `direccion` BIGINT NOT NULL,
    `correo electrónico` VARCHAR(255) NOT NULL
);
CREATE TABLE `PEDIDO`(
    `id_pedido` BIGINT NOT NULL,
    `libro` VARCHAR(255) NOT NULL,
    `cantidad` BIGINT NOT NULL,
    `fecha de compra` BIGINT NOT NULL,
    `estado` BOOLEAN NOT NULL,
    PRIMARY KEY(`id_pedido`)
);
CREATE TABLE `TRANSACCIÓN`(
    `id_transacción` BIGINT NOT NULL,
    `método_Pago` VARCHAR(255) NOT NULL,
    `monto total` BIGINT NOT NULL,
    `fecha transacción` BIGINT NOT NULL,
    PRIMARY KEY(`id_transacción`)
);
CREATE TABLE `fecha_pedido`(
    `id_fecha` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_cliente` BIGINT NOT NULL,
    `id_pedido` BIGINT NOT NULL
);
ALTER TABLE
    `fecha_pedido` ADD INDEX `fecha_pedido_id_cliente_index`(`id_cliente`);
ALTER TABLE
    `fecha_pedido` ADD INDEX `fecha_pedido_id_pedido_index`(`id_pedido`);
CREATE TABLE `fecha compra`(
    `id_fechaCompra` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_pedido` BIGINT NOT NULL,
    `id_transacción` BIGINT NOT NULL
);
ALTER TABLE
    `fecha compra` ADD INDEX `fecha compra_id_pedido_index`(`id_pedido`);
ALTER TABLE
    `fecha compra` ADD INDEX `fecha compra_id_transacción_index`(`id_transacción`);
ALTER TABLE
    `fecha compra` ADD CONSTRAINT `fecha compra_id_transacción_foreign` FOREIGN KEY(`id_transacción`) REFERENCES `TRANSACCIÓN`(`id_transacción`);
ALTER TABLE
    `fecha compra` ADD CONSTRAINT `fecha compra_id_pedido_foreign` FOREIGN KEY(`id_pedido`) REFERENCES `PEDIDO`(`id_pedido`);
ALTER TABLE
    `LIBRO` ADD CONSTRAINT `libro_autor_foreign` FOREIGN KEY(`autor`) REFERENCES `AUTOR`(`id_autor`);
ALTER TABLE
    `fecha_pedido` ADD CONSTRAINT `fecha_pedido_id_cliente_foreign` FOREIGN KEY(`id_cliente`) REFERENCES `CLIENTE`(`id_cliente`);
ALTER TABLE
    `fecha_pedido` ADD CONSTRAINT `fecha_pedido_id_pedido_foreign` FOREIGN KEY(`id_pedido`) REFERENCES `PEDIDO`(`id_pedido`);