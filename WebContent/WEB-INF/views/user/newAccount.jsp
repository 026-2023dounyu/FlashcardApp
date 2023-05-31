<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>My単語帳</title>

<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
<link rel="stylesheet" href="<c:url value='/css/reset.css' />">
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet" href="<c:url value='/css/login.css' />">
<link rel="stylesheet" href="<c:url value='/css/newAccount.css' />">

</head>
<body>
    <div class="card text-center border-0" style="width: 25rem;">
        <div class="card-header bg-primary text-white">新規ユーザー登録</div>
        <div class="card-body">
            <form method="POST"
                action="${pageContext.request.contextPath}/createAccount">
                <c:import url="_accountform.jsp" />
            </form>
            <p>
                <a href="${pageContext.request.contextPath}/login">ログイン画面に戻る</a>
            </p>
        </div>
    </div>
</body>
</html>