package day0208;

import java.util.Date;

public class bean_memberInfo {
	
	private String id;
	private String password;
	private String name;
	private Date registerDate;
	private String email;
	private int age;
	
	public String getId() {
		return id;
	}
	public void setId(String val) {
		this.id = val;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String val) {
		this.password = val;
	}
	public String getName() {
		return name;
	}
	public void setName(String val) {
		this.name = val;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date val) {
		this.registerDate = val;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String val) {
		this.email = val;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
