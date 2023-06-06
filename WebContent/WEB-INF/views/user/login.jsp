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

</head>
<body>
    <div class="card text-center border-0" style="width: 30rem;">
        <div class="card-header bg-primary text-white">My単語帳　ログイン</div>
        <div class="card-body">
            <form action="./login" method="post">
                <br /> <label>ユーザーID</label> <input type="number" name="id">
                <br />
                <br /> <label>パスワード</label> <input type="password" name="password">
                <br />
                <br /> <input type="hidden" name="_token" value="${_token}" />
                <button type="submit" class="btn btn-primary btn-sm">ログイン</button>
            </form>
            <p>
                <a href="${pageContext.request.contextPath}/newAccount">新規ユーザー登録</a>
            </p>
        </div>
    </div>

</body>
</html>