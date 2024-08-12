<%@ page language="java" import="java.sql.*,java.util.*,java.io.*,java.lang.*"%>

		<%
			String q = request.getParameter("Size");
			if(q=="")
			{
				q = "1";
			}
			int quantity = Integer.parseInt(q);
			String st = request.getParameter("itemName");
			String x = request.getParameter("price");
			int rate = Integer.parseInt(x);
			int total_cost = quantity*rate;
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Xe","system","srimani");
				PreparedStatement pst = con.prepareStatement("insert into ItemList values(?,?,?,?)");
				pst.setString(1,st);
				pst.setInt(2,quantity);
				pst.setInt(3,rate);
				pst.setInt(4,total_cost);
				pst.executeUpdate();
				if(pst!=null)
				{
					String redirectURL = "page1.html";
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
			