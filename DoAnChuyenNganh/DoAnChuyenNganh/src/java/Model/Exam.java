/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Exam {

    private int examId;
    private String examName;
    private String examCode;
    private String examTime;
    private String examDay;
    private String score;
    private String examDesc;
    private int subjectId;

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public String getExamCode() {
        return examCode;
    }

    public void setExamCode(String examCode) {
        this.examCode = examCode;
    }

    public String getExamTime() {
        return examTime;
    }

    public void setExamTime(String examTime) {
        this.examTime = examTime;
    }

    public String getExamDay() {
        return examDay;
    }

    public void setExamDay(String examDay) {
        this.examDay = examDay;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getExamDesc() {
        return examDesc;
    }

    public void setExamDesc(String examDesc) {
        this.examDesc = examDesc;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public Exam(int examId, String examName, String examCode, String examTime, String examDay, String score, String examDesc, int subjectId) {
        this.examId = examId;
        this.examName = examName;
        this.examCode = examCode;
        this.examTime = examTime;
        this.examDay = examDay;
        this.score = score;
        this.examDesc = examDesc;
        this.subjectId = subjectId;
    }

    public Exam(String examName, String examCode, String examTime, String examDay, String score, String examDesc, int subjectId) {
        this.examName = examName;
        this.examCode = examCode;
        this.examTime = examTime;
        this.examDay = examDay;
        this.score = score;
        this.examDesc = examDesc;
        this.subjectId = subjectId;
    }

    public Exam(String examName, String examCode, String examTime, String examDay, String score, String examDesc) {
        this.examName = examName;
        this.examCode = examCode;
        this.examTime = examTime;
        this.examDay = examDay;
        this.score = score;
        this.examDesc = examDesc;
    }
    
    
    public Exam() {

    }
}
