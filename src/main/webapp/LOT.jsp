<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/1/2022
  Time: 3:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

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

       <sql:setDataSource var="ic" driver="com.mysql.jdbc.Driver" url="jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v"
                          user="awludfehnzjioi" password="09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"/>

        <sql:query dataSource="${ic}" var="oc">
                <c:set var="classid" value="3"/>
                SELECT t.taskName,t.taskAssignDate,t.taskDueDate from task t JOIN class c ON t.classid = c.classid WHERE c.classid=?
                <sql:param value="${classid}" />
        </sql:query>

       <c:forEach var="result" items="${oc.rows}">
           <c:out value="${result.lecturerName}"/>
        <div class="frame">
            <div class="pd">
                <div id="e1">Posted <c:out value="${result.taskAssignDate}"/></div>
                <div id="e2">Due : <c:out value="${result.taskDueDate}"/>
                        <div class="dropdown">
                            <button class="dropbtn"><i class="fa fa-ellipsis-v"></i></button>
                            <div class="dropdown-content">
                                <a href="#"><i class="fa fa-edit"></i>  Edit</a>
                                <a href="#"><i class="fa fa-trash-o"></i>  Delete</a>
                                <a href="#"><i class="fa fa-clone"></i>  Report</a>
                            </div>
                        </div>
                </div>
            </div>
                <p style="text-align: center"><c:out value="${result.taskName}"/></p>
            <div class="myLink">
                <button type="submit">View Task</button>
            </div>
        </div>
       </c:forEach>



</body>

<script>

</script>
</html>
