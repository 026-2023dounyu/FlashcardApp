<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <style>
html {
    background: gray;
}

body {
    /*background: #F2F2F2;*/
    background: gray;
}

h3 {
    font-size: 40px
}

h2 {
    font-size: 30px
}
</style>
        <br>
        <div id="carouselExampleControlsNoTouching" class="carousel slide"
            data-bs-touch="false" data-bs-interval="false">
            <div class="carousel-inner">
                <c:set var="cardCount" value="${fn:length(mycard)}" />
                <c:forEach var="mycard" items="${mycard}" varStatus="s">
                    <c:choose>
                        <c:when test="${s.first == 'true'}">
                            <div class="carousel-item active">
                                <div class="card  is-surface">
                                    <div class="card_surface">
                                        <h3 class="card-title fw-bolder">
                                            <c:out value="${mycard.word}" />
                                        </h3>
                                    </div>
                                    <div class="card_reverse">
                                        <h2 class="card-title">
                                            <c:out value="${mycard.mean}" />
                                        </h2>
                                    </div>
                                </div>
                                <div class="card-index">${s.count}/${cardCount}</div>
                                <div class="button-group" style="margin-left: 5%;">
                                    <button
                                        class="button ${mycard.understand == '2' ? 'active' : ''}"
                                        type="button" name="understand" value="2"
                                        onclick="handleButtonClick(this)">&#9675;</button>
                                    <button
                                        class="button ${mycard.understand == '1' ? 'active' : ''}"
                                        type="button" name="understand" value="1"
                                        onclick="handleButtonClick(this)">&#9651;</button>
                                    <button
                                        class="button ${mycard.understand == '0' ? 'active' : ''}"
                                        type="button" name="understand" value="0"
                                        onclick="handleButtonClick(this)">&#10005;</button>
                                </div>
                                <input type="hidden" name="_token" value="${_token}" />
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="carousel-item">
                                <div class="card is-surface">
                                    <div class="card_surface">
                                        <h3 class="card-title fw-bolder">
                                            <c:out value="${mycard.word}" />
                                        </h3>
                                    </div>
                                    <div class="card_reverse">
                                        <h2 class="card-title fw-lighter">
                                            <c:out value="${mycard.mean}" />
                                        </h2>
                                    </div>
                                </div>
                                <div class="card-index">${s.count}/${cardCount}</div>
                                <div class="button-group"style="margin-left: 5%;">
                                    <button
                                        class="button ${mycard.understand == '2' ? 'active' : ''}"
                                        type="button" name="understand" value="2"
                                        onclick="handleButtonClick(this)">&#9675;</button>
                                    <button
                                        class="button ${mycard.understand == '1' ? 'active' : ''}"
                                        type="button" name="understand" value="1"
                                        onclick="handleButtonClick(this)">&#9651;</button>
                                    <button
                                        class="button ${mycard.understand == '0' ? 'active' : ''}"
                                        type="button" name="understand" value="0"
                                        onclick="handleButtonClick(this)">&#10005;</button>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>

            <button class="carousel-control-prev" type="button"
                data-bs-target="#carouselExampleControlsNoTouching"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button"
                data-bs-target="#carouselExampleControlsNoTouching"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <div class="text-center" style="padding-top: 20px;">
            <button onclick="history.back()" class="btn btn-light btn-sm">学習終了</button>
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
        confirm("理解度を変更しますか？")
      });
    }
  });
</script>
    </c:param>
</c:import>

