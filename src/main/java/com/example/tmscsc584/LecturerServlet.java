package com.example.tmscsc584;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
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
                    login(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "update":
                   updateUser(request, response);
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
        response.sendRedirect("Lecturer - Login.jsp");
    }


    /*######################################################( LOGIN )#############################################################*/


    private void login(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String password = request.getParameter("lecturerpassword");
        String email = request.getParameter("lectureremail");

        try {

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v"; //ni url dri heroku database
            String user = "awludfehnzjioi"; //ni user dri heroku database
            String pass = "09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT * from lecturer";

            if (conn != null){
                DatabaseMetaData dm = conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product Name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());


                Statement statement = conn.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(email.equals(res.getString("lectureremail")) && password.equals(res.getString("lecturerpassword")))
                    {
                        session.setAttribute("lecturerid",res.getString(1));
                        Lecturer lecturer = new Lecturer();


                        lecturer.setLecturerName(res.getString(2));
                        lecturer.setLecturerEmail(res.getString(3));
                        lecturer.setLecturerPassword(res.getString(4));

                        session.setAttribute("lecturer", lecturer);

                        response.sendRedirect("Lecturer-viewclass.jsp");


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
        int id = Integer.parseInt(request.getParameter("lecturerid"));
        String name = request.getParameter("lecturername");
        String password = request.getParameter("lecturerpassword");
        String email = request.getParameter("lectureremail");
        Lecturer lecturer = new Lecturer();

        lecturer.setLecturerId(id);
        lecturer.setLecturerName(name);
        lecturer.setLecturerPassword(password);
        lecturer.setLecturerEmail(email);
        ld.updateUser(lecturer);

        session.removeAttribute("lecturer");
        session.setAttribute("lecturer", lecturer);
        response.sendRedirect("Lecturer - Viewprofile.jsp");
    }



    /*######################################################( DELETE )#############################################################*/

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("lecturerid"));
        ld.deleteUser(id);
        response.sendRedirect("Lecturer - Login.jsp");
    }













}
