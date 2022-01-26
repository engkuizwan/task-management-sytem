<!DOCTYPE html>
<html>
	<head>
	<title>Student Signup</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="Student - Signup.css">
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
					<label style="">Student Name</label>
				</div>
				<div class="col-75">
					<input type="text" name="studentname" placeholder="Enter your name">
				</div>
			</div>
			
			<div class="row">
				<div class="col-25">
					<label>Password</label>
				</div>
				<div class="col-75">
					<input type="password" name="studentpassword" placeholder="Your Password" >
				</div>
			</div>	
			
			<div class="row">
				<div class="col-25">
					<label style="">Student Email</label>
				</div>
				<div class="col-75">
					<input type="text" name="studentemail" placeholder="Enter your email" >
					<input type="hidden" name="action" value="signup" >
				</div>
			</div>
					
					<button type="submit" class="button button1 " name="submit" onclick="form.action='StudentServlet'">Sign Up</button><br><br>
						
			
		</div>
		</form>
	<body>
</html>