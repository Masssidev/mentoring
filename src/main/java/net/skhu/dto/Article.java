package net.skhu.dto;

public class Article {
	int id;
	String title;
	String content;
	int art_u_id;
	String post_date;
	int art_f_id;
	int art_b_id;
	String userName;
	int com_count;

	public int getCom_count() {
		return com_count;
	}
	public void setCom_count(int com_count) {
		this.com_count = com_count;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getArt_u_id() {
		return art_u_id;
	}
	public void setArt_u_id(int art_u_id) {
		this.art_u_id = art_u_id;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public int getArt_f_id() {
		return art_f_id;
	}
	public void setArt_f_id(int art_f_id) {
		this.art_f_id = art_f_id;
	}
	public int getArt_b_id() {
		return art_b_id;
	}
	public void setArt_b_id(int art_b_id) {
		this.art_b_id = art_b_id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

}
