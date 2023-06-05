<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>単語テスト</title>
<link rel="stylesheet" href="<c:url value='/css/test.css' />">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
    <div id="wrapper">
        <main class="quiz">
            <div class="inner-block">

                <div class="quiz-content">

                    <div class="finish">
                        <div class="score-wrap">
                            <span class="score">0</span> <span class="ja">点</span> <span
                                class="full">／50点</span>
                        </div>
                        <a href="${pageContext.request.contextPath}/testHome"
                            class="goback-button">テスト終了</a>
                    </div>

                    <div class="quiz-question-number"></div>
                    <h2 class="quiz-question"></h2>

                    <ul class="quiz-answer">
                        <li><label class="quiz-button button01"> <input
                                name="radio" type="radio" value=""> <span
                                class="quiz-text01"></span>
                        </label></li>
                        <li><label class="quiz-button button02"> <input
                                name="radio" type="radio" value=""> <span
                                class="quiz-text02"></span>
                        </label></li>
                        <li><label class="quiz-button button03"> <input
                                name="radio" type="radio" value=""> <span
                                class="quiz-text03"></span>
                        </label></li>
                        <li><label class="quiz-button button04"> <input
                                name="radio" type="radio" value=""> <span
                                class="quiz-text04"></span>
                        </label></li>
                    </ul>
                </div>
            </div>
        </main>
    </div>
    <script>
        (function ($) {
              'use strict';

              //合計問題数
              let $questionTotalNum = 5;

              /* -----------------------------------------------
                県庁所在地クイズ
              -------------------------------------------------- */
              const prefecturalCapital = [
                    <c:forEach var="mycard" items="${mycard}" varStatus="s1">
                    {
                      id: "0${s1.count}",
                      question: "${mycard.mean}",
                      answer01: "${mycard.word}",
                      answer02: "${randomCard1}",
                      answer03: "${randomCard2}",
                      answer04: "${randomCard3}",
                    },
                    </c:forEach>
                  ];

              //質問をランダムにする
              function shuffleQuiz(array) {
                for (let i = (array.length - 1); 0 < i; i--) {
                  let random = Math.floor(Math.random() * (i + 1));
                  let selected = array[i];
                  array[i] = array[random];
                  array[random] = selected;
                }
                return array;
              }
              let quizId = ["01", "02", "03", "04", "05"];
              shuffleQuiz(quizId);

              //現在の質問数
              let $currentNum = 0;

              //得点
              let $pointPerCorrect = 10;

              let questionObject = (function () {
                let Obj = function ($target) {

                  //質問の番号
                  this.$questionNumber = $target.find('.quiz-question-number');

                  //質問文
                  this.$questionName = $target.find('.quiz-question');

                  //選択肢ボタン
                  this.$questionButton = $target.find('.quiz-button');
                  this.$button01 = $target.find('.button01');
                  this.$button02 = $target.find('.button02');
                  this.$button03 = $target.find('.button03');
                  this.$button04 = $target.find('.button04');

                  //選択肢のテキスト
                  this.$answer01 = $target.find('.quiz-text01');
                  this.$answer02 = $target.find('.quiz-text02');
                  this.$answer03 = $target.find('.quiz-text03');
                  this.$answer04 = $target.find('.quiz-text04');

                  //score
                  this.$score = $target.find('.score-wrap .score');

                  this.init();
                };
                Obj.prototype = {
                  //初回設定
                  init: function () {
                    //イベント登録
                    this.event();
                  },
                  event: function () {
                    let _this = this;
                    let score = 0;

                    //ウインドウ読み込み時
                    $(window).on('load', function () {
                      //value取得
                      let value = quizId[$currentNum]; //最初は0（1番目）
                      //次の質問を取得
                      let nextQuestion = _this.searchQuestion(value);
                      //次の質問に切り替える
                      _this.changeQuestion(nextQuestion);
                      //回答のシャッフル
                      _this.shuffleAnswer($('.quiz-answer'));
                    });

                    //button クリック
                    this.$questionButton.on("click", function () {

                      if ($(this).hasClass('button01')) {
                        $(this).parents('.quiz-answer').addClass('is-correct');
                        score = score + $pointPerCorrect;
                      } else {
                        $(this).parents('.quiz-answer').addClass('is-incorrect');
                      }

                      $(this).addClass('is-checked');

                      if ($currentNum + 1 == $questionTotalNum) {
                        setTimeout(function () {
                          $('.finish').addClass('is-show');
                          $('.score-wrap .score').text(score);
                        }, 1000);
                      } else {
                        setTimeout(function () {
                          //現在の数字の更新
                          $currentNum = $currentNum + 1;

                          //次の質問番号を取得
                          let value = quizId[$currentNum];

                          //次の質問を取得
                          let nextQuestion = _this.searchQuestion(value);

                          //次の質問に切り替える
                          _this.changeQuestion(nextQuestion);

                          //クラスを取る
                          _this.$questionButton.removeClass('is-checked');
                          $('.quiz-answer').removeClass('is-correct').removeClass('is-incorrect');

                          //回答のシャッフル
                          _this.shuffleAnswer($('.quiz-answer'));

                        }, 1000);
                      }
                      return false;
                    });
                  },
                  searchQuestion: function (questionId) {
                    let nextQuestion = null;
                    prefecturalCapital.forEach(function (item) {
                      if (item.id == questionId) {
                        nextQuestion = item;
                      }
                    });
                    return nextQuestion;
                  },
                  changeQuestion: function (nextQuestion) {
                    let _this = this;

                    //質問文の入れ替え
                    _this.$questionName.text(nextQuestion.question);

                    //質問番号を1つ増やす
                    let numPlusOne = $currentNum + 1;
                    _this.$questionNumber.text('質問' + numPlusOne);

                    //選択肢のテキストの入れ替え
                    _this.$answer01.text(nextQuestion.answer01);
                    _this.$answer02.text(nextQuestion.answer02);
                    _this.$answer03.text(nextQuestion.answer03);
                    _this.$answer04.text(nextQuestion.answer04);
                  },
                  shuffleAnswer: function (container) {
                    let content = container.find("> *");
                    let total = content.length;
                    content.each(function () {
                      content.eq(Math.floor(Math.random() * total)).prependTo(container);
                    });
                  },
                };
                return Obj;
              })();

              let quiz = $('.quiz');
              if (quiz[0]) {
                let queInstance = new questionObject(quiz);
              }

            })(jQuery);
        </script>
</body>
</html>