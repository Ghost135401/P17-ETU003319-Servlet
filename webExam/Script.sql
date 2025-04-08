CREATE TABLE Credit(
	id int primary key auto_increment,
	libele varchar(300),
	montant int,
	DateDebut Date,
	DateFin Date
);

CREATE TABLE Depense(
	id int primary key auto_increment,
	libele varchar(300),
	montant int,
	DateDebut Date,
	DateFin Date
);

insert into Credit(libele,montant,DateDebut,DateFin) values ("frais bus",20000,"2025-01-12","2025-02-12");
insert into Credit(libele,montant,DateDebut,DateFin) values ("Sakafo",50000,"2025-01-12","2025-02-12");
insert into Credit(libele,montant,DateDebut,DateFin) values ("Gouter",40000,"2025-01-12","2025-02-12");

insert into Depense(libele,montant,DateDebut,DateFin) values ("frais bus",10000,"2025-01-12","2025-02-12");
insert into Depense(libele,montant,DateDebut,DateFin) values ("Sakafo",20000,"2025-01-12","2025-02-12");
insert into Depense(libele,montant,DateDebut,DateFin) values ("Gouter",20000,"2025-01-12","2025-02-12");