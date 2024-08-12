<%@ page import="java.sql.*"%>
<%
	String Fname = request.getParameter("fname");
	String Lname = request.getParameter("lname");
	String Uname = request.getParameter("uname");
	String Password = request.getParameter("pwd");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Xe","system","srimani");
		PreparedStatement pst = con.prepareStatement("insert into login_demo1 values(?,?,?,?)");
		pst.setString(1,Fname);
		pst.setString(2,Lname);
		pst.setString(3,Uname);
		pst.setString(4,Password);
		pst.executeUpdate();
		if(pst!=null)
		{
			String redirectURL = "inlog.html";
			response.sendRedirect(redirectURL);
		}
		con.close();
	}
	catch(Exception e)
	{
	 %>
	 <%=e%>
	 <%
	}
%>
	