(function ($) {
  'use strict';

  //合計問題数
  let $questionTotalNum = 5;

  /* -----------------------------------------------
    県庁所在地クイズ
  -------------------------------------------------- */
  const prefecturalCapital = [
    {
      id: "01",
      question: "要素が「モレなくダブリなく」整理されている状態",
      answer01: "MECE",
      answer02: "QCD",
      answer03: "QOL",
      answer04: "3C",
    },
    {
      id: "02",
      question: "損害保険において偶然の事故による経済的損失に対して保険金を支払うこと",
      answer01: "補償",
      answer02: "保証",
      answer03: "保険料",
      answer04: "損害",
    },
    {
      id: "03",
      question: "メソッドやコンストラクタを多重に定義すること",
      answer01: "オーバーロード",
      answer02: "オーバライド",
      answer03: "プロパティ",
      answer04: "ポリモーフィズム",
    },
    {
      id: "04",
      question: "他のプログラムからできるだけ変更できない仕組み",
      answer01: "カプセル化",
      answer02: "オブジェクト指向",
      answer03: "メソッド",
      answer04: "プロパティ",
    },
    {
      id: "05",
      question: "継承したコードの一部を変更して利用するための仕組み",
      answer01: "ポリモーフィズム",
      answer02: "オーバーロード",
      answer03: "オブジェクト指向",
      answer04: "オーバライド",
    },
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