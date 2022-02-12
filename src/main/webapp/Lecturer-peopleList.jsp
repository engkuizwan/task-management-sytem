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

<%@include file="Lecturer-navbar.jsp"%>
<%

    int id = (Integer) session.getAttribute("classid");


%>
<sql:setDataSource var="ic" driver="org.postgresql.Driver" url="jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v" user = "awludfehnzjioi" password="09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"/>

<sql:query dataSource="${ic}" var="oc">
    <c:set var="clsid" value="<%=id%>"/>
    SELECT l.lecturername
    from class c
    join lecturer l
    on c.lecturerid = l.lecturerid
    WHERE c.classid=?
    <sql:param value="${clsid}" />
</sql:query>


<%--<sql:query dataSource="${ic}" var="oc">
    <c:set var="clsid" value="<%=id%>"/>
    SELECT L.lecturerid,L.lecturername,S.studentid,S.studentname
    from student S
        JOIN class_student CS
            ON S.studentid=CS.studentid
        JOIN class C
            ON CS.classid=C.classid
        JOIN lecturer L
            ON C.lecturerid=L.lecturerid
    WHERE CS.classid=?
    <sql:param value="${clsid}" />
</sql:query>--%>

        <div class="boxb">
            <a href="Lecturer-taskList.jsp" class="T">Task</a>
            <a href="#" class="active" class="P">Person</a>
        </div>

<c:forEach var="result" items="${oc.rows}">
        <div class="frame">
            <img src="images/lect.png"/>
           <div id="text1">${result.lecturername}</div>
            <div id="text2">Teacher</div>
        </div>
</c:forEach>



<sql:query dataSource="${ic}" var="ec">
    <c:set var="clsid" value="<%=id%>"/>
    SELECT count(studentid) "total"
    from class_student
    WHERE classid=?
    <sql:param value="${clsid}" />
</sql:query>

<c:forEach var="result" items="${ec.rows}">
    <form>
<div class="frame2">
    <div id="text3">TOTAL STUDENTS</div>
    <div class="round"><p><c:out value="${result.total}"/></p></div>
    <input type="hidden" name="classid" value="<%=id%>">
    <button type="submit" formaction="Lecturer-Classcode.jsp" ><i class="fa fa-plus"></i> Add Student</button>
</div>
    </form>
</c:forEach>



<sql:query dataSource="${ic}" var="ac">
    <c:set var="clsid" value="<%=id%>"/>
    SELECT s.studentname, s.studentid
    from class_student cs
    join student s
    on cs.studentid = s.studentid
    WHERE cs.classid=?
    <sql:param value="${clsid}" />
</sql:query>


<c:forEach var="test" items="${ac.rows}">
         <div class="frame3">
             <img src="images/Capture_ccexpress.png"/>
             <div id="text4"><c:out value="${test.studentname}"/></div>
             <div class="dropdown">
                 <button class="dropbtn"><i class="fa fa-ellipsis-v"></i></button>
                 <div class="dropdown-content">
                     <form action="classServlet" method="post">
                     <input type="hidden" name="action" value="remove">
                     <input type="hidden" name="studentid" value="${test.studentid}">
                     <a><button type="submit"><i class="fa fa-trash-o"></i> Remove</button></a>
                     </form>
                 </div>
             </div>
         </div>
</c:forEach>

</body>
</html>
