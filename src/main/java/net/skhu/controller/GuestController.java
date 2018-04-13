package net.skhu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.Introduce;
import net.skhu.dto.Mentor;
import net.skhu.dto.Setting;
import net.skhu.dto.User;
import net.skhu.mapper.FileMapper;
import net.skhu.mapper.IntroduceMapper;
import net.skhu.mapper.MentorMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.service.UserService;

//컨트롤러 만들었으면 중복된것 지우기
@Controller
@RequestMapping("/guest")
public class GuestController {

	@Autowired UserMapper userMapper;
	@Autowired IntroduceMapper introduceMapper;
	@Autowired UserService userService;
	@Autowired MentorMapper mentorMapper;
	@Autowired FileMapper fileMapper;

	@RequestMapping("main")
	public String main(Model model) {
		List<Mentor> mentors = mentorMapper.findMentor();
		model.addAttribute("mentors", mentors);
		model.addAttribute("setting", userMapper.findSetting());
		Setting setting = userMapper.findSetting();
		int period=0;

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);

		try {
		//str1.compareTo(str2) str1<str2일 때 -1리턴
		if(today.compareTo(setting.getMentor_start_date()) < 0) {
			period=1; //준비
		} else if( (today.compareTo(setting.getMentor_start_date()) >= 0) &&
				(today.compareTo(setting.getMentor_expire_date()) <= 0 ) ) {
			period=2; //멘토 모집 기간
		} else if( (today.compareTo(setting.getMentee_start_date()) >= 0) &&
				(today.compareTo(setting.getMentee_expire_date()) <= 0 ) ) {
			period=3; //멘티 모집 기간
		} else if( (today.compareTo(setting.getSm_start_date()) >= 0) &&
				(today.compareTo(setting.getSm_expire_date()) <= 0 ) ) {
			period=4; //멘토링 활동 기간
		} else if( (today.compareTo(setting.getSm_expire_date()) > 0) ){
			period=5; //종료
		}
		} catch (Exception e) {
			period=0;
		}
		model.addAttribute("period", period);
		return "guest/main";
	}

	@RequestMapping("introduce")
	public String introduce(Model model) {
		List<Introduce> introduces = introduceMapper.findAll();
		model.addAttribute("introduces", introduces);
		model.addAttribute("board" ,"사업소개");
		return "guest/introduce";
	}

	@RequestMapping("login")
	public String login(Model model) {
		model.addAttribute("board", "로그인");
		return "guest/login";
	}

	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("board", "회원가입");
		return "guest/join";
	}

	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Model model, User user) {
		if(user.getStatus_id()==2 || user.getStatus_id()==3)
			user.setType(2);
		else
			user.setType(1);

		userService.join(user);
		model.addAttribute("board", "로그인");
		return "redirect:login#login";

	}
}
