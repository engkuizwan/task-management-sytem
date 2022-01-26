<!DOCTYPE html>
<html>
	<head>
	<title>TASK MANAGEMENT SYSTEM</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="Student - viewprofile.css">
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
							<label style="" >Student Name</label>
						</div>
						<div class="col-75">
							<label ></label>
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label style="" >Student Email</label>
						</div>
						<div class="col-75">
							<label style="">${student.studentEmail}</label>
						</div>
					</div>
						
					<div class="row">
						<div class="col-25">
							<label>Password</label>
						</div>
						<div class="col-75">
							<label>${student.studentPassword}</label>
						</div>
					</div>
					<button type="submit" class="button button1" name="submit" onclick="form.action='Student-updateprofile.jsp'">Update</button>
					<button type="submit" onclick="myFunction(); return false" class="button button1" name="submit" >Delete</button><br><br>
					
					<script type="text/javaScript">
						function myFunction()
						{	
							confirm("Are you sure you want to delete your profile?");
							form.action="studentdeleteservlet";
						}
					</script>
			</div>
		</form>
	</body>
</html>