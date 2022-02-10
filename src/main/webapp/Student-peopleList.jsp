<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10/2/2022
  Time: 12:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.example.tmscsc584.Classs" %>
<%@ page import="com.example.tmscsc584.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Of People</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Student-peopleList.css">
</head>
<body>

<%@include file="Student-navbar.html"%>

<div class="boxb">
    <a href="Student-taskList.jsp" class="T">Task</a>
    <a href="#" class="P">Person</a>
</div>


<div class="frame">
    <img src="images/lect.png"/>
    <div id="text1">LECTURER NAME</div>
    <div id="text2">Teacher</div>
</div>


<div class="frame2">
    <div id="text3">TOTAL STUDENTS</div>
    <div class="round"><p>31</p></div>
</div>


<div class="frame3">
    <%
    Class.forName("org.postgresql.Driver"); // ni stay
    String dbURL = "jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v"; //ni url dri heroku database
    String user = "awludfehnzjioi"; //ni user dri heroku database
    String pass = "09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"; //ni password dri heroku database
    Connection conn = DriverManager.getConnection(dbURL, user, pass);

    int studentid = (Integer) session.getAttribute("id");
    //int classid = (Integer) session.getAttribute("id");

    if (conn != null){
        DatabaseMetaData dm = conn.getMetaData();
        System.out.println("Driver name: " + dm.getDriverName());
        System.out.println("Driver version: " + dm.getDriverVersion());
        System.out.println("Product Name: " + dm.getDatabaseProductName());
        System.out.println("Product version: " + dm.getDatabaseProductVersion());




        try{


            PreparedStatement st = conn.prepareStatement("SELECT student.studentname from class_student " +
                    " full join student ON  class_student.studentid = student.studentid ");


            st.setInt(1,studentid);
            //st.setInt(1,classid);
            ResultSet res = st.executeQuery();
            LinkedList listclass = new LinkedList();

            int count=0;

            while (res.next()){

                Student student = new Student();

                //student.setStudentId(res.getInt(2));
                student.setStudentName(res.getString(2));
                listclass.add(student);
                Student obj = (Student) listclass.get(count);

%>
    <img src="images/Capture_ccexpress.png"/>
    <div id="text4"><%=obj.getStudentName()%></div>

<%

    count++;
    }
    }catch (Exception e){
    e.printStackTrace();
    }
    }
%></div>
</body>
</html>

