<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/TPJAVA/login.css">
</head>
<body>
	<div>
	<form method="post" action="connexion">
	<legend><h2>Veuillez vous connecter !</h2></legend>
		<p class="input"><label for="pseudo">PSEUDO</label><input type="text" name="pseudo" id="pseudo"></p>
		<p class="input"><label for="pass">MOT DE PASSE</label><input type="password" name="pass" id="pass"></p>		
		<p class="input"><input type="submit" value="CONNEXION"></p>
		</form>
	</div>
</body>
</html>