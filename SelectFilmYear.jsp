<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-16">
    <title>Connexion à MySQL via JSP</title>
</head>
<body>
    <form action = "main.jsp" method = "GET">
    <label for="years">Année :</label>
    <input type="number" id="years" name="years" min="1900" max="2100" />
    <input type = "submit" value = "Submit" />
</form>
</body>
</html>
