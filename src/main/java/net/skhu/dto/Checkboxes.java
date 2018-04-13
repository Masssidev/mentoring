package net.skhu.dto;

import java.util.List;

public class Checkboxes {
	List<String> mon;
	List<String> tue;
	List<String> wed;
	List<String> thu;
	List<String> fri;
	List<Integer> teamCheckbox;
	List<Integer> semesterCheckbox;

	public List<String> getMon() {
		return mon;
	}

	public void setMon(List<String> mon) {
		this.mon = mon;
	}

	public List<String> getTue() {
		return tue;
	}

	public void setTue(List<String> tue) {
		this.tue = tue;
	}

	public List<String> getWed() {
		return wed;
	}

	public void setWed(List<String> wed) {
		this.wed = wed;
	}

	public List<String> getThu() {
		return thu;
	}

	public void setThu(List<String> thu) {
		this.thu = thu;
	}

	public List<String> getFri() {
		return fri;
	}

	public void setFri(List<String> fri) {
		this.fri = fri;
	}

	public List<Integer> getTeamCheckbox() {
		return teamCheckbox;
	}

	public void setTeamCheckbox(List<Integer> teamCheckbox) {
		this.teamCheckbox = teamCheckbox;
	}

	public List<Integer> getSemesterCheckbox() {
		return semesterCheckbox;
	}

	public void setSemesterCheckbox(List<Integer> semesterCheckbox) {
		this.semesterCheckbox = semesterCheckbox;
	}

}
