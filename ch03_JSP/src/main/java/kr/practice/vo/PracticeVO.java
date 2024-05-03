package kr.practice.vo;

import java.sql.Date;

public class PracticeVO {
	// 프로퍼티
	private int num;
	private String id;
	private String name;
	private String pw;
	private Date reg_date;
	
	public boolean isCheckedPassword(String userPasswd) {
		if(pw.equals(userPasswd)) { // 비밀번호 일치
			return true;
		} 
		// 비밀번호 불일치
		return false;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
		
}
