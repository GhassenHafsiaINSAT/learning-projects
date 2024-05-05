CREATE TABLE Enseignant(
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

CREATE TABLE Matiere(
   CodeMatiere VARCHAR(10) CONSTRAINT PK_Matiere PRIMARY KEY,
   Libelle VARCHAR(100),
   VolumeHorraire NUMBER(4,2),
   Coefficient NUMBER(4,2),
   matricule VARCHAR(50),
   CONSTRAINT FK_Matiere_Enseignantt FOREIGN KEY(matricule) REFERENCES Enseignantt(matricule)
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
   CreneauHoraire VARCHAR(50),
   CodeMatiere VARCHAR(10) ,
   CodeSession VARCHAR(50),
   CONSTRAINT FK_Epreuve_Matiere FOREIGN KEY(CodeMatiere) REFERENCES Matiere(CodeMatiere),
   CONSTRAINT FK_Epreuve_SessionExamen FOREIGN KEY(CodeSession) REFERENCES SessionExamen(CodeSession)
);

CREATE TABLE Enseignement(
   CodeGroupe VARCHAR(50),
   CodeMatiere VARCHAR(10),
   CodeSemestre VARCHAR(50),
   CreneauHoraire VARCHAR(50),
   Jour VARCHAR(50),
   Salle VARCHAR(10),
   CONSTRAINT PK_Ensegnement PRIMARY KEY(CodeGroupe, CodeMatiere, CodeSemestre),
   CONSTRAINT FK_Ensegnement_GroupeTD FOREIGN KEY(CodeGroupe) REFERENCES GroupeTD(CodeGroupe),
   CONSTRAINT FK_Ensegnement_Matiere FOREIGN KEY(CodeMatiere) REFERENCES Matiere(CodeMatiere),
   CONSTRAINT FK_Ensegnement_Semestre FOREIGN KEY(CodeSemestre) REFERENCES Semestre(CodeSemestre)
);


CREATE TABLE InscriptionNiveau(
   CodeNiveau VARCHAR(50) CONSTRAINT PK_InscriptionN PRIMARY KEY,
   AU VARCHAR(50),
   NbreEtudiant NUMBER (3),
   CONSTRAINT FK_Inscription_Niveau FOREIGN KEY(CodeNiveau) REFERENCES Niveau(CodeNiveau),
   CONSTRAINT FK_Inscription_AnneeUniver FOREIGN KEY(AU) REFERENCES AnneeUniversitaire(AU)
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

CREATE TABLE InscriptionEtudiant(
   CodeGroupe VARCHAR(50),
   AU VARCHAR(50),
   NumInscription VARCHAR(50),
   CONSTRAINT PK_InscriptionEt PRIMARY KEY(CodeGroupe, AU, NumInscription),
   CONSTRAINT FK_InscriEt_GoupeTD FOREIGN KEY(CodeGroupe) REFERENCES GroupeTD(CodeGroupe),
   CONSTRAINT FK_InscriEt_AnnUniver FOREIGN KEY(AU) REFERENCES AnneeUniversitaire(AU),
   CONSTRAINT FK_InscriEt_Etudiant FOREIGN KEY(NumInscription) REFERENCES Etudiant(NumInscription)
);

ALTER TABLE Epreuve ADD CONSTRAINT CHK_CreneauHorraire CHECK ( CreneauHorraire LIKE '_h__-__h_');
ALTER TABLE Evaluation ADD CONSTRAINT CHK_Note CHECK ( Note BETWEEN 0 AND 20);
ALTER TABLE Semestre ADD CONSTRAINT CHK_LibelleSemestre CHECK ( LibelleSemestre LIKE 'Semestre1' OR LibelleSemestre LIKE 'Semestre2');

CREATE SEQUENCE SQ_CodeEpreuve 
START WITH 1
INCREMENT BY 1; 

INSERT INTO Specialite values('iia','iia'); 
INSERT INTO Niveau values('iia2','iia2','iia'); 
INSERT INTO AnneeUniversitaire values('2023-2024'); 
INSERT INTO GoupeTD values('iia 2-1'); 
INSERT INTO Etudiant values('2100','ghassen','ghassen','H',TO_DATE('06-07-2002', 'MM-DD-YYYY'),'ghassen.ghassen@ucar.insat.tn','57888999', 'cite elKhadhra'); 
INSERT INTO Semestre values('1','semestre1','04-09-2023', '05-12-2023','2023-2024'); 
INSERT INTO InscriptionEtudiant values('2023,2024', 'iia 2-1', '2100'); 

SELECT *  
FROM Etudiant 
ORDER BY date_de_naissance DESC; 

SELECT *
FROM Etudiant 
WHERE genre like 'H'; 

SELECT count(*) 
FROM Etudiant
WHERE genre like 'F'; 

SELECT * 
FROM Etudiant 
WHERE adresse is NULL; 

SELECT * 
FROM Etudiant
WHERE date_anniversaire = SYSDATE; 



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
from matière m, (select n.* from niveau n where n.codeNiveau like 'IIA 3') n, compositionGroupe c, ensegnement e
where n.codeNiveau=c.codeNiveau and c.codeGroupe=e.codegroupe and e.codematière=m.codematière; 

--k 
select e.numinscription , count(ep.codeepreuve) as "nombre d'epreuve"
from niveau n, semestre s, anneeuniversitaire a, sessionexamen ss,
    compositionGroupe cg,
    epreuve ep,
    evaluation ev,
    etudiant e
where n.codeniveau like 'IIA 3'
    and s.codesemestre= '2'
    and a.au='2023-2024'
    and ss.libelle = 'DS'
    and e.numinscription=ev.numinscription 
    and ev.codeepreuve=ep.codeepreuve 
    and ep.codesession=ss.codesession
    and ss.codeSemestre=s.codeSemestre
    and s.au=a.au
    and a.au=cg.au
    and cg.codeNiveau=niveau.codeNiveau
group by e.numinscription;

--l
SELECT a.nom, a.numInscription
FROM  Etudiant e, Epreuve ep, Evaluation ev
WHERE   e.numInscription = ev.numInscription
        AND ep.codeEpreuve = ev.codeEpreuve
        AND ep.codeSession NOT IN (SELECT codeSession FROM SessionExamen se, semestre s 
                                        WHERE se.libelleSession LIKE 'DS' 
                                            AND se.codeSemestre = '2'
                                            AND s.au = '2023-2024'
                                            AND s.au = se.au); 
        
        
        
        
        
        
        
        