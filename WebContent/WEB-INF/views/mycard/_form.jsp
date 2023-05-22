<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<label for="type">単語ジャンル</label><br />
<input type="text" name="type" id="type" value="${mycard.type}" />
<br /><br />

<label for="word">単語</label><br />
<input type="text" name="word" id="word" value="${mycard.word}" />
<br /><br />

<label for="mean">単語の意味</label><br />
<input type="text" name="mean" id="mean" value="${mycard.mean}" />
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>