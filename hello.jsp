<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sample Application JSP Page</title>
</head>
<body bgcolor="white">

<table border="1">
  <caption>Description of the Table</caption>
  <tr>
    <th align="center">Logo</th>
    <th>Page Title</th>
  </tr>
  <tr>
    <td align="center">
      <img src="images/tomcat.gif" alt="Tomcat Logo">
    </td>
    <td>
      <h1>Sample Application JSP Page</h1>
      This is the output of a JSP page that is part of the Hello, World application.
    </td>
  </tr>
</table>

<%= new String("Hello!") %>

</body>
</html>
