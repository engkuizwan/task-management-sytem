package com.example.tmscsc584;

import java.io.Serializable;

public class Lecturer implements Serializable
{
    public int lecturerId;
    public String lecturerName;
    public String lecturerEmail;
    public String lecturerPassword;

    public Lecturer() {
    }

    public Lecturer(int lecturerId, String lecturerName, String lecturerEmail, String lecturerPassword) {
        this.lecturerId = lecturerId;
        this.lecturerName = lecturerName;
        this.lecturerEmail = lecturerEmail;
        this.lecturerPassword = lecturerPassword;
    }


    public int getLecturerId() {
        return lecturerId;
    }

    public void setLecturerId(int lecturerId) {
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
