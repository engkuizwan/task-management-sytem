<!DOCTYPE html>
<html>
	<head>
	<title>TASK MANAGEMENT SYSTEM</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="Student - Signup.css">
		<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
	</head>

	<body >
	<div class="header">
			<h1>iTASK</h1>
		</div>
	<form action="LecturerServlet" method="POST">
		<div class="container">
		<img src="teachIcon.png">
		<h2>LECTURER LOGIN</h2>
			<div class="row">
				<div class="col-25">
					<label style="">Lecturer Name</label>
				</div>
				<div class="col-75">
					<input type="text" name="lecturername" placeholder="Enter your name" >
				</div>
			</div>
			
			<div class="row">
				<div class="col-25">
					<label>Password</label>
				</div>
				<div class="col-75">
					<input type="password" name="lecturerpassword" placeholder="Your Password">
				</div>
			</div>	
			
			<div class="row">
				<div class="col-25">
					<label style="">Lecturer Email</label>
				</div>
				<div class="col-75">
					<input type="text" name="lectureremail" placeholder="Enter your email">
					<input type="hidden" name="action" value="signup">
				</div>
			</div>
					
					<button type="submit" class="button button1 " name="submit" >Sign Up</button><br><br>
						
			
		</div>
		</form>
	</body>
</html>