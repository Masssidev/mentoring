package net.skhu.domain;

import org.apache.poi.ss.usermodel.Row;

import net.skhu.dto.User;
import net.skhu.utils.Encryption;

public class UserDomain{

    public static User rowOf(Row row) {
    	User user = new User();

    	user.setUser_id(row.getCell(0).getStringCellValue());
    	String pw = Encryption.encrypt(row.getCell(1).getStringCellValue(), Encryption.SHA256);
    	user.setPw(pw);
    	user.setName(row.getCell(2).getStringCellValue());
    	user.setEmail(row.getCell(3).getStringCellValue());
    	user.setPhone(row.getCell(4).getStringCellValue());
    	user.setType((int)row.getCell(5).getNumericCellValue());
    	user.setMajor_id((int)row.getCell(6).getNumericCellValue());
    	//user.setMinor_id((int)row.getCell(7).getNumericCellValue());
    	//user.setDouble_id((int)row.getCell(8).getNumericCellValue());
    	user.setStatus_id((int)row.getCell(7).getNumericCellValue());

    	return user;
    }
}
