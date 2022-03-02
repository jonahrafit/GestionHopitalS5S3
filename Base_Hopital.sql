create database hopitaly;
\c hopitaly;

-- tables
create table categoriechambre(
    id serial not null primary key,
    categorie text,
    nombrelit int
);

create table tarifchambre(
    id serial not null primary key,
    idcategorie int,
    tarif decimal,
    daty date default current_date
);

create table chambre(
    id serial not null primary key,
    numero int,
    idcategorie int
);
create table patient(
    id serial not null primary key,
    nom text,
    prenom text,
    sexe text,
    datenaissance  date
);

create table docteur(
    id serial not null primary key,
    immatriculation text,
    nom text,
    prenom text,
    sexe text
);
create table grade(
    id serial not null primary key,
    grade text
);
create table gradedocteur(
    id serial not null primary key,
    iddocteur int,
    idgrade int,
    daty date
);

create table salairegrade(
    id serial not null primary key,
    idgrade int,
    salaire int,
    daty date  default current_date
);

create table maladie(
    id serial not null primary key,
    nommaladie text
);
--namboarina zao
create table fichepatient(
     id serial not null primary key,
     idpatient int,
     adresse int,
     dateentree datetime
);
create table payment(
     id serial not null primary key,
     idfichepatient int,
     montant decimal,
     daty datetime
);
create table tauxprestation(
     id serial not null primary key,
     idgrade int,
     tauxprestation decimal,
     daty date
);
create table sejourpatient(
     datedebut date,
     datefin  date default null
);
--zay 
create table patientchambre (
    id serial not null primary key,
    idfichepatient int,
    idchambre int,
    dateentreechambre date,
    datesortiechambre date default null
);

create table maladiepatient  (
    id serial not null primary key,
    idfichepatient int,
    idmaladie int,
    daty date default current_date
);

create table traitementpatientdocteur (
    id serial not null primary key,
    idfichepatient int,
    iddocteur int,
    daty date default current_date
);

alter table patientchambre
    add foreign key(idfichepatient) references fichepatient(id),
    add foreign key(idchambre) references Chambre(id);

alter table maladiepatient
    add foreign key(idfichepatient) references fichepatient(id),
    add foreign key(idmaladie) references maladie(id);
alter table traitementpatientdocteur
    add foreign key(idfichepatient) references fichepatient(id),
    add foreign key(iddocteur) references docteur(id);

alter table gradedocteur 
    add foreign key (iddocteur) references docteur(id),
    add  foreign key (idgrade) references grade(id);

alter table chambre
    add foreign key(idcategorie) references categoriechambre(id) ;
alter table payment
    add foreign key(idfichepatient) references fichepatient(id) ;
alter table tarifchambre
add foreign key(idcategorie) references categoriechambre(id);
alter table fichepatient
add foreign key (idpatient) references patient(id);


insert into categoriechambre (categorie,nombrelit)values('A',1);
insert into categoriechambre (categorie,nombrelit)values('B',2);
insert into categoriechambre (categorie,nombrelit)values('C',4);

insert into tarifchambre (idcategorie,tarif,daty) values (1,300000);
insert into tarifchambre (idcategorie,tarif,daty) values (2,100000);
insert into tarifchambre (idcategorie,tarif,daty) values (3,50000);


insert into chambre (numero,idcategorie) values(1,1);
insert into chambre (numero,idcategorie) values(2,2);
insert into chambre (numero,idcategorie) values(3,1);

insert into patient(nom,prenom,sexe,datenaissance) values('Rabearimanana','Hariniaina','masculin','2002-06-08');
insert into patient(nom,prenom,sexe,datenaissance) values('Rakoto','Faly','masculin','2008-09-17');
insert into patient(nom,prenom,sexe,datenaissance) values('Rabary','Fifaliana','feminin','1994-10-22');
insert into patient(nom,prenom,sexe,datenaissance) values('Nambinina','Itokiana','masculin','1996-11-03');
insert into patient(nom,prenom,sexe,datenaissance) values('Andriamanalinarivo','Ilo','feminin','2003-02-28');

