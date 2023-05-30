<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <%---------------------------------ここまでテンプレ------------------------------- --%>

        <h2>ログイン画面</h2>

        <form action="./login" method="post">
            <div>
                <label>ユーザーID</label> <input type="number" name="id">
            </div>
            <div>
                <label>パスワード</label> <input type="password" name="password">
            </div>
            <div>
                <input type="hidden" name="_token" value="${_token}" />
                <input type="submit" value="ログイン">
            </div>
        </form>

        <p>
            <a href="${pageContext.request.contextPath}/newAccount">ユーザー登録</a>
        </p>


    </c:param>
</c:import>