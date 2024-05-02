CREATE TABLE Enseignantt(
   matricule VARCHAR(50) CONSTRAINT PK_Enseignantt PRIMARY KEY,
   NomEnseignant VARCHAR(50),
   PrenomEnseignant VARCHAR(50),
   Discipline VARCHAR(50),
   Genre CHAR,
   Email VARCHAR(80),
   Tel VARCHAR(50)
);

CREATE TABLE Specialite(
   CodeSpec VARCHAR(50) CONSTRAINT PK_Specialite PRIMARY KEY,
   Intitule VARCHAR(50)
   
);

CREATE TABLE Niveau(
   CodeNiveau VARCHAR(50) CONSTRAINT PK_Niveau PRIMARY KEY ,
   Libelle VARCHAR(50),
   CodeSpec VARCHAR(50) ,
   CONSTRAINT FK_Niveau_Specialite FOREIGN KEY(CodeSpec) REFERENCES Specialite(CodeSpec)
);

CREATE TABLE GroupeTD(
   CodeGroupe VARCHAR(50) CONSTRAINT PK_GroupeTD PRIMARY KEY
   
);

CREATE TABLE AnneeUniversitaire(
   AU VARCHAR(100) CONSTRAINT PK_AnneeUniversitaire PRIMARY KEY 
);
CREATE TABLE Etudiant(
   NumInscription VARCHAR(50) CONSTRAINT PK_Etudiant PRIMARY KEY ,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Genre CHAR,
   DateNaissance DATE,
   Email VARCHAR(80),
   Tel VARCHAR(50),
   Adresse VARCHAR(100)
);

CREATE TABLE Matière(
   CodeMatière VARCHAR(10) CONSTRAINT PK_Matière PRIMARY KEY,
   Libelle VARCHAR(100),
   VolumeHorraire NUMBER(4,2),
   Coefficient NUMBER(4,2),
   matricule VARCHAR(50),
   CONSTRAINT FK_Matière_Enseignantt FOREIGN KEY(matricule) REFERENCES Enseignantt(matricule)
);

CREATE TABLE Semestre(
   CodeSemestre VARCHAR(50) CONSTRAINT PK_Semestre PRIMARY KEY,
   LibelleSemestre VARCHAR(50),
   DateDebut DATE,
   DateFin DATE,
   AU VARCHAR(50),
   CONSTRAINT FK_Semestre_AnneeUniversitaire FOREIGN KEY(AU) REFERENCES AnneeUniversitaire(AU)
);

CREATE TABLE SessionExamen(
   CodeSession VARCHAR(50) CONSTRAINT PK_SessionExamen PRIMARY KEY,
   LibelleSession VARCHAR(50),
   CodeSemestre VARCHAR(50) ,
   CONSTRAINT FK_SessionExamen_Semestre FOREIGN KEY(CodeSemestre) REFERENCES Semestre(CodeSemestre)
);

CREATE TABLE Epreuve(
   CodeEpreuve VARCHAR(50) CONSTRAINT PK_Epreuve PRIMARY KEY,
   DateEpreuve DATE,
   CreneauHorraire VARCHAR(50),
   CodeMatière VARCHAR(10) ,
   CodeSession VARCHAR(50),
   CONSTRAINT FK_Epreuve_Matière FOREIGN KEY(CodeMatière) REFERENCES Matière(CodeMatière),
   CONSTRAINT FK_Epreuve_SessionExamen FOREIGN KEY(CodeSession) REFERENCES SessionExamen(CodeSession)
);

CREATE TABLE Ensegnement(
   CodeGroupe VARCHAR(50),
   CodeMatière VARCHAR(10),
   CodeSemestre VARCHAR(50),
   CreneauHorraire VARCHAR(50),
   Jour VARCHAR(50),
   Salle VARCHAR(10),
   CONSTRAINT PK_Ensegnement PRIMARY KEY(CodeGroupe, CodeMatière, CodeSemestre),
   CONSTRAINT FK_Ensegnement_GroupeTD FOREIGN KEY(CodeGroupe) REFERENCES GroupeTD(CodeGroupe),
   CONSTRAINT FK_Ensegnement_Matière FOREIGN KEY(CodeMatière) REFERENCES Matière(CodeMatière),
   CONSTRAINT FK_Ensegnement_Semestre FOREIGN KEY(CodeSemestre) REFERENCES Semestre(CodeSemestre)
);

CREATE TABLE InscriptionN(
   CodeNiveau VARCHAR(50) CONSTRAINT PK_InscriptionN PRIMARY KEY,
   AU VARCHAR(50),
   NbreEtudiant NUMBER (3),
   CONSTRAINT FK_InscriN_Niveau FOREIGN KEY(CodeNiveau) REFERENCES Niveau(CodeNiveau),
   CONSTRAINT FK_InscriN_AnnU FOREIGN KEY(AU) REFERENCES AnneeUniversitaire(AU)
);

