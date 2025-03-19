package chap10;

public class Students {
	public Students() {}
	public Students(String name, int age, int grade, String gender) {
		this.name = name;
		this.age = age;
		this.grade = grade;
		this.gender = gender;
	}
	
	private String name;
	private int age;
	private int grade;
	private String gender;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