insert into docteur (immatriculation,nom,prenom,sexe) values ('Dokotera0012','Rakoto','Andrianina','masculin');
insert into docteur (immatriculation,nom,prenom,sexe) values ('Dokotera0059','Rabenoely','Mino','feminin');
insert into docteur (immatriculation,nom,prenom,sexe) values ('Dokotera0126','Akjea','Ando','masculin');
insert into docteur (immatriculation,nom,prenom,sexe) values ('Dokotera0017','Hafaliana','Dera','feminin');

insert into grade (grade) values('medecin generaliste');
insert into grade (grade) values('specialiste');
insert into grade (grade) values('professeur');

insert into gradedocteur (iddocteur,idgrade,daty) values(1,1,'2021-04-17');
insert into gradedocteur (iddocteur,idgrade,daty) values(2,1,'2004-4-5');
insert into gradedocteur (iddocteur,idgrade,daty) values(3,2,'2012-11-04');
insert into gradedocteur (iddocteur,idgrade,daty) values(4,3,'2022-02-23');
insert into gradedocteur (iddocteur,idgrade,daty) values(5,3,'2008-05-06');

insert into salairegrade (idgrade,salaire) values(1,300000);
insert into salairegrade (idgrade,salaire) values(2,800000);
insert into salairegrade (idgrade,salaire) values(2,1500000);

insert into maladie (nommaladie) values('Covid_19');
insert into maladie (nommaladie) values('Paludisme');
insert into maladie (nommaladie) values('Diabete');
insert into maladie (nommaladie) values('Cancer');
insert into maladie (nommaladie) values('Grippe');

insert into fichepatient(idpatient,adresse,dateentree) values(1,'Ambatobe','2021-03-13');
insert into fichepatient(idpatient,adresse,dateentree) values(2,'Andoharanofotsy','2021-08-30');
insert into fichepatient(idpatient,adresse,dateentree) values(3,'Itaosy','2021-8-01');
insert into fichepatient(idpatient,adresse,dateentree) values(4,'Mahajanga','2021-10-06');
insert into fichepatient(idpatient,adresse,dateentree) values(5,'Antananarivo','2021-01-17');

insert into payment(idfichepatient,montant,daty) values (1,200000,'2021-03-13');
insert into payment(idfichepatient,montant,daty) values (2,200000,'2021-08-30');
insert into payment(idfichepatient,montant,daty) values (3,200000,'2021-8-01');
insert into payment(idfichepatient,montant,daty) values (4,200000,'2021-10-06');
insert into payment(idfichepatient,montant,daty) values (5,200000,'2021-01-17');

insert into sejourpatient(datedebut) values (5,200000,'2021-01-17');

insert into patientchambre (idfichepatient,idchambre,dateentreechambre) values (1,1,'2021-03-13');
insert into patientchambre (idfichepatient,idchambre,dateentreechambre) values (2,1,'2021-08-30');
insert into patientchambre (idfichepatient,idchambre,dateentreechambre) values (3,2,'2021-8-01');
insert into patientchambre (idfichepatient,idchambre,dateentreechambre) values (4,2,'2021-10-06');
insert into patientchambre (idfichepatient,idchambre,dateentreechambre) values (5,3,'2021-01-17');

insert into maladiepatient (idfichepatient,idmaladie) values(1,1);
insert into maladiepatient (idfichepatient,idmaladie) values(4,1);
insert into maladiepatient (idfichepatient,idmaladie) values(2,1);
insert into maladiepatient (idfichepatient,idmaladie) values(3,3);
insert into maladiepatient (idfichepatient,idmaladie) values(5,5);

insert into traitementpatientdocteur(iddocteur,idfichepatient) values (1,1);
insert into traitementpatientdocteur(iddocteur,idfichepatient) values (3,2);
insert into traitementpatientdocteur(iddocteur,idfichepatient) values (4,3);
insert into traitementpatientdocteur(iddocteur,idfichepatient) values (2,4);
insert into traitementpatientdocteur(iddocteur,idfichepatient) values (3,5);


create or replace view _patientChambre_ as ( select patient.id,patient.nom,patient.prenom,patient.sexe,(extract(year from current_date)-extract (year from (datenaissance))) as age, chambre.numero as numero_Chambre from patient join patientchambre on patient.id=patientchambre.idpatient join chambre on patientchambre.idchambre=chambre.numero);


--scipt get date max @patientchambre
--scipt get date max @salairegrade












