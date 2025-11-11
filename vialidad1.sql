CREATE TABLE if not exists precio_autom (
    id_precio_autom INT,
	id_matricula INT,
	PRIMARY KEY (id_precio_autom)
);

CREATE TABLE descripcion (
    id_descripcion INT,
	descripcion varchar(100),
	PRIMARY KEY (id_descripcion)
);
CREATE TABLE cantidad_historia (
     id_cantidad_historia INT,
     fk_cantidad_historia varchar(20),
	 fk_historia varchar(20),
	 PRIMARY KEY (id_cantidad_historia)
);

CREATE TABLE cantidad_bienes (
     id_cantidad_bienes INT,
     fk_cantidad_bienes varchar(20),
	 fk_bienes varchar(20),
	 PRIMARY KEY (id_cantidad_bienes)
);
CREATE TABLE if not exists cantidad (
	id_cantidad INT,
	id_cantidad_bienes INT,
	id_cantidad_historia INT,
	cantidad INT,
	PRIMARY KEY (id_cantidad),
	CONSTRAINT fk_cantidad_bienes FOREIGN KEY(id_cantidad_bienes) REFERENCES cantidad_bienes(id_cantidad_bienes),
	CONSTRAINT fk_cantidad_historia FOREIGN KEY(id_cantidad_historia) REFERENCES cantidad_historia(id_cantidad_historia)
);

CREATE TABLE if not exists Estado (
		id_estado INT,
        estado varchar(100),
		PRIMARY KEY (id_estado)
);
CREATE TABLE if not exists Matricula (
		id_matricula INT,
        matricula INT,
		PRIMARY KEY (id_matricula)
);
CREATE TABLE if not exists fechacargo (
		id_fechacargo INT,
        Descripcion varchar(100),
		PRIMARY KEY (id_fechacargo)
);
CREATE TABLE if not exists Tipos ( 
		id_tipos INT,
        Descripcion varchar(100),
		PRIMARY KEY (id_tipos)
);
CREATE TABLE if not exists abandonado (
		id_abandonado INT,
    	Tipodej INT,
		Nombredej varchar (50),
		Wdocudejo INT,
		Destidej INT,
		PRIMARY KEY (id_abandonado)
);
CREATE TABLE if not exists responsables_bien (
	id_responsables_bien INT,
	destiac INT,
	responsa INT,
	respoante INT, 
	destiante INT,
	PRIMARY KEY (id_responsables_bien)
);
CREATE TABLE if not exists Transferid_Historia (
		id_transferid_historia INT,
		PRIMARY KEY (id_transferid_historia)
);
CREATE TABLE if not exists transferid_autom (
		id_transferid_autom INT,
		PRIMARY KEY (id_transferid_autom)
);
CREATE TABLE if not exists Transferid_Bienes (
		id_transferid_bienes INT,
		PRIMARY KEY (id_transferid_bienes)
);
CREATE TABLE if not exists Precio_Bienes (
		id_precio_bienes INT,
		PRIMARY KEY (id_precio_bienes)
);
CREATE TABLE if not exists Precio_Historia (
		id_precio_historia INT,
		PRIMARY KEY (id_precio_historia)
);
CREATE TABLE if not exists area(
	id_area INT,
	destino INT,
	descrip varchar(100),
	responsa varchar(100),
	PRIMARY KEY (id_area)
);
CREATE TABLE if not exists autom (
	id_autom INT,
	id_fechacargo INT,
	id_area INT,
	id_transferid_autom INT,
	id_precio_autom INT,
	id_matricula INT,
	id_estado INT,
	legajo varchar(100),
	refer varchar(100),
	destino INT,
	dni INT,
	poliza INT,
	cuentamot INT,
	scuentamot INT,
	responsable varchar(100),
	fechapre timestamp,
	dominio varchar(100),
	nromotor varchar(100),
	numdoc INT,
	cargo INT,
	observa varchar(100),
	patente varchar(20),
	PRIMARY KEY (id_autom),
	CONSTRAINT fk_autom_fechacargo FOREIGN KEY(id_fechacargo) REFERENCES fechacargo(id_fechacargo),
	CONSTRAINT fk_autom_area FOREIGN KEY(id_area) REFERENCES area(id_area),
	CONSTRAINT fk_autom_transferid FOREIGN KEY(id_transferid_autom) REFERENCES transferid_autom(id_transferid_autom),
	CONSTRAINT fk_autom_precio FOREIGN KEY(id_precio_autom) REFERENCES precio_autom(id_precio_autom),
	CONSTRAINT fk_autom_matricula FOREIGN KEY(id_matricula) REFERENCES matricula(id_matricula),
	CONSTRAINT fk_autom_estado FOREIGN KEY(id_estado) REFERENCES estado(id_estado)
);


