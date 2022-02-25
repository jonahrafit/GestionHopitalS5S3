create database hopitaly;
\c hopitaly;

-- tables
create table categoriechambre(
    id serial not null primary key,
    categorie text
);

create table tarifchambre(
    id serial not null primary key,
    idcategorie int,
    tarif decimal,
    daty date default current_date
);
create table hopital(
    id serial primary key not null,
    nomhopital text
);

create table chambre(
    id serial not null primary key,
    numero int,
    idhopital int,
    idcategorie int,
    nombremaxpatient int
);
create table patient(
    id serial not null primary key,
    nom text,
    prenom text,
    sexe text,
    adresse text,
    datenaissance  date
);

create table docteur(
    id serial not null primary key,
    matricule text,
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

create table patientchambre (
    id serial not null primary key,
    idpatient int,
    idchambre int,
    daty date default current_date
);

create table patienttraitement (
    id serial not null primary key,
    idpatient int,
    datedebut date,
    datefin date
);

create table patientmaladie (
    id serial not null primary key,
    idpatient int,
    idmaladie int,
    daty date default current_date
);

create table traitementdocteurpatient (
    id serial not null primary key,
    iddocteur int,
    idpatient int,
    daty date default current_date
);

alter table patienttraitement
    add  foreign key(idpatient) references patient(id);
alter table patientmaladie
    add  foreign key(idpatient) references patient(id);
alter table patientchambre
    add foreign key(idpatient) references patient(id),
    add foreign key(idchambre) references Chambre(id);

alter table traitementdocteurpatient
    add foreign key(idpatient) references patient(id),
    add foreign key(iddocteur) references docteur(id);
alter table patientmaladie
    add foreign key(idpatient) references patient(id),
    add foreign key(idmaladie) references maladie(id);
alter table patienttraitement
    add foreign key(idpatient) references patient(id);

alter table salairegrade
    add foreign key (idgrade) references grade(id);

alter table gradedocteur 
    add foreign key (iddocteur) references docteur(id),
    add  foreign key (idgrade) references grade(id);

alter table chambre
    add foreign key(idhopital) references hopital(id),
    add foreign key(idcategorie) references categoriechambre(id) ;
alter table tarifchambre
    add foreign key(idcategorie) references categoriechambre(id);





insert into hopital (nomhopital)values('nomHopital');

insert into categoriechambre (categorie)values('Categorie1');
insert into categoriechambre (categorie)values('Categorie2');

insert into tarifchambre (idcategorie,tarif,daty) values (1,100000);
insert into tarifchambre (idcategorie,tarif,daty) values (2,200000);


insert into chambre (numero,idhopital,idcategorie,nombremaxpatient) values(1,1,1,3);
insert into chambre (numero,idhopital,idcategorie,nombremaxpatient) values(2,1,2,5);
insert into chambre (numero,idhopital,idcategorie,nombremaxpatient) values(3,1,1,2);

insert into maladie (nommaladie) values('Covid_19');
insert into maladie (nommaladie) values('Paludisme');
insert into maladie (nommaladie) values('Diabete');
insert into maladie (nommaladie) values('Cancer');
insert into maladie (nommaladie) values('Grippe');

insert into patient(nom,prenom,sexe,adresse,datenaissance) values('Rabearimanana','Hariniaina','masculin','Ambatobe','2002-06-08');
insert into patient(nom,prenom,sexe,adresse,datenaissance) values('Rakoto','Faly','masculin','Andoharanofotsy','2008-09-17');
insert into patient(nom,prenom,sexe,adresse,datenaissance) values('Rabary','Fifaliana','feminin','Itaosy','1994-10-22');
insert into patient(nom,prenom,sexe,adresse,datenaissance) values('Nambinina','Itokiana','masculin','Mahajanga','1996-11-03');
insert into patient(nom,prenom,sexe,adresse,datenaissance) values('Andriamanalinarivo','Ilo','feminin','Antananarivo','2003-02-28');

insert into docteur (matricule,nom,prenom,sexe) values ('Dokotera0012','Rakoto','Andrianina','masculin');
insert into docteur (matricule,nom,prenom,sexe) values ('Dokotera0059','Rabenoely','Mino','feminin');
insert into docteur (matricule,nom,prenom,sexe) values ('Dokotera0126','Akjea','Ando','masculin');
insert into docteur (matricule,nom,prenom,sexe) values ('Dokotera0017','Hafaliana','Dera','feminin');

insert into grade (grade) values('medecin generaliste');
insert into grade (grade) values('specialiste');
insert into grade (grade) values('professeur');

insert into salairegrade (idgrade,salaire) values(1,300000);
insert into salairegrade (idgrade,salaire) values(2,800000);
insert into salairegrade (idgrade,salaire) values(2,1500000);

insert into patientchambre (idpatient,idchambre) values (1,1);
insert into patientchambre (idpatient,idchambre) values (2,1);
insert into patientchambre (idpatient,idchambre) values (3,2);
insert into patientchambre (idpatient,idchambre) values (4,2);
insert into patientchambre (idpatient,idchambre) values (5,3);

insert into patientmaladie (idpatient,idmaladie) values(1,1);
insert into patientmaladie (idpatient,idmaladie) values(4,1);
insert into patientmaladie (idpatient,idmaladie) values(2,1);
insert into patientmaladie (idpatient,idmaladie) values(3,3);
insert into patientmaladie (idpatient,idmaladie) values(5,5);

insert into traitementdocteurpatient(iddocteur,idpatient) values (1,1);
insert into traitementdocteurpatient(iddocteur,idpatient) values (3,2);
insert into traitementdocteurpatient(iddocteur,idpatient) values (4,3);
insert into traitementdocteurpatient(iddocteur,idpatient) values (2,4);
insert into traitementdocteurpatient(iddocteur,idpatient) values (3,5);


create or replace view _patientChambre_ as ( select patient.id,patient.nom,patient.prenom,patient.sexe,(extract(year from current_date)-extract (year from (datenaissance))) as age, chambre.numero as numero_Chambre from patient join patientchambre on patient.id=patientchambre.idpatient join chambre on patientchambre.idchambre=chambre.numero);


--scipt get date max @patientchambre
--scipt get date max @salairegrade












