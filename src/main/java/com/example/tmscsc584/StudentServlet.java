package com.example.tmscsc584;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

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
                case "login":
                    login(request, response);
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
        response.sendRedirect("Student-Login.jsp");
    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String username = request.getParameter("studentusername");
        String password = request.getParameter("studentpassword");
        Student student = new Student();

        student.setStudentName(username);
        student.setStudentPassword(password);

        try {
            if (sd.validate(student)){
                session.setAttribute("student", student);
                response.sendRedirect("Student-viewclass.jsp");
            }else{
                session.setAttribute("login", student);
                response.sendRedirect("Student-Login.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        }


    }



