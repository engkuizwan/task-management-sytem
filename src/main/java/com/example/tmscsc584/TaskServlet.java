package com.example.tmscsc584;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "TaskServlet", value = "/TaskServlet")
public class TaskServlet extends HttpServlet {

    private TaskDao td;
    public void init() {
        td = new TaskDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "signup":
                    create(request, response);
                    break;
                case "delete":
                    /*deleteUser(request, response);*/
                    break;
                case "update":
                    /*updateUser(request, response);*/

            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }


    }



    /*######################################################( CREATE )#############################################################*/

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("classid"));
        String name = request.getParameter("taskname");
        String type = request.getParameter("tasktype");
        String email = request.getParameter("taskdescription");
        Date duedate = Date.valueOf(request.getParameter("taskduedate"));

        Task task = new Task();
        Classs classs = new Classs();

        task.setTaskName(name);
        task.setTaskType(type);
        task.setTaskDesc(email);
        task.setTaskDueDate(duedate);

        classs.setClassId(id);

        td.create(task, classs);
        response.sendRedirect("Lecturer-viewclass.jsp");
    }


}
