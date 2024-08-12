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
				background-color: white;
				padding: 30px;
			}
			.bill_container{
				width: 750px;
				padding: 10px;
				background-color: lightblue;
			}
			.bill_heading{
				font-size: 40px;
				color: purple;
				font-width: 300;
				text-align: center;
				font-style: italic;
				margin-bottom: 10px;
			}
			.image{
				height: 50px;
				width: 60px;
			}
			.customer_name{
				font-size: 20px;
				font-width: 250px;
			}
			.text2{
				font-width: bold;
				font-size: 25px;
				margin-top: 20px;
			}
			.message{
				margin-top: 30px;
				color: grey;
				font-width: 300px;
				font-size: 22px;
				font-family: 'bree serif';
				text-align: center;
				text-decoration: underline;
			}
			
		</style>
	</head>
	<body>
		<%
			String u1 = request.getParameter("cname");
			String u2 = request.getParameter("pno");
			String u3 = request.getParameter("address");
			String u4 = request.getParameter("event");
		%>
		<div class="bg-container d-flex flex-row justify-content-center">
			<div class="bill_container">
				<div class="text1">
				<h1 class="bill_heading">Vijaya's Bakery <img src="https://img.freepik.com/premium-vector/bakery-logo-template_441059-121.jpg?w=2000" class="image"></h1>
				<p class="customer_name">Customer's name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=u1%></p>
				<p class="customer_name">Customer's phone no : <%=u2%></p>
				<p class="customer_name">Delivery Address&nbsp;&nbsp;&nbsp;&nbsp;: <%=u3%></p>
				<p class="customer_name">Event type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=u4%></p>
				</div>
				<br>
				<hr/>
				<table style="width:100%;">
				<tr>
				<th class="customer_name">ItemName</th><th class="customer_name">Quantity</th><th class="customer_name">Price</th><th class="customer_name">Total</th><td></td>
				</tr>
		<%
		try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Xe","system","srimani");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from ItemList");
				while(rs.next())
				{
		%>
						<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getInt(2)%></td>
						<td><%=rs.getInt(3)%></td>
						<td><%=rs.getInt(4)%></td>
						</tr>
		<%
				}					
				ResultSet rs1 = stmt.executeQuery("select sum(total) from ItemList");
				if(rs1.next())
				{
		%>
				</table>
				<p class="text2">Total Cost : <%=rs1.getString(1)%></p>
				<hr/>
				<p class="message">"Have a great day"</p>
		<%
				}
				con.close();
			}
			catch(Exception e)
			{
		%>
				<%=e%>
		<%	}   %>
		
				
			</div>
		</div>
	</body>
</html>
	