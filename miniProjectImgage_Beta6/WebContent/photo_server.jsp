<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="javax.imageio.*" %>
<%@ page import="java.awt.image.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
String fileUrl = "c:/Upload";
int sizeLimit = 5 * 1024 * 1024 ; // 5�ް����� ���� �Ѿ�� ���ܹ߻�
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

MultipartRequest  multi = new MultipartRequest(request,fileUrl,sizeLimit,"utf-8",policy);

String tmp;
Enumeration<?> params = multi.getParameterNames(); //����! �Ѿ���� ������ �ݴ�.
tmp = (String) params.nextElement();
String addVal = multi.getParameter(tmp);
tmp = (String) params.nextElement();
String algo = multi.getParameter(tmp);


//** ���� ���� **
Enumeration<?> files = multi.getFileNames();
tmp = (String) files.nextElement();
String filename = multi.getFilesystemName(tmp);
out.println("<p>���ε� ���ϸ� :" + filename);


/////////////////////////////////


String para = addVal;

//���� ���� ����
int[][][] inImage=null;
int inH=0, inW=0;
int[][][] outImage=null;
int outH=0, outW=0;

//(1) JSP ���� ó��
File inFp;
FileInputStream inFs;
inFp = new File("c:/Upload/" + filename);  // mypic.png
//Į�� �̹��� ó��
BufferedImage cImage = ImageIO.read(inFp);
//(2) JSP �迭 ó�� : ���� --> �޸�(2���迭)
//(�߿�!) �Է� ��, ���� ����
inW = cImage.getHeight();
inH = cImage.getWidth();
inImage = new int[3][inH][inW];
//���� --> �޸�

	for (int i=0; i<inH; i++) {
		for (int k=0; k<inW; k++) {
			int rgb = cImage.getRGB(i,k);
			int r = (rgb >> 16) & 0xFF;
			int g = (rgb >> 8) & 0xFF;
			int b = (rgb >> 0) & 0xFF;
			inImage[0][i][k] = r;
			inImage[1][i][k] = g;
			inImage[2][i][k] = b;
		}
	}

