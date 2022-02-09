<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/1/2022
  Time: 3:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.example.tmscsc584.Classs" %>
<%@ page import="com.example.tmscsc584.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>List Of Task</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<style><%@include file="LOT.css"%></style>

<%@include file="NavBar.jsp"%>

        <div class="boxb">
            <a href="#" class="T">Task</a>
            <a href="#" class="P">Person</a>
            <div class="animation start-home"></div>
        </div>

        <div class="createbtn">
            <input type="hidden" name="currentclassid">
            <button type="submit" style="font-size:17px">Create <i class="fa fa-plus"></i></button>
        </div>

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


            PreparedStatement st = conn.prepareStatement("SELECT student.studentname from student " +
                    "full join class_student ON  student.studentid = class_student.studentid" +
                    " join  class ON class.classid = class_student.classid " );


            //st.setInt(1,studentid);
            ResultSet res = st.executeQuery();
            LinkedList listclass = new LinkedList();

            int count=0;

            while (res.next()){

                Student student = new Student();

                //student.setStudentId(res.getInt(2));
                student.setStudentName(res.getString(1));
                listclass.add(student);
                Student obj = (Student) listclass.get(count);

%>
        <div class="frame">
            <div class="pd">
                <div id="e1"><%=obj.getStudentName()%></div>

            </div>
                <%--<p style="text-align: center"><c:out value="${result.taskName}"/></p>--%>
            <div class="myLink">
                <button type="submit">View Task</button>
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

</body>

<script>

</script>
</html>