<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>
    </div>
</c:if>

<c:if test="${errorMessage != null}">
    <div id="flush_error">
        <c:out value="${errorMessage}" />
    </div>
</c:if>

<br/>
<label for="id">ユーザーID</label><br />
<input type="number" name="id" id="id" value="${user.id}" />
<br /><br />

<label for="name">ユーザー名</label><br />
<input type="text" name="name" id="name" value="${user.name}" />
<br /><br />

<label for="password">パスワード</label><br />
<input type="text" name="password" id="password" value="${user.password}" />
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit" class="btn btn-primary btn-sm">登録</button>