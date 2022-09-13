<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	var f=document.form;
		if(f.id.value==""){
			alert("id가 입력되지 않았습니다.");
			f.id.focus();  //커서를 id에  그대로 남겨두기위해
		}else if(f.id.value.length<8||f.id.value.length>15){
			alert("id는 8~15자리입니다.");
			f.id.focus();
		}
		else if(f.pass.value==""){
			alert("password가 입력되지 않았습니다.");
			f.pass.focus();
		}else if(f.name.value==""){
			alert("이름이 입력되지 않았습니다.");
			f.name.focus();
		}else{f.submit();}
}  
</script>
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
<p><input type="button" value="전송" onclick="check()">
<input type="reset"  value="취소">
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>