CREATE TABLE Evaluation(
   CodeEpreuve VARCHAR(50),
   NumInscription VARCHAR(50),
   Note NUMBER(4,2),
   CONSTRAINT PK_Evaluation PRIMARY KEY(CodeEpreuve, NumInscription),
   CONSTRAINT FK_Evaluation_Epreuve FOREIGN KEY(CodeEpreuve) REFERENCES Epreuve(CodeEpreuve),
   CONSTRAINT FK_Evaluation_Etudiant FOREIGN KEY(NumInscription) REFERENCES Etudiant(NumInscription)
);

CREATE TABLE CompositionGroupe(
   CodeNiveau VARCHAR(50),
   CodeGroupe VARCHAR(50),
   AU VARCHAR(50),
   nbrsEtudGRP NUMBER(3),
   CONSTRAINT PK_CompoGroupe PRIMARY KEY(CodeNiveau, AU,CodeGroupe ),
   CONSTRAINT FK_CompoGroupe_Niveau FOREIGN KEY(CodeNiveau) REFERENCES Niveau(CodeNiveau),
   CONSTRAINT FK_CompoGroupe_GoupeTD FOREIGN KEY(CodeGroupe) REFERENCES GroupeTD(CodeGroupe),
   CONSTRAINT FK_CompoGroupe_AnnUniver FOREIGN KEY(AU) REFERENCES AnneeUniversitaire(AU)
);

CREATE TABLE InscriptionE(
   CodeGroupe VARCHAR(50),
   AU VARCHAR(50),
   NumInscription VARCHAR(50),
   CONSTRAINT PK_InscriptionE PRIMARY KEY(CodeGroupe, AU, NumInscription),
   CONSTRAINT FK_InscriE_GoupeTD FOREIGN KEY(CodeGroupe) REFERENCES GroupeTD(CodeGroupe),
   CONSTRAINT FK_InscriE_AnnUniver FOREIGN KEY(AU) REFERENCES AnneeUniversitaire(AU),
   CONSTRAINT FK_InscriE_Etudiant FOREIGN KEY(NumInscription) REFERENCES Etudiant(NumInscription)
);

ALTER TABLE AnneeUniversitaire ADD CONSTRAINT CHK_AU CHECK ( AU LIKE '___-___');

ALTER TABLE Etudiant ADD CONSTRAINT CHK_email CHECK ( email LIKE REPLACE(Nom,' ','')||'.'||REPLACE(Prenom,' ','')||'@insat.ucar.tn');
ALTER TABLE Enseignantt ADD CONSTRAINT CHK_emailE CHECK ( email LIKE REPLACE(NomEnseignant,' ','')||'.'||REPLACE(PrenomEnseignant,' ','')||'@insat.ucar.tn');

ALTER TABLE Niveau MODIFY CodeSpec CONSTRAINT NN_CodeSpec NOT NULL ;
ALTER TABLE Semestre MODIFY AU CONSTRAINT NN_AU NOT NULL ;
ALTER TABLE SessionExamen MODIFY CodeSemestre CONSTRAINT NN_CodeSemestre NOT NULL ;
ALTER TABLE Epreuve MODIFY CodeSession CONSTRAINT NN_CodeSession NOT NULL ;
ALTER TABLE Epreuve MODIFY CodeMatière CONSTRAINT NN_CodeMatière NOT NULL ;
ALTER TABLE CompositionGroupe MODIFY CodeNiveau CONSTRAINT NN_CodeNiveau NOT NULL ;
ALTER TABLE CompositionGroupe MODIFY AU CONSTRAINT NN_AU2 NOT NULL ;
ALTER TABLE CompositionGroupe MODIFY CodeGroupe CONSTRAINT NN_CodeGroupe NOT NULL ;
ALTER TABLE InscriptionN MODIFY CodeNiveau CONSTRAINT NN_CodeNiveau2 NOT NULL ;
ALTER TABLE InscriptionE MODIFY AU CONSTRAINT NN_AU3 NOT NULL ;
ALTER TABLE InscriptionE MODIFY CodeGroupe CONSTRAINT NN_CodeGroupe1 NOT NULL ;
ALTER TABLE InscriptionE MODIFY NumInscription CONSTRAINT NN_NumInscription NOT NULL ;
ALTER TABLE Ensegnement MODIFY CodeGroupe CONSTRAINT NN_CodeGroupe2 NOT NULL ;
ALTER TABLE Ensegnement MODIFY CodeSemestre CONSTRAINT NN_CodeSemestre1 NOT NULL ;
ALTER TABLE Ensegnement MODIFY CodeMatière CONSTRAINT NN_CodeMatière1 NOT NULL ;
ALTER TABLE Evaluation MODIFY NumInscription CONSTRAINT NN_NumInscription1 NOT NULL ;
ALTER TABLE Evaluation MODIFY CodeEpreuve CONSTRAINT NN_CodeEpreuve NOT NULL ;

ALTER TABLE Epreuve ADD CONSTRAINT CHK_CreneauHorraire CHECK ( CreneauHorraire LIKE '_h__-__h_');

ALTER TABLE Evaluation ADD CONSTRAINT CHK_Note CHECK ( Note BETWEEN 0 AND 20);

