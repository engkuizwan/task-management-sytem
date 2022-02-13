package com.example.tmscsc584;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.*;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import java.io.OutputStream;

import static java.lang.System.out;

public class StudentDao {

    String dbURL = "jdbc:postgresql://ec2-34-205-46-149.compute-1.amazonaws.com:5432/d51mek36uogr3v"; //ni url dri heroku database
    String user = "awludfehnzjioi";
    String pass = "09a37687d3b4f8b12b34ff9054fec599f1bbab64c06d01f8e33a5144585076eb";



    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(dbURL, user, pass);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }


    public void signup (Student student) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into student(studentname, studentpassword, studentemail) values(?,?,?)");)
        {
            preparedStatement.setString(1, student.getStudentName());
            preparedStatement.setString(2, student.getStudentPassword());
            preparedStatement.setString(3, student.getStudentEmail());
            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }



    public boolean updateUser(Student student) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE student set studentname=?,studentpassword=?,studentemail=? where studentid=?");)
        {
            statement.setString(1, student.getStudentName());
            statement.setString(2, student.getStudentPassword());
            statement.setString(3, student.getStudentEmail());
            statement.setInt(4, student.getStudentId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }




    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from student where studentid=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public void joinclass(Student student, Classs classs)throws SQLException{

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into class_student(classid, studentid) values(?,?)");)
        {
            preparedStatement.setInt(1, classs.getClassId());
            preparedStatement.setInt(2, student.getStudentId());
            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }

    }


    public boolean quitclass(Classs classs) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from class_student where classid=?");) {
            statement.setInt(1, classs.getClassId());
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public void addwork(Part f, int studentid, int taskid, String status) throws SQLException, FileNotFoundException {

        String FileName=f.getSubmittedFileName();
        File file = new File("src/main/webapp/images/"+ FileName);

        try {
            FileOutputStream fos = new FileOutputStream(file);
            InputStream is = f.getInputStream();

            byte[] data=new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        try (Connection connection = getConnection();

             PreparedStatement preparedStatement = connection.prepareStatement("update student_task set taskwork=?, taskworkname=?, taskstatus=? where studentid=? and taskid=?");)
        {


            FileInputStream fis = new FileInputStream(file);

            preparedStatement.setBinaryStream(1, fis, file.length());
            preparedStatement.setString(2, file.getName());
            preparedStatement.setString(3, status);
            preparedStatement.setInt(4, studentid);
            preparedStatement.setInt(5, taskid);

            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }

    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}
