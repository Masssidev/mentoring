package net.skhu.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.dto.User;

@Component
public class MyEmailService {

	@Autowired
	FileService fileService;
	@Autowired UserService userService;
	@Autowired
    public JavaMailSender emailSender;

    public void sendSimpleMessage(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        emailSender.send(message);
    }

    public void sendSimpleMessage(User from, String to, String subject, String text) {
    	MimeMessage message = emailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(message);
        try {
            mimeMessageHelper.setSubject(subject);
            mimeMessageHelper.setText(text);
            mimeMessageHelper.setTo(to);
            mimeMessageHelper.setFrom(new InternetAddress(from.getEmail(), from.getName()+" (SKHU SM)"));
            emailSender.send(message);
        } catch (MessagingException messageException) {
            throw new RuntimeException(messageException);
        }catch (Throwable e) {
            e.printStackTrace();
            return;
          }
    }

    public void sendSimpleMessageAllUser(User from, String[] to, String subject, String text) {
    	MimeMessage message = emailSender.createMimeMessage();
        try {
        	MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(message, true);
            mimeMessageHelper.setSubject(subject);
            mimeMessageHelper.setText(text);
            mimeMessageHelper.setTo(to);

            mimeMessageHelper.setFrom(new InternetAddress(from.getEmail(), from.getName()+" (SKHU SM)"));
            emailSender.send(message);
        } catch (MessagingException messageException) {
            throw new RuntimeException(messageException);
        }catch (Throwable e) {
            e.printStackTrace();
            return;
          }
    }

    public void sendMessageWithAttachment(String to, String subject, String text, MultipartFile multipart) {
        MimeMessage message = emailSender.createMimeMessage();

        try{
        	String relPath = fileService.getUploadFilePath(multipart);
        	String fileName = relPath.substring(11);

        	MimeMessageHelper helper = new MimeMessageHelper(message,true);

        	helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text);

            FileSystemResource file = new FileSystemResource(new File(relPath));
            helper.addAttachment(fileName, file);

            emailSender.send(message);
        }catch (MessagingException messageException) {
            throw new RuntimeException(messageException);
        }

    }

    public void sendMessageWithAttachment(User from, String to, String subject, String text, MultipartFile multipart) {
        MimeMessage message = emailSender.createMimeMessage();


        try{
        	String relPath = fileService.getUploadFilePath(multipart);
        	String fileName = relPath.substring(11);

        	MimeMessageHelper helper = new MimeMessageHelper(message,true);

        	helper.setFrom(new InternetAddress(from.getEmail(), from.getName()+" (SKHU SM)"));
        	helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text);

            File tempFile = new File(relPath);

            FileSystemResource file = new FileSystemResource(tempFile);
            helper.addAttachment(fileName, file);

            emailSender.send(message);

            tempFile.delete();
        }catch (MessagingException messageException) {
            throw new RuntimeException(messageException);
        }catch (Throwable e) {
            e.printStackTrace();
            return;
          }

    }

    public void sendMessageWithAttachmentAllUser(User from, String[] to, String subject, String text, MultipartFile multipart) {
        MimeMessage message = emailSender.createMimeMessage();

        try{
        	String relPath = fileService.getUploadFilePath(multipart);
        	String fileName = relPath.substring(11);

        	MimeMessageHelper helper = new MimeMessageHelper(message,true);

        	helper.setFrom(new InternetAddress(from.getEmail(), from.getName()+" (SKHU SM)"));
        	helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text);

            File tempFile = new File(relPath);

            FileSystemResource file = new FileSystemResource(tempFile);
            helper.addAttachment(fileName, file);

            emailSender.send(message);

            tempFile.delete();
        }catch (MessagingException messageException) {
            throw new RuntimeException(messageException);
        }catch (Throwable e) {
            e.printStackTrace();
            return;
          }

    }
}
