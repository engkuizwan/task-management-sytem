<!DOCTYPE html>
<html>
	<head>
	<title>TASK MANAGEMENT SYSTEM</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="Lecturer - Login.css">
		<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
	</head>

	<body >
	<div class="header">
			<h1>iTASK</h1>
		</div>
	<form action="" method="POST">
		<div class="container">
		<img src="teachIcon.png">
		<h2>LECTURER LOGIN</h2>
			<div class="row">
				<div class="col-25">
					<label style="">Lecturer Email</label>
				</div>
				<div class="col-75">
					<input type="text" name="lectureremail" placeholder="Enter your email">
				</div></div>
					<div class="row">
						<div class="col-25">
							<label>Password</label>
						</div>
						<div class="col-75">
							<input type="password" name="lecturerpassword" placeholder="Enter your password">
							<input type="hidden" name="action" value="login">
						</div>
					</div>
					<p>Don't have an account?</p>
					<button type="submit" class="button button1" name="submit" onclick="form.action = 'LecturerServlet' ">Login</button>
					
					<button type="submit" class="button2 button1 " name="submit" ><a href ="Lecturer - Signup.jsp">Sign up</a></button><br><br>
						
			
		</div>
		</form>
	</body>
</html>