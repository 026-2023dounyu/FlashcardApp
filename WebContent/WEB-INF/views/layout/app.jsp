<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>My単語帳</title>

<link rel="stylesheet" href="<c:url value='/css/reset.css' />">
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
<link rel="stylesheet" href="<c:url value='/css/index.css' />">
<link rel="stylesheet" href="<c:url value='/css/style.css' />">

</head>
<body>
    <div id="wrapper">
        <div id="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-light"
                style="background: radial-gradient(circle, rgba(58, 99, 255, 1), rgba(42, 179, 252, 1) 90%);">
                <a class="navbar-brand"
                    href="${pageContext.request.contextPath}/index">My単語帳</a>
                <a><c:out value="${name}" /></a>
                <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link"
                            href="${pageContext.request.contextPath}/index">単語一覧</a>
                        <li class="nav-item"><a class="nav-link"
                            href="${pageContext.request.contextPath}/new">新規単語登録</a></li>
                        <li class="nav-item"><a class="nav-link"
                            href="${pageContext.request.contextPath}/flashcard">単語帳</a></li>
                        <li class="nav-item"><a class="nav-link"
                            href="${pageContext.request.contextPath}/testHome">テスト</a></li>
                        <li class="nav-item"><a class="nav-link"
                            href="${pageContext.request.contextPath}/share">みんなの単語</a></li>
                        <li class="nav-item"><a class="nav-link"
                            href="${pageContext.request.contextPath}/logout">ログアウト</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div id="content">${param.content}</div>
        <div id="footer">by Haruko & Kyoko.</div>
    </div>
    <script src="<c:url value='/js/jquery-3.7.0.slim.min.js' />"></script>
    <script src="<c:url value='/js/bootstrap.bundle.min.js' />"></script>
</body>
</html>