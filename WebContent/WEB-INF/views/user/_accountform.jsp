<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<br/>
<label for="id">ユーザーID</label><br />
<input type="number" name="id" id="id" value="${user.id}" />
<br /><br />

<label for="name">ユーザー名</label><br />
<input type="text" name="name" id="name" value="${user.name}" />
<br /><br />

<label for="password">パスワード</label><br />
<input type="text" name="password" id="password" value="${user.password}" />
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit" class="btn btn-primary btn-sm">登録</button>