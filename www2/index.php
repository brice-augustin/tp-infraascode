<?php
//======================
// Cédric Peston
// IUT de Créteil-Vitry
// 02/2018
//======================
	try {
		/* Connexion au serveur de bases de données avec les bons identifiants */
		$db = new PDO('mysql:host=192.0.2.3;dbname=app;charset=utf8', 'root', 'vitrygtr');
	}

	catch(Exception $e) {
		/* En cas d'erreur, on affiche un message et on arrête tout*/
		die('Erreur : '.$e->getMessage());
	}

	/* Si l'utilisateur a posté un message dans son navigateur */
	if (!empty($_POST)) {

		/* L'heure actuelle */
		$heure = date("H:i");

		/* Le message posté par l'utilisateur */
		$msg = $_POST['msg'];

		/* Si le message n'est pas vide */
		if ($msg != "") {
			/* Préparation de la requête SQL pour ajouter une nouvelle
			entrée dans la table nommée "messages" */
			$req = "INSERT INTO messages VALUES ('', '" . $heure . "', '" . $msg . "')";

			try {
				/* Envoi de la requête SQL au serveur de BdD */
				$resp = $db->query($req);
			}

			catch(Exception $e) {
				// En cas d'erreur, on affiche un message et on arrête tout
				die('Erreur : '.$e->getMessage());
			}
		}
	}
?>

<!doctype html>

<html>
	<head>
		<title>Microblogging</title>
		<meta charset="utf-8" />
	</head>

	<body>
		<form method=post action=index.php>
			<input name=msg type=text>
			<button type=submit>Envoyer</button>
		</form>

	</body>

</html>

<?php
	/* Préparation de la requête SQL pour récupérer
  	tout le contenu de la table "messages" */
	$req = "SELECT * FROM messages ORDER BY id DESC";
	try {
		/* Envoi de la requête SQL au serveur de BdD */
		$resp = $db->query($req);
	}

	catch(Exception $e) {
		// En cas d'erreur, on affiche un message et on arrête tout
		die('Erreur : '.$e->getMessage());
	}

	/* Pour chaque ligne de la table "messages" */
	while ($data = $resp->fetch()) {
	/* ... afficher l'heure et le message */
		echo $data['heure'] . ' : ' . $data['msg'] . '<br/>';
	}

	$resp->closeCursor();
?>
