<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.Statement" %>
<%@page import = "java.sql.ResultSet" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//conn 통로
			//Connection conn = DriverManager.getConnection(url, uid, pwd);
			Connection conn = DriverManager.getConnection( //연결 얻을 때 사용하는 메소드 (getConnection)
					"jdbc:oracle:thin:@localhost:1521:orcl","changju","1234");
					//"jdbc:url", "사용자명", "패스워드"
					//"jdbc:oracle:thin:[HostName][:port][:DBname]" -- 실제 DB파일 위치
			
			Statement stmt = conn.createStatement();//SQL 시작//stmt 객체 생성
			
			ResultSet rs = stmt.executeQuery("select * from employees");//query 실행
			//stmt.executeUpdate
			//rs.next() : 현재 행에서 앞으로 이동
			//rs.previouse() : 현재 행에서 한 행 뒤로 이동
			//rs.first() : 현재 행에서 첫번째 행의 위치로 이동
			//rs.last() : 현재 행에서 마지막 행의 위치로 이동
			
			while(rs.next()){
				out.print("<h6>" + rs.getString("employee_id") + "&nbsp&nbsp&nbsp" + rs.getString("salary") + "</h6>");
			}
			
			stmt.close();//닫아줌
			conn.close();//닫아줌
			
		%>
	</body>
</html>