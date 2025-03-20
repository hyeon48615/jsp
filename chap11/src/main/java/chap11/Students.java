package chap11;

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
	private String ssn;
	
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
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	
	public String getBirthInfo(String ssn) {
		return ssn.substring(0,6);
	}
	public String printBirthInfo(String ssn) {
		String year = ssn.substring(0,2);
		if (Integer.parseInt(getSex(ssn)) == 1 || Integer.parseInt(getSex(ssn)) == 2) {
			year = "19" + year;
		} else {
			year = "20" + year;
		}
		String mon = ssn.substring(2,4);
		String day = ssn.substring(4,6);
		return year + "년" + mon + "월" + day + "일";
	}
	public String getSex(String ssn) {
		return ssn.trim().split("-")[1].substring(0,1);
	}
	public String printSex(String ssn) {
		int sex = Integer.parseInt(getSex(ssn));
		if (sex % 2 == 0) {
			return "여자";
		} else {
			return "남자";
		}
	}
	
	// 정적 메서드
	public static String showPersonInfo(String name, int age, String sex) {
		return name + "님은 "	+ age + "세의 " + sex + "입니다.";
	}
}
