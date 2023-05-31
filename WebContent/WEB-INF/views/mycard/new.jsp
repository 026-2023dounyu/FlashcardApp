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
        <link rel="stylesheet" href="<c:url value='/css/form.css' />">

    </head>
    <body>
        <div class="card border-0" style="width: 40rem;">
            <div class="card-header text-center bg-primary text-white">新しい単語を登録</div>
                <div class="card-body">
                    <form method="POST" action="${pageContext.request.contextPath}/create">
                        <c:import url="_form.jsp" />
                    </form>
                    <p><a href="${pageContext.request.contextPath}/index">単語一覧に戻る</a></p>
           </div>
        </div>
    </body>
</html>