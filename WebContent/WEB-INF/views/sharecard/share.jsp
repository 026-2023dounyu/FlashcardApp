<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>みんなの単語帳</h2>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">ジャンル</th>
                    <th scope="col">単語名</th>
                    <th scope="col">意味</th>
                    <th scope="col">作成者</th>
                    <th scope="col">作成日</th>
                    <th scope="col">My単語</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sharecard" items="${sharecard}">
                    <tr>
                        <th scope="row"><c:out value="${sharecard.type}" /></th>
                        <td><c:out value="${sharecard.word}" /></td>
                        <td><c:out value="${sharecard.mean}" /></td>
                        <td><c:out value="${sharecard.name}" /></td>
                        <td><fmt:formatDate value="${sharecard.created_at}"
                                pattern="yyyy-MM-dd" /></td>
                        <td>追加</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:param>
</c:import>