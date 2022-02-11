<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10/2/2022
  Time: 12:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.example.tmscsc584.Classs" %>
<%@ page import="com.example.tmscsc584.Student" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>List Of Task</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Student-taskList.css">

</head>
<body>

<%@include file="Student-navbar.html"%>

<%
    int id = 0;

    try{
        if(request.getParameter("classid") != null)
        {
            id = Integer.parseInt(request.getParameter("classid"));
            session.removeAttribute("classid");
            session.setAttribute("classid", id);
        }
        else
        {
            id = (Integer) session.getAttribute("classid");
        }
    }catch (Exception e){e.printStackTrace();}

%>


<sql:setDataSource var="ic" driver="org.postgresql.Driver" url="jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v" user = "awludfehnzjioi" password="09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"/>

<sql:query dataSource="${ic}" var="oc">
    SELECT taskid,taskname,taskduedate,taskassigndate from task where classid=?
    <sql:param value="<%=id%>"/>
</sql:query>

<div class="boxb">

    <a href="#" class="T">Task</a>
    <a href="Student-peopleList.jsp" class="P">Person</a>


</div>

<div class="createbtn">
    <form>
        <input type="hidden" name="classid" value="<%=id%>">
        <button type="submit" style="font-size:17px" formaction="Lecturer - taskAdd.jsp" >Create <i class="fa fa-plus"></i></button>
    </form>
</div>

<c:forEach var="result" items="${oc.rows}">
    <div class="frame">
        <div class="pd">
            <div id="e1">Posted <c:out value="${result.taskassigndate}"/></div>
            <div id="e2">Due : <c:out value="${result.taskduedate}"/></div>
        </div>
        <p style="text-align: center"><c:out value="${result.taskname}"/></p>
        <div class="myLink">
            <form method="post">
                <input type="hidden" name="taskid" value="${result.taskid}">
                <button type="submit" formaction="Student-taskView.jsp" >View Task</button>
            </form>
        </div>
    </div>
</c:forEach>

</body>

</html>