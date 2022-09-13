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
<h2>회원삭제</h2>
<form name="form"  method="post" action="deleteProcess.jsp">
<p> id : <input type ="text" name="id">
<p>비밀번호 : <input type="password" name="passwd">
<p><input type ="submit" value="삭제하기">
<input type="reset" value="취소하기">
</form>
</section>
<%@include file="footer.jsp" %>

</body>
</html>