<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	PreparedStatement pstmt = null;
	Statement stmt = null;
	Connection con = null;
	ResultSet rs = null;
	String custno = "";
	try{
		String sql = "SELECT MAX(custno)+1 custno FROM t2_member_tbl_02";
		con = DBCon.getConnection();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			custno = rs.getString("custno");
		}
	} catch (Exception e){
		e.printStackTrace();
	}
%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<h1>홈쇼핑 회원 등록</h1>
		<form action="Action.jsp" name="form" method="post">
			<input type="hidden" name="mode" value="insert">
			<table border="1">
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input value="<%= custno %>" type="text" name="custno" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"/></td>
				</tr>
				<tr>
					<td>회원성별</td>
					<td>
						<input type="radio" name="gender" id="M" value="M">
						<label for="M">남</label>
						<input type="radio" name="gender" id="W" value="W">
						<label for="W">여</label>
					</td>
				</tr>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="phone"/></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"/></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate"/></td>
				</tr>
				<tr>
					<td>회원등급</td>
					<td>
						<select name="grade">
							<option value="">등급을 선택해주세요.</option>
							<option value="A">VIP</option>
							<option value="B">일반</option>
							<option value="C">직원</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="return valueChecked()"/>
						<input type="button" value="조회" onclick="return saleryLocation()"/>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="./script/script.js"></script>
</body>
</html>