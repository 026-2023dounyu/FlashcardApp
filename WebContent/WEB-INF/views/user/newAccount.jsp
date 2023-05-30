<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>新規ユーザー登録ページ</h2>

        <form method="POST" action="${pageContext.request.contextPath}/createAccount">
            <c:import url="_accountform.jsp" />
        </form>

        <p><a href="${pageContext.request.contextPath}/login">ログイン画面に戻る</a></p>

    </c:param>
</c:import>