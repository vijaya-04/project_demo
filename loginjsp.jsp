<%@ page import="java.sql.*,java.util.*,java.io.*"%>

<html>		
		<script>
			function login()
			{
				alert("Login Successfull");
				
			}
			function loginInvalid()
			{
				alert("Not a valid username or password");
				window.location = 'inlog.html';
			}
		</script>
		
		<%
			String Uname = request.getParameter("uname");
			String Password = request.getParameter("pwd");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Xe","system","srimani");
				Statement stmt = con.createStatement();
				String query = "select * from login_demo1 where username='"+Uname+"' and password='"+Password+"'";
				stmt.executeQuery(query);
				ResultSet rs = stmt.getResultSet();
				if(rs.next())
				{
		%>
		<script>
			login();
		</script>
		<body>
			<form action="profile.jsp" method="post">
			 <input type="hidden" name="u1" value="<%=Uname%>"/>
			 <input type="hidden" name="u2" value="<%=Password%>" />
			 <button type="hidden" id="qq" value="Login" style="display: none;"></button>
			</form>
			  <script type="text/javascript">
				 document.getElementById("qq").click();
			  </script>
			</body>
</html>
		<%
				}
				else
				{
		%>
		<script>
			loginInvalid();
		</script>
		<%
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
		