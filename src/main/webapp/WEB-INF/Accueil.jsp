<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.keita.beans.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>La page d'accueil</title>
<link rel="stylesheet" href="/TPJAVA/accueil.css">
</head>
<body>
<%-- <h2 class="bienvenu">Bienvenue ${ user.nom } ${ user.prenom }</h2> --%>
<h2 class="bienvenu">Bienvenue ${ user.pseudo }</h2>
<div class="form">

	<!--<c:if test="${ !empty nom }"><p><c:out value="Bonjour, vous vous appelez ${ nom }"/></p></c:if>-->
	<table>
	<caption><h2>La liste des utilisateurs</h2></caption>
    <tr>
    	<th>Nom</th>
    	<th>Prénom</th>
    	<th>Email</th>
    	<th>Pseudo</th>
    </tr>
   <%
   HttpSession ses=request.getSession();
   	List<Users> users = (List)ses.getAttribute("liste");
   	
   	for(Users user : users){
   %>
   <tr>
	   	<td><% out.print(user.getNom());%></td>
	    <td><% out.print(user.getPrenom());%></td>
	    <td><% out.print(user.getEmail());%></td>
	    <td><% out.print(user.getPseudo());%></td>
	   <%} %>
	   
   </tr>
   </table>
      
	<form method="post" action="connexion">			
		<p><input type="submit" value="Deconnecter"></p>
	</form>
	
	</div>
</body>

</html>