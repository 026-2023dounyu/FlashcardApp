<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>単語帳一覧</h2>
        <ul>
            <c:forEach var="mycard" items="${mycard}">
                <li>
                    <a href="${pageContext.request.contextPath}/show?id=${mycard.id}">
                        <c:out value="${mycard.id}" />
                    </a>
                    ：<c:out value="${mycard.type}"></c:out> &gt; <c:out value="${mycard.word}"></c:out> &gt; <c:out value="${mycard.mean}" />
                </li>
            </c:forEach>
        </ul>

        <p><a href="${pageContext.request.contextPath}/new">新規単語の投稿</a></p>

    </c:param>
</c:import>