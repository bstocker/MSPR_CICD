<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>

<?php

include "connection.php";

if(isset($_GET['annee'])){
$sql = "SELECT idFilm, titre, année FROM Film where année = '".$_GET['annee']."'";
$result = mysql_query($sql);
}

?>

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
    String url = "jdbc:mysql://localhost:3306/films";
    String user = "root";
    String password = "root";

        // Charger le pilote JDBC
        Class.forName("com.mysql.jdbc.Driver");

        // Établir la connexion
        Connection conn = DriverManager.getConnection(url, user, password);

        // Exemple de requête SQL
        String sql = "SELECT idFilm, titre, année FROM Film where année > 2000 ";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        // Afficher les résultats (à adapter selon vos besoins)
        while (rs.next()) {
            String colonne1 = rs.getString("idFilm");
            String colonne2 = rs.getString("titre");
            String colonne3 = rs.getString("année");
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
