<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<label for="word">単語</label><br />
<input type="text" name="word" id="word" value="${mycard.word}" />
<br /><br />

<label for="mean">メッセージ</label><br />
<input type="text" name="mean" id="mean" value="${mycard.mean}" />
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>