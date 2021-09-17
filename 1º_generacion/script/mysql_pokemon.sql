use bd_pokemon;

/*Creamos Base de datos Pokemon*/
create database bd_pokemon;

/*Eliminar BD*/
drop database if exists bd_pokemon;

/*Tablas*/

Create table if not exists pokemon  (
	id_pokedex int not null auto_increment,
    nombre varchar(45) not null,
    peso real not null,
    altura real not null,
    primary key (id_pokedex)
);

Create table if not exists tipo_ataque  (
	id_tipo_ataque int primary key auto_increment,
	tipo varchar(8) not null
);


Create table if not exists tipo (
	id_tipo int primary key auto_increment, 
    nombre varchar(10) not null,
    id_tipo_ataque int not null,
	foreign key (id_tipo_ataque) references tipo_ataque(id_tipo_ataque)
);
 
 
Create table if not exists pokemon_tipo  (
	id_pokedex int not null,
    id_tipo int not null,
    primary key(id_pokedex, id_tipo),
    foreign key (id_pokedex) references pokemon(id_pokedex),
    foreign key (id_tipo) references tipo(id_tipo)
);

Create table if not exists estadisticas_base  (
	id_pokedex int primary key,
    ps int not null,
    ataque int not null,
    defensa int not null,
    especial int not null,
    velocidad int not null,
	foreign key (id_pokedex) references pokemon(id_pokedex)
);

Create table if not exists movimiento  (
	id_movimiento int primary key auto_increment,
    nombre varchar(20) not null,
    potencia int not null,
    precision_mov int not null,
    descripcion varchar(500) not null,
    pp int not null,
    id_tipo int not null,
    prioridad int not null default 0,
	foreign key (id_tipo) references tipo(id_tipo)
);

Create table if not exists efecto_secundario  (
	id_efecto_secundario int primary key,
    efecto_secundario varchar(30) not null
);

Create table if not exists movimiento_efecto_secundario  (
	id_movimiento int,
    id_efecto_secundario int,
    probabilidad real not null, 
    primary key (id_movimiento, id_efecto_secundario),
    foreign key (id_movimiento) references movimiento(id_movimiento),
    foreign key (id_efecto_secundario) references efecto_secundario(id_efecto_secundario)
);

Create table if not exists tipo_forma_aprendizaje  (
	id_tipo_aprendizaje int primary key auto_increment,
    tipo_aprendizaje varchar(20) not null
);

Create table if not exists forma_aprendizaje  (
	id_forma_aprendizaje int primary key auto_increment,
    id_tipo_aprendizaje int not null,
    foreign key (id_tipo_aprendizaje) references tipo_forma_aprendizaje(id_tipo_aprendizaje)
);

Create table if not exists MT  ( 
	id_forma_aprendizaje int primary key, 
    MT varchar(5) not null,
    foreign key(id_forma_aprendizaje) references forma_aprendizaje(id_forma_aprendizaje)
);

Create table if not exists MO  ( 
	id_forma_aprendizaje int primary key, 
    MO varchar(5) not null,
    foreign key(id_forma_aprendizaje) references forma_aprendizaje(id_forma_aprendizaje)
);

Create table if not exists nivel_aprendizaje  ( 
	id_forma_aprendizaje int primary key, 
    nivel int not null,
    foreign key(id_forma_aprendizaje) references forma_aprendizaje(id_forma_aprendizaje)
);

Create table if not exists pokemon_movimiento_forma  (
	id_pokedex int,
    id_movimiento int,
    id_forma_aprendizaje int,
    primary key(id_pokedex, id_movimiento, id_forma_aprendizaje),
    foreign key (id_pokedex) references pokemon(id_pokedex),
    foreign key (id_movimiento) references movimiento(id_movimiento),
    foreign key (id_forma_aprendizaje) references forma_aprendizaje(id_forma_aprendizaje)
);

 Create table if not exists tipo_evolucion  (
	id_tipo_evolucion int primary key,
    tipo_evolucion varchar(15) not null
);

 Create table if not exists forma_evolucion  (
	id_forma_evolucion int primary key,
    tipo_evolucion int not null,
	foreign key (tipo_evolucion) references tipo_evolucion(id_tipo_evolucion)
);

 Create table if not exists evoluciona_de  (
	pokemon_evolucionado int,
    pokemon_origen int,
	primary key(pokemon_evolucionado, pokemon_origen),
    foreign key (pokemon_evolucionado) references pokemon(id_pokedex),
    foreign key (pokemon_origen) references pokemon(id_pokedex)
);

Create table if not exists tipo_piedra  (
	id_tipo_piedra int primary key,
    nombre_piedra varchar(20) not null
);

Create table if not exists piedra  (
	id_forma_evolucion int primary key,
    id_tipo_piedra int,
    foreign key (id_tipo_piedra) references tipo_piedra(id_tipo_piedra),
    foreign key (id_forma_evolucion) references forma_evolucion(id_forma_evolucion)
);

Create table if not exists nivel_evolucion  (
	id_forma_evolucion int primary key,
    nivel int not null,
    foreign key (id_forma_evolucion) references forma_evolucion(id_forma_evolucion)
);

Create table if not exists pokemon_forma_evolucion  (
	id_pokedex int,
    id_forma_evolucion int,
    primary key(id_pokedex, id_forma_evolucion),
    foreign key (id_pokedex) references pokemon(id_pokedex),
    foreign key (id_forma_evolucion) references forma_evolucion(id_forma_evolucion)
);