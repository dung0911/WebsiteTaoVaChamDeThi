/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class User {

    private static final long serialVersionUID = 1L;
    private int id;
    private String email;
    private String password;
    private String fullname;
    private String tuoi;
    private String sdt;
    private String gioiTinh;
    private String diaChi;
    private String thumb;
    private int roleId;

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", email=" + email + ", password=" + password + ", fullname=" + fullname + ", tuoi=" + tuoi + ", sdt=" + sdt + ", gioiTinh=" + gioiTinh + ", diaChi=" + diaChi + ", thumb=" + thumb + ", roleId=" + roleId + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getTuoi() {
        return tuoi;
    }

    public void setTuoi(String tuoi) {
        this.tuoi = tuoi;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public User() {
    }

    public User(String fullname, int id) {
        this.id = id;
        this.fullname = fullname;
    }

    public User(String email, String password, String fullname) {
        this.email = email;
        this.password = password;
        this.fullname = fullname;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User(String email, String password, int roleId) {
        this.email = email;
        this.password = password;
        this.roleId = roleId;
    }

    public User(String email, String fullname, String tuoi, String sdt, String gioiTinh, String diaChi) {
        this.email = email;
        this.fullname = fullname;
        this.tuoi = tuoi;
        this.sdt = sdt;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
    }

    public User(String email, String fullname, String tuoi, String sdt, String gioiTinh, String diaChi, int roleId) {
        this.email = email;
        this.fullname = fullname;
        this.tuoi = tuoi;
        this.sdt = sdt;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
        this.roleId = roleId;
    }

    public User(int id, String email, String fullname, String tuoi, String sdt, String gioiTinh, String diaChi, String thumb, int roleId) {
        this.id = id;
        this.email = email;
        this.fullname = fullname;
        this.tuoi = tuoi;
        this.sdt = sdt;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
        this.thumb = thumb;
        this.roleId = roleId;
    }

    public User(int id, String email, String password, String fullname, String tuoi, String sdt, String gioiTinh, String diaChi, String thumb, int roleId) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.tuoi = tuoi;
        this.sdt = sdt;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
        this.thumb = thumb;
        this.roleId = roleId;
    }

}
