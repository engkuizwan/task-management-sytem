package com.example.tmscsc584;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "classServlet", value = "/classServlet")
public class ClassServlet extends HttpServlet {

    private ClassDao cd;
    public void init() {
        cd = new ClassDao();
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
                case "create":
                    create(request, response);
                    break;
                case "login":
                    /*login(request, response);*/
                    break;
                case "delete":
                    /*deleteUser(request, response);*/
                    break;
                case "update":
                    /*updateUser(request, response);*/
                    break;
                default:
                    /*listUser(request, response);*/
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }

    }



    /*######################################################( CREATE )#############################################################*/

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        HttpSession session = request.getSession();
        int lecturerid = Integer.parseInt(request.getParameter("lecturerid"));
        String subject = request.getParameter("classsubject");
        String name = request.getParameter("classname");
        int totalstudent = Integer.parseInt(request.getParameter("classtotalstudent"));
        Lecturer lecturer = new Lecturer();
        Classs classs = new Classs();

        classs.setClassName(name);
        classs.setClassSubject(subject);
        classs.setClassTotalstud(totalstudent);

        cd.create(classs,lecturer);
        session.setAttribute("class", classs);

    }





}
