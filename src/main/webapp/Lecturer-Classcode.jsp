<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12/2/2022
  Time: 1:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Join Class Code</title>
</head>
<body>
<style><%@include file="Lecturer-Classcode.css"%></style>
<%

    int id = (Integer) session.getAttribute("classid");


%>
    <div class="frame">
        <p style="text-align: center">INVITATION CLASS CODE</p>
        <h1 style="text-align: center"><%=id%></h1>
        <input type="hidden" value="<%=id%>" id="myCode">
        <button onclick="myFunction()">Copy code</button>
    </div>

    <div class="frame2">
        <p style="text-align: center">YOU CAN COPY CODE AND SHARE WITH YOUR STUDENT<p>
    </div>
</body>
</html>

<script>
    function myFunction() {
        /* Get the text field */
        var copyText = document.getElementById("myCode");

        /* Select the text field */
        copyText.select();
        copyText.setSelectionRange(0, 99999); /* For mobile devices */

        /* Copy the text inside the text field */
        navigator.clipboard.writeText(copyText.value);

        /* Alert the copied text */
        alert("Copied the text: " + copyText.value);
    }
</script>