package net.skhu.dto;

public class Report {
	int id;
	String subject;
	String place;
	String day;
	String start_time;
	String end_time;
	String study_content;
	String create_date;
	int rep_f_photo_id;
	int rep_u_id;
	int rep_team_id;
	int rep_f_study_id;
	int condition;
	String group_name;
	int reportCount;
	int totalReportCount;
	String name;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getStudy_content() {
		return study_content;
	}
	public void setStudy_content(String study_content) {
		this.study_content = study_content;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public int getRep_f_photo_id() {
		return rep_f_photo_id;
	}
	public void setRep_f_photo_id(int rep_f_photo_id) {
		this.rep_f_photo_id = rep_f_photo_id;
	}
	public int getRep_u_id() {
		return rep_u_id;
	}
	public void setRep_u_id(int rep_u_id) {
		this.rep_u_id = rep_u_id;
	}
	public int getRep_team_id() {
		return rep_team_id;
	}
	public void setRep_team_id(int rep_team_id) {
		this.rep_team_id = rep_team_id;
	}
	public int getRep_f_study_id() {
		return rep_f_study_id;
	}
	public void setRep_f_study_id(int rep_f_study_id) {
		this.rep_f_study_id = rep_f_study_id;
	}
	public int getCondition() {
		return condition;
	}
	public void setCondition(int condition) {
		this.condition = condition;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public int getTotalReportCount() {
		return totalReportCount;
	}
	public void setTotalReportCount(int totalReportCount) {
		this.totalReportCount = totalReportCount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
