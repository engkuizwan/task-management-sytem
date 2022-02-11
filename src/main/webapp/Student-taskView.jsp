<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

<%
    int tskid = Integer.parseInt(request.getParameter("taskid"));
    int studentid = (Integer) session.getAttribute("id");
%>

<sql:setDataSource var="ic"
                   driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v"
                   user = "awludfehnzjioi"
                   password="09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"/>


<sql:query dataSource="${ic}" var="oc">
    <c:set var="tskid" value="<%=tskid%>"/>
    SELECT taskname, taskassigndate, taskduedate, tasktype, taskdescription
    from task
    where taskid=?
    <sql:param value="<%=tskid%>"/>
</sql:query>



<%@include file="Student-navbar.html"%>

<div class="container" style="margin-top: 9%; margin-bottom: 9%;">
    <div class="title">View Task</div>
    <c:forEach var="result" items="${oc.rows}">
        <form action="StudentServlet" method="post" enctype = "multipart/form-data">
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

                <div class="input-box">
                    <span class="details">Your Works</span></br>
                    <input type="file" name="task" id="task" data-height="300" required="required">
                </div>

                <sql:query dataSource="${ic}" var="od">
                    <c:set var="tskid" value="<%=tskid%>"/>
                    SELECT taskworkname FROM student_task WHERE taskid=?
                    <sql:param value="<%=tskid%>"/>
                </sql:query>

                <c:forEach var="test" items="${od.rows}">
                    <form action="StudentServlet">
                        <input type="hidden" name="action" value="viewfile">
                        <input type="hidden" name="imgname" value="${test.taskworkname}">
                        <button><c:out value="${test.taskworkname}"/></button>
                    </form>
                </c:forEach>
                <input type="hidden" name="action" value="addwork">
                <input type="hidden" name="taskid" value="<%=tskid%>">
                <input type="hidden" name="studentid" value="<%=studentid%>">
            </div>

            <div class="button">
                <input type="submit" value="Submit Your Works">
            </div>

        </form>
    </c:forEach>
</div>


</body>
</html>