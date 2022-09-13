<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="dbcon.jsp" %>

<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String passwd=request.getParameter("passwd");

PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	String sql="select id,pass from member where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
	String rPass=rs.getString(2);	
	if(passwd.equals(rPass)){
		sql="delete from member where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
			%>
			<script> alert("삭제 성공");
			history.back(-1);
			</script>
			<%
	}
	
	else{ %> 
	<script> 
	alert("비밀번호가 일치하지 않습니다.")
	history.back(-1);</script>
	 <%
	} }
	else{
	%><script>
	alert ("일치하는 id가 아닙니다");
	history.back(-1);
		</script>
<%	
	}
	
} catch(Exception e){System.out.println("데이터베이스 에러");
e.printStackTrace();
}

%>


</body>
</html>