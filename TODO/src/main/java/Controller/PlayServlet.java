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
import java.util.Collection;
import java.util.Collections;

@WebServlet(name = "playServlet",urlPatterns = "/play")
public class PlayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = "";
        String url = "";
        int valueUser = Integer.parseInt(req.getParameter("valueUser"));
        String username = req.getParameter("username");
        int count = Integer.parseInt(req.getParameter("count"));
        int valueRandom = Integer.parseInt(req.getParameter("valueRandom"));
        Users user = new Users(username);
        user.setRandomValue(valueRandom);
        user.setCount(count);
        System.out.println(valueRandom);
        String success = "";
        HttpSession session = req.getSession();








                if (valueUser > user.getRandomValue()) {
                    message = "Chua chinh xac ! So phai nho hon " + valueUser;
                    url = "/play.jsp";
                } else if (valueUser < user.getRandomValue()) {
                    message = "Chua chinh xac ! So phai lon hon " + valueUser;
                    url = "/play.jsp";
                } else if (valueUser == user.getRandomValue()) {

                    message = "Chuc mung "+ username+ " da doan dung voi so lan doan la " + user.getCount();
                    url = "/index.jsp";
                    success  = "yes";
                    req.setAttribute("success", success);

                }




//            try {
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        // sap xep list user
//        System.out.println("check size 2"+listUser.size());


        req.setAttribute("user", user);
        req.setAttribute("message", message);
        req.getRequestDispatcher(url).forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
