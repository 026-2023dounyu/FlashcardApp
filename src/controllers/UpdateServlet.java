package controllers;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.MyCard;
import models.ShareCard;
import utils.DBUtil;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            // セッションスコープからメッセージのIDを取得して
            // 該当のIDのメッセージ1件のみをデータベースから取得
            MyCard my = em.find(MyCard.class, (Integer)(request.getSession().getAttribute("mycard_id")));

            // フォームの内容を各フィールドに上書き
            String type = request.getParameter("type");
            my.setType(type);

            String word = request.getParameter("word");
            my.setWord(word);

            String mean = request.getParameter("mean");
            my.setMean(mean);

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            my.setUpdated_at(currentTime);       // 更新日時のみ上書き

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
                share.setName("ログイン情報からとってくるユーザー名");

                em.persist(share);
            }

            // データベースを更新
            em.getTransaction().begin();
            em.getTransaction().commit();
            request.getSession().setAttribute("flush", "登録が完了しました。");
            em.close();

            // セッションスコープ上の不要になったデータを削除
            request.getSession().removeAttribute("mycard_id");

            // indexページへリダイレクト
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }
}