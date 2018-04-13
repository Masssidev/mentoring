package net.skhu.dto;

public class Comment {
	int id;
	String c_content;
	String c_post_date;
	int com_u_id;
	int com_a_id;
	int condition;
	String name;
	int art_b_id;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_post_date() {
		return c_post_date;
	}
	public void setC_post_date(String c_post_date) {
		this.c_post_date = c_post_date;
	}
	public int getCom_u_id() {
		return com_u_id;
	}
	public void setCom_u_id(int com_u_id) {
		this.com_u_id = com_u_id;
	}
	public int getCom_a_id() {
		return com_a_id;
	}
	public void setCom_a_id(int com_a_id) {
		this.com_a_id = com_a_id;
	}
	public int getCondition() {
		return condition;
	}
	public void setCondition(int condition) {
		this.condition = condition;
	}
	public int getArt_b_id() {
		return art_b_id;
	}
	public void setArt_b_id(int art_b_id) {
		this.art_b_id = art_b_id;
	}
}
