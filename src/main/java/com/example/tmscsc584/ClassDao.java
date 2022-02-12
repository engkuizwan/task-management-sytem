package com.example.tmscsc584;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;

public class ClassDao {


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


    public void create (Classs classs, Lecturer lecturer) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into class(classname, classsubject, classtotalstudent, lecturerid) values(?,?,?,?)");)
        {
            preparedStatement.setString(1, classs.getClassName());
            preparedStatement.setString(2, classs.getClassSubject());
            preparedStatement.setInt(3, classs.getClassTotalstud());
            preparedStatement.setInt(4, lecturer.getLecturerId());
            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }



    public boolean update(Classs classs) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE class set classname=?,classsubject=?,classtotalstudent=? where classid=?");)
        {
            statement.setString(1, classs.getClassName());
            statement.setString(2, classs.getClassSubject());
            statement.setInt(3, classs.getClassTotalstud());
            statement.setInt(4, classs.getClassId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }


    public boolean delete(Classs classs) throws SQLException {
        boolean rowDeleted;
        boolean rowDeleted2;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from class where classid=?");) {
            statement.setInt(1, classs.getClassId());
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
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
