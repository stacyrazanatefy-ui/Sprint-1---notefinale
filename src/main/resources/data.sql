-- ============================================
-- Création de la base de données et insertion des données
-- ============================================

-- Table candidat
CREATE TABLE candidat (
    id BIGSERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

-- Table matiere
CREATE TABLE matiere (
    id BIGSERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

-- Table correcteur
CREATE TABLE correcteur (
    id BIGSERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

-- Table operateur
CREATE TABLE operateur (
    id BIGSERIAL PRIMARY KEY,
    operateur VARCHAR(10) NOT NULL
);

-- Table resolution
CREATE TABLE resolution (
    id BIGSERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

-- Table parametre
CREATE TABLE parametre (
    id BIGSERIAL PRIMARY KEY,
    idmatiere BIGINT NOT NULL,
    diff NUMERIC(10,2),
    idoperateur BIGINT NOT NULL,
    idresolution BIGINT NOT NULL,
    CONSTRAINT fk_parametre_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(id) ON DELETE CASCADE,
    CONSTRAINT fk_parametre_operateur FOREIGN KEY (idoperateur) REFERENCES operateur(id) ON DELETE CASCADE,
    CONSTRAINT fk_parametre_resolution FOREIGN KEY (idresolution) REFERENCES resolution(id) ON DELETE CASCADE
);

-- Table note
CREATE TABLE note (
    id BIGSERIAL PRIMARY KEY,
    note NUMERIC(10,2) NOT NULL,
    idcandidat BIGINT NOT NULL,
    idmatiere BIGINT NOT NULL,
    idcorrecteur BIGINT NOT NULL,
    CONSTRAINT fk_note_candidat FOREIGN KEY (idcandidat) REFERENCES candidat(id) ON DELETE CASCADE,
    CONSTRAINT fk_note_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(id) ON DELETE CASCADE,
    CONSTRAINT fk_note_correcteur FOREIGN KEY (idcorrecteur) REFERENCES correcteur(id) ON DELETE CASCADE
);

-- ============================================
-- Insertion des données de test
-- ============================================

-- Insertion des candidats
INSERT INTO candidat (nom) VALUES ('Candidat1');
INSERT INTO candidat (nom) VALUES ('Candidat2');

-- Insertion des matières
INSERT INTO matiere (nom) VALUES ('JAVA');
INSERT INTO matiere (nom) VALUES ('PHP');

-- Insertion des correcteurs
INSERT INTO correcteur (nom) VALUES ('Correcteur1');
INSERT INTO correcteur (nom) VALUES ('Correcteur2');
INSERT INTO correcteur (nom) VALUES ('Correcteur3');

-- Insertion des résolutions
INSERT INTO resolution (nom) VALUES ('Petit');
INSERT INTO resolution (nom) VALUES ('Grand');
INSERT INTO resolution (nom) VALUES ('Moyenne');

-- Insertion des opérateurs
INSERT INTO operateur (operateur) VALUES ('<');
INSERT INTO operateur (operateur) VALUES ('<=');
INSERT INTO operateur (operateur) VALUES ('>');
INSERT INTO operateur (operateur) VALUES ('>=');

-- Insertion des paramètres pour JAVA
-- JAVA avec opérateur > et résolution Grand, seuil 7
INSERT INTO parametre (idmatiere, diff, idoperateur, idresolution) 
VALUES (1, '7', 3, 2);

INSERT INTO parametre (idmatiere, diff, idoperateur, idresolution) 
VALUES (1, '7', 4, 3);

-- JAVA avec opérateur < et résolution Petit, seuil 2
INSERT INTO parametre (idmatiere, diff, idoperateur, idresolution) 
VALUES (1, '2', 1, 1);

INSERT INTO parametre (idmatiere, diff, idoperateur, idresolution) 
VALUES (1, '2', 2, 2);

-- Insertion des paramètres pour PHP
-- PHP avec opérateur < et résolution Petit, seuil 2
INSERT INTO parametre (idmatiere, diff, idoperateur, idresolution) 
VALUES (2, '2', 1, 1);

INSERT INTO parametre (idmatiere, diff, idoperateur, idresolution) 
VALUES (2, '2', 3, 2);

-- Insertion des notes pour Candidat1
-- Candidat1 - JAVA avec Correcteur1
INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (15, 1, 1, 1);

INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (10, 1, 1, 2);

INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (12, 1, 1, 3);

-- Candidat1 - JAVA avec Correcteur2
INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (9, 1, 1, 2);

-- Candidat1 - PHP avec Correcteur1
INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (8, 1, 2, 1);

INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (11, 1, 2, 3);

-- Candidat1 - PHP avec Correcteur2
INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (10, 1, 2, 1);

INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (10, 1, 2, 2);

-- Insertion des notes pour Candidat2
-- Candidat2 - JAVA avec Correcteur2
INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (13, 2, 1, 2);

INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (11, 2, 1, 3);

-- Candidat2 - PHP avec Correcteur1
INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (14, 2, 2, 1);

-- Candidat2 - PHP avec Correcteur2
INSERT INTO note (note, idcandidat, idmatiere, idcorrecteur) 
VALUES (16, 2, 2, 2);
