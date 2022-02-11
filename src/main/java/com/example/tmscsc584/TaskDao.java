package com.example.tmscsc584;

import oracle.jdbc.proxy.annotation.Pre;

import java.sql.*;

import static java.lang.System.out;

public class TaskDao {


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


    public void create (Task task, Classs classs) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into task(taskname, tasktype, taskduedate, taskdescription, classid) values(?,?,?,?,?)");)
        {

            preparedStatement.setString(1, task.getTaskName());
            preparedStatement.setString(2, task.getTaskType());
            preparedStatement.setDate(3, task.getTaskDueDate());
            preparedStatement.setString(4,task.getTaskDesc());
            preparedStatement.setInt(5,classs.getClassId());

            out.println(preparedStatement);
            preparedStatement.executeUpdate();

            PreparedStatement s = connection.prepareStatement("select max(taskid) from task");
            ResultSet res = s.executeQuery();
            while (res.next()){
                task.setTaskId(res.getInt(1));
            }

            PreparedStatement st = connection.prepareStatement
                    ("insert into student_task(studentid) " +
                            "select studentid from class_student where classid=?");
            st.setInt(1,classs.getClassId());
            st.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }





    public boolean update(Task task) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE task set taskname=?,tasktype=?,taskduedate=?, taskdescription=? where taskid=?");)
        {
            statement.setString(1, task.getTaskName());
            statement.setString(2, task.getTaskType());
            statement.setDate(3, task.getTaskDueDate());
            statement.setString(4, task.getTaskDesc());
            statement.setInt(5, task.getTaskId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
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
