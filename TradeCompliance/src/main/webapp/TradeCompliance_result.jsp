<%@ page session="true" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>Worldly Wonders</title>
  <style>
    body {
      background-color: #f5f5f5;
      font-family: Arial, sans-serif;
    }

    h1 {
      text-align: center;
      margin-top: 50px;
      font-size: 50px;
      font-weight: bold;
      color: #333;
    }

    .form-container {
      max-width: 600px;
      margin: 0 auto;
      text-align: center;
    }

    form {
      background-color: #fff;
      padding: 40px;
      box-shadow: 0 0 10px #ddd;
      border-radius: 10px;
    }

    input[type="text"],
    select {
      width: 100%;
      padding: 20px;
      font-size: 18px;
      margin-bottom: 20px;
      border: none;
      border-bottom: 2px solid #ddd;
      border-radius: 5px;
      transition: all 0.3s;
    }

    input[type="text"]:focus,
    select:focus {
      border-bottom: 2px solid #ff5733;
    }

    label {
      font-weight: bold;
      margin-bottom: 10px;
      display: block;
    }

    button[type="submit"] {
      width: 100%;
      padding: 20px;
      background-color: #ff5733;
      color: #fff;
      border: none;
      border-radius: 30px;
      font-size: 18px;
      font-weight: bold;
      transition: all 0.3s;
    }

    button[type="submit"]:hover {
      background-color: #fff;
      color: #ff5733;
      box-shadow: 0 0 10px #ff5733;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>
        <%
            String title = (String)session.getAttribute("title");
            String cod = (String)session.getAttribute("cod");
            String documents = (String)session.getAttribute("documents");
            String product_message="";
            boolean isRestricted = (Boolean)session.getAttribute("isRestricted");
            if(isRestricted)
            {
                product_message=title + " is <span style='color:red'>RESTRICTED</span> for import into " + cod;

            }
            else
                product_message=title + " is <span style='color:green'>NOT RESTRICTED</span> for import into " + cod;
        %>
        <%=product_message%>
    </h2>
    <br>
    <% if(isRestricted) {%>
    <p>
        You may be able to import <%=title%> into <%=cod%> with the following documents<br><br>
        <%=documents%>
    </p>
    <%}%>
  </div>
</body>
</html>
