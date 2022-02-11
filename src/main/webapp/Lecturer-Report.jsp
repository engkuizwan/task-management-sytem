<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/1/2022
  Time: 3:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@ page import="oracle.sql.DatumWithConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>List Of Task</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Lecturer-Report.css">

</head>
<body>
<%@include file="Lecturer-navbar.jsp"%>

<%
    int id = (Integer) session.getAttribute("classid");

%>


<sql:setDataSource var="ic" driver="org.postgresql.Driver" url="jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v" user = "awludfehnzjioi" password="09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"/>

<sql:query dataSource="${ic}" var="oc">
    <c:set var="clsid" value="<%=id%>"/>
    SELECT taskid,taskname,taskduedate,taskassigndate from task where classid=?
    <sql:param value="${clsid}" />
</sql:query>

<div class="boxb">
    <a href="#" class="T">Task</a>
    <a href="Lecturer-peopleList.jsp" class="P">Person</a>
</div>


<c:forEach var="result" items="${oc.rows}">

    <div class="frame">
        <div class="pd">
            <div id="e1">Report on <c:out value="${result.taskname}"/></div>
            <div id="e2">Due : <c:out value="${result.taskduedate}"/></div>
        </div>
    </div>

    <div class="frame2">
        <div class="pd">

            <table>
                <tr>
                    <th>NO</th>
                    <th>STUDENT NAME</th>
                    <th>TASK STATUS</th>
                    <th>STUDENT WORK</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Engku</td>
                    <td>Completed</td>
                    <td></td>

                </tr>

            </table>
        </div>
    </div>

</c:forEach>



</body>


</html>
