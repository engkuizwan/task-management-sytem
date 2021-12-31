<!DOCTYPE html>

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

<div class="container">
    <div class="title">View Task</div>
    <form action="#">

        <div class="taskdetails" >
            <div class="input-box">
                <span class="details">Task Name</span>
                <dd>task name</dd>
            </div>

            <div class="input-box">
                <span class="details">Assign Date</span>
                <dd>assign Date</dd>
            </div>
            <div class="input-box">
                <span class="details">Due Date</span>
                <dd>due Date</dd>
            </div>
            <div class="input-box">
                <span class="details">Status</span>
                <dd>status</dd>
            </div></br>
            <div class="input-box">
                <span class="details">Description</span></br>
                <dd>description</dd>
            </div>

            <div class="input-box">
                </br>
                <span class="details">Your Works</span></br>
                <input type="file">
            </div>



        </div>

        <div class="button">
            <input type="submit" value="Submit your works">
        </div>

    </form>
</div>


</body>
</html>