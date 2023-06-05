<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${mycard != null}">

                <table class="table">

                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>単語ジャンル</td>
                            <td><c:out value="${mycard.type}" /></td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>単語名</td>
                            <td><c:out value="${mycard.word}" /></td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>意味</td>
                            <td><c:out value="${mycard.mean}" /></td>
                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>理解度</td>
                            <td><c:out value="${mycard.understand}" /></td>
                        </tr>
                        <tr>
                            <th scope="row">5</th>
                            <td>共有</td>
                            <td><c:out value="${mycard.share}" /></td>
                        </tr>
                        <tr>
                            <th scope="row">6</th>
                            <td>作成日</td>
                            <td><fmt:formatDate value="${mycard.created_at}"
                                    pattern="yyyy-MM-dd" /></td>
                        </tr>

                    </tbody>
                </table>
                <p>
                    <c:if test="${mycard.share == 1}">
                            みんなの単語帳に共有済み
                        </c:if>
                </p>
                <p>
                    <a href="${pageContext.request.contextPath}/index">一覧に戻る</a>
                </p>
                <p>
                    <a href="${pageContext.request.contextPath}/edit?id=${mycard.id}">この単語を編集する</a>
                </p>

            </c:when>
            <c:otherwise>

                <h2>お探しのデータは見つかりませんでした。</h2>

            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>