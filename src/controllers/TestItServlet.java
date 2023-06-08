package controllers;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.MyCard;
import utils.DBUtil;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/testIt")
public class TestItServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestItServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        List<MyCard> mycard = em.createNamedQuery("getItTest", MyCard.class).getResultList();

        // リストの要素をランダムに並び替える
        Collections.shuffle(mycard);

        if (mycard.size() < 8) {
            String errorMessage = "登録単語数が不十分です";
            request.setAttribute("errorMessage", errorMessage);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/mycard/testHome.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("mycard", mycard);

            String randomCard1 = mycard.get(5).getWord();
            String randomCard2 = mycard.get(6).getWord();
            String randomCard3 = mycard.get(7).getWord();

            // requestに属性を設定する
            request.setAttribute("randomCard1", randomCard1);
            request.setAttribute("randomCard2", randomCard2);
            request.setAttribute("randomCard3", randomCard3);
        }

        em.close();
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/mycard/test.jsp");
        rd.forward(request, response);
    }
}