package net.skhu.dto;

public class Team {
	int id;
	int group_m_apply_id;
	int group_mentee_id;
	String group_name;
	int count;//희망 멘티수
	int apply_mentee_count;//신청멘티수
	String open_date;
	String name;//mentor name
	int mentor_u_id;


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGroup_m_apply_id() {
		return group_m_apply_id;
	}
	public void setGroup_m_apply_id(int group_m_apply_id) {
		this.group_m_apply_id = group_m_apply_id;
	}
	public int getGroup_mentee_id() {
		return group_mentee_id;
	}
	public void setGroup_mentee_id(int group_mentee_id) {
		this.group_mentee_id = group_mentee_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getOpen_date() {
		return open_date;
	}
	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getApply_mentee_count() {
		return apply_mentee_count;
	}
	public void setApply_mentee_count(int apply_mentee_count) {
		this.apply_mentee_count = apply_mentee_count;
	}
	public int getMentor_u_id() {
		return mentor_u_id;
	}
	public void setMentor_u_id(int mentor_u_id) {
		this.mentor_u_id = mentor_u_id;
	}

}
