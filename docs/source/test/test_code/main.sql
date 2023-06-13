-- Création de la table Utilisateurs
CREATE TABLE Utilisateurs (
    id INT PRIMARY KEY,
    nom VARCHAR(50),
    age INT
);

-- Insertion de quelques enregistrements
INSERT INTO Utilisateurs (id, nom, age) VALUES (1, 'Alice', 25);
INSERT INTO Utilisateurs (id, nom, age) VALUES (2, 'Bob', 30);
INSERT INTO Utilisateurs (id, nom, age) VALUES (3, 'Charlie', 35);

-- Sélection de tous les utilisateurs
SELECT * FROM Utilisateurs;

