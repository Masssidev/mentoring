package net.skhu.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

import lombok.Data;
import net.skhu.dto.User;

@Data
public class UserRegistrationModel {

	@Size(min=3, max=12)
	String user_id;

	@Size(min=6, max=12)
	String pw;

	@Email
	String email;

	int major_id;
	int status_id;
	String office;
	String office_tel;
	int minor_id;
	int double_id;
	String name;
	String phone;

	public User toUser() {
		User user = new User();
		user.setUser_id(this.user_id);
        user.setPw(this.pw);
        user.setEmail(this.email);
        user.setMajor_id(this.major_id);
        user.setStatus_id(this.status_id);
        user.setOffice(this.office);
        user.setOffice_tel(this.office_tel);
        user.setMinor_id(this.minor_id);
        user.setDouble_id(this.double_id);
        user.setName(this.name);
        user.setPhone(this.phone);
		return user;
	}
}