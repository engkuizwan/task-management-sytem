<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/2/2022
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>List Of People</title>
</head>
<body>
<style><%@include file="Lecturer-peopleList.css"%></style>

<%@include file="NavBar.jsp"%>

        <div class="boxb">
            <a href="Lecturer-taskList.jsp" class="T">Task</a>
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
             <button type="submit"><i class="fa fa-plus"></i> Add Student</button>
         </div>


         <div class="frame3">
             <img src="images/Capture_ccexpress.png"/>
             <div id="text4">STUDENT NAME</div>
             <div class="dropdown">
                 <button class="dropbtn"><i class="fa fa-ellipsis-v"></i></button>
                 <div class="dropdown-content">
                     <a href="#"><i class="fa fa-trash-o"></i> Remove</a>
                 </div>
             </div>
         </div>

</body>
</html>
