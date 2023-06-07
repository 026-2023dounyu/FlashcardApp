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

import models.MyCard;
import models.ShareCard;
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

        // 単語情報とセッションIDをリクエストスコープに登録
        request.setAttribute("mycard", my);
        request.setAttribute("_token", request.getSession().getId());

        // 単語IDをセッションスコープに登録
        if(my != null) {
            request.getSession().setAttribute("mycard_id", my.getId());
        }

        HttpSession userInfoSession = request.getSession();
        String name = (String)userInfoSession.getAttribute("name");

        List<ShareCard> getShareCard = em.createNamedQuery("getShareCard", ShareCard.class).setParameter("name", name).setParameter("word", my.getWord()).setParameter("mean", my.getMean()).getResultList();
        if(!getShareCard.isEmpty()) {
            ShareCard shareCard = getShareCard.get(0);
            Integer shareCardId = shareCard.getId();
            ShareCard share = em.find(ShareCard.class, shareCardId);

            request.setAttribute("sharecard", share);
            request.setAttribute("_token", request.getSession().getId());

            if(share != null) {
                request.getSession().setAttribute("sharecard_id", share.getId());
            }

        }else {
            System.out.println("sharecardテーブルに一致するデータがない");
        }


        em.close();
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/mycard/edit.jsp");
        rd.forward(request, response);
    }
}