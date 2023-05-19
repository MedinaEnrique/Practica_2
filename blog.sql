-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
  ID_Usuario INT PRIMARY KEY,
  Nombre VARCHAR(255),
  CorreoElectronico VARCHAR(255) UNIQUE,
  Contrasena VARCHAR(255),
  FechaRegistro DATE,
 
);

-- Creación de la tabla Posteos
CREATE TABLE Posteos (
  ID_Posteo INT PRIMARY KEY,
  ID_Usuario INT,
  Titulo VARCHAR(255),
  Contenido TEXT,
  FechaCreacion DATE,
  -- Otros campos relevantes de posteo
  FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

-- Creación de la tabla Comentarios
CREATE TABLE Comentarios (
  ID_Comentario INT PRIMARY KEY,
  ID_Posteo INT,
  ID_Usuario INT,
  Contenido TEXT,
  FechaCreacion DATE,
  FOREIGN KEY (ID_Posteo) REFERENCES Posteos(ID_Posteo),
  FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

-- Creación de la tabla Categorías (opcional)
CREATE TABLE Categorias (
  ID_Categoria INT PRIMARY KEY,
  NombreCategoria VARCHAR(255)
);

-- Creación de la tabla Posteos_Categorias (opcional, relación muchos a muchos)
CREATE TABLE Posteos_Categorias (
  ID_Posteo INT,
  ID_Categoria INT,
  PRIMARY KEY (ID_Posteo, ID_Categoria),
  FOREIGN KEY (ID_Posteo) REFERENCES Posteos(ID_Posteo),
  FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria)
);

-- Creación de la tabla Etiquetas (opcional)
CREATE TABLE Etiquetas (
  ID_Etiqueta INT PRIMARY KEY,
  NombreEtiqueta VARCHAR(255)
);

-- Creación de la tabla Posteos_Etiquetas (opcional, relación muchos a muchos)
CREATE TABLE Posteos_Etiquetas (
  ID_Posteo INT,
  ID_Etiqueta INT,
  PRIMARY KEY (ID_Posteo, ID_Etiqueta),
  FOREIGN KEY (ID_Posteo) REFERENCES Posteos(ID_Posteo),
  FOREIGN KEY (ID_Etiqueta) REFERENCES Etiquetas(ID_Etiqueta)
);
