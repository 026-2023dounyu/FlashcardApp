<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>みんなの単語帳</h2>
         <h2 class="fw-bolder">■IT</h2>
        <table class="table">
            <thead>
                <tr>
                <th scope="col">単語名</th>
                    <th scope="col">意味</th>
                    <th scope="col">作成者</th>
                    <th scope="col">作成日</th>
                    <th scope="col">My単語</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sharecard" items="${sharecard}">
                <c:if test="${sharecard.type.equals('IT')}">
                    <tr>
                    <td><c:out value="${sharecard.word}" /></td>
                        <td><c:out value="${sharecard.mean}" /></td>
                        <td><c:out value="${sharecard.name}" /></td>
                        <td><fmt:formatDate value="${sharecard.created_at}"
                                pattern="yyyy-MM-dd" /></td>
                        <td>追加</td>
                    </tr>
                    </c:if>
                </c:forEach>
            </tbody>
             </table><br>

        <h2 class="fw-bolder">■保険</h2>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">単語名</th>
                    <th scope="col">意味</th>
                    <th scope="col">作成者</th>
                    <th scope="col">作成日</th>
                    <th scope="col">My単語</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sharecard" items="${sharecard}">
                <c:if test="${sharecard.type.equals('保険')}">
                        <tr>
                            <td><c:out value="${sharecard.word}" /></td>
                            <td><c:out value="${sharecard.mean}" /></td>
                            <td><c:out value="${sharecard.name}" /></td>
                            <td><fmt:formatDate value="${sharecard.created_at}"
                                    pattern="yyyy-MM-dd" /></td>
                            <td>追加</td>
                        </tr>
                        </c:if>
                </c:forEach>
            </tbody>
        </table><br>

        <h2 class="fw-bolder">■ビジネス</h2>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">単語名</th>
                    <th scope="col">意味</th>
                    <th scope="col">作成者</th>
                    <th scope="col">作成日</th>
                    <th scope="col">My単語</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sharecard" items="${sharecard}">
                <c:if test="${sharecard.type.equals('ビジネス')}">
                        <tr>
                            <td><c:out value="${sharecard.word}" /></td>
                            <td><c:out value="${sharecard.mean}" /></td>
                            <td><c:out value="${sharecard.name}" /></td>
                            <td><fmt:formatDate value="${sharecard.created_at}"
                                    pattern="yyyy-MM-dd" /></td>
                            <td>追加</td>
                        </tr>
                        </c:if>
                </c:forEach>
            </tbody>
        </table><br>

        <h2 class="fw-bolder">■その他</h2>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">単語名</th>
                    <th scope="col">意味</th>
                    <th scope="col">作成者</th>
                    <th scope="col">作成日</th>
                    <th scope="col">My単語</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sharecard" items="${sharecard}">
                <c:if test="${sharecard.type.equals('その他')}">
                        <tr>
                            <td><c:out value="${sharecard.word}" /></td>
                            <td><c:out value="${sharecard.mean}" /></td>
                            <td><c:out value="${sharecard.name}" /></td>
                            <td><fmt:formatDate value="${sharecard.created_at}"
                                    pattern="yyyy-MM-dd" /></td>
                            <td>追加</td>
                        </tr>
                        </c:if>
                </c:forEach>
            </tbody>
        </table><br>
    </c:param>
</c:import>