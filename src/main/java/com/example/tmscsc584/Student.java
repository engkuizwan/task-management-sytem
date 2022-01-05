package com.example.tmscsc584;

public class Student
{
    public String studentId;
    public String studentName;
    public String studentPassword;
    public String studentEmail;

    public Student(String studentId, String studentName, String studentPassword, String studentEmail) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentPassword = studentPassword;
        this.studentEmail = studentEmail;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
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
                "studentId='" + studentId + '\'' +
                ", studentName='" + studentName + '\'' +
                ", studentPassword='" + studentPassword + '\'' +
                ", studentEmail='" + studentEmail + '\'' +
                '}';
    }
}