ALTER TABLE Semestre ADD CONSTRAINT CHK_LibelleSemestre CHECK ( LibelleSemestre LIKE 'Semestre1' OR LibelleSemestre LIKE 'Semestre2');

CREATE SEQUENCE SQ_CodeEpreuve 
START WITH  1
INCREMENT BY 1;


INSERT INTO AnneeUniversitaire VALUES('2022-2023');
INSERT INTO AnneeUniversitaire VALUES('2023-2024');

INSERT INTO GroupeTD VALUES ('IIA3-1');
INSERT INTO GroupeTD VALUES ('IIA3-2');
INSERT INTO GroupeTD VALUES ('IIA4-1');
INSERT INTO GroupeTD VALUES ('IIA4-2');
INSERT INTO GroupeTD VALUES ('GL3-1');
INSERT INTO GroupeTD VALUES ('GL3-2');
INSERT INTO GroupeTD VALUES ('GL4-1');
INSERT INTO GroupeTD VALUES ('GL4-2');

INSERT INTO Semestre VALUES ('1','Semestre1',TO_DATE('01/09/2023','DD/MM/YYYY'),TO_DATE('01/01/2024','DD/MM/YYYY'),'2023-2024');
INSERT INTO Semestre VALUES ('2','Semestre2',TO_DATE('01/01/2024','DD/MM/YYYY'),TO_DATE('29/05/2024','DD/MM/YYYY'),'2023-2024');

INSERT INTO Etudiant VALUES ('41000','hafsia','ghassen','m',TO_DATE('06/10/2002','DD/MM/YYYY'),'hafsia.ghassen@insat.ucar.tn','27596637','cite olympique');

INSERT INTO InscriptionE VALUES ('IIA3/2','2023-2024','42000');

INSERT INTO Etudiant VALUES ('21017','halfaoui','med tej','m',TO_DATE('12/11/2002','DD/MM/YYYY'),'halfaoui.medtej@insat.ucar.tn','5439','geant');
INSERT INTO Etudiant VALUES ('21018','azzabi','khalil','m',TO_DATE('05/01/2000','DD/MM/YYYY'),'azzabi.khalil@insat.ucar.tn','948','mourouj3');
INSERT INTO Etudiant VALUES ('21019','jelassi','yassine','m',TO_DATE('05/05/2006','DD/MM/YYYY'),'jelassi.yassine@insat.ucar.tn','929','mourouj3');



INSERT INTO CompositionGroupe (CodeNiveau, AU, CodeGroupe, nbrsEtudGRP) VALUES ('IIA3','2023-2024','IIA3-2',29);
INSERT INTO CompositionGroupe (CodeNiveau, AU, CodeGroupe, nbrsEtudGRP) VALUES ('IIA4','2023-2024','IIA4-1',35);
INSERT INTO CompositionGroupe (CodeNiveau, AU, CodeGroupe, nbrsEtudGRP) VALUES ('IIA4','2023-2024','IIA4-2',34);
INSERT INTO CompositionGroupe (CodeNiveau, AU, CodeGroupe, nbrsEtudGRP) VALUES ('IIA3', '2023-2024', 'IIA3-1', 31);

--a
select count(g.codeGroupe), n.codeNiveau, s.codeSpec 
from compositionGroupe c, groupeTd g, specialite s, niveau n 
where n.codeSpec = s.codeSpec and n.codeNiveau = c.codeNiveau and c.codegroupe = g.codegroupe
group by s.codeSpec, n.codeNiveau;

--b
select e.*, g.codeGroupe, n.codeNiveau
from etudiant e, groupeTD g, niveau n, inscriptione ie, compositiongroupe c
where e.numinscription=ie.numinscription and ie.codegroupe=g.codegroupe 
and g.codegroupe=c.codegroupe and c.codeniveau=n.codeniveau; 

--c
select m.libelle
from matière m
where m.matricule like '0000000006';

--d
select m.codematière, e1.jour
from ensegnement e1, ensegnement e2, matière m
where e1.jour=e2.jour and m.codematière=e1.codematière and m.codematière=e2.codematière
order by e1.jour asc; 

--e
select e.matricule
from enseignantt e
where e.matricule not in (select m.matricule from matière m); 

--f
select g.codegroupe
from groupetd g, compositiongroupe c
where c.nbrsetudgrp = (select max(c.nbrsetudgrp) from compositiongroupe c) and c.au like '2022-2023'; 

--g 
--select e.*
--from etudiant e, specialite s
--where s.codespec like 'MPI' and 

--h
select e.*, m.*
from enseignantt e, matière m 
where e.matricule=m.matricule; 

--i
select e.*
from enseignantt e
where (select count(*) from matière m where e.matricule=m.matricule) >= 2;

--j
select m.*, e.jour, e.codesemestre
from matière m, (select n.* from niveau n where n.codeNiveau like 'IIA 3'), compositionGroupe c, ensegnement e
where n.codeNiveau=c.codeNiveau and c.codeGroupe=e.codegroupe and e.codematière=m.codematière

--k 
select 