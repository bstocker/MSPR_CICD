<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MySQL via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MySQL via JSP</h1>

    <!-- Formulaire pour saisir l'année -->
    <form method="get" action="">
        <label for="annee">Choisir une année :</label>
        <input type="number" id="annee" name="annee" min="1900" max="2100">
        <input type="submit" value="Rechercher">
    </form>

    <% 
        try {
            String url = "jdbc:mysql://localhost:3306/films";
            String user = "root";
            String password = "root";

            // Initialisation de l'année par défaut
            int anneeRecherchee = 1900; // Année par défaut

            // Vérifier si une année a été saisie dans le formulaire
            if (request.getParameter("annee") != null) {
                anneeRecherchee = Integer.parseInt(request.getParameter("annee"));
            }

            // Charger le pilote JDBC
            Class.forName("com.mysql.jdbc.Driver");

            // Établir la connexion
            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                // Exemple de requête SQL avec l'année saisie
                String sql = "SELECT idFilm, titre, année FROM Film WHERE année >= ?";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setInt(1, anneeRecherchee); // Utilisation de l'année saisie
                    try (ResultSet rs = pstmt.executeQuery()) {

                        // Afficher les résultats (à adapter selon vos besoins)
                        while (rs.next()) {
                            String colonne1 = rs.getString("idFilm");
                            String colonne2 = rs.getString("titre");
                            String colonne3 = rs.getString("année");
            %>
                            <!-- Exemple d'affichage de 3 colonnes -->
                            <p>Colonne 1 : <%= colonne1 %>, Colonne 2 : <%= colonne2 %>, Colonne 3 : <%= colonne3 %></p>
            <%
                        }
                    }
                }
            }
        } catch (Exception e) {
            // Gérer les exceptions (journalisation, affichage d'un message d'erreur, etc.)
            e.printStackTrace();
            out.println("Erreur : " + e.getMessage());
        }
    %>
</body>
</html>