//(3) ����ó�� �˰��� �����ϱ�.
switch(algo) {
	case "101" : 	// ���� �˰��� : out = 255 - in
		// (�߿�!) ��� ��, ���� ���� --> �˰��� ����.
		outH = inH;
		outW = inW;
		outImage = new int[3][outH][outW];
		// ## ��¥ ����ó�� �˰��� ##
		for(int rgb =0;rgb<3;rgb++)
			for(int i=0; i<inH; i++) {
				for (int k=0; k<inW; k++) {
					outImage[rgb][i][k] = 255 - inImage[rgb][i][k];
				}
			}
		break;
	case "102" : 	// ���/��Ӱ� : out = in + para
		// (�߿�!) ��� ��, ���� ���� --> �˰��� ����.
		outH = inH;
		outW = inW;
		outImage = new int[3][outH][outW];
		// ## ��¥ ����ó�� �˰��� ##
		for(int rgb =0;rgb<3;rgb++)
			for(int i=0; i<inH; i++) {
				for (int k=0; k<inW; k++) {
					 int v = inImage[rgb][i][k] + Integer.parseInt(para);
					 if (v > 255)
						 v = 255;
					 if (v < 0)
						 v = 0;
					 outImage[rgb][i][k] = v;
				}
			}
		break;
	case "103" : 	// ��ϴ�� 
		// (�߿�!) ��� ��, ���� ���� --> �˰��� ����.
		outH = inH;
		outW = inW;
		outImage = new int[3][outH][outW];
		// *** ���� ó�� �˰��� ***
		int value = Integer.parseInt(para);
		if(value >0){
			value = (value+10)/10;
			for(int rgb=0;rgb<3;rgb++){
				for(int i=0;i<inH;i++){
					for(int k=0;k<inW;k++){
						int pixel = inImage[rgb][i][k];
						if(pixel > 127){
								if(pixel * value > 255){
									pixel = 255;
								}
								pixel *= value;
						}
						else{
							pixel /= value;
						}
						outImage[rgb][i][k] = pixel;
					}
				}
			}
		}else{
				value = -(value - 10) / 10;
				for(int rgb=0;rgb<3;rgb++){
					for(int i=0;i<inH;i++){
						for(int k=0;k<inW;k++){
							int pixel = inImage[rgb][i][k];
							if(pixel > 127){
								if(pixel / value < 127)
									pixel =127;
								pixel /= value;
							}else{
								if(pixel * value > 127)
									pixel /= value;
							}
							outImage[rgb][i][k] = pixel;
						}
					}
				}
			}
		
		break;
	case "201"://Ȯ���ϱ�
		outH = inH*Integer.parseInt(para);
		outW = inW*Integer.parseInt(para);
		//�̹��� �Ҵ�
		outImage = new int[3][outH][outW];
		//����ó�� �˰���
		for(int rgb=0;rgb<3;rgb++)
			for(int i=0;i<outH;i++)
				for(int k=0;k<outW;k++)
					outImage[rgb][i][k] = inImage[rgb][i/Integer.parseInt(para)][k/Integer.parseInt(para)];
		break;
	case "202": //����ϱ�
		outH = inH/Integer.parseInt(para);
		outW = inW/Integer.parseInt(para);
		//�̹��� �Ҵ�
		outImage = new int[3][outH][outW];
		//����ó�� �˰���
		for(int rgb=0;rgb<3;rgb++)
			for(int i=0;i<inH;i++)
				for(int k=0;k<inW;k++)
					outImage[rgb][(int)(i/Integer.parseInt(para))][(int)(k/Integer.parseInt(para))] = inImage[rgb][i][k];
		break;
	case "203": //�缱�� ������
		outH = inH;
		outW = inW;
		outImage = new int[3][outH][outW];
	
		Double scale2 = Double.parseDouble(para);
		int C1, C2, C3, C4;
		int newValue, point;
	
		outH = (int) (inH * scale2);
		outW = (int) (inW * scale2);
	
		outImage = new int[3][outH][outW];
	
		for (int rgb = 0; rgb < 3; rgb++) {
			for (int i = 0; i < outH; i++) {
				for (int k = 0; k < outW; k++) {
					int r_H = (int)Math.round(i / scale2);
					int r_W = (int)Math.round(k / scale2);
					int i_H = r_H;
					int i_W = r_W;
					int s_H = Math.round(r_H - i_H);
					int s_W = Math.round(r_W - i_W);
					// console.log(i_H);
					if (i_H < 0 || i_H >= (inH - 1) || i_W < 0 || i_W >= (inW - 1)) {
						// point = i * outW + k;
						outImage[rgb][i][k] = 255;
					} else {
						C1 = inImage[rgb][i_H][i_W];
						C2 = inImage[rgb][i_H][i_W + 1];
						C3 = inImage[rgb][i_H + 1][i_W + 1];
						C4 = inImage[rgb][i_H + 1][i_W];
						newValue = (C1 * (1 - s_H) * (1 - s_W) + C2 * s_W * (1 - s_H) + C3 * s_W * s_H
								+ C4 * (1 - s_W) * s_H);
						outImage[rgb][i][k] = newValue;
					}
	
				}
			}
		}
		break;
	case "301": //������� ����
		outH = inH;
		outW = inW;
		double[][] mask3={{1.0/16.0,1.0/8.0,1.0/16.0},
				{1.0/8.0,1.0/4.0,1.0/8.0},
				{1.0/16.0,1.0/8.0,1.0/16.0}};
		int[][][] tmpImage3=new int[3][inH+2][inW+2];
	
		for (int rgb = 0; rgb < 3; rgb++) {
			for (int i = 0; i < outH; i++) {
				for (int k = 0; k < outW; k++) {
					tmpImage3[rgb][i+1][k+1] = inImage[rgb][i][k];
					}
				}
			}
		//�޸� �Ҵ�
		outImage = new int[3][outH][outW];
		for (int rgb = 0; rgb < 3; rgb++) {
			for (int i = 0; i < outH; i++) {
				for (int k = 0; k < outW; k++) {
					double x= 0.0;
					for(int m=0;m<3;m++){
						for(int n=0;n<3;n++){
							x+=mask3[m][n]*tmpImage3[rgb][i+m][k+n];
						}
					}
					if(x>255)
						x=255;
					if(x<0)
						x=0;
					outImage[rgb][i][k]= (int)x;
					}
				}
			}
	
	
		break;
	case "302": //�ص��� 
		outH = inH;
		outW = inW;
		
		int low;
		int high;
		
		
		outImage = new int[3][outH][outW];
		
		low = inImage[0][0][0];
		high=inImage[0][0][0];
		

        //�ִ�, �ּ� ã��
        for (int rgb = 0; rgb < 3; rgb++) {
	        for (int i = 0; i < inH; i++) {
	            for (int k = 0; k < inW; k++) {
	            	int pixel = inImage[rgb][i][k];
	            	if (pixel < low)
	            		low = pixel;
	            	else if (pixel > high)
	            		high = pixel;
	            	
	            }
	        }
        }
        low += 50;
        high -= 50;
        
        for (int rgb = 0; rgb < 3; rgb++) {
	        for (int i = 0; i < inH; i++) {
	            for (int k = 0; k < inW; k++) {
	            	int inVal = inImage[rgb][i][k];
	               
	                double outVal = (inVal - low) / (high - low) * 255.0;

	                if (outVal > 255.0)
	                    outVal = 255.0;
	                else if (outVal < 0.0)
	                    outVal = 0.0;
	                
	                
	                outImage[rgb][i][k] = (int) Math.round(outVal);
	               
	            }
	        }
        }
       

		break;
	case "401": // ������
		outH = inH;
		outW = inW;
		int[][] mask1 = {{-1,0,0},{0,0,0},{0,0,1}};
		int[][][] tmpImage1 = new int[3][inH+2][inW+2];
		
		for (int rgb=0; rgb<3; rgb++)
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				tmpImage1[rgb][i][k] = 127;
			}
		}
		for (int rgb=0; rgb<3; rgb++)
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				tmpImage1[rgb][i+1][k+1] = inImage[rgb][i][k];
			}
		}
	
		// �޸� �Ҵ�
		outImage = new int[3][outH][outW];
		// ��¥ ����ó�� �˰���
		for (int rgb=0; rgb<3; rgb++)
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				int x = 0;
				for(int m=0; m<3; m++){
					for(int n=0; n<3; n++){
						x += mask1[m][n]*tmpImage1[rgb][i+m][k+n];
					}
				}
				x += 127;
				if(x > 255)
					x = 255;
				if(x < 0)
					x = 0;
				outImage[rgb][i][k] = x;
			}
		}
		break;
	case "402"://LoG
		outH = inH;
		outW = inW;
		int[][] mask8 = {{0,0,-1,0,0},
						{0,-1,-2,-1,0},
						{-1,-2,16,-2,-1},
						{0,-1,-2,-1,0},
						{0,0,-1,0,0}};
		int[][][] tmpImage8 = new int[3][inH+4][inW+4];
		
		for (int rgb=0; rgb<3; rgb++)
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				tmpImage8[rgb][i+2][k+2] = inImage[rgb][i][k];
			}
		}
	
		// �޸� �Ҵ�
		outImage = new int[3][outH][outW];
		// ��¥ ����ó�� �˰���
		for (int rgb=0; rgb<3; rgb++)
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				int x = 0;
				for(int m=0; m<5; m++){
					for(int n=0; n<5; n++){
						x += mask8[m][n]*tmpImage8[rgb][i+m][k+n];
					}
				}
				if(x > 255)
					x = 255;
				if(x < 0)
					x = 0;
				outImage[rgb][i][k] = x;
			}
		}
		break;
	case "403": //DoG
		outH = inH;
		outW = inW;
		int[][] mask9 = {{0,0,-1,-1,-1,0,0},
						{0,-2,-3,-3,-3,-2,0},
						{-1,-3,5,5,5,-3,-1},
						{-1,-3,5,16,5,-3,-1},
						{-1,-3,5,5,5,-3,-1},
						{0,-2,-3,-3,-3,-2,0},
						{0,0,-1,-1,-1,0,0}};
		int[][][] tmpImage9 = new int[3][inH+6][inW+6];
		
		for (int rgb=0; rgb<3; rgb++)
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				tmpImage9[rgb][i+3][k+3] = inImage[rgb][i][k];
			}
		}
	
		// �޸� �Ҵ�
		outImage = new int[3][outH][outW];
		// ��¥ ����ó�� �˰���
		for (int rgb=0; rgb<3; rgb++)
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				int x = 0;
				for(int m=0; m<7; m++){
					for(int n=0; n<7; n++){
						x += mask9[m][n]*tmpImage9[rgb][i+m][k+n];
					}
				}
				if(x > 255)
					x = 255;
				if(x < 0)
					x = 0;
				outImage[rgb][i][k] = x;
			}
		}
		break;



}



//(4) ����� ���Ͽ� ����
File outFp;
FileOutputStream outFs;
String outname = "out_"+filename;
outFp = new File("c:/out/"+outname);
//Į�� �̹��� ����
BufferedImage outCImage = new BufferedImage(outH, outW,
		BufferedImage.TYPE_INT_RGB);
//�޸� --> ����

	for(int i=0; i<outH; i++) {
		for(int k=0; k<outW; k++) {
			int r = outImage[0][i][k];
			int g = outImage[1][i][k];
			int b = outImage[2][i][k];
			int px =0;
			px = px | (r << 16);
			px = px | (g << 8);
			px = px | (b << 0);
			outCImage.setRGB(i,k,px);
		}
	}
ImageIO.write(outCImage,"jpg", outFp);

out.println(algo + "  <h1> ó�� ��! </h1>");

String url = "<p><h1><a href='http://192.168.56.102:8080/miniProjectImgage_Beta6/";
url += "download.jsp?file=" + outname + "'>�ٿ�ε�</a></h1>";

out.println(url);

%>


</body>
</html>