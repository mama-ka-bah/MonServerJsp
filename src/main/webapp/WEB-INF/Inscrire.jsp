<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>La page d'inscription</title>
<link rel="stylesheet" href="/TPJAVA/inscription.css">
<style type="text/css">
	


</style>

</head>
<body>
		
		<form method="post" action="inscription">
		<legend><h2>Veuillez vous inscrire !</h2></legend>
		<p><label for="nom">NOM</label><input type="text" name="nom" id="nom"></p>
		<p><label for="prenom">PRENOM</label><input type="text" name="prenom" id="prenom"></p>
		<p><label for="pseudo">PSEUDO</label><input type="text" name="pseudo" id="pseudo"></p>
		<p><label for="email">EMAIL</label><input type="email" name="email" id="email"></p>
		<p><label for="pass">MOT DE PASSE</label><input type="password" name="pass" id="pass"></p>
		<p><label for="cpass">CONFIRMER</label><input type="password" name="cpass" id="cpass"></p>
		
		<% if(request.getAttribute("erreur") != null){ %>
			<p class="error"> <%= request.getAttribute("erreur") %></p>
		<%} %>
		<p><input type="submit" value="Envoyer"></p>
		</form>
	
</body>
</html>