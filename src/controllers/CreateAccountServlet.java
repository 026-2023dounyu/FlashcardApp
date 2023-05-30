package controllers;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.DBUtil;

@WebServlet("/createAccount")
public class CreateAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CreateAccountServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {

            EntityManager em = DBUtil.createEntityManager();
            em.getTransaction().begin();

            User user = new User();

            String id_str = request.getParameter("id");
            Integer id = Integer.valueOf(id_str);
            user.setId(id);

            String name = request.getParameter("name");
            user.setName(name);

            String password = request.getParameter("password");
            user.setPassword(password);

            user.setLogin(0);

            //SQLを実行したいときは実行結果をListに格納する
            List<User> searchId = em.createNamedQuery("searchSameId", User.class).setParameter("id", id).getResultList();
            if (searchId.size() == 0) {
                //UserクラスのオブジェクトをDBにセーブ
                em.persist(user);
            }else {
                System.out.println("既に登録されたユーザーIDです");
            }


            em.getTransaction().commit();
            em.close();

            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

}