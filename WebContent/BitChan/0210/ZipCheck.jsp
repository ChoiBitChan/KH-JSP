<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, day0210.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String check = request.getParameter("check");	// y
	String area4 = request.getParameter("area4");	// null
	LogonDBBean manager = LogonDBBean.getInstance();
	
	Vector zipcodeList = manager.zipcodeRead(area4);
	int totalList = zipcodeList.size();
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	
	<script language="JavaScript"></script>
	<script>
		function dongCheck() {
			if (document.zipForm.area4.value == "") {
				alert("도로명을 입력하세요");
				document.zipForm.area4.focus();
				return;
			}
			document.zipForm.submit();
		}
		
		function sendAddress(zipcode, area1, area2, area3, area4) {
			var address = area1 + " " + area2;
			area3 = null;
			area3 = eval(area3);
			if (area3 != null) {
				address = address + " " + area3;
			}
			address = address + " " + area4;
			
			opener.document.userinput.zipcode.value = zipcode;
			opener.document.userinput.address.value = address;
			self.close();
		}
	</script>
</head>
<body bgcolor="#FFFFCC">
	<form name="zipForm" method="post" action="ZipCheck.jsp">
		<center>
			<b>우편번호 찾기</b>
				<table>
	      			<tr>
	        			<td>
	        				<br>
	          				도로명 입력 : <input name="area4" type="text">
	          				<input type="button" value="검색" onclick= "dongCheck();">
	        			</td>
	      			</tr>
	     			<input type="hidden" name="check" value="n">
				<%
					if(check.equals("n")){   
				%>
					<%
	   					if (zipcodeList.isEmpty()) {  
					%>
	   					<tr>
	   						<td align="center"><br>검색된 결과가 없습니다.</td>
	   					</tr>
					<%
						} else { 
					%>
						<tr>
							<td align="center"><br>
	    						※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.
	    					</td>
	    				</tr>
					<%
						for (int i=0;i<totalList;i++) {
							ZipcodeBean zipBean = (ZipcodeBean)zipcodeList.elementAt(i);
							String tempZipcode = zipBean.getZipcode();
							String temptArea1 = zipBean.getArea1();
							String temptArea2 = zipBean.getArea2();
							String temptArea3 = null;
							if(zipBean.getArea3() != null) {
								temptArea3 = zipBean.getArea3();
							}
							String temptArea4 = zipBean.getArea4();
					%>
						<tr>
							<td>
								<a href="javascript:sendAddress(
									'<%=tempZipcode%>'
									,'<%=temptArea1%>'
									,'<%=temptArea2%>'
									,'<%=temptArea3%>'
									,'<%=temptArea4%>')"> 
									<%=tempZipcode%>&nbsp;
									<%=temptArea1%>&nbsp;
									<%=temptArea2%>&nbsp;
									<%
										if (temptArea3 != null) {
									%>
											<%=temptArea3%>&nbsp;
									<%	
										}
									%>
									<%=temptArea4%>
								</a><br>
					<%
							}//for
						}
					%>
				<%
					}
				%>
							</td>
					</tr>
				<tr>
					<td align="center"><br><a href="javascript:this.close();">닫기</a></td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>