<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>





<head>
    <meta charset="UTF-8">
    <title>Connexion à MySQL via JSP</title>
</head>
<body>
    <form action="Select_BDD.jsp" method="GET">
        <div>
          <label for="annee">Choisir année de film</label>
          <input type="number" name="number" id="annee"/>
        </div>
    <h1>Exemple de connexion à MySQL via JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "mysql";
    String password = "mysql";

        // Charger le pilote JDBC
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
        Connection conn = DriverManager.getConnection(url, user, password);


        if(isset($_GET['annee'])){
            $sql = "SELECT idFilm, titre, année FROM Film where année = '".$_GET['annee']."'";
            $result = mysql_query($sql);
            }

        // Afficher les résultats (à adapter selon vos besoins)
        while (result.next()) {
            String colonne1 = result.getString("idFilm");
            String colonne2 = result.getString("titre");
            String colonne3 = result.getString("année");
            // Faites ce que vous voulez avec les données...
            //Exemple d'affichage de 2 colonnes
            out.println("Colonne 1 : " + colonne1 + ", Colonne 2 : " + colonne2 + ",  Colonne 3 : " + colonne3 +" </br>");
        }

        // Fermer les ressources 
        rs.close();
        pstmt.close();
        conn.close();
    
    %>
</body>
</html>
