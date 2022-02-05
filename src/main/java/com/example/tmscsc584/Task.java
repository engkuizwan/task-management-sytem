package com.example.tmscsc584;

import java.io.Serializable;
import java.sql.Date;

public class Task implements Serializable
{
    public String taskId;
    public String taskName;
    public String taskType;
    public Date taskDueDate;
    public String taskDesc;
    public Date taskAssignDate;
    public String taskMarks;
    public String taskStatus;

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    public Date getTaskDueDate() {
        return taskDueDate;
    }

    public void setTaskDueDate(Date taskDueDate) {
        this.taskDueDate = taskDueDate;
    }

    public String getTaskDesc() {
        return taskDesc;
    }

    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
    }

    public Date getTaskAssignDate() {
        return taskAssignDate;
    }

    public void setTaskAssignDate(Date taskAssignDate) {
        this.taskAssignDate = taskAssignDate;
    }

    public String getTaskMarks() {
        return taskMarks;
    }

    public void setTaskMarks(String taskMarks) {
        this.taskMarks = taskMarks;
    }

    public String getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(String taskStatus) {
        this.taskStatus = taskStatus;
    }
}
