<%@ page import="java.sql.*" %>
<%@ page import="com.example.tmscsc584.Lecturer" %>
<%@ page import="com.example.tmscsc584.Classs" %>
<%@ page import="java.util.LinkedList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>List Class</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="Lecturer-viewclass.css">


<body>

<%@include file="Lecturer-navbar.html"%>

<!-- Team Section -->

<div class="w3-container" style="padding:128px 16px" id="team">
	<h6><button class="w3-button w3-white w3-padding-large w3-large w3-opacity w3-hover-opacity-off" onclick="document.getElementById('subscribe').style.display='block'">CREATE CLASS</button></h6>
  <h3 class="w3-center">CLASSES</h3>
  <div class="w3-row-padding w3-grayscale" style="margin-top:64px">



      <%
          Class.forName("org.postgresql.Driver"); // ni stay
          String dbURL = "jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v"; //ni url dri heroku database
          String user = "awludfehnzjioi"; //ni user dri heroku database
          String pass = "09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"; //ni password dri heroku database
          Connection conn = DriverManager.getConnection(dbURL, user, pass);

          int lecturerid = (Integer) session.getAttribute("id");



          String query = "select classid from class where lecturerid = '" + lecturerid + "'";
          Statement st = conn.createStatement();
          ResultSet res  = st.executeQuery(query);

          int[] id = new int[20];
          int count = 0;
          int d=0;

          while(res.next()){
              id[count] = res.getInt(1);
              count++;
          }


      %>


      <sql:setDataSource var="ic" driver="org.postgresql.Driver" url="jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v" user = "awludfehnzjioi" password="09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"/>

      <sql:query dataSource="${ic}" var="oc">
          <c:set var="clsid" value="<%=lecturerid%>"/>
          SELECT classid,classname,classsubject,classtotalstudent,row_number() over () "rank" from class where lecturerid=?
          <sql:param value="${clsid}" />
      </sql:query>

<c:forEach var="result" items="${oc.rows}">




      <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="w3-card">


              <img src="java.png" alt="John" style="width:100%">


              <div class="w3-container w3-sand">
                  <form method="post">

                  <h3><c:out value="${result.classsubject}"/></h3>
                  <p><c:out value="${result.classname}"/></p>

                  <input type="hidden" name="classid" value="${result.classid}">
                  <input type="" name="c" value="${result.rank}">
                  <input type="hidden" name="action" value="delete">

                  <p><button type="submit"  onclick="form.action='Lecturer-taskList.jsp'" class="w3-button w3-blue-grey w3-block"></i> View class</button></p> <%-- wan update here--%>
                  <p><button type="submit"  formaction="Lecturer-classupdate.jsp"><img src="edit.png" style="width:10%"></button></p>
                  <p><button type="submit" formaction="classServlet"
                             onclick="return confirm('Confirm delete Class: <c:out value="${result.classname}"/>  Subject: <c:out value="${result.classsubject}"/> ?');">
                      <img src="delete.png" style="width:10%">
                  </button></p>


                  </form>
              </div>
          </div>
      </div>



</c:forEach>

    </div>
  </div>

<script>
    function test(){

        <%
        try{

            session.removeAttribute("classid");
            d = Integer.parseInt(request.getParameter("c"));
            session.setAttribute("classid", id[d]);
        }catch (Exception e){e.printStackTrace();}
        %>

        form.action="Lecturer-taskList.jsp";
    }
</script>



<!-- Join Modal -->
<div id="subscribe" class="w3-modal w3-animate-opacity">
  <div class="w3-modal-content" style="padding:32px">
    <div class="w3-container w3-white">
      <i onclick="document.getElementById('subscribe').style.display='none'" class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>
      <h2 class="w3-wide">CREATE CLASS</h2>
        <form action="classServlet" method="post">
            <p>Enter your class details here</p>
            <p><input class="w3-input w3-border" type="text" name="classsubject" placeholder="Class Subject"></p>
	        <p><input class="w3-input w3-border" type="text" name="classname" placeholder="Class Name"></p>
            <p><input class="w3-input w3-border" type="text" name="classtotalstudent" placeholder="Total student"></p>
            <input type="hidden" name="lecturerid" value="${lecturer.lecturerId}">
            <input type="hidden" name="action" value="create">
            <button type="submit" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom" onclick="document.getElementById('subscribe').style.display='none'; form.action='classServlet';">CREATE CLASS</button>
        </form>
    </div>
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
