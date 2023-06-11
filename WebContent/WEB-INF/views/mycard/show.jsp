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
                            <td>単語ジャンル</td>
                            <td><c:out value="${mycard.type}" /></td>
                        </tr>
                        <tr>
                            <td>単語名</td>
                            <td><c:out value="${mycard.word}" /></td>
                        </tr>
                        <tr>
                            <td>意味</td>
                            <td><c:out value="${mycard.mean}" /></td>
                        </tr>
                        <tr>
                            <td>理解度</td>
                            <c:choose>
                                <c:when test="${mycard.understand == '0'}">
                                    <td>×</td>
                                </c:when>
                                <c:when test="${mycard.understand == '1'}">
                                    <td>△</td>
                                </c:when>
                                <c:otherwise>
                                    <td>〇</td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <td>みんなの単語</td>
                            <c:choose>
                                <c:when test="${mycard.share == '0'}">
                                    <td>共有なし</td>
                                </c:when>
                                <c:otherwise>
                                    <td>共有済み</td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <td>作成者</td>
                            <td><c:out value="${mycard.name}" /></td>
                        </tr>
                        <tr>
                            <td>作成日</td>
                            <td><fmt:formatDate value="${mycard.created_at}"
                                    pattern="yyyy-MM-dd" /></td>
                        </tr>

                    </tbody>
                </table>

                <p>
                    <a href="${pageContext.request.contextPath}/index">My単語一覧に戻る</a>
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