CREATE TABLE if not exists historia (
	id_historia INT,
	id_abandonado INT,
	id_descripcion INT,
	id_tipos INT,
	id_precio_historia INT,
	id_estado INT,
	id_responsables_bien INT,
	legajo varchar(100),
	tipo INT,
	marca INT, 
	referencia INT,
	PRIMARY KEY (id_historia),
	CONSTRAINT fk_historia_abandonado FOREIGN KEY(id_abandonado) REFERENCES abandonado(id_abandonado),
	CONSTRAINT fk_historia_descripcion FOREIGN KEY(id_descripcion) REFERENCES descripcion(id_descripcion),
	CONSTRAINT fk_historia_tipos FOREIGN KEY(id_tipos) REFERENCES tipos(id_tipos),
	CONSTRAINT fk_historia_precio FOREIGN KEY(id_precio_historia) REFERENCES precio_historia(id_precio_historia),
	CONSTRAINT fk_historia_estado FOREIGN KEY(id_estado) REFERENCES estado(id_estado),
	CONSTRAINT fk_historia_responsables FOREIGN KEY(id_responsables_bien) REFERENCES responsables_bien(id_responsables_bien)
);
CREATE TABLE  if not exists bienes (
	id_bienes INT,
	id_responsables_bien INT,
	id_cantidad_bienes INT,
	id_transferid_bienes INT,
	id_precio_bienes INT,
	id_matricula INT,
	matrícula INT,
	estado varchar(100),
	transferid varchar(100),
	descrip varchar(100),
	cantidad INT,
	PRIMARY KEY (id_bienes),
	CONSTRAINT fk_bienes_responsable FOREIGN KEY(id_responsables_bien) REFERENCES responsables_bien(id_responsables_bien),
	CONSTRAINT fk_bienes_cantidad FOREIGN KEY(id_cantidad_bienes) REFERENCES cantidad_bienes(id_cantidad_bienes),
	CONSTRAINT fk_bienes_transferid FOREIGN KEY(id_transferid_bienes) REFERENCES transferid_bienes(id_transferid_bienes),
	CONSTRAINT fk_bienes_precio FOREIGN KEY(id_precio_bienes) REFERENCES precio_bienes(id_precio_bienes),
	CONSTRAINT fk_bienes_matricula FOREIGN KEY(id_matricula) REFERENCES matricula(id_matricula)
);
CREATE TABLE if not exists nomencla (
	id_nomencla INT,
	id_autom INT,
	id_bienes INT,
	cuenta INT,
	subcuenta INT, 
	especie varchar(100),
	descrip varchar (100),
	cantidad INT,
	PRIMARY KEY (id_nomencla),
	CONSTRAINT fk_nomencla_autom FOREIGN KEY(id_autom) REFERENCES autom(id_autom),
	CONSTRAINT fk_nomencla_bienes FOREIGN KEY(id_bienes) REFERENCES bienes(id_bienes)
);
CREATE TABLE  if not exists legajo (
	id_legajo INT,
	id_historia INT,
	id_autom INT,
	lega varchar(100),
	descrip varchar(100),
	PRIMARY KEY (id_legajo),
	CONSTRAINT fk_legajo_historia FOREIGN KEY(id_historia) REFERENCES historia(id_historia),
	CONSTRAINT fk_legajo_autom FOREIGN KEY(id_autom) REFERENCES autom(id_autom)
);
CREATE TABLE if not exists transferid (
	id_transferid INT,
	id_transferid_historia INT,
	id_transferid_bienes INT,
	id_transferid_autom INT,
	transferid varchar(100),
	PRIMARY KEY (id_transferid),
	CONSTRAINT fk_transferid_historia FOREIGN KEY(id_transferid_historia) REFERENCES transferid_historia(id_transferid_historia),
	CONSTRAINT fk_transferid_bienes FOREIGN KEY(id_transferid_bienes) REFERENCES transferid_bienes(id_transferid_bienes),
	CONSTRAINT fk_transferid_autom FOREIGN KEY(id_transferid_autom) REFERENCES transferid_autom(id_transferid_autom)
);


CREATE TABLE if not exists precios (
	id_precios INT,
	id_precio_autom INT,
	id_precio_bienes INT,
	id_precio_historia INT,
	precio INT,
	fechapreg TIMESTAMP,
	PRIMARY KEY (id_precios),
	CONSTRAINT fk_precios_autom FOREIGN KEY(id_precio_autom) REFERENCES precio_autom(id_precio_autom),
	CONSTRAINT fk_precios_bienes FOREIGN KEY(id_precio_bienes) REFERENCES precio_bienes(id_precio_bienes),
	CONSTRAINT fk_precios_historia FOREIGN KEY(id_precio_historia) REFERENCES precio_historia(id_precio_historia)
);

CREATE TABLE if not exists historia (
	id_historia INT,
	id_abandonado INT,
	id_descripcion INT,
	id_tipos INT,
	id_precio_historia INT,
	id_estado INT,
	id_responsables_bien INT,
	legajo varchar(100),
	tipo INT,
	marca INT, 
	referencia INT,
	PRIMARY KEY (id_historia),
	CONSTRAINT fk_historia_abandonado FOREIGN KEY(id_abandonado) REFERENCES abandonado(id_abandonado),
	CONSTRAINT fk_historia_descripcion FOREIGN KEY(id_despcripcion) REFERENCES area(id_descripcion),
	CONSTRAINT fk_historia_tipos FOREIGN KEY(id_tipos) REFERENCES tipos(id_tipos),
	CONSTRAINT fk_historia_precio FOREIGN KEY(id_precio_historia) REFERENCES precio_historia(id_precio_historia),
	CONSTRAINT fk_historia_estado FOREIGN KEY(id_estado) REFERENCES estado(id_estado),
	CONSTRAINT fk_historia_responsables_bien FOREIGN KEY(id_responsables_bien) REFERENCES tipos(id_responsables_bien)
);