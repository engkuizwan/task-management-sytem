<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>

    <title>View Task</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="task.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>


<body>



<sql:setDataSource var="ic" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v"
                   user = "awludfehnzjioi"
                   password="09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"/>
<sql:query dataSource="${ic}" var="oc">
    <%
        int tskid = Integer.parseInt(request.getParameter("taskid"));
    %>
    SELECT * from task WHERE taskid=?
    <sql:param value="<%=tskid%>" />
</sql:query>



<%@include file="Student-navbar.html"%>

<div class="container">
    <div class="title">View Task</div>
    <c:forEach var="result" items="${oc.rows}">
        <form action="#">
            <div class="taskdetails" >
                <div class="input-box">
                    <span class="details">Task Name</span>
                    <dd><c:out value="${result.taskname}"/></dd>
                </div>

                <div class="input-box">
                    <span class="details">Assign Date</span>
                    <dd><c:out value="${result.taskassigndate}"/></dd>
                </div>
                <div class="input-box">
                    <span class="details">Due Date</span>
                    <dd><c:out value="${result.taskduedate}"/></dd>
                </div>

                <div class="input-box">
                    <span class="details">Task Type</span>
                    <dd><c:out value="${result.tasktype}"/></dd>
                </div>

                <div class="input-box">
                    <span class="details">Description</span></br>
                    <dd><c:out value="${result.taskdescription}"/></dd>
                </div>


            </div>



        </form>
    </c:forEach>
</div>


</body>
</html>