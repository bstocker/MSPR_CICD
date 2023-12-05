<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un nouveau film</title>
</head>
<body>
    <h1>Ajouter un nouveau film</h1>

    <% 
        String url = "jdbc:mariadb://localhost:3306/films";
        String user = "mysql";
        String password = "mysql";

        // Charger le pilote JDBC
        Class.forName("org.mariadb.jdbc.Driver");

        // Vérifier si des données ont été envoyées pour l'ajout d'un nouveau film
        if (request.getParameter("titre") != null && request.getParameter("annee") != null) {
            String nouveauTitre = request.getParameter("titre");
            int nouvelleAnnee = Integer.parseInt(request.getParameter("annee"));

            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                // Requête SQL pour ajouter un nouveau film dans la base de données
                String insertQuery = "INSERT INTO Film (idFilm, titre, année) VALUES (DEFAULT, ?, ?)";
                try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS)) {
                    insertStmt.setString(1, nouveauTitre);
                    insertStmt.setInt(2, nouvelleAnnee);

                    int rowsAffected = insertStmt.executeUpdate();

                    if (rowsAffected > 0) {
                        // Récupérer l'ID généré pour le nouveau film
                        ResultSet generatedKeys = insertStmt.getGeneratedKeys();
                        if (generatedKeys.next()) {
                            int nouveauIdFilm = generatedKeys.getInt(1);
    %>
                            <!-- Afficher un message si l'ajout du film a été effectué -->
                            <p>Le film "<%= nouveauTitre %>" de l'année <%= nouvelleAnnee %> a été ajouté avec succès (ID : <%= nouveauIdFilm %>) !</p>
    <%
                        }
                    } else {
    %>
                        <!-- Afficher un message si l'ajout du film a échoué -->
                        <p>L'ajout du film "<%= nouveauTitre %>" de l'année <%= nouvelleAnnee %> a échoué.</p>
    <%
                    }
                }
            } catch (Exception e) {
                // Gérer les exceptions
                e.printStackTrace();
                out.println("Erreur : " + e.getMessage());
            }
        }
    %>

    <!-- Formulaire pour saisir un nouveau film -->
    <form method="post" action="">
        <label for="titre">Titre du film :</label>
        <input type="text" id="titre" name="titre">
        <label for="annee">Année :</label>
        <input type="number" id="annee" name="annee" min="1900" max="2100">
        <input type="submit" value="Ajouter">
    </form>
</body>
</html>
