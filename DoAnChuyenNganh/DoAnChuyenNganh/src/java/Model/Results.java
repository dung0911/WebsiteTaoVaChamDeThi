/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Results {

    private int ketQuaId;
    private String soCauDung;
    private Float diem;
    private String ngayLam;
    private String nguoiLam;
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNguoiLam() {
        return nguoiLam;
    }

    public void setNguoiLam(String nguoiLam) {
        this.nguoiLam = nguoiLam;
    }
    private int examId;

    public Results(String soCauDung, Float diem, String ngayLam, String nguoiLam, String email, int examId) {
        this.soCauDung = soCauDung;
        this.diem = diem;
        this.ngayLam = ngayLam;
        this.nguoiLam = nguoiLam;
        this.email = email;
        this.examId = examId;
    }

    public Results(int ketQuaId, String soCauDung, Float diem, String ngayLam, String nguoiLam, String email, int examId) {
        this.ketQuaId = ketQuaId;
        this.soCauDung = soCauDung;
        this.diem = diem;
        this.ngayLam = ngayLam;
        this.email = email;
        this.nguoiLam = nguoiLam;
        this.examId = examId;
    }

    public String getNgayLam() {
        return ngayLam;
    }

    public void setNgayLam(String ngayLam) {
        this.ngayLam = ngayLam;
    }

    public int getKetQuaId() {
        return ketQuaId;
    }

    public void setKetQuaId(int ketQuaId) {
        this.ketQuaId = ketQuaId;
    }

    public String getSoCauDung() {
        return soCauDung;
    }

    public void setSoCauDung(String soCauDung) {
        this.soCauDung = soCauDung;
    }

    public Float getDiem() {
        return diem;
    }

    public void setDiem(Float diem) {
        this.diem = diem;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }
}
