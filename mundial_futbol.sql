-- Creación de la tabla Equipos
CREATE TABLE Equipos (
  ID_Equipo INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Pais VARCHAR(255),
  -- Otros campos relevantes de equipo
  Grupo VARCHAR(1)
);

-- Creación de la tabla Grupos
CREATE TABLE Grupos (
  ID_Grupo INT PRIMARY KEY,
  Nombre VARCHAR(255)
);

-- Creación de la tabla Partidos
CREATE TABLE Partidos (
  ID_Partido INT PRIMARY KEY,
  ID_EquipoLocal INT,
  ID_EquipoVisitante INT,
  FechaHora DATETIME,
  Estadio VARCHAR(255),
  Fase VARCHAR(255),
  ResultadoLocal INT,
  ResultadoVisitante INT,
  FOREIGN KEY (ID_EquipoLocal) REFERENCES Equipos(ID_Equipo),
  FOREIGN KEY (ID_EquipoVisitante) REFERENCES Equipos(ID_Equipo)
);

-- Creación de la tabla Fases
CREATE TABLE Fases (
  ID_Fase INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Orden INT
);

-- Creación de la tabla Equipos_Fases 
CREATE TABLE Equipos_Fases (
  ID_Equipo INT,
  ID_Fase INT,
  PRIMARY KEY (ID_Equipo, ID_Fase),
  FOREIGN KEY (ID_Equipo) REFERENCES Equipos(ID_Equipo),
  FOREIGN KEY (ID_Fase) REFERENCES Fases(ID_Fase)
);
