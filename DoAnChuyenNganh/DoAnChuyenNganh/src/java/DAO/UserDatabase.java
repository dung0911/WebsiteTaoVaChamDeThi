/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Subject;
import Model.Exam;
import Model.Quiz;
import Model.Results;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class UserDatabase {

    Connection con;

    //-----------------------------------Connect Db-------------------------------------
    //
    //
    //
    public UserDatabase(Connection con) {
        this.con = con;
    }

    //-----------------------------------Sign In----------------------------------------
    //
    //
    //
    //for register user 
    public boolean saveUser(User user) {
        boolean set = false;
        try {
            //Insert register data to database
            String sql = "INSERT INTO accounts" + "  (email, password, fullname) VALUES " + " (?, ?, ?);";

            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullname());

            statement.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = "select * from accounts where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

//             data from db
                String fullname = set.getString("fullname");
//             set to user object
                user.setFullname(fullname);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setTuoi(set.getString("tuoi"));
                user.setGioiTinh(set.getString("gioiTinh"));
                user.setDiaChi(set.getString("diaChi"));
                user.setSdt(set.getString("sdt"));
                user.setThumb(set.getString("thumb"));
                user.setRoleId(set.getInt("roleId"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    //    Login, Get User
    public String authenticateUser(User user) {
        String email = user.getEmail();
        String password = user.getPassword();

        String fullname = user.getFullname();
        String sdt = user.getSdt();
        String tuoi = user.getTuoi();
        String gioiTinh = user.getGioiTinh();
        String diaChi = user.getDiaChi();
        String thumb = user.getThumb();

        Statement statement = null;
        ResultSet resultSet = null;

        String emailDB = "";
        String passwordDB = "";
        String roleIdDB = "";

        PreparedStatement pstm;
        try {
            Connection con = ConnectionPro.getConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select email,password,roleId from accounts");

            while (resultSet.next()) {
                emailDB = resultSet.getString("email");
                passwordDB = resultSet.getString("password");
                roleIdDB = resultSet.getString("roleId");

                if (email.equals(emailDB) && password.equals(passwordDB) && roleIdDB.equals("1")) {
                    return "Admin_Role";
                } else if (email.equals(emailDB) && password.equals(passwordDB) && roleIdDB.equals("2")) {
                    return "User_Role";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }

    //-----------------------------------Subject----------------------------------------
    //
    // 
    //
    public boolean addsubject(Subject subject) {
        boolean test = false;

        try {
            String query = "insert into subjects (subjectName) values(?)";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, subject.getSubjectName());
            pst.executeUpdate();
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

    //    retrieve the subject details from databse
    public List<Subject> getAllsubjects() {
        List<Subject> subject = new ArrayList<>();

        try {

            String query = "select * from subjects";
            PreparedStatement pt = this.con.prepareStatement(query);

            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int subjectId = rs.getInt("subjectId");
                String subjectName = rs.getString("subjectName");

                Subject row = new Subject(subjectId, subjectName);
                subject.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return subject;
    }

    //    eidt subject information
    public boolean editsubjectInfo(Subject subject) {
        boolean test = false;
        try {
            String query = "update subjects set subjectName=? where subjectId=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, subject.getSubjectName());
            pt.setInt(2, subject.getSubjectId());

            pt.executeUpdate();

            test = true;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return test;
    }

    //    get single subject information in edit page
    public Subject getSinglesubject(int id) {
        Subject bk = null;

        try {
            String query = "select * from subjects where subjectId=? ";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int subjectId = rs.getInt("subjectId");
                String subjectName = rs.getString("subjectName");
                bk = new Subject(subjectId, subjectName);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return bk;
    }

    //    delete subjects from database
    public void deletesubject(int subjectId) {
        try {
            String query = "delete from subjects where subjectId=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, subjectId);
            pt.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //-----------------------------------Account-----------------------------------------
    //
    // 
    //    eidt subject information
    public boolean editAccountInfo(User subject) {
        boolean test = false;
        try {
            String query = "update accounts set email=?, fullname=?, tuoi=?, sdt=?, gioiTinh=?, diaChi=?,  roleId=? where id=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, subject.getEmail());
            pt.setString(2, subject.getFullname());
            pt.setString(3, subject.getTuoi());
            pt.setString(4, subject.getSdt());
            pt.setString(5, subject.getGioiTinh());
            pt.setString(6, subject.getDiaChi());
            pt.setInt(7, subject.getRoleId());

            pt.setInt(8, subject.getId());

            pt.executeUpdate();

            test = true;

        } catch (Exception ex) {
            ex.printStackTrace();;
        }
        return test;
    }

    //    get single subject information in edit page
    public User getSingleaccount(int accountId) {
        User bk = null;

        try {
            String query = "select * from accounts where id=? ";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, accountId);
            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String fullname = rs.getString("fullname");
                String tuoi = rs.getString("tuoi");
                String gioiTinh = rs.getString("gioiTinh");
                String diaChi = rs.getString("diaChi");
                String sdt = rs.getString("sdt");
                String thumb = rs.getString("thumb");
                int roleId = rs.getInt("roleId");

                bk = new User(id, email, fullname, tuoi, sdt, gioiTinh, diaChi, thumb, roleId);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return bk;
    }

    //    delete subjects from database
    public void deleteAccount(int accountId) {
        try {
            String query = "delete from accounts where id=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, accountId);
            pt.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public List<User> getAllAccounts() {
        List<User> account = new ArrayList<>();

        try {
            String query = "select * from accounts";
            PreparedStatement pt = this.con.prepareStatement(query);

            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String fullname = rs.getString("fullname");
                String tuoi = rs.getString("tuoi");
                String sdt = rs.getString("sdt");
                String gioiTinh = rs.getString("gioiTinh");
                String diaChi = rs.getString("diaChi");
                String thumb = rs.getString("thumb");
                int roleId = rs.getInt("roleId");

                User row = new User(id, email, fullname, tuoi, sdt, gioiTinh, diaChi, thumb, roleId);
                account.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }

    //-----------------------------------Test Examination ----------------------------------------
    // 
    //
    //
    public boolean addExam(Exam exam) {
        boolean test = false;

        try {
            String query = "insert into exam(examName, examCode, examTime, examDay, score, examDesc, subjectId) values (?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement pst = this.con.prepareStatement(query);

            pst.setString(1, exam.getExamName());
            pst.setString(2, exam.getExamCode());
            pst.setString(3, exam.getExamTime());
            pst.setString(4, exam.getExamDay());
            pst.setString(5, exam.getScore());
            pst.setString(6, exam.getExamDesc());
            pst.setInt(7, exam.getSubjectId());

            pst.executeUpdate();
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

    //    retrieve the exam details from databse
    public List<Exam> getAllExams() {

        List<Exam> exam = new ArrayList<>();

        try {

            String query = "select * from exam";
            PreparedStatement pt = this.con.prepareStatement(query);

            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int examId = rs.getInt("examId");
                String examName = rs.getString("examName");
                String examCode = rs.getString("examCode");
                String examTime = rs.getString("examTime");
                String examDay = rs.getString("examDay");
                String score = rs.getString("score");
                String examDesc = rs.getString("examDesc");
                int subjectId = rs.getInt("subjectId");

                Exam row = new Exam(examId, examName, examCode, examTime, examDay, score, examDesc, subjectId);
                exam.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return exam;
    }

    //    eidt exam information
    public boolean editTestInfo(Exam exam) {
        boolean test = false;
        try {
            String query = "update exam set examName = ?, examCode = ?, examTime= ?, examDay = ?, score = ?, examDesc = ?, subjectId = ? where examId=?";
            PreparedStatement pt = this.con.prepareStatement(query);

            pt.setString(1, exam.getExamName());
            pt.setString(2, exam.getExamCode());
            pt.setString(3, exam.getExamTime());
            pt.setString(4, exam.getExamDay());
            pt.setString(5, exam.getScore());
            pt.setString(6, exam.getExamDesc());
            pt.setInt(7, exam.getSubjectId());
            pt.setInt(8, exam.getExamId());

            pt.executeUpdate();

            test = true;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return test;
    }

    //    get single exam information in edit page
    public Exam getSingleExam(int id) {
        Exam bk = null;

        try {
            String query = "select * from exam where examId=? ";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int examId = rs.getInt("examId");
                String examName = rs.getString("examName");
                String examCode = rs.getString("examCode");
                String examTime = rs.getString("examTime");
                String examDay = rs.getString("examDay");
                String score = rs.getString("score");
                String examDesc = rs.getString("examDesc");
                int subjectId = rs.getInt("subjectId");

                bk = new Exam(examId, examName, examCode, examTime, examDay, score, examDesc, subjectId);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return bk;
    }

    //    delete exam from database
    public void deleteExam(int examId) {
        try {
            String query = "delete from exam where examId=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, examId);
            pt.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public List<Exam> getAllExamsBySubject(int courseExam) {

        List<Exam> exam = new ArrayList<>();

        try {

            String query = "select * from exam where subjectId = ?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, courseExam);

            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int examId = rs.getInt("examId");
                String examName = rs.getString("examName");
                String examCode = rs.getString("examCode");
                String examTime = rs.getString("examTime");
                String examDay = rs.getString("examDay");
                String score = rs.getString("score");
                String examDesc = rs.getString("examDesc");
                int subjectId = rs.getInt("subjectId");

                Exam row = new Exam(examId, examName, examCode, examTime, examDay, score, examDesc, subjectId);
                exam.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return exam;
    }

    //-----------------------------------Quiz----------------------------------------
    //
    //
    //
    //
    public void delQuiz(int qId) {
        try {
            String query = "delete from quiz where quizId=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, qId);
            pt.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public boolean addQuiz(Quiz exam) {
        boolean test = false;

        try {
            String query = "insert into quiz(quiz, answer1, answer2, answer3, answer4, correct, examId) values (?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement pst = this.con.prepareStatement(query);

            pst.setString(1, exam.getQuiz());
            pst.setString(2, exam.getAnswer1());
            pst.setString(3, exam.getAnswer2());
            pst.setString(4, exam.getAnswer3());
            pst.setString(5, exam.getAnswer4());
            pst.setString(6, exam.getCorrect());
            pst.setInt(7, exam.getExamId());

            pst.executeUpdate();
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

    public List<Quiz> getAllQuiz() {

        List<Quiz> exam = new ArrayList<>();

        try {

            String query = "select * from quiz";
            PreparedStatement pt = this.con.prepareStatement(query);

            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int quizId = rs.getInt("quizId");
                String quiz = rs.getString("quiz");
                String answer1 = rs.getString("answer1");
                String answer2 = rs.getString("answer2");
                String answer3 = rs.getString("answer3");
                String answer4 = rs.getString("answer4");
                String correct = rs.getString("correct");
                int examId = rs.getInt("examId");

                Quiz row = new Quiz(quizId, quiz, answer1, answer2, answer3, answer4, correct, examId);
                exam.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return exam;
    }

    public List<Quiz> getAllQuestions(int courseId) {
        List<Quiz> exam = new ArrayList<>();

        try {

            String query = "select * from quiz where examId = ?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, courseId);

            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int quizId = rs.getInt("quizId");
                String quiz = rs.getString("quiz");
                String answer1 = rs.getString("answer1");
                String answer2 = rs.getString("answer2");
                String answer3 = rs.getString("answer3");
                String answer4 = rs.getString("answer4");
                String correct = rs.getString("correct");
                int examId = rs.getInt("examId");

                Quiz row = new Quiz(quizId, quiz, answer1, answer2, answer3, answer4, correct, examId);
                exam.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return exam;
    }

    public boolean addResult(Results result) {
        boolean test = false;

        try {
            String query = "insert into results(soCauDung, diem, ngayLam,nguoiLam,email, examId) values (?, ?, ?, ?, ?, ?);";
            PreparedStatement pst = this.con.prepareStatement(query);

            pst.setString(1, result.getSoCauDung());
            pst.setFloat(2, result.getDiem());
            pst.setString(3, result.getNgayLam());
            pst.setString(4, result.getNguoiLam());
            pst.setString(5, result.getEmail());
            pst.setInt(6, result.getExamId());

            pst.executeUpdate();
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

//    public List<Results> getAllResult(int courseId) {
//        List<Results> exam = new ArrayList<>();
//
//        try {
//
//            String query = "select * from results where ketQuaId = ?";
//            PreparedStatement pt = this.con.prepareStatement(query);
//            pt.setInt(1, courseId);
//
//            ResultSet rs = pt.executeQuery();
//
//            while (rs.next()) {
//                int ketQuaId = rs.getInt("ketQuaId");
//                String soCauDung = rs.getString("soCauDung");
//                String diem = rs.getString("diem");
//                String ngayLam = rs.getString("ngayLam");
//                int examId = rs.getInt("examId");
//
//                Results row = new Results(ketQuaId, soCauDung, diem, ngayLam, examId);
//                exam.add(row);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return exam;
//    }
    public List<Results> getAllResultInAdmin() {

        List<Results> exam = new ArrayList<>();

        try {

            String query = "select * from results";
            PreparedStatement pt = this.con.prepareStatement(query);

            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int ketQuaId = rs.getInt("ketQuaId");
                String soCauDung = rs.getString("soCauDung");
                Float diem = rs.getFloat("diem");
                String ngayLam = rs.getString("ngayLam");
                String nguoiLam = rs.getString("nguoiLam");
                String email = rs.getString("email");
                int examId = rs.getInt("examId");

                Results row = new Results(ketQuaId, soCauDung, diem, ngayLam, nguoiLam, email, examId);
                exam.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return exam;
    }

    public void delResult(int qId) {
        try {
            String query = "delete from results where ketQuaId=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, qId);
            pt.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public Results getSingleResult(int id) {
        Results bk = null;

        try {
            String query = "select * from results where ketQuaId=? ";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int ketQuaId = rs.getInt("ketQuaId");
                String soCauDung = rs.getString("soCauDung");
                Float diem = rs.getFloat("diem");
                String ngayLam = rs.getString("ngayLam");
                String nguoiLam = rs.getString("nguoiLam");
                String email = rs.getString("email");
                int examId = rs.getInt("examId");

                bk = new Results(ketQuaId, soCauDung, diem, ngayLam, nguoiLam, email, examId);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return bk;
    }
}
