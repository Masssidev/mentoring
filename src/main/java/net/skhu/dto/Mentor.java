package net.skhu.dto;

import java.util.List;

public class Mentor{
	int id;
	int mentor_u_id;
	String group_name;
	String subject;
	int year;
	String grade;
	int count;
	String study_purpose;
	String study_content;
	String study_method;
	String open_date;
	int apply_f_time_id;
	int apply_f_intro_fk;
	int apply_f_doc_fk;
	int m_condition;
	String i_path;
	String t_path;
	String d_path;
	String name;
	int user_id;
    List<Report> reports;
    int type;
    int mentee_count;
    int state;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMentor_u_id() {
		return mentor_u_id;
	}

	public void setMentor_u_id(int mentor_u_id) {
		this.mentor_u_id = mentor_u_id;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getStudy_purpose() {
		return study_purpose;
	}

	public void setStudy_purpose(String study_purpose) {
		this.study_purpose = study_purpose;
	}

	public String getStudy_content() {
		return study_content;
	}

	public void setStudy_content(String study_content) {
		this.study_content = study_content;
	}

	public String getStudy_method() {
		return study_method;
	}

	public void setStudy_method(String study_method) {
		this.study_method = study_method;
	}

	public String getOpen_date() {
		return open_date;
	}

	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}

	public int getApply_f_time_id() {
		return apply_f_time_id;
	}

	public void setApply_f_time_id(int apply_f_time_id) {
		this.apply_f_time_id = apply_f_time_id;
	}

	public int getApply_f_intro_fk() {
		return apply_f_intro_fk;
	}

	public void setApply_f_intro_fk(int apply_f_intro_fk) {
		this.apply_f_intro_fk = apply_f_intro_fk;
	}

	public int getApply_f_doc_fk() {
		return apply_f_doc_fk;
	}

	public void setApply_f_doc_fk(int apply_f_doc_fk) {
		this.apply_f_doc_fk = apply_f_doc_fk;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getM_condition() {
		return m_condition;
	}

	public void setM_condition(int m_condition) {
		this.m_condition = m_condition;
	}

	public String getI_path() {
		return i_path;
	}

	public void setI_path(String i_path) {
		this.i_path = i_path;
	}

	public String getT_path() {
		return t_path;
	}

	public void setT_path(String t_path) {
		this.t_path = t_path;
	}

	public String getD_path() {
		return d_path;
	}

	public void setD_path(String d_path) {
		this.d_path = d_path;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public List<Report> getReports() {
		return reports;
	}

	public void setReports(List<Report> reports) {
		this.reports = reports;
	}

	public int getMentee_count() {
		return mentee_count;
	}

	public void setMentee_count(int mentee_count) {
		this.mentee_count = mentee_count;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}