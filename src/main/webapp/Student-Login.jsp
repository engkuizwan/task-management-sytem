<!DOCTYPE html>
<html>
	<head>
	<title>TASK MANAGEMENT SYSTEM</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="Student - Login.css">
		<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
	</head>

	<body >
	<div class="header">
			<h1>iTASK</h1>
		</div>
	<form action="" method="POST">


		<div class="container">
			<img src="studIcon.png">
		<h2>STUDENT LOGIN</h2>
			<div class="row">
				<div class="col-25">
					<label style="">Student Username</label>
				</div>
				<div class="col-75">
					<input type="text" name="studentusername" placeholder="Enter your username" >
				</div>
			</div>
					<div class="row">
						<div class="col-25">
							<label>Password</label>
						</div>
						<div class="col-75">
							<input type="password" name="studentpassword" placeholder="Your email" >
							<input type="hidden" name="action" placeholder="login" >
						</div>
					</div>
					<p>Don't have an account?</p>
					<button type="submit" class="button button1" name="submit" onclick="form.action='StudentServlet'">Login</button>
					<button type="submit" class="button2 button1 " name="submit" ><a href ="Student-Signup.jsp">Sign up</a></button><br><br>
			
		</div>
		</form>
	</body>
</html>