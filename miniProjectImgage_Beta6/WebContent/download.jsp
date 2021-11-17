<%@page import="java.nio.charset.StandardCharsets"%>
<%@ page contentType="application;" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.text.*"%>
<%@ page import="java.net.URLDecoder" %>
<%
	// 호출 : http://localhost:8080/프로젝트명/download.jsp?file=파일�
	String fileNameEncoder=request.getParameter("file");


	String strFilename=java.net.URLDecoder.decode(fileNameEncoder,StandardCharsets.UTF_8.toString());
	String strFilenameOutput=new String(strFilename.getBytes("utf-8"),"8859_1");
	File file=new File("c:/Out/"+strFilename); // 출력 결과를 C:/Out 폴더에 고정함.
	byte b[]=new byte[(int)file.length()];
	response.setHeader("Content-Disposition","attachment;filename="+strFilenameOutput);
	response.setHeader("Content-Length",String.valueOf(file.length()));
	if(file.isFile()){
		out.clear();
		out=pageContext.pushBody();
		BufferedInputStream fin=new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream outs=new BufferedOutputStream(response.getOutputStream());
		int read=0;
		while((read=fin.read(b))!=-1){
			outs.write(b,0,read);
		}
		outs.close();
		fin.close();

		
	}
%>