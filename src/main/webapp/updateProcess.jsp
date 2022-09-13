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
String id=request.getParameter("id");                 //폼에서 입력한 id
String passwd=request.getParameter("passwd");     //폼에서 입력한 passwd
String name=request.getParameter("name");         //폼에서 입력한name

PreparedStatement pstmt=null;
ResultSet rs=null;
try {
	String sql="select id,pass from member where id=?";      //데이터베이스상 column이름과  데이터베이스 테이블이름
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);                     //첫번째 물음표안에 들어갈 폼에서적는 id
	rs=pstmt.executeQuery();        //읽기
   if (rs.next()){
       String rID=rs.getString(1);            //데이터베이스상 column이름  or  column번호
       String rPass=rs.getString("pass"); // 데이터베이스상 column 이름  or  column번호
       if(rPass.equals(passwd)){                               //데이터베이스 이름과   폼에서입력한 이름이 같은경우
    	   sql="update member set name=? where id=?";     // member라는 테이블에 id칼럼값이 ?인 name칼럼을 ?로 수정하세요 
    	   pstmt=conn.prepareStatement(sql);
    	   pstmt.setString(1,name);            //첫번째 물음표안에 들어갈 폼에서 적는 name
    	   pstmt.setString(2,id);                 //두번째 물음표 안에 들어갈 폼에서적는 id
    	   pstmt.executeUpdate();%>
    	   <script>
    	   alert("수정성공");
    	   history.back(-1);</script>
    	   <%
         }else{
    	     %>
    	     <Script>
    	     alert("비밀번호가 일치하지 않습니다");
    	     history.back(-1);
    	     </Script>
    	    <%
    	        	    } }
  else{%>
	  <Script>
    	     alert("일치하는 id가 아닙니다.");
    	     history.back(-1);
    	     </Script>
	   <%
   }
} catch(Exception e){
	System.out.println("데이터베이스 에러");
	e.printStackTrace();
}

%>

</body>
</html>