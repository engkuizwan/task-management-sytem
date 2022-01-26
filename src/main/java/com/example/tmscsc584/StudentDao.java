package com.example.tmscsc584;

import javax.servlet.http.HttpSession;
import java.sql.*;

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

    public Student login (Student student){

        try
        {
            Connection connection = getConnection();
            String sql = "select * from student";

            if (connection != null){

                DatabaseMetaData dm = connection.getMetaData();
                out.println("Driver name: " + dm.getDriverName());
                out.println("Driver version: " + dm.getDriverVersion());
                out.println("Product Name: " + dm.getDatabaseProductName());
                out.println("Product version: " + dm.getDatabaseProductVersion());

                Statement st = connection.createStatement();
                ResultSet res = st.executeQuery(sql);

                while (res.next()){
                    if(student.getStudentName().equals(res.getString("studentname")) && student.getStudentPassword().equals(res.getString("studentpassword")))
                    {
                        return student;

                    }else{
                        Student student1 = new Student(null,null, null);
                        return student1;
                    }
                }

            }

        }catch (SQLException e){
            printSQLException(e);
        }



        return student;
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
