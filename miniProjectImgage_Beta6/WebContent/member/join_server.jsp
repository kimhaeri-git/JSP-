<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../dbconn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String u_id = request.getParameter("u_id");
String u_pass = request.getParameter("u_pass");

//ResultSet rs = null;  // 조회결과의 더미
Statement stmt = null; // SQL을 실을 트럭준비

try{
	stmt = conn.createStatement();
	String sql = "INSERT INTO user_table VALUES ('"+u_id + "','"+u_pass+"','C')";
	out.println(sql);
	stmt.executeUpdate(sql); // 트럭에 짐을 실어서 다리건너 부어 넣기.
	
	out.println("회원가입이 완료 되었습니다.");
	response.sendRedirect("/miniProjectImgage_Beta6/index.html");

}catch(SQLException ex){
	out.println("Exception error:"+ex.getMessage());
	
}finally{
	if(stmt != null)
		stmt.close();
	if(conn != null)
		conn.close();
	
}


%>
</body>
</html>