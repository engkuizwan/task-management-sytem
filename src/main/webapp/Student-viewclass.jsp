<!DOCTYPE html>
<html>
<title>List Class</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="Student-viewclass.css">


<body>


<%@include file="Student-navbar.html"%>


<!-- Team Section -->

<div class="w3-container" style="padding:128px 16px" id="team">
	<h5><button class="w3-button w3-white w3-padding-large w3-large w3-opacity w3-hover-opacity-off" onclick="document.getElementById('subscribe').style.display='block'">JOIN CLASS</button></h5>
    <h3 class="w3-center">CLASSES</h3>

  <div class="w3-row-padding w3-grayscale" style="margin-top:64px">

       <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="w3-card">
              <img src="java.png" alt="John" style="width:100%">

			  <div class="dropdown">
                  <button class="dropbtn">...</button>
                  <div class="dropdown-content">
                    <button type="submit" class="w3-button w3-block" onclick="myFunction(); return false" class="button button1" name="submit"  >Delete</button>
                  </div>
			  </div>

              <div class="w3-container w3-sand">
                  <h3><c:out value="${classs.classsubject}"/></h3>
                  <p><c:out value="${classs.classname}"/></p>
                  <p><c:out value="${classs.classtotalstudent}"/></p>
                  <p><button class="w3-button w3-blue-grey w3-block"></i> View class</button></p>
              </div>
         </div>
        </div>
  </div>
</div>


<!-- Join Modal -->
<div id="subscribe" class="w3-modal w3-animate-opacity">
  <div class="w3-modal-content" style="padding:32px">
    <div class="w3-container w3-white">
      <i onclick="document.getElementById('subscribe').style.display='none'" class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>
            <form action="classServlet" method="post">
            <h2 class="w3-wide">JOIN CLASS</h2>
            <input type="hidden" name="lecturerid" value="${lecturer.lecturerId}">
            <input type="hidden" name="action" value="create">
      <p>Ask your teacher for the class code, then enter it here.</p>
      <p><input class="w3-input w3-border" type="text" placeholder="Enter class code"></p>
      <button type="button" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom" onclick="document.getElementById('subscribe').style.display='none'">Join class</button>
    </div>
  </div>


<script type="text/javaScript">
						function myFunction()
						{
							confirm("Are you sure you want to delete your class?");
						}
					</script>
</body>
</html>
