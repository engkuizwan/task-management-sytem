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
                case "delete":
                    deleteUser(request, response);
                    break;
                case "update":
                    updateUser(request, response);
                    break;
                case "joinclass":
                    joinclass(request, response);
                    break;
                case "quitclass":
                    quitclass(request, response);
                    break;
                case "addwork":
                    addwork(request,response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }


    }


    /*######################################################( SINGNUP )#############################################################*/

    private void signup(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("studentname");
        String password = request.getParameter("studentpassword");
        String email = request.getParameter("studentemail");
        Student student = new Student();

        student.setStudentName(name);
        student.setStudentPassword(password);
        student.setStudentEmail(email);

        sd.signup(student);
        response.sendRedirect("Student-Login.jsp");
    }

    /*######################################################( LOGIN )#############################################################*/


    private void login(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String password = request.getParameter("studentpassword");
        String email = request.getParameter("studentemail");

        try {

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v"; //ni url dri heroku database
            String user = "awludfehnzjioi"; //ni user dri heroku database
            String pass = "09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT * from student";

            if (conn != null){
                DatabaseMetaData dm = conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product Name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());


                Statement statement = conn.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(email.equals(res.getString("studentemail")) && password.equals(res.getString("studentpassword")))
                    {
                        session.setAttribute("studentid",res.getString(1));
                        Student student = new Student();


                                student.setStudentName(res.getString(2));
                                student.setStudentPassword(res.getString(3));
                                student.setStudentEmail(res.getString(4));

                        session.setAttribute("student", student);
                        session.setAttribute("id", res.getInt(1));

                        response.sendRedirect("Student-viewclass.jsp");


                    }else{
                        out.println("User not exist");
                    }
                }
            }


        }catch (Exception e){
            e.printStackTrace();
        }
        }


    /*######################################################( UPDATE )#############################################################*/


    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("studentid"));
        String name = request.getParameter("studentname");
        String password = request.getParameter("studentpassword");
        String email = request.getParameter("studentemail");
        Student student = new Student();

        student.setStudentId(id);
        student.setStudentName(name);
        student.setStudentPassword(password);
        student.setStudentEmail(email);
        sd.updateUser(student);

        session.removeAttribute("student");
        session.setAttribute("student", student);
        response.sendRedirect("Student-viewprofile.jsp");
    }

    /*######################################################( DELETE )#############################################################*/

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("studentid"));
        sd.deleteUser(id);
        response.sendRedirect("Student-Login.jsp");
    }



    /*######################################################( JOIN CLASS )#############################################################*/

    private void joinclass(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        int studentid = Integer.parseInt(request.getParameter("studentid"));
        int classid = Integer.parseInt(request.getParameter("classid"));
        Student student = new Student();
        Classs classs = new Classs();

        student.setStudentId(studentid);
        classs.setClassId(classid);

        sd.joinclass(student,classs);
        response.sendRedirect("Student-viewclass.jsp");

    }

    /*######################################################( QUIT CLASS )#############################################################*/

    private void quitclass(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("classid"));
        Classs classs = new Classs();

        classs.setClassId(id);

        sd.quitclass(classs);
        response.sendRedirect("Student-viewclass.jsp");


    }


    /*######################################################( ADD WORK )#############################################################*/

    private void addwork(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {


        int studentid = Integer.parseInt(request.getParameter("studentid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        String work = request.getParameter("task");

        sd.addwork(work, studentid, taskid);
        response.sendRedirect("Student-taskList.jsp");

    }




    }



