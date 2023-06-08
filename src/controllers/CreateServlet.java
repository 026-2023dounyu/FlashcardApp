package controllers;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.MyCard;
import models.ShareCard;
import utils.DBUtil;

@WebServlet("/create")
public class CreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CreateServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();
            em.getTransaction().begin();

            MyCard my = new MyCard();

            String type = request.getParameter("type");
            my.setType(type);

            String word = request.getParameter("word");
            my.setWord(word);

            String mean = request.getParameter("mean");
            my.setMean(mean);

            HttpSession userInfoSession = request.getSession();
            String loginName = (String) userInfoSession.getAttribute("name");
            my.setName(loginName);

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            my.setCreated_at(currentTime);
            my.setUpdated_at(currentTime);

            Integer understand = 0;
            my.setUnderstand(understand);

            /*
             * 押されたボタンによって
             * ・mycardテーブルのunderstand(理解度)を変更
             */
            if ("2".equals(request.getParameter("understand"))) {
                my.setUnderstand(2);
            } else if ("1".equals(request.getParameter("understand"))) {
                my.setUnderstand(1);
            } else if ("0".equals(request.getParameter("understand"))) {
                my.setUnderstand(0);
            } else {
                System.out.println("エラー：理解度が選択されていません。");
            }


            Integer shareFlag = 0;
            my.setShare(shareFlag);

            /*
             * 共有ボタンが押されたら
             * ・mycardテーブルのshareを1に変更
             * ・この単語の情報をsharecardテーブルに追加
             */
            if(request.getParameter("share") != null) {
                shareFlag = 1;
                my.setShare(shareFlag);

                ShareCard share = new ShareCard();

                share.setType(type);
                share.setWord(word);

                share.setMean(mean);
                share.setCreated_at(currentTime);
                share.setName(loginName);
                System.out.println(loginName);

                em.persist(share);

                em.persist(my);
                em.getTransaction().commit();
                request.getSession().setAttribute("flush", "登録が完了しました。");
                em.close();
            }

            response.sendRedirect(request.getContextPath() + "/index");        }
    }

}