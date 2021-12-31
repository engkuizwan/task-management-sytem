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
	<!--<div class="header">
			<h1>iTASK</h1>
		</div>-->
		<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href="#home" class="w3-bar-item w3-button w3-wide">iTASK</a>
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
	
	  <a href="#class" class="w3-bar-item w3-button"><i class="fa fa-th"></i> CLASS</a>
      <a href="#pricing" class="w3-bar-item w3-button"><i class="fa fa-user"></i> PROFILE</a>
	        <a href="#pricing" class="w3-bar-item w3-button"><i class="fa fa-sign-out"></i></a>

    </div>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>
		<form action="" method="POST">
			<div class="container">
				<img src="studIcon.png">
				<h2>STUDENT PROFILE</h2>
					<div class="row">
						<div class="col-25">
							<label style="" >Student Name</label>
						</div>
						<div class="col-75">
							<label style="">Anir Nur Athirah</label>
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label style="" >Student Email</label>
						</div>
						<div class="col-75">
							<label style="">anis@gmail.com</label>
						</div>
					</div>
						
					<div class="row">
						<div class="col-25">
							<label>Password</label>
						</div>
						<div class="col-75">
							<!--<input type="password" name="lecturerPassword" placeholder="Your email" value=""> -->
							<label>*****</label>
						</div>
					</div>
					<button type="submit" class="button button1" name="submit" ><a href="%5BS%5D%20UpdateProfile.htmle.html">Update</a></button>
					<button type="submit" onclick="myFunction(); return false" class="button button1" name="submit" >Delete</button><br><br>
					
					<script type="text/javaScript">
						function myFunction()
						{	
							confirm("Are you sure you want to delete your profile?");
						}
					</script>
			</div>
		</form>
	<body>
</html>