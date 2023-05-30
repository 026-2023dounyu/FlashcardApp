package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;

@WebServlet("/newAccount")
public class NewAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public NewAccountServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // CSRF対策
        request.setAttribute("_token", request.getSession().getId());

        // おまじないとしてのインスタンスを生成
        request.setAttribute("user", new User());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/user/newAccount.jsp");
        rd.forward(request, response);
     }

}
