<%@ page import="java.sql.*" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.example.tmscsc584.Classs" %>
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


      <%
          Class.forName("org.postgresql.Driver"); // ni stay
          String dbURL = "jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v"; //ni url dri heroku database
          String user = "awludfehnzjioi"; //ni user dri heroku database
          String pass = "09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"; //ni password dri heroku database
          Connection conn = DriverManager.getConnection(dbURL, user, pass);

          int studentid = (Integer) session.getAttribute("id");

          if (conn != null){
              DatabaseMetaData dm = conn.getMetaData();
              System.out.println("Driver name: " + dm.getDriverName());
              System.out.println("Driver version: " + dm.getDriverVersion());
              System.out.println("Product Name: " + dm.getDatabaseProductName());
              System.out.println("Product version: " + dm.getDatabaseProductVersion());




              try{

                  PreparedStatement st = conn.prepareStatement("SELECT class_student.classid, class.classid, class.classname, class.classsubject from class_student full join class ON  class_student.classid = class.classid where class_student.studentid=?;");
                  st.setInt(1,studentid);
                  ResultSet res = st.executeQuery();
                  LinkedList listclass = new LinkedList();

                  int count=0;

                  while (res.next()){

                      Classs classs = new Classs();

                      classs.setClassId(res.getInt(2));
                      classs.setClassName(res.getString(3));
                      classs.setClassSubject(res.getString(4));
                      listclass.add(classs);
                      Classs obj = (Classs) listclass.get(count);

      %>



      <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="w3-card">


              <img src="java.png" alt="John" style="width:100%">


              <div class="w3-container w3-sand">

                  <form>
                      <h3><%=obj.getClassSubject()%></h3>
                      <p><%=obj.getClassName()%></p>
                      <input type="hidden" name="classid" value="<%=obj.getClassId()%>">
                      <input type="hidden" name="action" value="quitclass">
                      <p><button class="w3-button w3-blue-grey w3-block"></i> View class</button></p>
                      <p><button type="submit" formaction="StudentServlet"
                                 onclick="return confirm('Confirm quit Class: <%=obj.getClassName() %>  Subject: <%=obj.getClassSubject()%> ?');">
                          <img src="delete.png" style="width:10%">
                      </button></p>
                  </form>

              </div>



         </div>
        </div>


      <%

                      count++;
                  }
              }catch (Exception e){
                  e.printStackTrace();
              }
          }
      %>




  </div>
</div>


<!-- Join Modal -->
<div id="subscribe" class="w3-modal w3-animate-opacity">
  <div class="w3-modal-content" style="padding:32px">
    <div class="w3-container w3-white">
      <i onclick="document.getElementById('subscribe').style.display='none'" class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>

            <h2 class="w3-wide">JOIN CLASS</h2>

        <form action="StudentServlet" method="post">

            <p>Ask your teacher for the class code, then enter it here.</p>
            <p><input class="w3-input w3-border" type="text" name="classid" placeholder="Enter class code"></p>
            <input type="hidden" name="studentid" value="<%=studentid%>">
            <input type="hidden" name="action" value="joinclass">
            <button type="submit" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom">Join class</button>


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
