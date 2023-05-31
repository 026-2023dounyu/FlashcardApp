<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>単語帳</title>
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/css/flashcard.css' />">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <br><br><br><br>
        </div>
        <div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
            <div class="carousel-inner">
                <c:set var="cardCount" value="${fn:length(mycard)}" />
                <c:forEach var="mycard" items="${mycard}" varStatus="s">
                    <c:choose>
                        <c:when test="${s.first == 'true'}">
                            <div class="carousel-item active">
                                <div class="card is-surface">
                                    <div class="card_surface">
                                        <h1 class="card-title"><c:out value="${mycard.word}" /></h1>
                                    </div>
                                    <div class="card_reverse">
                                        <h2 class="card-title"><c:out value="${mycard.mean}" /></h2>
                                    </div>
                                </div>
                                <div class="card-index">${s.count}/${cardCount}</div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="carousel-item">
                                <div class="card is-surface">
                                    <div class="card_surface">
                                        <h1 class="card-title"><c:out value="${mycard.word}" /></h1>
                                    </div>
                                    <div class="card_reverse">
                                        <h2 class="card-title"><c:out value="${mycard.mean}" /></h2>
                                    </div>
                                </div>
                                <div class="card-index">${s.count}/${cardCount}</div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <div class="button-group">
    <button class="button circle">&#9675;</button>
    <button class="button triangle">&#9651;</button>
    <button class="button cross">&#10005;</button>
  </div>
    </div>

    <script>
        $(function() {
            $('.card').on('click', function() {
                $(this).toggleClass('is-surface').toggleClass('is-reverse');
            });
        });
    </script>

    <script>
  document.addEventListener("DOMContentLoaded", function() {
    var buttons = document.getElementsByClassName("button");
    for (var i = 0; i < buttons.length; i++) {
      buttons[i].addEventListener("click", function() {
        var currentButton = this;
        var currentButtonClass = currentButton.classList[1];
        var buttons = document.getElementsByClassName("button");
        for (var j = 0; j < buttons.length; j++) {
          buttons[j].classList.remove("active");
        }
        currentButton.classList.add("active");
      });
    }
  });
</script>

    <script src="<c:url value='/js/jquery-3.7.0.slim.min.js' />"></script>
    <script src="<c:url value='/js/bootstrap.bundle.min.js' />"></script>
</body>
</html>