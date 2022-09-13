<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="dbcon.jsp" %>
<%
request.setCharacterEncoding("UTF-8");      //줘라 set utf8 파일인코딩- 한글안깨짐 
       String id=request.getParameter("id");          //폼에서 "id"라는 name가진 애를 String 변수로 가져오겠다.
       String passwd=request.getParameter("pass");
       String name=request.getParameter("name");

       PreparedStatement pstmt=null;
       String sql="insert into member(id,pass,name) values(?,?,?)";
       try{
    	   pstmt=conn.prepareStatement(sql);           //위에sql말하는거
    	   pstmt.setString(1,id);                        // 데이터베이스 값 넘겨주기    1번에 id
    	   pstmt.setString(2,passwd);
    	   pstmt.setString(3,name);
	    	pstmt.executeUpdate();                         //데이터베이스에 반영시키기
	    	System.out.println("저장성공");
	    	
	    	   %>              
	    	   <script>
	    	   alert ("저장성공")
	    	   location.href="select.jsp";              //저장과 동시에 조회되는 것
	    	   </script>   
	    <%    } catch(Exception e){ System.out.println("저장 실패"); 
	    e.printStackTrace();}
	    %>
	       


아이디  : <%=id %><br>
비밀번호 : <%=passwd %><br>
이름 : <%= name %><br>
</body>
</html>