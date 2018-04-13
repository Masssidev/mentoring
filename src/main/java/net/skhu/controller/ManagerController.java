package net.skhu.controller;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;

import net.skhu.domain.UserDomain;
import net.skhu.dto.Checkboxes;
import net.skhu.dto.FileDTO;
import net.skhu.dto.Introduce;
import net.skhu.dto.Mentor;
import net.skhu.dto.Report;
import net.skhu.dto.Setting;
import net.skhu.dto.Team;
import net.skhu.dto.User;
import net.skhu.mapper.BoardMapper;
import net.skhu.mapper.CommentMapper;
import net.skhu.mapper.FileMapper;
import net.skhu.mapper.IntroduceMapper;
import net.skhu.mapper.MentorMapper;
import net.skhu.mapper.TeamMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.model.Pagination;
import net.skhu.model.ReportPagination;
import net.skhu.service.ExcelReadService;
import net.skhu.service.FileService;
import net.skhu.service.ManagerService;
import net.skhu.service.ReportService;
import net.skhu.service.UserService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	UserMapper userMapper;
	@Autowired
	FileMapper fileMapper;
	@Autowired
	MentorMapper mentorMapper;
	@Autowired
	IntroduceMapper introduceMapper;
	@Autowired
	TeamMapper teamMapper;
	@Autowired BoardMapper boardMapper;
	@Autowired
	ManagerService managerService;
	@Autowired
	FileService fileservice;
	@Autowired
	ExcelReadService excelReadService;
	@Autowired
	UserService userService;
	@Autowired
	ReportService reportService;
	@Autowired
	CommentMapper commentMapper;

	@RequestMapping(value = "m_introduce_modi", method = RequestMethod.GET)
	public String m_introduce_modi(Model model) {
		List<Introduce> introduces = introduceMapper.findAll();
		model.addAttribute("introduces", introduces);
		model.addAttribute("board", "사업소개 수정");
		return "manager/m_introduce_modi";
	}

	@RequestMapping(value = "m_introduce_modi", method = RequestMethod.POST)
	public String introduce_edit(Model model, @RequestParam(value = "id") int id, HttpServletRequest request) {
		managerService.introduce_edit(id, request);
		return "redirect:m_introduce_modi#introduce";
	}

	@RequestMapping("introduce_delete")
	public String introduce_delete(Model model, @RequestParam(value = "id") int id) {
		introduceMapper.delete(id);
		return "redirect:m_introduce_modi";
	}

	/* 신편입생 등록, 작성자-남하영 */
	@RequestMapping("m_register")
	public String m_register() {
		return "manager/m_register";
	}

	@RequestMapping("m_post")
	public String m_post(Model model) {
		model.addAttribute("board", "내가 쓴 글");
		model.addAttribute("boards", boardMapper.findAllManager());
		//model.addAttribute("postBoards", userService.findAllArticleBydUser());
		model.addAttribute("postReports", userService.findAllReportByUser());
		model.addAttribute("postComments", userService.findAllCommentByUser());
		return "manager/m_post";
	}

	@RequestMapping("comment_delete")
	public String comment_delete(Model model, @RequestParam(value = "cid") int cid, Pagination pagination) {
		commentMapper.delete(cid);
		return "redirect:m_post#fh5co-tab-feature-vertical4com";
	}

	@RequestMapping(value = "m_register", method = RequestMethod.POST)
	public String m_register(@RequestBody MultipartFile file, HttpServletResponse response)
			throws Exception, IOException, InvalidFormatException, org.apache.poi.openxml4j.exceptions.InvalidFormatException {
		List<User> users = excelReadService.readExcelToList(file, UserDomain::rowOf);
		for (int i = 0; i < users.size(); i++) {
			userMapper.insertWithExcel(users.get(i));
		}

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		writer.println("<script>alert('등록되었습니다.');history.back();</script>");
		writer.close();
		return "manager/m_register";
	}

	@RequestMapping("m_survey")
	public String m_survey() {
		return "manager/m_survey";
	}

	@RequestMapping(value = "m_survey", method = RequestMethod.POST)
	public String m_survey(HttpServletRequest request){
		String link = request.getParameter("link");
		int id = userMapper.findSetting().getId();
		userMapper.m_survey(link, id);
		return "manager/m_survey";
	}

	/* 멘토 신청서 목록 출력 , 작성자-남하영 */
	@RequestMapping("m_contact")
	public String m_contact(Model model, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		Setting setting = userMapper.findSetting();
		int period=0;

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);

		if(!((today.compareTo(setting.getMentor_start_date()) >= 0) &&
				(today.compareTo(setting.getMentee_start_date()) < 0 ))) {
			writer.println("<script>alert('멘토 선정 기간이 아닙니다.');history.back();</script>");
			writer.close();
			return null;
		}

		if((today.compareTo(setting.getMentor_start_date()) >= 0) &&
				(today.compareTo(setting.getMentor_expire_date()) <= 0 )) {
			period=2;
		}

		List<Mentor> mentors = mentorMapper.findAll();
		model.addAttribute("mentors", mentors);
		model.addAttribute("period", period);
		return "manager/m_contact";
	}

	/* 멘토 선정 여부 업데이트, 작성자-남하영 */
	/* mentor_apply테이블의 condition을 m_condition으로 변경, team.mentee_id NN 해제 */
	/* 선정된 유저 타입 3으로 변경, 탈락된 유저 타입 1으로 변경, 그룹 생성 */
	@RequestMapping("mentor_update")
	public String mentor_update(Model model, @RequestParam(value = "id") int id, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		Setting setting = userMapper.findSetting();

		Mentor mentor = mentorMapper.findOne(id);
		User user = userMapper.findOneById(mentor.getMentor_u_id());
		if (mentor.getType() == 1) {
			if(teamMapper.count()+1 > setting.getMax_mentor()) {
				writer.println("<script>alert('설정한 최대 멘토 인원수를 넘습니다.');history.back();</script>");
				writer.close();
				return null;
			}
			user.setType(3);
			Team team = new Team();
			team.setGroup_m_apply_id(mentor.getId());
			team.setGroup_mentee_id(mentor.getMentor_u_id());
			teamMapper.insert(team);
		} else if (mentor.getType() == 3) {
			user.setType(1);
			teamMapper.delete(mentor.getId());
		}
		userMapper.type_update(user);
		return "redirect:m_contact#contact";
	}

	@RequestMapping("m_contact_detail")
	public String m_contact_detail(Model model, @RequestParam(value = "id") int id) {
		Setting setting = userMapper.findSetting();
		int period=0;

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);

		if((today.compareTo(setting.getMentor_start_date()) >= 0) &&
				(today.compareTo(setting.getMentor_expire_date()) <= 0 )) {
			period=2;
		}

		model.addAttribute("mentor", mentorMapper.findOne(id));
		model.addAttribute("period", period);
		return "manager/m_contact_detail";
	}

	@RequestMapping("mentor_detail_update")
	public String mentor_detail_update(Model model, @RequestParam(value = "id") int id, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		Setting setting = userMapper.findSetting();

		Mentor mentor = mentorMapper.findOne(id);
		User user = userMapper.findOneById(mentor.getMentor_u_id());
		if (mentor.getType() == 1) {
			if(teamMapper.count()+1 > setting.getMax_mentor()) {
				writer.println("<script>alert('설정한 최대 멘토 인원수를 넘습니다.');history.back();</script>");
				writer.close();
				return null;
			}
			user.setType(3);
			Team team = new Team();
			team.setGroup_m_apply_id(mentor.getId());
			team.setGroup_mentee_id(mentor.getMentor_u_id());
			teamMapper.insert(team);
		} else if (mentor.getType() == 3) {
			user.setType(1);
			teamMapper.delete(mentor.getId());
		}
		userMapper.type_update(user);
		return "redirect:m_contact_detail?id=" + mentor.getId();
	}
	/* 멘토 선정 여부 업데이트 끝 */

	@RequestMapping(value = "m_userManage", method = RequestMethod.GET)
	public String m_userManage(Model model) {
		String startKeyword = null;
		String endKeyword = null;
		String semester = null;
		Calendar current = Calendar.getInstance();
		if (current.get(Calendar.MONTH) + 1 <= 12 && current.get(Calendar.MONTH) + 1 >= 9) {
			startKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-09-01";
			endKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-12-31";
			semester = "2";
		}
		if (current.get(Calendar.MONTH) + 1 <= 7 && current.get(Calendar.MONTH) + 1 >= 3) {
			startKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-03-01";
			endKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-6-30";
			semester = "1";
		}

		List<User> managers = userMapper.findAllManager(startKeyword, endKeyword);
		List<User> mentors = userMapper.findAllMentor(startKeyword, endKeyword);
		List<User> mentees = userMapper.findAllMentee(startKeyword, endKeyword);
		List<User> users = userMapper.findAllUser(startKeyword, endKeyword);

		model.addAttribute("managers", managers);
		model.addAttribute("mentors", mentors);
		model.addAttribute("mentees", mentees);
		model.addAttribute("users", users);
		model.addAttribute("semester", semester);

		return "manager/m_userManage";
	}

	@RequestMapping(value = "m_userManage", method = RequestMethod.POST)
	public String m_userManage(Model model, HttpServletRequest request) {
		String startKeyword = null;
		String endKeyword = null;
		String semester = null;

		Calendar current = Calendar.getInstance();
		if (current.get(Calendar.MONTH) + 1 <= 12 && current.get(Calendar.MONTH) + 1 >= 9) {
			startKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-09-01";
			endKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-12-31";
			semester = "2";
		}
		if (current.get(Calendar.MONTH) + 1 <= 7 && current.get(Calendar.MONTH) + 1 >= 3) {
			startKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-03-01";
			endKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-6-30";
			semester = "1";
		}
		String keyword = request.getParameter("search");
		List<User> SearchUsers = userMapper.findByName(keyword);
		model.addAttribute("SearchUsers", SearchUsers);
		model.addAttribute("keyword", keyword);

		List<User> managers = userMapper.findAllManager(startKeyword, endKeyword);
		List<User> mentors = userMapper.findAllMentor(startKeyword, endKeyword);
		List<User> mentees = userMapper.findAllMentee(startKeyword, endKeyword);
		List<User> users = userMapper.findAllUser(startKeyword, endKeyword);
		model.addAttribute("managers", managers);
		model.addAttribute("mentors", mentors);
		model.addAttribute("mentees", mentees);
		model.addAttribute("users", users);
		model.addAttribute("semester", semester);

		return "manager/m_userManage";

	}

	@RequestMapping("auth_update")
	public String auth_update(@RequestParam("id") int id) {
		int type = userMapper.findType(id);
		userMapper.auth_update(type, id);
		return "redirect:m_userManage";
	}

	@RequestMapping(value = "term_search_user", method = RequestMethod.GET)
	public String term_search_user(Model model, String year, String semester, String keyword) {
		Calendar current = Calendar.getInstance();
		if ("".equals(year))
			year = Integer.toString(current.get(Calendar.YEAR));
		String startKeyword = year;
		String endKeyword = year;
		if (Integer.parseInt(semester) == 1) {
			startKeyword += "-03-01";
			endKeyword += "-06-30";
		} else if (Integer.parseInt(semester) == 2) {
			startKeyword += "-09-01";
			endKeyword += "-12-30";
		}

		model.addAttribute("keyword", keyword);
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);
		if (!"".equals(keyword)) {
			List<User> SearchUsers = userMapper.findByName(keyword);
			model.addAttribute("SearchUsers", SearchUsers);
		}

		List<User> TermSearchManagers = userMapper.findManagerByTerm(startKeyword, endKeyword);
		List<User> TermSearchMentors = userMapper.findMentorByTerm(startKeyword, endKeyword);
		List<User> TermSearchMentees = userMapper.findMenteeByTerm(startKeyword, endKeyword);
		List<User> TermSearchUsers = userMapper.findUserByTerm(startKeyword, endKeyword);

		model.addAttribute("TermSearchManagers", TermSearchManagers);
		model.addAttribute("TermSearchMentors", TermSearchMentors);
		model.addAttribute("TermSearchMentees", TermSearchMentees);
		model.addAttribute("TermSearchUsers", TermSearchUsers);

		return "manager/m_userManage";
	}

	@RequestMapping(value = "term_search_user", method = RequestMethod.POST)
	public String term_search_user2(Model model, String year, String semester, String keyword) {
		Calendar current = Calendar.getInstance();
		if ("".equals(year))
			year = Integer.toString(current.get(Calendar.YEAR));

		model.addAttribute("keyword", keyword);
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);

		return "redirect:term_search_user#userManage";
	}

	@RequestMapping(value = "m_mentoringManage", method = RequestMethod.GET)
	public String m_montoringManage(Model model) {
		String startKeyword = null;
		String endKeyword = null;
		String semester = null;
		Calendar current = Calendar.getInstance();
		if (current.get(Calendar.MONTH) + 1 <= 12 && current.get(Calendar.MONTH) + 1 >= 9) {
			startKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-09-01";
			endKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-12-31";
			semester = "2";
		}
		if (current.get(Calendar.MONTH) + 1 <= 7 && current.get(Calendar.MONTH) + 1 >= 3) {
			startKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-03-01";
			endKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-6-30";
			semester = "1";
		}
		List<Team> teams = teamMapper.findAll(startKeyword, endKeyword);
		model.addAttribute("teams", teams);
		model.addAttribute("semester", semester);
		return "manager/m_mentoringManage";
	}

	@RequestMapping(value = "m_mentoringManage", method = RequestMethod.POST)
	public String m_mentoringManage(Model model, HttpServletRequest request) {
		String startKeyword = null;
		String endKeyword = null;
		String semester = null;
		Calendar current = Calendar.getInstance();
		if (current.get(Calendar.MONTH) + 1 <= 12 && current.get(Calendar.MONTH) + 1 >= 9) {
			startKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-09-01";
			endKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-12-31";
			semester = "2";
		}
		if (current.get(Calendar.MONTH) + 1 <= 7 && current.get(Calendar.MONTH) + 1 >= 3) {
			startKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-03-01";
			endKeyword = Integer.toString(current.get(Calendar.YEAR)) + "-6-30";
			semester = "1";
		}
		String keyword = request.getParameter("mentoringSearch");
		List<Team> searchTeams = teamMapper.findMentoringByName(keyword);
		model.addAttribute("SearchTeams", searchTeams);
		model.addAttribute("keyword", keyword);

		List<Team> teams = teamMapper.findAll(startKeyword, endKeyword);
		model.addAttribute("teams", teams);
		model.addAttribute("semester", semester);

		return "manager/m_mentoringManage";

	}

	@RequestMapping(value = "term_search_mentoring", method = RequestMethod.GET)
	public String term_search_mentoring(Model model, String year, String semester, String keyword) {
		Calendar current = Calendar.getInstance();
		if ("".equals(year))
			year = Integer.toString(current.get(Calendar.YEAR));
		String startKeyword = year;
		String endKeyword = year;
		if (Integer.parseInt(semester) == 1) {
			startKeyword += "-03-01";
			endKeyword += "-06-30";
		} else if (Integer.parseInt(semester) == 2) {
			startKeyword += "-09-01";
			endKeyword += "-12-30";
		}


		model.addAttribute("keyword", keyword);
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);
		if (!"".equals(keyword)) {
			List<Team> searchTeams = teamMapper.findMentoringByName(keyword);
			model.addAttribute("SearchTeams", searchTeams);
		}

		List<Team> teams = teamMapper.findAll(startKeyword, endKeyword);

		model.addAttribute("teams", teams);

		return "manager/m_mentoringManage";
	}

	@RequestMapping(value = "term_search_mentoring", method = RequestMethod.POST)
	public String term_search_mentoring2(Model model, String year, String semester, String keyword) {
		Calendar current = Calendar.getInstance();
		if ("".equals(year))
			year = Integer.toString(current.get(Calendar.YEAR));

		model.addAttribute("keyword", keyword);
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);

		return "redirect:term_search_mentoring#mentoringManage";
	}

	@RequestMapping(value = "m_reportManage", method = RequestMethod.GET)
	public String m_reportManage(Model model, ReportPagination reportPagination) {
		List<Report> teamReports = userMapper.findAllWithReports();
		List<Report> conditionReports = userMapper.findAllCondition();

		int totalReport = userMapper.findStudyCount();
		String startSM = (userMapper.findStartSM()).replaceAll("-", "");

		model.addAttribute("teamReports", teamReports);
		model.addAttribute("conditionReports", conditionReports);
		model.addAttribute("totalReport", totalReport);
		model.addAttribute("startSM", startSM);
		model.addAttribute("list", reportService.findAllReports(reportPagination));
		model.addAttribute("orderBy", reportService.getOrderByOptions());

		return "manager/m_reportManage";
	}

	@RequestMapping(value = "m_reportManage", method = RequestMethod.POST)
	public String m_reportManage2(Model model, ReportPagination reportPagination) {

		return "redirect:m_reportManage?" + reportPagination.getQueryString() + "#fh5co-tab-feature-center3report";
	}

	@RequestMapping(value = "m_searchReport", method = RequestMethod.GET)
	public String m_searchReport(Model model, ReportPagination reportPagination, String year, String semester) {
		List<Report> teamReports = userMapper.findAllWithReports();
		List<Report> conditionReports = userMapper.findAllCondition();
		String startKeyword = year;
		String endKeyword = year;
		if (Integer.parseInt(semester) == 1) {
			startKeyword += "-03-01";
			endKeyword += "-06-30";
		} else {
			startKeyword += "-09-01";
			endKeyword += "-12-30";
		}

		List<Report> searchReports = userMapper.findAllBySearch(startKeyword, endKeyword);

		int totalReport = userMapper.findStudyCount();
		String startSM = (userMapper.findStartSM()).replaceAll("-", "");

		model.addAttribute("teamReports", teamReports);
		model.addAttribute("conditionReports", conditionReports);
		model.addAttribute("totalReport", totalReport);
		model.addAttribute("startSM", startSM);
		model.addAttribute("list", reportService.findAllReports(reportPagination));
		model.addAttribute("orderBy", reportService.getOrderByOptions());
		model.addAttribute("searchReports", searchReports);
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);

		return "manager/m_reportManage";
	}

	@RequestMapping(value = "m_searchReport", method = RequestMethod.POST)
	public String m_searchReport2(Model model, ReportPagination reportPagination, String year, String semester) {
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);

		return "redirect:m_searchReport?" + "#fh5co-tab-feature-center5report";
	}

	@RequestMapping(value = "deleteReport", method = RequestMethod.POST)
	public String deleteReport(Model model, Checkboxes semesterCheckbox, String year, String semester) {
		for (int i = 0; i < semesterCheckbox.getSemesterCheckbox().size(); ++i) {
			userMapper.deleteReport(semesterCheckbox.getSemesterCheckbox().get(i));
		}
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);
		return "redirect:m_searchReport?" + "#fh5co-tab-feature-center5report";
	}

	@RequestMapping(value = "report_detail", method = RequestMethod.GET)
	public String report_detail(Model model, @RequestParam("id") int id, HttpServletRequest request) {
		String old_url = request.getHeader("referer");
		Report report = userMapper.findOneReport(id);
		model.addAttribute("report", report);
		model.addAttribute("url", old_url);
		return "manager/m_report_detail";
	}

	@RequestMapping(value = "m_reportListByMentor", method = RequestMethod.GET)
	public String m_reportListByMentor(Model model, @RequestParam("id") int id) {
		List<Report> teamReports = userMapper.findAllReportsById(id);
		Report conditionReports = userMapper.findAllConditionById(id);

		int totalReport = userMapper.findStudyCount();

		model.addAttribute("teamReports", teamReports);
		model.addAttribute("conditionReports", conditionReports);
		model.addAttribute("totalReport", totalReport);

		return "manager/m_reportListByMentor";
	}

	@RequestMapping("file/download")
	public void download(@RequestParam("id") int id, HttpServletResponse response) throws Exception {
		FileDTO uploadedfile = fileMapper.findOne(id);
		if (uploadedfile == null)
			return;
		String fileName = (uploadedfile.getPath()).substring(11);

		String filePath = (uploadedfile.getPath()).substring(0, 11);

		filePath += fileName;

		Path path = Paths.get(filePath);

		uploadedfile.setData(Files.readAllBytes(path));

		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8") + ";");
		try (BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream())) {
			output.write(uploadedfile.getData());
		}
	}

	@RequestMapping(value = "getImage")
	public ResponseEntity<byte[]> getImage(@RequestParam("id") int id) {

		String fileName = fileMapper.getImage(id);

		Path path = Paths.get(fileName);

		byte[] image = null;
		try {
			image = Files.readAllBytes(path);
			return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(image);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(image);
		}
	}

	@RequestMapping(value = "m_setting", method = RequestMethod.GET)
	public String m_setting(Model model) {
		Setting setting = new Setting();
		model.addAttribute("setting", setting);
		return "manager/m_setting";
	}

	@RequestMapping(value = "m_setting", method = RequestMethod.POST)
	public String m_setting(Model model, Setting setting) {

		userMapper.m_setting(setting);
		model.addAttribute("setting", setting);
		return "manager/m_setting";

	}

}