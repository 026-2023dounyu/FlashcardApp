<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<label for="word">単語</label><br />
<input type="text" name="word" id="word" value="${mycard.word}" />
<br /><br />

<label for="mean">単語の意味</label><br />
<textarea name="mean" id="mean" rows="3" cols="25">${mycard.mean}</textarea>
<br /><br />

<label for="type">単語ジャンル</label><br />
<input type="radio" name="type" value="IT" ${mycard.type == 'IT' ? 'checked' : ''}> IT<br />
<input type="radio" name="type" value="保険" ${mycard.type == '保険' ? 'checked' : ''}> 保険<br />
<input type="radio" name="type" value="ビジネス" ${mycard.type == 'ビジネス' ? 'checked' : ''}> ビジネス<br />
<input type="radio" name="type" value="その他" ${mycard.type == 'その他' ? 'checked' : ''}> その他<br />
<br />

<label>理解度</label><br />
<input type="radio" name="understand" value="2" ${mycard.understand == '2' ? 'checked' : ''}> 〇<br />
<input type="radio" name="understand" value="1" ${mycard.understand == '1' ? 'checked' : ''}> △<br />
<input type="radio" name="understand" value="0" ${mycard.understand == '0' ? 'checked' : ''}> ×<br />

<br />

<div class="form-check form-switch">
    <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" name="share" value="${mycard.share}" ${mycard.share == 1 ? 'checked' : ''}>
    <label class="form-check-label" for="flexSwitchCheckDefault">みんなの単語に共有する</label><br /><br />
</div>
<br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit" class="btn btn-primary btn-sm" style="margin-right: 40%;">登録</button>
