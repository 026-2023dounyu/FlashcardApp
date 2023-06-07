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
 * Servlet implementation class FlashServlet
 */
@WebServlet("/flashOthers")
public class FlashOthersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlashOthersServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        List<MyCard> mycard = em.createNamedQuery("getOthersCard", MyCard.class).getResultList();

        // リストの要素をランダムに並び替える
        Collections.shuffle(mycard);

        request.setAttribute("mycard", mycard);

        em.close();
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/mycard/flashcard.jsp");
        rd.forward(request, response);
    }


}