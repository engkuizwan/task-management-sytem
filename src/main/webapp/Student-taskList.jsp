<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10/2/2022
  Time: 12:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
    <title>List Of Task</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Student-taskList.css">

</head>
<body>

<%@include file="Student-navbar.html"%>

<div class="boxb">
    <a href="#" class="T">Task</a>
    <a href="Student-peopleList.jsp" class="P">Person</a>
</div>

<%--<sql:setDataSource var="ic" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/csc584" user="root" password=""/>--%>

<%--<sql:query dataSource="${ic}" var="oc">--%>
<%--    <c:set var="classid" value="3"/>--%>
<%--    SELECT t.taskName,t.taskAssignDate,t.taskDueDate from task t JOIN class c ON t.classid = c.classid WHERE c.classid=?--%>
<%--    <sql:param value="${classid}" />--%>
<%--</sql:query>--%>

<%--<c:forEach var="result" items="${oc.rows}">--%>
<%--    <c:out value="${result.lecturerName}"/>--%>
<%--    <div class="frame">--%>
<%--        <div class="pd">--%>
<%--            <div id="e1">Posted <c:out value="${result.taskAssignDate}"/></div>--%>
<%--            <div id="e2">Due : <c:out value="${result.taskDueDate}"/></div>--%>
<%--        </div>--%>
<%--        <p style="text-align: center"><c:out value="${result.taskName}"/></p>--%>
<%--        <div class="myLink">--%>
<%--            <button type="submit">View Task</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</c:forEach>--%>

    <div class="frame">
        <div class="pd">
            <div id="e1">Posted </div>
            <div id="e2">Due : </div>
        </div>
        <p style="text-align: center">ASSIGNMENT NAME</p>
        <div class="myLink">
            <button type="submit">View Task</button>
        </div>
    </div>

</body>

<script>

</script>
</html>