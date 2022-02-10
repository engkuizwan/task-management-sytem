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
    <link rel="stylesheet" href="Lecturer-taskList.css">

</head>
<body>
<%@include file="NavBar.jsp"%>

<%

    Class.forName("org.postgresql.Driver"); // ni stay
    String dbURL = "jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v"; //ni url dri heroku database
    String user = "awludfehnzjioi"; //ni user dri heroku database
    String pass = "09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"; //ni password dri heroku database
    Connection conn = DriverManager.getConnection(dbURL, user, pass);

    int id = 0;

    try{
        if(request.getParameter("classid") != null)
        {
            id = Integer.parseInt(request.getParameter("classid"));
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
    <c:set var="clsid" value="<%=id%>"/>
    SELECT taskid,taskname,taskduedate,taskassigndate from task where classid=?
    <sql:param value="${clsid}" />
</sql:query>

<div class="boxb">

    <a href="#" class="T">Task</a>
    <a href="Lecturer-peopleList.jsp" class="P">Person</a>


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
            <div id="e2">Due : <c:out value="${result.taskduedate}"/>
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
        <p style="text-align: center"><c:out value="${result.taskname}"/></p>
        <div class="myLink">
            <form>
                <input type="hidden" name="taskid" value="${result.taskid}">
            <button type="submit" formaction="Lecturer - taskView.jsp" >View Task</button>
            </form>
        </div>
    </div>
</c:forEach>






</body>


</html>
