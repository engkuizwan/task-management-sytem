<!DOCTYPE html>
<html>
	<head>
	<title>TASK MANAGEMENT SYSTEM</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="Lecturer - UpdateProfile.css">
		<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>

	<body>


		<form action="" method="POST">
			<div class="container">
				<img src="teachIcon.png">
				<h2>LECTURER PROFILE</h2>
					<div class="row">
						<div class="col-25">
							<label style="">Lecturer Name</label>
						</div>
						<div class="col-75">
							<input type="text" name="email"  value="${lecturer.lecturerName}">
							<input type="hidden" name="lecturerid"  value="${lecturer.lecturerid}">
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label style="">Lecturer Email</label>
						</div>
						<div class="col-75">
							<input type="text" name="email" value="${lecturer.lecturerEmail}">
						</div>
					</div>
						
					<div class="row">
						<div class="col-25">
							<label>Password</label>
						</div>
						<div class="col-75">
							<input type="password" name="lecturerPassword" value="${lecturer.lecturerPassword}">
							<input type="hidden" name="action" value="update">
						</div>
					</div>
					<button type="submit" class="button button1" name="submit"  formaction="LecturerServlet" onclick="return confirm('Confirm update your profile?');">Update</button>
					<button type="submit" class="button button1" name="submit" ><a href="Lecturer%20-%20ViewProfile.jsp">Cancel</a></button><br><br>
					

			</div>
		</form>
	<body>
</html>