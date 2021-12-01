<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<h1>홈쇼핑 회원 등록</h1>
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>회원성별</td>
				<td>회원번호</td>
				<td>회원주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>도시코드</td>
			</tr>
			<%
				Connection conn = null;
				PreparedStatement pstm = null;
				ResultSet rs = null;
				String custno,custname,gender,phone,address,grade,city;
				String genderStr = "";
				
				
				try{
					String sql = "SELECT custno,custname,gender,phone,address,joindate,grade,city from t2_member_tbl_02";
					conn = DBCon.getConnection();
					pstm = conn.prepareStatement(sql);
					rs = pstm.executeQuery();
					
					while(rs.next()){
						custno = rs.getString("custno");
						custname = rs.getString("custname");
						gender = rs.getString("gender");
						phone = rs.getString("phone");
						address = rs.getString("address");
						grade = rs.getString("grade");
						city = rs.getString("city");
						switch(gender){
							case "W" : genderStr = "여"; break;
							case "M" : genderStr = "남"; break;
						}				

						// 날짜 형식 변경하기
						String joindate = rs.getString("joindate");
						
						SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
						SimpleDateFormat newDate = new SimpleDateFormat("yyyy-MM-dd");
						Date formatDate = dtFormat.parse(joindate);
						String joinDateStr = newDate.format(formatDate);
						System.out.println("formatDate : " + formatDate);
						System.out.println("joinDateStr : " + joinDateStr);
			%>
				<tr>
					<td><a href="modify.jsp?custno=<%=custno%>"><%=custno %></a></td>
					<td><%=custname %></td>
					<td><%=genderStr %></td>
					<td><%=phone %></td>
					<td><%=address %></td>
					<td><%=joinDateStr %></td>
					<td><%=grade %></td>
					<td><%=city %></td>
				</tr>
			<%
					}
							
				} catch(Exception e){
					e.printStackTrace();
				}
				
			
			%>
		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>