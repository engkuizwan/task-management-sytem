package com.example.tmscsc584;

import java.io.Serializable;

public class Classs implements Serializable
{
    public int classId;
    public String classSubject;
    public String className;
    public String classTotalstud;

    public Classs() {
    }




    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getClassSubject() {
        return classSubject;
    }

    public void setClassSubject(String classSubject) {
        this.classSubject = classSubject;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getClassTotalstud() {
        return classTotalstud;
    }

    public void setClassTotalstud(String classTotalstud) {
        this.classTotalstud = classTotalstud;
    }

    @Override
    public String toString() {
        return "Student{" +
                "classId='" + classId + '\'' +
                ", classSubject='" + classSubject + '\'' +
                ", className='" + className + '\'' +
                ", classTotalstud='" + classTotalstud + '\'' +
                '}';
    }
}
