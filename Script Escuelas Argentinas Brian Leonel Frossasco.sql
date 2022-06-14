
/* SCRIPT DB ESCUELAS ARGENTINAS BRIAN FROSSASCO*/

CREATE SCHEMA Escuelas_Argentinas;

USE Escuelas_Argentinas;

/* TABLA PROVINCIAS */

CREATE TABLE IF NOT EXISTS Provincias(
	IdProvin INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		Nombre VARCHAR (255) NOT NULL,
		Region VARCHAR (255) NOT NULL);

/* TABLA LOCALIDAD */

CREATE TABLE IF NOT EXISTS Localidad(
	IdLocalidad INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		Localidad VARCHAR (255) NOT NULL);

/* TABLA NIVELES EDUCATIVOS */

CREATE TABLE IF NOT EXISTS Niveles_Educativos(
	IdNivel INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		Nivel VARCHAR (255) NOT NULL);

/* TABLA MODALIDADES EDUCATIVAS */

CREATE TABLE IF NOT EXISTS Modalidades_Educativas(
	IdModalidad INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		Tipo VARCHAR (255) NOT NULL);
        
/* TABLA ESPECIALIDAD */    
    
CREATE TABLE IF NOT EXISTS Especialidad(
	IdEspeciali_ INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		TipoEspec VARCHAR (255) NOT NULL);    

/* TABLA TIPO DE CURSADA */

CREATE TABLE IF NOT EXISTS Tipo_de_Cursada(
	IdTipCurs_ INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		TipoCurs VARCHAR (255) NOT NULL);
        
/* TABLA TURNO */

CREATE TABLE IF NOT EXISTS Turno(
	IdTurno INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		Turno VARCHAR (255) NOT NULL);
        
/* TABLA ESCUELAS */  
      
CREATE TABLE IF NOT EXISTS Escuelas(
	Cue_Escuela INT NOT NULL UNIQUE PRIMARY KEY,
		NumEscuela INT NOT NULL,
        Nombre VARCHAR (255) NOT NULL,
        Calle VARCHAR (255) NOT NULL,
        Num_Calle VARCHAR (255) NOT NULL,
        Cod_postal INT NOT NULL,
        Telefono INT NOT NULL,
        Email VARCHAR (255) NOT NULL,
        IdProvin INT NOT NULL,
        IdLocalidad INT NOT NULL,
        IdModalidad INT NOT NULL,
        IdNivel INT NOT NULL,
			FOREIGN KEY (IdProvin) REFERENCES Escuelas_Argentinas.Provincias(IdProvin),
			FOREIGN KEY (IdLocalidad) REFERENCES Escuelas_Argentinas.Localidad(IdLocalidad),
			FOREIGN KEY (IdModalidad) REFERENCES Escuelas_Argentinas.Modalidades_Educativas(IdModalidad),
			FOREIGN KEY (IdNivel) REFERENCES Escuelas_Argentinas.Niveles_Educativos(IdNivel));
            
/* TABLA DOCENTES */

CREATE TABLE IF NOT EXISTS Docentes(
	Id_Cuit INT NOT NULL PRIMARY KEY UNIQUE,
		Nombre VARCHAR (255) NOT NULL,
		Apellido VARCHAR (255) NOT NULL,
		Edad INT NOT NULL,
		Dni INT NOT NULL,
		Años_Docenc INT NOT NULL,
		Matricu INT NOT NULL ,
		IdNivel INT NOT NULL,
		IdEspeciali_ INT NOT NULL,
		Cue_Escuela INT NOT NULL,
			FOREIGN KEY (IdNivel) REFERENCES Escuelas_Argentinas.Niveles_Educativos (IdNivel),
			FOREIGN KEY (IdEspeciali_) REFERENCES Escuelas_Argentinas.Especialidad (IdEspeciali_),
            FOREIGN KEY (Cue_Escuela) REFERENCES Escuelas_Argentinas.Escuelas (Cue_Escuela));
            
/* TABLA MATERIAS */
 
CREATE TABLE IF NOT EXISTS Materias(
	IdMateria INT NOT NULL PRIMARY KEY UNIQUE auto_increment,
		Materia VARCHAR (255) NOT NULL,
		Durac_Horas INT NOT NULL,
		IdTipCurs_ INT NOT NULL,
		IdTurno INT NOT NULL,
		Id_Cuit INT NOT NULL,
		Cue_Escuela INT NOT NULL,
			FOREIGN KEY (IdTipCurs_) REFERENCES Escuelas_Argentinas.Tipo_de_Cursada (IdTipCurs_),
			FOREIGN KEY (IdTurno) REFERENCES Escuelas_Argentinas.Turno (IdTurno),
            FOREIGN KEY (Id_Cuit) REFERENCES Escuelas_Argentinas.Docentes (Id_Cuit),
            FOREIGN KEY (Cue_Escuela) REFERENCES Escuelas_Argentinas.Escuelas (Cue_Escuela));
            

        










