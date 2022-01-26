package com.example.tmscsc584;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "StudentServlet", value = "/StudentServlet")
public class StudentServlet extends HttpServlet {

    private StudentDao sd;
    public void init() {
        sd = new StudentDao();
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
                    signup(request, response);
                    break;
                case "/insert":
                    /*insertUser(request, response);*/
                    break;
                case "/delete":
                    /*deleteUser(request, response);*/
                    break;
                case "/edit":
                    /*showEditForm(request, response);*/
                    break;
                case "/update":
                    /*updateUser(request, response);*/
                    break;
                default:
                    /*listUser(request, response);*/
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }


    }


    private void signup(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("studentname");
        String password = request.getParameter("studentpassword");
        String email = request.getParameter("studentemail");
        Student student = new Student(name, password, email);
        sd.signup(student);
        response.sendRedirect("list");
    }


}
