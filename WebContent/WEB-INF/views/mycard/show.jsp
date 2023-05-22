<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">

        <h2>id : ${mycard.id} の単語詳細ページ</h2>

        <table>
            <tbody>
                <tr>
                    <th>単語ジャンル</th>
                    <td><c:out value="${mycard.type}" /></td>
                </tr>

                <tr>
                    <th>単語</th>
                    <td><c:out value="${mycard.word}" /></td>
                </tr>
                <tr>
                    <th>単語の意味</th>
                    <td><c:out value="${mycard.mean}" /></td>
                </tr>
                <tr>
                    <th>作成日時</th>
                    <td><fmt:formatDate value="${mycard.created_at}"
                            pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                    <th>更新日時</th>
                    <td><fmt:formatDate value="${mycard.updated_at}"
                            pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
            </tbody>
        </table>
        <p>
            <a href="${pageContext.request.contextPath}/index">一覧に戻る</a>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/edit?id=${mycard.id}">この単語を編集する</a>
        </p>

    </c:param>
</c:import>