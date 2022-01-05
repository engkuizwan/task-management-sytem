package com.example.tmscsc584;

public class Classs
{
    public String classId;
    public String classSubject;
    public String className;
    public String classTotalstud;

    public Classs(String classId, String classSubject, String className, String classTotalstud) {
        this.classId = classId;
        this.classSubject = classSubject;
        this.className = className;
        this.classTotalstud = classTotalstud;
    }


    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
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
