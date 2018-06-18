-- autoriser l'utilisateur root sur les serveurs Web à se connecter sur la base de données
grant all privileges on *.* to root@192.0.2.1 identified by "vitrygtr";
grant all privileges on *.* to root@192.0.2.2 identified by "vitrygtr";

-- créer une base de données nommée "app"
create database app;

-- sélectionner cette base de données pour la suite
use app;

-- créer une table nommée "message" avec trois colonnes :
-- id : un entier servant d'identifiant du message (Ex: 42)
-- heure : l'heure à laquelle le message a été posté (Ex: 12:39)
-- msg : le message (Ex: "Coucou tout le monde")
create table messages (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, heure VARCHAR(30) NOT NULL, msg VARCHAR(100) NOT NULL);

-- Ajouter une premier message d'accueil
INSERT INTO messages(id, heure, msg) VALUES ('', '00:00', 'Bienvenue dans l\'app');
