package com.example.tmscsc584;

public class Student
{
    public String studentName;
    public String studentPassword;
    public String studentEmail;

    public Student(String studentName, String studentPassword, String studentEmail) {
        this.studentName = studentName;
        this.studentPassword = studentPassword;
        this.studentEmail = studentEmail;
    }



    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentPassword() {
        return studentPassword;
    }

    public void setStudentPassword(String studentPassword) {
        this.studentPassword = studentPassword;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    @Override
    public String toString() {
        return "classs{" +
                ", studentName='" + studentName + '\'' +
                ", studentPassword='" + studentPassword + '\'' +
                ", studentEmail='" + studentEmail + '\'' +
                '}';
    }
}
