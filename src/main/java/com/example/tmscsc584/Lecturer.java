package com.example.tmscsc584;

public class Lecturer
{
    public String lecturerId;
    public String lecturerName;
    public String lecturerEmail;
    public String lecturerPassword;

    public Lecturer(String lecturerId, String lecturerName, String lecturerEmail, String lecturerPassword) {
        this.lecturerId = lecturerId;
        this.lecturerName = lecturerName;
        this.lecturerEmail = lecturerEmail;
        this.lecturerPassword = lecturerPassword;
    }


    public String getLecturerId() {
        return lecturerId;
    }

    public void setLecturerId(String lecturerId) {
        this.lecturerId = lecturerId;
    }

    public String getLecturerName() {
        return lecturerName;
    }

    public void setLecturerName(String lecturerName) {
        this.lecturerName = lecturerName;
    }

    public String getLecturerEmail() {
        return lecturerEmail;
    }

    public void setLecturerEmail(String lecturerEmail) {
        this.lecturerEmail = lecturerEmail;
    }

    public String getLecturerPassword() {
        return lecturerPassword;
    }

    public void setLecturerPassword(String lecturerPassword) {
        this.lecturerPassword = lecturerPassword;
    }


    @Override
    public String toString() {
        return "Lecturer{" +
                "lecturerId='" + lecturerId + '\'' +
                ", lecturerName='" + lecturerName + '\'' +
                ", lecturerEmail='" + lecturerEmail + '\'' +
                ", lecturerPassword='" + lecturerPassword + '\'' +
                '}';
    }
}
