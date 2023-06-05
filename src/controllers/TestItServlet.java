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

        List<MyCard> mycard = em.createNamedQuery("getItCard", MyCard.class).getResultList();

        // リストの要素をランダムに並び替える
        Collections.shuffle(mycard);

        request.setAttribute("mycard", mycard);

        String randomCard1 = mycard.get(5).getWord();
        System.out.println("ランダムカード"+randomCard1);
        String randomCard2 = mycard.get(6).getWord();
        System.out.println("ランダムカード"+randomCard2);
        String randomCard3 = mycard.get(7).getWord();

        System.out.println("ランダムカード"+randomCard1);
        System.out.println("ランダムカード"+randomCard2);
        System.out.println("ランダムカード"+randomCard3);

        // requestに属性を設定する
        request.setAttribute("randomCard1", randomCard1);
        request.setAttribute("randomCard2", randomCard2);
        request.setAttribute("randomCard3", randomCard3);

        em.close();
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/mycard/test.jsp");
        rd.forward(request, response);
    }


}