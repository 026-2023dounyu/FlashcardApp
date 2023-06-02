<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>みんなの単語帳</h2>
        <ul>
            <c:forEach var="sharecard" items="${sharecard}">

                <h3>・ビジネス</h3>
                <c:if test="${sharecard.type == 'ビジネス'}">
                    <li><c:out value="${sharecard.id}" />
                    ：<c:out value="${sharecard.word}" />&gt;
                      <c:out value="${sharecard.mean}" />&gt;
                      <c:out value="${sharecard.created_at}" />&gt;
                      <c:out value="${sharecard.name}" />&gt;
                    </li>
                </c:if>

            </c:forEach>
        </ul>

        <p>
            <a href="${pageContext.request.contextPath}/new">新規メッセージの投稿</a>
        </p>

    </c:param>
</c:import>