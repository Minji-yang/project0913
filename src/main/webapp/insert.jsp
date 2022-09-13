<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file ="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<h2>회원입력</h2>

<form name="form" method=post action="insertProcess.jsp">
<p>아이디  :  <input type="text" name="id">
<p>비밀번호  :  <input type="password" name="pass">
<p>이   름  :  <input type="text" name="name">
<p><input type="submit" value="전송">
<input type="reset"  value="취소">
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>