package com.example.tmscsc584;

public class Task
{
    public String taskId;
    public String taskName;
    public String taskDesc;
    public String taskAssignDate;
    public String taskDueDate;
    public String taskMarks;
    public String taskStatus;
    public String taskType;

    public Task(String taskId, String taskName, String taskDesc, String taskAssignDate, String taskDueDate, String taskMarks, String taskStatus, String taskType) {
        this.taskId = taskId;
        this.taskName = taskName;
        this.taskDesc = taskDesc;
        this.taskAssignDate = taskAssignDate;
        this.taskDueDate = taskDueDate;
        this.taskMarks = taskMarks;
        this.taskStatus = taskStatus;
        this.taskType = taskType;
    }


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

    public String getTaskDesc() {
        return taskDesc;
    }

    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
    }

    public String getTaskAssignDate() {
        return taskAssignDate;
    }

    public void setTaskAssignDate(String taskAssignDate) {
        this.taskAssignDate = taskAssignDate;
    }

    public String getTaskDueDate() {
        return taskDueDate;
    }

    public void setTaskDueDate(String taskDueDate) {
        this.taskDueDate = taskDueDate;
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

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    @Override
    public String toString() {
        return "Task{" +
                "taskId='" + taskId + '\'' +
                ", taskName='" + taskName + '\'' +
                ", taskDesc='" + taskDesc + '\'' +
                ", taskAssignDate='" + taskAssignDate + '\'' +
                ", taskDueDate='" + taskDueDate + '\'' +
                ", taskMarks='" + taskMarks + '\'' +
                ", taskStatus='" + taskStatus + '\'' +
                ", taskType='" + taskType + '\'' +
                '}';
    }
}
