<%@page import="DB.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");		

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String mode = request.getParameter("mode");
	System.out.println(mode);
	
	if(mode.equals("insert")){
		String custno = request.getParameter("custno");	
		String custname = request.getParameter("custname");	
		String gender = request.getParameter("gender");	
		String phone = request.getParameter("phone");	
		String address = request.getParameter("address");	
		String joindate = request.getParameter("joindate");	
		String grade = request.getParameter("grade");	
		String city = request.getParameter("city");	

		String sql = "INSERT INTO t2_member_tbl_02 VALUES(?,?,?,?,?,?,?,?)";
		try{
			conn = DBCon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custno);
			pstmt.setString(2, custname);
			pstmt.setString(3, gender);
			pstmt.setString(4, phone);
			pstmt.setString(5, address);
			pstmt.setString(6, joindate);
			pstmt.setString(7, grade);
			pstmt.setString(8, city);
			pstmt.executeUpdate();
			%>
			<jsp:forward page="insert.jsp"></jsp:forward>
			<%
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	if(mode.equals("modify")){
		String custno = request.getParameter("custno");	
		String custname = request.getParameter("custname");	
		String gender = request.getParameter("gender");	
		String phone = request.getParameter("phone");	
		String address = request.getParameter("address");	
		String joindate = request.getParameter("joindate");	
		String grade = request.getParameter("grade");	
		String city = request.getParameter("city");
		
		String sql = "UPDATE t2_member_tbl_02 " + 
			"SET custname=?,gender=?,phone=?,address=?,joindate=?,grade=?,city=? " + 
			"WHERE custno=?";
		try{
			conn = DBCon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custname);
			pstmt.setString(2, gender);
			pstmt.setString(3, phone);
			pstmt.setString(4, address);
			pstmt.setString(5, joindate);
			pstmt.setString(6, grade);
			pstmt.setString(7, city);
			pstmt.setString(8, custno);
			pstmt.executeUpdate();
			%>
			<jsp:forward page="list.jsp"></jsp:forward>
			<%			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>