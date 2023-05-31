<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<label for="word">単語</label><br />
<input type="text" name="word" id="word" value="${mycard.word}" />
<br /><br />

<label for="mean">単語の意味</label><br />
<textarea name="mean" id="mean" rows="3" cols="25">${mycard.mean}</textarea>
<br /><br />

<label for="type">単語ジャンル</label><br />
<input type="radio" name="type" value="IT"> IT<br />
<input type="radio" name="type" value="保険"> 保険<br />
<input type="radio" name="type" value="ビジネス"> ビジネス<br />
<input type="radio" name="type" value="その他"> その他<br />
<br />

<label>理解度</label>
<input type="radio" name="understand" id="ok" value="2"/> 〇
<input type="radio" name="understand" id="soso" value="1"/> △
<input type="radio" name="understand" id="bad" value="0"/>×
<br /><br />

<div class="toggle_button">
  <input id="toggle" class="toggle_input" type='checkbox' />
  <label for="toggle" class="toggle_label"></label>
</div>
<label for="type">みんなの単語に共有する</label><br /><br />


<label><input type="checkbox" name="share" id="share"value="${mycard.share}">みんなの単語帳に共有する</label>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>