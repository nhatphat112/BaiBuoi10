<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Users" %>
<%@ page import="java.util.Collections" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <meta charset="utf-8">
    <title>TODO</title>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">


    <body>
    <%


        String message = (String) request.getAttribute("message");
        Users user = (Users) request.getAttribute("user");
        if(message==null){
           message ="";
        }

        ArrayList <Users> listUser = (ArrayList<Users>) session.getAttribute("listUser");
        if(listUser==null) listUser = new ArrayList<Users>();
        if(user!=null) {

            listUser.add(user);

            session.setAttribute("listUser", listUser);
        }
            for(int i =0;i<listUser.size()-1;i++) {
                for (int j = i + 1; j < listUser.size(); j++) {
                    Users userI = listUser.get(i);
                    Users userJ = listUser.get(j);
                    if(userI!=null &&userJ!=null){
                        if (userI.getCount()>userJ.getCount()){
                            Collections.swap(listUser,i,j);
                        }
                        else if(userI.getUsername().equals(userJ.getUsername())&&userI.getCount()==userJ.getCount()){
                            listUser.remove(userJ);
                        }
                    }

                }
            }


    %>
    <div class="container">
        <div style="text-align: center; margin-top: 10%"><b>Well Come To TODO</b></div>
        <h4><%=message%></h4>

        <form action="login" method="get">

            <div class="mb-3">
                <label for="idUsername" class="form-label">Username</label>
                <input type="text" class="form-control" id="idUsername" name="username" required>
            </div>
            <button type="submit" class="btn btn-primary">BEGIN</button>
        </form>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">UserName</th>
                <th scope="col">Count</th>

            </tr>
            </thead>
        <%
            int count = 0;
            if(listUser!=null){
                System.out.println(listUser.size());

                for(Users users : listUser){

                    if(users!=null){
                        count++;

                    %>



            <tbody>
            <tr>
                <th scope="row"><%=count%></th>
                <td><%=users.getUsername()%></td>
                <td><%=users.getCount()%></td>
            </tr>
            <% }%>



                    <%
                }
                %>
        <%
            }

        %>
            </tbody>
        </table>
    </div>
</body>
</html>
