package com.keita.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.keita.beans.Users;


public class MonservletJsp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MonservletJsp() {
        super();
        
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		Users user = (Users) session.getAttribute("user");
		if(user == null) {
		this.getServletContext().getRequestDispatcher("/WEB-INF/Inscrire.jsp").forward(request, response);
		}else {
			this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nom = request.getParameter("nom");//recupere la valeur du champ(input) qui a le name nom
		String prenom = request.getParameter("prenom");
		String pseudo = request.getParameter("pseudo");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String cpass = request.getParameter("cpass");
		
		HttpSession session=request.getSession();
		List<Users> liste=(List)session.getAttribute("liste");
		if(liste==null) {
			liste= new ArrayList();
		}
		
	if(nom.trim().equals("") || prenom.trim().equals("") || pseudo.trim().equals("") || email.trim().equals("") || cpass.trim().equals("") ) {		
		request.setAttribute("erreur", "Veuillez remplir tout les champs");
		this.getServletContext().getRequestDispatcher("/WEB-INF/Inscrire.jsp").forward(request, response);
	}else {
		if(!pass.equals(cpass)) {
			request.setAttribute("erreur", "Vos mot de passe ne se correspondent pas");
			this.getServletContext().getRequestDispatcher("/WEB-INF/Inscrire.jsp").forward(request, response);
		}else {
			for(Users u:liste) {
				if(pseudo.equals(u.getPseudo()) || email.equals(u.getEmail())) {
					request.setAttribute("erreur", "cet utilisateur existe déjà");
					this.getServletContext().getRequestDispatcher("/WEB-INF/Inscrire.jsp").forward(request, response);
					break;
				}
			}
		}
	}
	
	request.setAttribute("nom", nom);//Je fais un attribut pour le nom recuperer  dans l'objectif de le recuperer dans mon fichier jsp et le manupiler
	request.setAttribute("prenom", prenom);
	request.setAttribute("pseudo", pseudo);//Je fais un attribut pour le nom recuperer  dans l'objectif de le recuperer dans mon fichier jsp et le manupiler
	request.setAttribute("email", email);
	request.setAttribute("pass", pass);

	Users user = new Users(pseudo, nom, prenom, email, pass);
   
    request.setAttribute("user", user);
    liste.add(user);
    request.setAttribute("liste", liste);
    
    session.setAttribute("liste", liste);
    
    this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
	}

}
