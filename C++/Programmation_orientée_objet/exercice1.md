# Atelier C++ Programmation Orientée Objet 
## Exercice 1 
**Soit la classe abstraite Employe caractérisée par attributs suivants :**  
• Matricule  
• Nom  
• Prénom  
• Date de naissance  
**La classe Employé doit disposer des méthodes suivantes :**  
* Un constructeur d’initialisation 
* Des propriétés pour les différents attributs 
* La méthode ToString() 
* Une méthode abstraite GetSalaire() 
**Un ouvrier est un employé qui se caractérise par sa date d’entrée à la société.**  
• Tous les ouvriers ont une valeur commune appelée SMIG=2500 DH  
• L’ouvrier a un salaire mensuel qui est : Salaire = SMIG + (Ancienneté en 
année)*100.  
• De plus, le salaire ne doit pas dépasser SMIG*2.  
**Un cadre est un employé qui se caractérise par un indice.**  
• Le cadre a un salaire qui dépend de son indice :  
o 1 : salaire mensuel 13000 DH  
o 2 : salaire mensuel 15000 DH  
o 3 : salaire mensuel 17000 DH  
o 4 : salaire mensuel 20000 DH  
**Un patron est un employé qui se caractérise par un chiffre d’affaire et un  pourcentage.**
• Le chiffre d’affaire est commun entre les patrons.  
• Le patron a un salaire annuel qui est égal à x% du chiffre d'affaire : Salaire = 
CA*pourcentage/100  
## Travail à faire:  
1. Créer la classe abstraite Employé.  
2. Créer la classe Ouvrier, la classe Cadre et la classe Patron qui héritent de la classe Employé, et prévoir les Constructeurs et la méthode ToString de chacune des 3 classes.   
3. Implémenter la méthode GetSalaire() qui permet de calculer le salaire pour chacune des classes.    