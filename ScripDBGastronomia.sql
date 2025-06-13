
DROP DATABASE IF EXISTS gastronomia_peru;
CREATE DATABASE gastronomia_peru;
USE gastronomia_peru;

-- Tabla de regiones
CREATE TABLE regiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

-- Tabla de platos típicos
CREATE TABLE platos_tipicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    ingredientes TEXT,
    tipo VARCHAR(50),
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regiones(id)
);

-- Insertar regiones
INSERT INTO regiones (nombre) VALUES ('Costa');
INSERT INTO regiones (nombre) VALUES ('Sierra');
INSERT INTO regiones (nombre) VALUES ('Selva');

-- Insertar platos típicos

-- Costa (region_id = 1)
INSERT INTO platos_tipicos (nombre, descripcion, ingredientes, tipo, region_id)
VALUES 
('Ceviche', 'Plato marino con pescado crudo marinado en limón.', 'pescado, limón, cebolla, ají', 'Entrada', 1),
('Arroz con mariscos', 'Arroz sazonado con mariscos mixtos y especias.', 'arroz, mariscos, ajo, pimiento', 'Fondo', 1);

-- Sierra (region_id = 2)
INSERT INTO platos_tipicos (nombre, descripcion, ingredientes, tipo, region_id)
VALUES 
('Pachamanca', 'Cocción de carnes y papas bajo tierra con piedras calientes.', 'cordero, cerdo, papas, hierbas andinas', 'Fondo', 2),
('Rocoto relleno', 'Ají rocoto relleno de carne y cubierto con queso.', 'rocoto, carne, queso, leche', 'Entrada', 2);

-- Selva (region_id = 3)
INSERT INTO platos_tipicos (nombre, descripcion, ingredientes, tipo, region_id)
VALUES 
('Juane', 'Arroz con gallina envuelto en hojas de bijao.', 'arroz, gallina, huevo, aceitunas', 'Fondo', 3),
('Tacacho con cecina', 'Plátano verde machacado con carne seca.', 'plátano verde, manteca, cecina', 'Desayuno', 3);
