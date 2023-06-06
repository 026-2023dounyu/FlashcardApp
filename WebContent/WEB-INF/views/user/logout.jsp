<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ログアウト</title>
</head>
<body>
    <h1>ログアウトしますか？</h1>
    <form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="hidden" name="_token" value="${_token}">
        <button type="submit">ログアウト</button>
    </form>
</body>
</html>
