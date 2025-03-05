create table paritate (
    id_par integer auto_increment primary key,
    actual_par ENUM('odd', 'even') not null
);

insert into paritate (actual_par) values ('odd'), ('even');

create table zile (
    id_zi integer auto_increment primary key,
    actual_zi ENUM('luni', 'marti', 'miercuri', 'joi', 'vineri') not null
);

insert into zile (actual_zi) values ('luni'), ('marti'), ('miercuri'), ('joi'), ('vineri');

create table ora (
    id_ora integer auto_increment primary key,
    actual_ora ENUM('1', '2', '3', '4', '5') not null
);

insert into ora (actual_ora) values ('1'), ('2'), ('3'), ('4'), ('5');

create table free_rooms (
    id_room integer auto_increment primary key,
    actual_rooms text not null,
    id_par integer not null,
    id_zi integer not null,
    id_ora integer not null,

    FOREIGN KEY (id_par) REFERENCES paritate(id_par),
    FOREIGN KEY (id_zi) REFERENCES zile(id_zi),
    FOREIGN KEY (id_ora) REFERENCES ora(id_ora)
);

-- Luni pe bara
insert into free_rooms (actual_rooms, id_par, id_zi, id_ora) values
("213;216;224;311;313;112;114;122;204;218;225;230;301;309;315;401;415;419;423;424;428;SalaAlbastra;SalaVerde;SalaDeLectura;SalaSportivaNr2", 1, 1, 1),
("213;216;313;314;114;122;204;225;230;315;401;404;406;415;431;SalaTurcoaz;SalaDeLectura;SalaSportivaNr2", 1, 1, 2),
("213;214;216;313;112;114;201;204;218;225;230;315;401;406;415;SalaAlbastra;SalaDeLectura;SalaSportivaNr2", 1, 1, 3),
("213;216;313;101;112;114;118;122;123;201;204;225;301;309;315;318;322;415;419;423;424;425;SalaSportivaNr1;SalaSportivaNr2", 1, 1, 4),
("213;214;216;223;311;313;314;101;108;112;115;118;122;123;125;201;204;225;230;301;302;309;315;318;322;401;402;404;415;416;417;419;423;424;425;431;SalaAlbastra;SalaTurcoaz;SalaVerde;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 1, 1, 5);

-- Marti pe bara
insert into free_rooms (actual_rooms, id_par, id_zi, id_ora) values
("213;216;223;224;313;101;114;204;225;230;309;406;410;412;415;425;431;SalaAlbastra;SalaTurcoaz;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 1, 2, 1),
("213;215;216;223;313;112;114;115;204;225;230;301;315;415;416;425;SalaAlbastra;SalaRosie;SalaDeLectura;SalaSportivaNr2", 1, 2, 2),
("213;216;223;224;313;101;114;204;225;230;301;404;406;410;415;417;424;425;SalaAlbastra;SalaRosie;SalaVerde;SalaDeLectura", 1, 2, 3),
("213;216;224;313;101;112;114;118;122;123;201;204;225;230;301;302;309;318;322;415;419;423;424;425;SalaAlbastra;SalaDeLectura", 1, 2, 4),
("213;214;216;223;224;311;313;314;101;108;112;114;115;118;122;123;201;204;218;225;230;301;302;309;315;318;322;404;406;410;412;415;416;417;419;423;424;425;428;431;SalaAlbastra;SalaRosie;SalaVerde;SalaDeLectura", 1, 2, 5);

-- Miercuri pe bara
insert into free_rooms (actual_rooms, id_par, id_zi, id_ora) values
("213;216;223;313;108;114;115;122;125;201;204;225;230;301;315;322;401;406;410;412;415;424;SalaDeLectura;SalaSportivaNr2", 1, 3, 1),
("213;223;313;114;115;204;218;225;230;301;322;412;415;423;425;SalaRosie;SalaVerde;SalaDeLectura;SalaSportivaNr2", 1, 3, 2),
("213;216;223;313;101;114;115;123;201;204;225;309;315;322;401;415;419;425;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 1, 3, 3),
("213;216;223;313;101;112;114;115;118;122;123;201;204;225;301;309;315;318;322;404;415;419;423;424;425;SalaDeLectura;SalaSportivaNr2", 1, 3, 4),
("213;214;215;216;223;311;313;314;101;108;112;114;115;118;122;123;125;201;204;218;225;230;301;302;309;315;318;322;401;402;404;406;412;415;416;417;419;423;424;425;428;431;SalaAlbastra;SalaTurcoaz;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 1, 3, 5);

-- Joi pe bara
insert into free_rooms (actual_rooms, id_par, id_zi, id_ora) values
("213;216;313;314;108;112;114;204;225;230;402;410;415;416;419;425;431;SalaAlbastra;SalaRosie;SalaTurcoaz;SalaDeLectura", 1, 4, 1),
("213;216;313;101;114;125;204;225;230;318;412;415;419;431;SalaAlbastra;SalaTurcoaz;SalaDeLectura", 1, 4, 2),
("213;216;313;114;125;204;225;230;410;415;416;417;419;431;SalaTurcoaz;SalaVerde;SalaDeLectura", 1, 4, 3),
("213;216;223;313;101;112;114;118;122;123;201;204;225;230;301;309;318;322;412;415;419;423;424;425;SalaDeLectura;SalaSportivaNr1", 1, 4, 4),
("213;214;215;216;223;224;311;313;314;101;108;112;114;115;118;122;123;125;201;204;218;225;230;301;302;309;315;318;322;401;402;404;406;410;412;415;417;419;423;424;425;428;SalaRosie;SalaTurcoaz;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 1, 4, 5);

-- Vineri pe bara
insert into free_rooms (actual_rooms, id_par, id_zi, id_ora) values
("213;216;223;313;112;114;122;201;204;225;230;301;302;309;315;318;322;401;406;415;416;SalaAlbastra;SalaRosie;SalaDeLectura;SalaSportivaNr2", 1, 5, 1),
("213;214;216;313;114;123;201;204;225;230;309;315;318;406;415;419;SalaDeLectura;SalaSportivaNr2", 1, 5, 2),
("213;216;313;114;118;123;201;204;218;225;230;315;322;402;406;415;428;431;SalaRosie;SalaTurcoaz;SalaVerde;SalaDeLectura;SalaSportivaNr2", 1, 5, 3),
("213;214;215;216;223;224;311;313;314;101;108;112;114;115;118;122;123;125;201;204;218;225;230;301;302;309;318;322;401;402;404;406;410;415;416;417;419;423;424;425;428;431;SalaAlbastra;SalaVerde;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 1, 5, 4),
("213;214;215;216;223;224;311;313;314;101;108;112;114;115;118;122;123;125;201;204;218;225;230;301;302;309;315;318;322;401;402;404;406;410;415;416;417;419;423;424;425;428;431;SalaAlbastra;SalaRosie;SalaTurcoaz;SalaVerde;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 1, 5, 5);




-- Luni pe bara
insert into free_rooms (actual_rooms, id_par, id_zi, id_ora) values
("213;216;223;224;311;313;112;114;204;218;225;230;301;309;315;318;322;401;415;419;423;424;428;431;SalaAlbastra;SalaVerde;SalaDeLectura;SalaSportivaNr2", 2, 1, 1),
("213;216;313;114;122;204;225;230;315;401;404;406;415;423;424;431;SalaTurcoaz;SalaDeLectura;SalaSportivaNr2", 2, 1, 2),
("213;214;216;313;112;114;201;204;218;225;230;315;401;406;415;SalaAlbastra;SalaDeLectura;SalaSportivaNr2", 2, 1, 3),
("213;216;313;101;112;114;118;122;123;201;204;225;301;309;315;318;322;415;419;423;424;425;SalaSportivaNr1;SalaSportivaNr2", 2, 1, 4),
("213;214;216;223;311;313;101;108;112;115;118;122;123;125;201;204;225;230;301;302;309;315;318;322;402;415;416;417;419;423;424;425;431;SalaAlbastra;SalaTurcoaz;SalaVerde;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 2, 1, 5);

-- Marti pe bara
insert into free_rooms (actual_rooms, id_par, id_zi, id_ora) values
("213;216;223;224;313;101;114;204;225;230;309;406;410;412;415;423;425;431;SalaAlbastra;SalaTurcoaz;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 2, 2, 1),
("213;215;216;223;313;112;114;115;123;204;225;230;301;315;415;416;425;SalaRosie;SalaDeLectura;SalaSportivaNr2", 2, 2, 2),
("213;216;223;313;101;114;125;204;225;230;301;404;406;410;415;417;424;425;SalaAlbastra;SalaRosie;SalaVerde;SalaDeLectura", 2, 2, 3),
("213;216;223;313;314;101;112;114;118;122;123;201;204;225;230;301;302;309;315;318;322;415;416;417;419;423;424;425;SalaAlbastra;SalaDeLectura", 2, 2, 4),
("213;214;216;223;224;311;313;314;101;108;112;114;115;118;122;123;201;204;218;225;230;301;302;309;315;318;322;401;402;404;410;412;415;416;417;419;423;424;425;428;SalaAlbastra;SalaRosie;SalaVerde;SalaDeLectura", 2, 2, 5);

-- Miercuri pe bara
insert into free_rooms (actual_rooms, id_par, id_zi, id_ora) values
("213;216;223;313;314;112;114;115;115;118;122;125;201;204;225;230;301;315;322;401;406;410;412;415;SalaDeLectura;SalaSportivaNr2", 2, 3, 1),
("213;223;313;114;115;115;118;204;218;225;230;301;322;406;412;415;423;SalaRosie;SalaDeLectura;SalaSportivaNr2", 2, 3, 2),
("213;216;223;313;101;114;115;115;123;201;204;225;309;315;322;401;415;419;425;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 2, 3, 3),
("213;216;223;313;101;108;112;114;115;115;118;122;123;201;204;225;301;309;315;318;322;415;419;423;424;425;SalaDeLectura;SalaSportivaNr2", 2, 3, 4),
("213;214;215;216;223;311;313;314;101;108;112;114;115;115;118;122;123;125;201;204;218;225;230;301;302;309;315;318;322;401;402;404;406;412;415;416;417;419;423;424;425;428;431;SalaAlbastra;SalaTurcoaz;SalaVerde;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 2, 3, 5);

-- Joi pe bara
insert into free_rooms (actual_rooms, id_par, id_zi, id_ora) values
("213;216;313;108;114;118;204;225;230;302;402;410;415;416;419;425;431;SalaAlbastra;SalaRosie;SalaTurcoaz;SalaDeLectura", 2, 4, 1),
("213;216;313;114;125;204;225;230;302;318;412;415;419;431;SalaAlbastra;SalaTurcoaz;SalaDeLectura", 2, 4, 2),
("213;216;313;114;125;204;225;230;322;410;415;416;419;423;431;SalaTurcoaz;SalaVerde;SalaDeLectura", 2, 4, 3),
("213;216;223;313;101;108;112;114;118;122;123;201;204;225;230;301;302;309;318;322;415;419;423;424;425;SalaRosie;SalaDeLectura;SalaSportivaNr1", 2, 4, 4),
("213;214;215;216;223;224;311;313;314;101;108;112;114;115;118;122;123;125;201;204;218;225;230;301;302;309;315;318;322;401;402;404;406;412;415;417;419;423;424;425;428;431;SalaRosie;SalaTurcoaz;SalaVerde;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 2, 4, 5);

-- Vineri pe bara
insert into free_rooms (actual_rooms, id_par, id_zi, id_ora) values
("213;216;223;313;101;108;112;114;122;201;204;225;230;301;302;309;315;318;322;401;406;415;416;425;SalaAlbastra;SalaRosie;SalaDeLectura;SalaSportivaNr2", 2, 5, 1),
("213;214;216;313;114;123;201;204;225;230;309;315;318;406;415;419;SalaDeLectura;SalaSportivaNr2", 2, 5, 2),
("213;216;311;313;114;118;123;201;204;218;225;230;315;322;402;406;410;415;428;431;SalaRosie;SalaTurcoaz;SalaVerde;SalaDeLectura;SalaSportivaNr2", 2, 5, 3),
("213;214;215;216;223;224;311;313;314;101;108;112;114;115;118;122;123;125;201;204;218;225;230;301;302;309;318;322;401;402;404;406;410;412;415;416;417;419;423;424;425;428;431;SalaAlbastra;SalaVerde;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 2, 5, 4),
("213;214;215;216;223;224;311;313;314;101;108;112;114;115;118;122;123;125;201;204;218;225;230;301;302;309;315;318;322;401;402;404;406;410;412;415;416;417;419;423;424;425;428;431;SalaAlbastra;SalaRosie;SalaTurcoaz;SalaVerde;SalaDeLectura;SalaSportivaNr1;SalaSportivaNr2", 2, 5, 5);