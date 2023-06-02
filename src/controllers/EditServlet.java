package controllers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.MyCard;
import utils.DBUtil;

@WebServlet("/edit")
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        // 該当のIDのメッセージ1件のみをデータベースから取得
        MyCard my = em.find(MyCard.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        // 単語情報とセッションIDをリクエストスコープに登録
        request.setAttribute("mycard", my);
        request.setAttribute("_token", request.getSession().getId());

        // 単語IDをセッションスコープに登録
        if(my != null) {
            request.getSession().setAttribute("mycard_id", my.getId());
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/mycard/edit.jsp");
        rd.forward(request, response);
    }
}