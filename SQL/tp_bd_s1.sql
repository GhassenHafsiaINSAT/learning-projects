CREATE TABLE Specialite(
   codeSpec varchar(50) CONSTRAINT PK_specialite PRIMARY KEY,
   intitule VARCHAR(50)
);

CREATE TABLE Niveau(
    codeNiveau VARCHAR(50) CONSTRAINT PK_niveau PRIMARY KEY, 
    libelle VARCHAR(50), 
    codeSpec varchar(50),
    CONSTRAINT FK_codeSpec FOREIGN KEY(codeSpec) REFERENCES Specialite(codeSpec)
);

CREATE TABLE AnneeUniversitaire( 
    AU VARCHAR(50) CONSTRAINT PK_AU PRIMARY KEY
);

CREATE TABLE GroupeTD(
    codeGroupe VARCHAR(50) CONSTRAINT PK_codeGroupe PRIMARY KEY
); 

CREATE TABLE Etudiant(
    numInsciption VARCHAR(50) CONSTRAINT PK_numInscription Primary key, 
    nom varchar(50), 
    prenom varchar(50), 
    genre char, 
    dateNaissance DATE, 
    email varchar(50), 
    tel varchar(50), 
    adresse varchar(100)
); 

CREATE TABLE Semestre (
    CodeSemestre varchar(50) constraint PK_semestre PRIMARY KEY,
    LibelleSemestre varchar(50),
    DateDebut DATE, 
    DateFin DATE, 
    AU varchar(50), 
    CONSTRAINT FK_AU_semestre foreign key (AU) references AnneeUniversitaire(AU)
); 

CREATE TABLE Enseignant (
    matricule varchar(50) constraint pk_matricule primary key, 
    nomEnseignant varchar(50),
    prenomEnseignant varchar(50), 
    discipline varchar(50),
    genre char, 
    email varchar(50), 
    tel varchar(50)
);

CREATE TABLE matiere (
    codeMatiere varchar(50) constraint pk_matiere primary key, 
    libelle varchar(100),
    volumeHoraire number(4,2), 
    coefficient number(4,2), 
    matricule varchar(50),
    constraint FK_matricule foreign key (matricule) references Enseignant(matricule)
);

CREATE TABLE SessionExamen (
    codeSession varchar(50) constraint pk_examen primary key, 
    libelleSession varchar(50),
    codeSemestre varchar(50), 
    constraint FK_codeSemestre_SessionEx foreign key (codeSemestre) references Semestre(codeSemestre) 
);

CREATE TABLE Epreuve (
    codeEpreuve varchar(50) constraint pk_epreuve primary key, 
    dateEpreuve date,
    crenauHoraire varchar(50),
    codeSession varchar(50), 
    constraint FK_codeSession foreign key (codeSession) references SessionExamen(codeSession), 
    codeMatiere varchar(50),
    constraint FK_codeMatiere foreign key (codeMatiere) references Matiere(codeMatiere)
);

CREATE table CompositionGroupe(
    codeNiveau varchar(50),
    AU varchar(50), 
    codeGroupe varchar(50), 
    constraint PK_codeNiveau_codeGroupe_AU primary key(codeNiveau,AU,codeGroupe), 
    constraint FK_codeNiveau foreign key(codeNiveau) references Niveau(codeNiveau),
    constraint FK_AU_CompGr foreign key(AU) references AnneeUniversitaire(AU), 
    constraint FK_codeGroupe foreign key(codeGroupe) references GroupeTD(codeGroupe), 
    nbreEtudGrp number(3)
); 

CREATE table InscriptionNiveau(
    codeNiveau varchar(50),
    AU varchar(50), 
    constraint PK_codeNiveau_AU primary key(codeNiveau,AU), 
    constraint FK_niveau foreign key(codeNiveau) references Niveau(codeNiveau),
    constraint FK_AU_InscriNiv foreign key(AU) references AnneeUniversitaire(AU), 
    nbreEtudiant number(3)    
);

CREATE table InsciptionEtudiant(
    AU varchar(50), 
    codeGroupe varchar(50), 
    numInscription varchar(50),
    constraint PK_numInscri_codeGr_AU primary key(AU,codeGroupe,numInscription), 
    constraint FK_AU_InscriEtud foreign key(AU) references AnneeUniversitaire(AU), 
    constraint FK_groupe_InscriEtud foreign key(codeGroupe) references GroupeTD(codeGroupe), 
    constraint FK_numInscription_InscriEtud foreign key(numInscription) references etudiant(numInsciption)   
); 

CREATE table Enseignement(
    codeGroupe varchar(50),
    codeSemestre varchar(50),
    codeMatiere varchar(50),
    jour varchar(50), 
    salle varchar(10),
    constraint PK_codeMatiere_codeGroupe_AU primary key(codeGroupe,codeSemestre,codeMatiere), 
    constraint FK_codeSemestre_Enseignement foreign key(codeSemestre) references Semestre(codeSemestre), 
    constraint FK_groupe_enseignement foreign key(codeGroupe) references GroupeTD(codeGroupe), 
    constraint FK_matiere foreign key(codeMatiere) references matiere(codeMatiere),
    crenauHoraire varchar(50)

); 

create table Evaluation(
    numInsciption VARCHAR(50),
    codeEpreuve varchar(50),
    constraint PK_numInscription_codeEpreuve primary key(numInsciption,codeEpreuve),
    constraint FK_numInscription_Evaluation foreign key(numInsciption) references Etudiant(numInsciption), 
    constraint FK_codeEpreuve foreign key(codeEpreuve) references Epreuve(codeEpreuve), 
    note number(4,2)
);



