<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <br><br><br>
    <div class="text-center">
    <h2 class="fw-bolder">ログアウトしますか？</h2><br>
    <button onclick="location.href='${pageContext.request.contextPath}/login'" class="btn btn-secondary">ログアウト</button><br><br>
    <p><a href="${pageContext.request.contextPath}/index">My単語一覧に戻る</a></p>
    </div>
    </c:param>
</c:import>