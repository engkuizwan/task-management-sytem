
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>

    <title>Update Task</title>
    <link rel="stylesheet" href="task.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>


<body>



<!--topbar-->
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

<%


    int taskid = 0;

    try{
        if(request.getParameter("taskid") != null)
        {
            taskid = Integer.parseInt(request.getParameter("classid"));
        }
        else
        {
            taskid = (Integer) session.getAttribute("classid");
        }
    }catch (Exception e){e.printStackTrace();}

%>




<sql:setDataSource var="ic" driver="org.postgresql.Driver" url="jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v" user = "awludfehnzjioi" password="09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"/>

<sql:query dataSource="${ic}" var="oc">
    <c:set var="taskid" value="<%=taskid%>"/>
    SELECT taskid,taskname,taskduedate,tasktype, taskdescription
    from task
    where taskid=?
    <sql:param value="${taskid}"/>
</sql:query>




<!--form-->
<div class="container" style="margin-top: 9%; margin-bottom: 9%;">
    <div class="title">Add Task</div>
    <form action="TaskServlet" method="post">

        <input type="hidden" name="taskid" value="<%=taskid%>">

        <c:forEach var="result" items="${oc.rows}">
        <div class="taskdetails" >
            <div class="input-box">
                <span class="details">Task Name</span>
                <input type="text" name="taskname" value="${result.taskname}" required>
            </div>

            <div class="input-box">
                <span class="details">Task Type</span>
                <input type="text" name="tasktype" value="${result.tasktype}" required>
            </div>
            <div class="input-box">
                <span class="details">Due Date</span>
                <input type="date" name="taskduedate"  value="${result.taskduedate}" required>
            </div>
            <div class="input-box">
                <span class="details">Description</span></br>
                <input name="taskdescription" cols="30" rows="10" value="${result.taskdescription}">
            </div>

            <input type="hidden" name="action" value="update">

            </c:forEach>

        </div>

        <div class="button">
            <input type="submit" onclick="return confirm('Confirm update your task?');" value="Update">
        </div>

    </form>
</div>




</body>
</html>