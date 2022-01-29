package com.example.tmscsc584;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;

@WebServlet(name = "LecturerServlet", value = "/LecturerServlet")
public class LecturerServlet extends HttpServlet {

    private LecturerDao ld;
    public void init() {
        ld = new LecturerDao();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "signup":
                    signup(request, response);
                    break;
                case "login":
                    /*login(request, response);*/
                    break;
                case "delete":
                    /*deleteUser(request, response);*/
                    break;
                case "update":
                   /* updateUser(request, response);*/
                    break;
                default:
                    /*listUser(request, response);*/
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }


    }


    /*######################################################( SINGNUP )#############################################################*/

    private void signup(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("lecturername");
        String password = request.getParameter("lecturerpassword");
        String email = request.getParameter("lectureremail");
        Lecturer lecturer = new Lecturer();

        lecturer.setLecturerName(name);
        lecturer.setLecturerPassword(password);
        lecturer.setLecturerEmail(email);

        ld.signup(lecturer);
        response.sendRedirect("Lecturer-Login.jsp");
    }




}
