<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		<style>
			.bg-container{
				background-image: url("https://t4.ftcdn.net/jpg/03/08/40/43/360_F_308404381_LqyMIXDPOR6Ut1TqE2cJRQdxomGsQegc.jpg");
				height: 100vh;
				background-size: cover;
			}
			.profile_container{
				width: 280px;
				height: 380px;
				border-radius: 15px;
				background-color: white;
				border-width: 0px;
				margin: auto;
				text-align: center;
			}
			.image{
				height: 230px;
				width: 280px;
				border-radius: 15px;
				margin-bottom: 10px;
			}
			.fname{
				padding-left: 10px;
				font-size: 25px;
				color: red;
				font-family: 'roboto';
				font-width: bold;
				font-style: italic;
			}
			.email{
				font-size: 20px;
				font-family: 'roboto;
				text-align: center;
				text-decoration: none;
				margin-top: 10px;
			}
		</style>
	</head>
	<body>
		<div class="bg-container d-flex flex-column justify-content-center">
			<div class="profile_container">
				<img src="https://flyclipart.com/thumb2/download-customer-icon-clipart-computer-icons-customer-clip-art-657313.png" class="image">
		 <% String Uname = request.getParameter("u1").toString();
			String Password = request.getParameter("u2").toString();
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
					String query1 = rs.getString(1);
					String query2 = rs.getString(2);
			%>
			<p class="fname"><%=query1%> <%=query2%></p>
			<a href="index.html">Back</a>
			</div>
		</div>
			<%
				}
				else
				{
					String query3 = "Not Signed in";
			%>
					<p class="fname"><%=query3%></p>
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
	
		</div>
		</div>
	</body>
</html>