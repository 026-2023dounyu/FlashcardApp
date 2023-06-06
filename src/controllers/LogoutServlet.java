package controllers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import utils.DBUtil;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LogoutServlet() {
        super();
    }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            // CSRF対策
            request.setAttribute("_token", request.getSession().getId());

            // おまじないとしてのインスタンスを生成
            request.setAttribute("user", new User());

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/user/logout.jsp");
            rd.forward(request, response);
         }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {

            EntityManager em = DBUtil.createEntityManager();
            em.getTransaction().begin();

            HttpSession userInfoSession = request.getSession();
            Integer id = (Integer) userInfoSession.getAttribute("id");

            //ログ会う炉したユーザーのloginを更新
            User logoutUser = em.find(User.class, id);
            logoutUser.setLogin(0);
            em.persist(logoutUser);

            //ユーザー情報をセッションから削除
            userInfoSession.removeAttribute("userInfo");
            response.sendRedirect(request.getContextPath() + "/login");
            System.out.println("ログアウト完了");

            em.getTransaction().commit();
            em.close();

        }
    }


}