package Controller;

import Model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

@WebServlet(name = "loginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        Users user = (Users) req.getAttribute("user");
        // random 1 so max 1000
        String url = "/index.jsp";
        user = new Users(username);
        Random generator = new Random();
        int value = generator.nextInt((1000 - 1) + 1) + 1;
        System.out.println(value);
        user.setRandomValue(value);
        url ="/play.jsp";
        // create session
        HttpSession session = req.getSession();
        ArrayList <Users> listUser = (ArrayList<Users>) session.getAttribute("listUser");
        if(listUser==null){
            System.out.println("List null, creator");
            listUser = new ArrayList<Users>();
        }
        session.setAttribute("listUser",listUser);
//
//
//
//
//        }
//        if(user!=null){
//            url ="/play";
//        }
        req.setAttribute("user",user);
        req.getRequestDispatcher(url).forward(req,resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
