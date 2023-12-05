<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-16">
    <title>Connexion à MySQL via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MySQL via JSP</h1>
    <form method="get" action="Select_BDD.jsp">
    Année: <input type="text" name="year"><br>
    <input type="submit" value="Submit">

</body>
</html>
