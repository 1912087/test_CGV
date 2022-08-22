package com.mycgv2.vo;

public class CgvMemberVO {
	int rno;
	String id, pass, name, gender, email1, email2, email, zonecode, addr1, addr2, address,
		hp, pnum1, pnum2, pnum3, pnumber, hobbylist, intro, mdate;
	String[] hobby;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getEmail() {
		if(email == null) {
			return email1 + "@" + email2;			
		}else {
			return email;
		}
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZonecode() {
		return zonecode;
	}
	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	
	public String getAddress() {
		if(address == null) {
			return "[" + zonecode + "] " + addr1 + " " + addr2;
		}else {
			return address;
		}
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getPnum1() {
		return pnum1;
	}
	public void setPnum1(String pnum1) {
		this.pnum1 = pnum1;
	}
	public String getPnum2() {
		return pnum2;
	}
	public void setPnum2(String pnum2) {
		this.pnum2 = pnum2;
	}
	public String getPnum3() {
		return pnum3;
	}
	public void setPnum3(String pnum3) {
		this.pnum3 = pnum3;
	}
	public String getPnumber() {
		if(pnumber == null) {
			return pnum1 + "-" + pnum2 + "-" + pnum3; 
		}else {			
			return pnumber;
		}
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public String getHobbylist() {
		if(hobbylist == null) {
			return String.join(", ", hobby);
		}else {
			return hobbylist;
		}
	}
	public void setHobbylist(String hobbylist) {
		this.hobbylist = hobbylist;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String[] getHobby() {
		return hobby;
	}
	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	
}
