<!DOCTYPE html>
<html lang="en" xml:lang="en">
<head>
  <title>Sample Application JSP Page</title>
</head>
<body bgcolor="white">
  <table border="1">
    <caption>Sample Table Description: A table illustrating the structure of a JSP page</caption>
    <tr>
      <th colspan="2" bgcolor="#dddddd" id="header1">Header 1</th>
    </tr>
    <tr>
      <th id="imageHeader">Image</th>
      <th id="descriptionHeader">Description</th>
    </tr>
    <tr>
      <td align="center">
        <img src="images/tomcat.gif" alt="Tomcat Logo - Hello World">
      </td>
      <td>
        <h1>Sample Application JSP Page</h1>
        This is the output of a JSP page that is part of the Hello, World application.
      </td>
    </tr>
    <tr>
      <th colspan="2" bgcolor="#dddddd" id="header2">Header 2</th>
    </tr>
  </table>
  <%= new String("Hello!") %>
</body>
</html>
