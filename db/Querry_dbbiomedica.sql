CREATE DATABASE proyecto_espirometro_bi;
USE proyecto_espirometro_bi;

-- Tabla Paciente
CREATE TABLE Paciente (
    ID_Paciente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    NIT INT,
    Edad INT,
    Sexo VARCHAR(50),
    Altura FLOAT
);

-- Tabla Mediciones
CREATE TABLE Mediciones (
    ID_Medición INT AUTO_INCREMENT PRIMARY KEY,
    ID_Paciente INT,
    Fecha_Hora DATETIME,
    FVC FLOAT,
    PEF FLOAT,
    FEV1 FLOAT,
    FVC_FEV1 FLOAT,
    MEF25_75 FLOAT,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente)
);

-- Creación de la tabla Estados_FVC
CREATE TABLE Estados_FVC (
    ID_Estado_FVC INT AUTO_INCREMENT PRIMARY KEY,
    Descripción VARCHAR(255),
    Valor_Min FLOAT,
    Valor_Max FLOAT
);

-- Creación de la tabla Estados_PEF
CREATE TABLE Estados_PEF (
    ID_Estado_PEF INT AUTO_INCREMENT PRIMARY KEY,
    Descripción VARCHAR(255),
    Valor_Min FLOAT,
    Valor_Max FLOAT
);

-- Tabla Estados_FEV1
CREATE TABLE Estados_FEV1 (
    ID_Estado_FEV1 INT AUTO_INCREMENT PRIMARY KEY,
    Descripción VARCHAR(255),
    Valor_Min FLOAT,
    Valor_Max FLOAT
);

-- Tabla Estados_FVC_FEV1
CREATE TABLE Estados_FVC_FEV1 (
    ID_Estado_FVC_FEV1 INT AUTO_INCREMENT PRIMARY KEY,
    Descripción VARCHAR(255),
    Valor_Min FLOAT,
    Valor_Max FLOAT
);

-- Creación de la tabla Estados_MEF25_75
CREATE TABLE Estados_MEF25_75 (
    ID_Estado_MEF25_75 INT AUTO_INCREMENT PRIMARY KEY,
    Descripción VARCHAR(255),
    Valor_Min FLOAT,
    Valor_Max FLOAT
);

-- Tabla Posibles_Enfermedades
CREATE TABLE Posibles_Enfermedades (
    ID_Enfermedad INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripción TEXT
);

-- Tabla Relación_Estado_Enfermedad
CREATE TABLE Relación_Estado_Enfermedad (
    ID_Relación INT AUTO_INCREMENT PRIMARY KEY,
    ID_Estado_FVC INT,
    ID_Estado_PEF INT,
    ID_Estado_FEV1 INT,
    ID_Estado_FVC_FEV1 INT,
    ID_Estado_MEF25_75 INT,
    ID_Enfermedad INT,
    FOREIGN KEY (ID_Estado_FVC) REFERENCES Estados_FVC(ID_Estado_FVC),
    FOREIGN KEY (ID_Estado_PEF) REFERENCES Estados_PEF(ID_Estado_PEF),
    FOREIGN KEY (ID_Estado_FEV1) REFERENCES Estados_FEV1(ID_Estado_FEV1),
    FOREIGN KEY (ID_Estado_FVC_FEV1) REFERENCES Estados_FVC_FEV1(ID_Estado_FVC_FEV1),
    FOREIGN KEY (ID_Estado_MEF25_75) REFERENCES Estados_MEF25_75(ID_Estado_MEF25_75),
    FOREIGN KEY (ID_Enfermedad) REFERENCES Posibles_Enfermedades(ID_Enfermedad)
);
