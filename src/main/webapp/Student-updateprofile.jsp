<!DOCTYPE html>
<html>
	<head>
	<title>Update Profile</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="Student - updateprofile.css">
		<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>

	<body>
	<%@include file="Student-navbar.html"%>
		<form action="" method="POST">

			<div class="container">
				<img src="studIcon.png">
				<h2>STUDENT PROFILE</h2>
					<div class="row">
						<div class="col-25">
							<label style="">Student Name</label>
						</div>
						<div class="col-75">
							<input type="text" name="studentname" value="${student.studentName}">
						</div>
						<div class="col-75">
							<input type="hidden" name="studentid" value="${studentid}">
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label style="">Student Email</label>
						</div>
						<div class="col-75">
							<input type="text" name="studentemail" value="${student.studentEmail}">
						</div>
					</div>
						
					<div class="row">
						<div class="col-25">
							<label>Password</label>
						</div>
						<div class="col-75">
							<input type="password" name="studentpassword" value="${student.studentPassword}">
							<input type="hidden" name="action" value="update">
						</div>
					</div>
					<button type="submit"  class="button button1" name="submit" onclick="form.action='StudentServlet'" >Update</button>
					<button type="submit" class="button button1" name="submit" ><a href="Student-viewprofile.jsp">Cancel</a></button>
				<br><br>
					

			</div>
		</form>
	<body>
</html>