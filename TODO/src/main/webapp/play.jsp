<%@ page import="Model.Users" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: peanhatphat
  Date: 15/04/2023
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Play Game</title>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
        <%
            Users user = (Users) request.getAttribute("user");
            String message = (String) request.getAttribute("message");
            if (message==null){
                message ="";
            }
                user.increaseCount();

            if (user==null){
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            }

        %>

    <div class="container">
        <div style="text-align: center"> <h2>Wellcome <%=user.getUsername()%> !</h2>
        </div>
        <form action="play" method="post">

            <div class="mb-3">
                <label for="idValueUser" class="form-label">Please Enter A Number </label>
                <input type="number" class="form-control" id="idValueUser" name="valueUser" required>
            </div>
            <div>
                <input style="display: none" name="username" value="<%=user.getUsername()%>">
                <input style="display: none" name="valueRandom" value="<%=user.getRandomValue()%>">
                <input style="display: none" name="count" value="<%=user.getCount()%>">
            </div>
            <button type="submit" class="btn btn-primary">AGREE</button>
            <div><h2><%=message%></h2></div>
        </form>
    </div>
</body>
</html>
