package controllers;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // CSRF対策
        request.setAttribute("_token", request.getSession().getId());

        // おまじないとしてのインスタンスを生成
        request.setAttribute("user", new User());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/user/login.jsp");
        rd.forward(request, response);
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

            String password = request.getParameter("password");
            user.setPassword(password);

            //SQLを実行したいときは実行結果をListに格納する
            List<User> searchUser = em.createNamedQuery("searchUser", User.class).setParameter("id", id).setParameter("password", password).getResultList();

            if (searchUser.size() == 0 ) {
                System.out.println("ユーザーID、またはパスワードが違います。");
                response.sendRedirect(request.getContextPath() + "/login");
            }else if(searchUser.size() == 1){

                //ログインしたユーザーのloginを更新
                User loginUser = em.find(User.class, id);
                if(loginUser != null) {
                    loginUser.setLogin(1);
                    em.persist(loginUser);
                    List<User> searchSameId = em.createNamedQuery("searchSameId", User.class).setParameter("id", id).getResultList();
                    HttpSession userInfoSession = request.getSession();
                    User userInfo = searchSameId.get(0);
                    userInfoSession.setAttribute("id", userInfo.getId());
                    userInfoSession.setAttribute("name", userInfo.getName());
                    userInfoSession.setAttribute("login", userInfo.getLogin());

                }else {
                    System.out.println("一致するユーザーIDが見つかりませんでした。");
                }

                response.sendRedirect(request.getContextPath() + "/index");
                System.out.println("ログイン完了");
            }else {
                System.out.println("エラー：アカウントが複数見つかりました。");
                response.sendRedirect(request.getContextPath() + "/login");
            }

            em.getTransaction().commit();
            em.close();

        }
    }


}
