<!DOCTYPE html>
<html>
	<head>
	<title>TASK MANAGEMENT SYSTEM</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="Lecturer - ViewProfile.css">
		<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>

	<body>

	<%@include file="Lecturer-navbar.html"%>


		<form action="" method="POST">
			<div class="container">
				<img src="teachIcon.png">
				<h2>LECTURER PROFILE</h2>
					<div class="row">
						<div class="col-25">
							<label style="" >Lecturer Name</label>
						</div>
						<div class="col-75">
							<label style="">${lecturer.lecturerName}</label>
							<input type="hidden" name="lecturerid" value="${lecturer.lecturerId}">
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label style="" >Lecturer Email</label>
						</div>
						<div class="col-75">
							<label style="">${lecturer.lecturerEmail}</label>
						</div>
					</div>
						
					<div class="row">
						<div class="col-25">
							<label>Password</label>
						</div>
						<div class="col-75">
							<label>${lecturer.lecturerPassword}</label>
							<input type="hidden" name="action" value="delete">
						</div>
					</div>
					<button type="submit" class="button button1" name="submit" ><a href="Lecturer%20-%20UpdateProfile.jsp">Update</a></button>
					<button type="submit" class="button button1" name="submit" formaction="LecturerServlet" onclick="return confirm('Confirm delete your account?');" >Delete</button><br><br>
					

			</div>
		</form>
	</body>
</html>