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

<h2>회원조회</h2>

<%@ include file="dbcon.jsp" %>  



<table border=1>

<tr>
<th>아이디</th>
<th>비밀번호</th>
<th>이름</th>
</tr>
<%              //데이터베이스 읽기

PreparedStatement pstmt=null;
ResultSet rs=null;
String sql="select * from member";
try {
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString("id");            //가져오기 get      "필드이름" 적어줘도되고 순서번호를 가져오와도됨
		String passwd=rs.getString("pass");
		String name=rs.getString("name");

%>

<tr>
<td><%=id %></td>
<td><%=passwd %></td>
<td><%=name %></td>
</tr>
<%
	}
} catch(Exception e){System.out.println("데이터베이스 읽기 에러");
e.printStackTrace();
}                                                                     //끝나는부분을 이쪽으로 지정해줘서  중간 테이블에 적용되도록
%>
</table>

</section>
<%@include file="footer.jsp" %>

</body>
</html>