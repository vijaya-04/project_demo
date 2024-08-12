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
				background-color: lightblue;
				height: 100vh;
				background-size: cover;
			}
			.profile_container{
				width: 360px;
				height: 465px;
				border-radius: 10px;
				background-color: white;
				border-width: 0px;
			}
			.image{
				height: 300px;
				width: 360px;
				border-radius: 10px;
				margin-bottom: 10px;
			}
			.fname{
				font-size: 23px;
				color: red;
				font-family: 'roboto';
				font-width: bold;
				font-style: italic;
				text-align: center;
				margin: 0px;
			}
			.email{
				font-size: 20px;
				color: black;
				font-family: 'roboto';
				font-style: italic;
				margin-bottom: 10px;
				text-align: center;
				width: 50px;
			}
			.hint{
				text-align: center;
				background-color: white;
				border-width: 0px;
				margin-bottom: 5px;
			}
			.shop{
				background-color: lightpink;
				font-family: 'roboto';
				border-width: 0px;
			}
			.sub-container{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<div class="bg-container d-flex flex-column justify-content-center">
			<div class="profile_container m-auto">
				<img src="" id="itemImage" class="image">
				<div class="sub-container">
					<form action="meu2jsp.jsp" method="post" onsubmit="return inputSize();">
						<input class="fname hint" id="item" name="itemName" readonly="true"><br>
						Rs. <input class="email hint" id="itemCost" name="price" readonly="true"><br>
						<input type="text" class="hint" name="Size" placeholder="Enter quantity"/><br>
						<input type="submit" value="Buy Now" class="shop" name="sbbutton"/>
					</form>
				</div>
		</div>
		</div>
		<script>
		const b = localStorage.getItem("name");
		const c = localStorage.getItem("image");
		const d = localStorage.getItem("cost");
		const id1 = document.getElementById("item");
		const id2 = document.getElementById("itemImage");
		const id3 = document.getElementById("itemCost");
		console.log(id1);
		console.log(id2);
		console.log(id3);
		id1.value = b;
		id2.src = c;
		id3.value = d;
		function inputSize()
		{
			
			alert("Your item is selected");
			return true;
		}
	</script>
				<% 	
		%>
	</body>
</html>