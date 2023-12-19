<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- Nous chargeons les fichiers CDN de Leaflet. Le CSS AVANT le JS -->
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin="" />
        <style type="text/css">
            #map{ /* la carte DOIT avoir une hauteur sinon elle n'apparaît pas */
                height:750px;
                width: 750px;
            }
        </style>
        <title>Carte</title>
    </head>
    <body>
        <% 
        String url = "jdbc:mariadb://localhost:3306/equipements";
        String user = "mysql";
        String password = "mysql";
    
            // Charger le pilote JDBC
            Class.forName("org.mariadb.jdbc.Driver");
    
            // Établir la connexion
    Connection conn = DriverManager.getConnection(url, user, password);
                // Exemple de requête SQL
            String sql = "SELECT equi_id, equi_libelle, equi_lat, equi_long, get_distance_metres('48.858205', '2.294359', equi_lat, equi_long) AS proximite FROM equipement HAVING proximite < 1000 ORDER BY proximite ASC LIMIT 10;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
    
            // Créer un objet JavaScript pour stocker les données de latitude et de longitude
            out.println("<script type='text/javascript'>");
            out.println("var data = {");
        
            while (rs.next()) {
                String batiment = rs.getString("equi_libelle");
                String latitude = rs.getString("equi_lat");
                String longitude = rs.getString("equi_long");
        
                // Ajouter les données de latitude et de longitude à l'objet JavaScript
                out.println("\"" + batiment + "\": { \"lat\": " + latitude + ", \"lon\": " + longitude + " },");
            }
        
            out.println("};");
            out.println("</script>");
    
            // Fermer les ressources 
            rs.close();
            pstmt.close();
            conn.close();
        %>
    <div id="map">
	    <!-- Ici s'affichera la carte -->
	</div>

        <!-- Fichiers Javascript -->
        <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>
	<script type="text/javascript">
        
            // On initialise la latitude et la longitude de Paris (centre de la carte)
            var lat = 48.852969;
            var lon = 2.349903;
            var macarte = null;
            // Nous initialisons une liste de marqueurs
        
            // Fonction d'initialisation de la carte
            function initMap() {
                // Créer l'objet "macarte" et l'insèrer dans l'élément HTML qui a l'ID "map"
                macarte = L.map('map').setView([lat, lon], 11);
                // Leaflet ne récupère pas les cartes (tiles) sur un serveur par défaut. Nous devons lui préciser où nous souhaitons les récupérer. Ici, openstreetmap.fr
                L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
                    // Il est toujours bien de laisser le lien vers la source des données
                    attribution: 'données © OpenStreetMap/ODbL - rendu OSM France',
                    minZoom: 1,
                    maxZoom: 20
                }).addTo(macarte);
                // Nous parcourons la liste des villes
                for (ville in data) {
                    var marker = L.marker([data[ville].lat, data[ville].lon]).addTo(macarte);
                }              	
            }
            window.onload = function(){
		// Fonction d'initialisation qui s'exécute lorsque le DOM est chargé
		initMap(); 
            };
        </script>
    </body>
</html>

