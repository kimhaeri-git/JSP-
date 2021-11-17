<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인</title>
</head>
<body>
<%@ include file="../dbconn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String u_id = request.getParameter("u_id");
String u_pass = request.getParameter("u_pass");
String grade=null;

ResultSet rs = null;  // 조회결과의 더미
Statement stmt = conn.createStatement(); // SQL을 실을 트럭준비

String sql = "SELECT u_id,u_pass,u_grade FROM user_table WHERE u_id='";
sql += u_id + "'";
rs = stmt.executeQuery(sql); // 트럭에 짐을 실어서 다리건너 부어 넣기.

String u_pass2 ="";
while (rs.next()) {
	u_pass2 = rs.getString("u_pass");
	grade = rs.getString("u_grade");
}
if (u_pass2.equals("")) {
	out.println("존재하지 않는 아이디입니다.");
	out.println("<a href='../index.html'>메인으로 돌아가기</a>");
} else if (!u_pass2.equals(u_pass)) {
	out.println("비밀번호가 잘못 입력되었씁니다."+u_pass2);
	out.println("<a href='../index.html'>메인으로 돌아가기</a>");
} else {
	request.setAttribute("id", u_id);
	request.setAttribute("pass",u_pass);
	request.setAttribute("grade",grade);
	
	response.sendRedirect("../index.html");
	
	/* RequestDispatcher rd = request.getRequestDispatcher("../index.html");
	rd.forward(request, response); */
	
}
stmt.close();
conn.close();

%>
</body>
</html>
</html>