package net.skhu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
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

import net.skhu.dto.Article;
import net.skhu.dto.Checkboxes;
import net.skhu.dto.Comment;
import net.skhu.dto.Email;
import net.skhu.dto.Mentor;
import net.skhu.dto.Report;
import net.skhu.dto.Setting;
import net.skhu.dto.Team;
import net.skhu.dto.TimetableDTO;
import net.skhu.dto.User;
import net.skhu.mapper.ArticleMapper;
import net.skhu.mapper.BoardMapper;
import net.skhu.mapper.CommentMapper;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.FileMapper;
import net.skhu.mapper.MentorMapper;
import net.skhu.mapper.TeamMapper;
import net.skhu.mapper.TimetableMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.model.Pagination;
import net.skhu.service.ArticleService;
import net.skhu.service.FileService;
import net.skhu.service.MyEmailService;
import net.skhu.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserMapper userMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	BoardMapper boardMapper;
	@Autowired
	ArticleMapper articleMapper;
	@Autowired
	MentorMapper mentorMapper;
	@Autowired
	FileMapper fileMapper;
	@Autowired
	TeamMapper teamMapper;
	@Autowired
	CommentMapper commentMapper;
	@Autowired
	TimetableMapper timetableMapper;
	@Autowired
	UserService userService;
	@Autowired
	ArticleService articleService;
	@Autowired
	FileService fileService;
	@Autowired
	MyEmailService emailService;
	Report report = new Report();
	Mentor mentor = new Mentor();

	/*
	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String board(Model model, Pagination pagination) {
		model.addAttribute("board", boardMapper.findOne(pagination.getBd()).getB_name());
		model.addAttribute("article", userService.findAll(pagination));
		return "user/board";
	}
	*/

	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String board(Model model, Pagination pagination, HttpServletResponse response) throws Exception{
		String board = boardMapper.findOne(pagination.getBd()).getB_name();
		System.out.println(board);
		if(board.equals("학습자료게시판")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			Setting setting = userMapper.findSetting();

			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(date);

			if(!((today.compareTo(setting.getSm_start_date()) >= 0) &&
					(today.compareTo(setting.getSm_expire_date()) <= 0 ))) {
				writer.println("<script>alert('멘토링 활동 기간이 아닙니다.');history.back();</script>");
				writer.close();
				return null;
			}
		}

		model.addAttribute("board", board);
		model.addAttribute("article", userService.findAll(pagination));
		return "user/board";
	}

	@RequestMapping("board_detail")
	public String board_detail(Model model, @RequestParam(value = "id") int id, Pagination pagination, HttpServletRequest request) {
		Article article = articleMapper.findOne(id);
		Comment newComment = new Comment();
		String old_url = request.getHeader("referer");
		model.addAttribute("board", boardMapper.findOne(pagination.getBd()).getB_name());
		model.addAttribute("article", article);
		model.addAttribute("comments", commentMapper.findAllByArticle(id));
		model.addAttribute("newComment", newComment);
		model.addAttribute("user", UserService.getCurrentUser().getId());
		model.addAttribute("url", old_url);
		return "user/board_detail";
	}

	@RequestMapping(value = "board_create", method = RequestMethod.GET)
	public String board_create(Model model, Pagination pagination) {
		Article article = new Article();
		model.addAttribute("article", article);
		model.addAttribute("board", boardMapper.findOne(pagination.getBd()).getB_name());
		return "user/board_create";
	}

	@RequestMapping(value = "board_create", method = RequestMethod.POST)
	public String board_create(Model model, Article article, Pagination pagination, @RequestBody MultipartFile file,
			HttpServletRequest request) {
		int id = pagination.getBd();
		userService.createArticle(article, id, file, request);
		long recordCount = articleMapper.count(pagination);
		long pageCount = (recordCount + pagination.getSz() - 1) / pagination.getSz();
		return "redirect:board?bd=" + id + "&pg=" + pageCount;
	}

	@RequestMapping(value = "board_edit", method = RequestMethod.GET)
	public String board_edit(Model model, @RequestParam(value = "id") int id, Pagination pagination) {
		Article article = articleMapper.findOne(id);
		model.addAttribute("article", article);
		model.addAttribute("file", fileService.getFileName(article.getArt_f_id()));
		model.addAttribute("board", boardMapper.findOne(pagination.getBd()).getB_name());
		return "user/board_create";
	}

	@RequestMapping(value = "board_edit", method = RequestMethod.POST)
	public String board_edit(Model model, Article article, Pagination pagination, @RequestParam(value = "id") int id,
			@RequestBody MultipartFile file, HttpServletRequest request) {
		userService.editArticle(article, file, request);
		return "redirect:board_detail?id=" + id + "&" + pagination.getQueryString();
	}

	@RequestMapping("board_delete")
	public String board_delete(Model model, @RequestParam(value = "id") int id, Pagination pagination) {
		articleMapper.delete(id);
		return "redirect:board?" + pagination.getQueryString();
	}


/*
	@RequestMapping(value = "comment_edit", method = RequestMethod.POST)
	public String comment_edit(Model model, @RequestParam(value = "cid") int cid, HttpServletRequest request,
			@RequestParam(value = "id") int id, Pagination pagination) {
		userService.editComment(request, cid);
		return "redirect:board_detail?id=" + id + "&" + pagination.getQueryString();
	}

	@RequestMapping(value = "comment_edit_ajax", method = RequestMethod.POST)
	public @ResponseBody Comment comment_edit_ajax(Model model, @RequestParam(value = "cid") int cid,
			HttpServletRequest request, @RequestParam(value = "id") int id, Pagination pagination) {
		userService.editComment(request, cid);
		Comment comment = commentMapper.findOne(cid);
		return comment;
	}

	@RequestMapping(value = "comment_create", method = RequestMethod.POST)
	public String comment_create(Model model, Comment newComment, @RequestParam(value = "id") int id,
			Pagination pagination) {
		userService.addComment(newComment, id);
		return "redirect:board_detail?id=" + id + "&" + pagination.getQueryString() + "#com";
	}

	@RequestMapping("comment_delete")
	public String comment_delete(Model model, @RequestParam(value = "cid") int cid, Pagination pagination, @RequestParam(value = "id") int id) {
		commentMapper.delete(cid);
		return "redirect:board_detail?id=" + id + "&" + pagination.getQueryString();
	}
*/
	@RequestMapping("comment_delete_mypost")
	public String comment_delete_mypost(Model model, @RequestParam(value = "cid") int cid, Pagination pagination) {
		commentMapper.delete(cid);
		return "redirect:mypost#fh5co-tab-feature-vertical5myReport";
	}

	@RequestMapping("question")
	public String question(Model model, Pagination pagination) {
		model.addAttribute("board", boardMapper.findOne(pagination.getBd()).getB_name());
		model.addAttribute("article", userService.findAll(pagination));
		return "user/question";
	}

	/* 합격 멘토 신청서 목록 출력, 작성자-남하영 */
	@RequestMapping("menteeapply")
	public String menteeapply(Model model, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		Setting setting = userMapper.findSetting();

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);

		if(!((today.compareTo(setting.getMentee_start_date()) >= 0) &&
				(today.compareTo(setting.getMentee_expire_date()) <= 0 ))) {
			writer.println("<script>alert('멘토링 신청 기간이 아닙니다.');history.back();</script>");
			writer.close();
			return null;
		}

		boolean b = false;
		List<Mentor> mentors = mentorMapper.findMentor();
		User user = UserService.getCurrentUser();
		for (int i = 0; i < mentors.size(); i++) {
			mentors.get(i).setState(2); // 신청불가
			if (user.getType() == 1) {
				mentors.get(i).setState(0); // 신청가능
			} else if (user.getType() == 4) {
				List<Team> teams = teamMapper.findTeamByMentor(mentors.get(i).getId());
				for (int j = 0; j < teams.size(); j++) {
					if (user.getId() == teams.get(j).getGroup_mentee_id()) {
						mentors.get(i).setState(1); // 신청취소
						b = true;
					}
				}
			}
			if (!b && mentors.get(i).getMentee_count() == mentors.get(i).getCount())
				mentors.get(i).setState(2);
		}
		model.addAttribute("mentors", mentors);
		return "user/menteeapply";
	}

	@RequestMapping("menteeapply_detail")
	public String menteeapply_detail(Model model, @RequestParam(value = "id") int id) {
		boolean b = false;
		Mentor mentor = mentorMapper.findOne(id);
		User user = UserService.getCurrentUser();
		mentor.setState(2); // 신청불가
		if (user.getType() == 1) {
			mentor.setState(0); // 신청가능
		} else if (user.getType() == 4) {
			List<Team> teams = teamMapper.findTeamByMentor(mentor.getId());
			for (int j = 0; j < teams.size(); j++) {
				if (user.getId() == teams.get(j).getGroup_mentee_id()) {
					b = true;
					mentor.setState(1); // 신청취소
				}
			}
		}
		if (!b && mentor.getMentee_count() == mentor.getCount()) {
			mentor.setState(2);
		}
		model.addAttribute("mentor", mentor);
		return "user/menteeapply_detail";
	}

	@RequestMapping("mentorapply_detail")
	public String mentorapply_detail(Model model, @RequestParam(value = "id") int id) {
		Setting setting = userMapper.findSetting();
		int period=0;

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);

		if( (today.compareTo(setting.getMentor_start_date()) >= 0) &&
				(today.compareTo(setting.getMentor_expire_date()) <= 0 ) ) {
			period=2; //멘토 모집 기간
		}
		model.addAttribute("mentor", mentorMapper.findOne(id));
		model.addAttribute("period", period);
		return "user/mentorapply_detail";
	}

	@RequestMapping("mentorapply_submit")
	public String mentorapply_submit() {
		return "user/mentorapply_submit";
	}

	/* 멘토링 신청서 작성, 작성자-남하영 */
	@RequestMapping(value = "mentorapply", method = RequestMethod.GET)
	public String mentorapply_submit(Model model, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		Setting setting = userMapper.findSetting();

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);

		if(!((today.compareTo(setting.getMentor_start_date()) >= 0) &&
				(today.compareTo(setting.getMentor_expire_date()) <= 0 ))) {
			writer.println("<script>alert('멘토 모집 기간이 아닙니다.');history.back();</script>");
			writer.close();
			return null;
		}

		User user = UserService.getCurrentUser();
		Mentor mentor = mentorMapper.findByMentor_u_id(user.getId());
		if (mentor == null) {
			model.addAttribute("setting", userMapper.findSetting());
			return "user/mentorapply";
		}
		else {
			return "user/mentorapply_submit";
		}
	}

	@RequestMapping(value = "mentorapply", method = RequestMethod.POST)
	public String mentorapply_submit(Model model, HttpServletRequest request, @RequestBody MultipartFile file1,
			@RequestBody MultipartFile file2, @RequestBody MultipartFile file3) {

		User user = UserService.getCurrentUser();
		mentor.setMentor_u_id(user.getId());
		int c = Integer.parseInt(request.getParameter("count"));
		mentor.setCount(c);
		mentor.setGrade(request.getParameter("grade"));
		mentor.setGroup_name(request.getParameter("group_name"));
		mentor.setStudy_content(request.getParameter("study_content"));
		mentor.setStudy_method(request.getParameter("study_method"));
		mentor.setStudy_purpose(request.getParameter("study_purpose"));
		int y = Integer.parseInt(request.getParameter("year"));
		mentor.setYear(y);
		mentor.setSubject(request.getParameter("subject"));

		if (file1 != null && file2 != null && file3 != null) {
			int intro_fk = fileService.fileUpload(file1);
			int t_fk = fileService.fileUpload(file2);
			int doc_fk = fileService.fileUpload(file3);

			mentor.setApply_f_intro_fk(intro_fk);
			mentor.setApply_f_time_id(t_fk);
			mentor.setApply_f_doc_fk(doc_fk);
		}
		mentorMapper.insert_apply(mentor);

		return "redirect:mentorapply_submit#submit";
	}

	/* 멘토링 신청서 수정, 작성자-남하영 */
	@RequestMapping("mentorapply_edit")
	public String mentorapply_edit(Model model, @RequestParam(value = "id") int id) {
		model.addAttribute("mentor", mentorMapper.findOne(id));
		model.addAttribute("setting", userMapper.findSetting());
		return "user/mentorapply_edit";
	}

	@RequestMapping(value = "mentorapply_edit", method = RequestMethod.POST)
	public String mentorapply_edit(Model model, HttpServletRequest request, @RequestBody MultipartFile e_file1,
			@RequestBody MultipartFile e_file2, @RequestBody MultipartFile e_file3) {
		User user = UserService.getCurrentUser();
		Mentor myMentor = mentorMapper.findByMentor_u_id(user.getId());
		mentor.setMentor_u_id(user.getId());
		int c = Integer.parseInt(request.getParameter("count"));
		mentor.setCount(c);
		mentor.setGrade(request.getParameter("grade"));
		mentor.setGroup_name(request.getParameter("group_name"));
		mentor.setStudy_content(request.getParameter("study_content"));
		mentor.setStudy_method(request.getParameter("study_method"));
		mentor.setStudy_purpose(request.getParameter("study_purpose"));
		int y = Integer.parseInt(request.getParameter("year"));
		mentor.setYear(y);
		mentor.setSubject(request.getParameter("subject"));
		if (e_file1.getSize() == 0) {
			mentor.setApply_f_intro_fk(myMentor.getApply_f_intro_fk());
		} else {
			int intro_fk = fileService.fileUpload(e_file1);
			mentor.setApply_f_intro_fk(intro_fk);
		}
		if (e_file2.getSize() == 0)
			mentor.setApply_f_time_id(myMentor.getApply_f_time_id());
		else {
			int t_fk = fileService.fileUpload(e_file2);
			mentor.setApply_f_time_id(t_fk);
		}
		if (e_file3.getSize() == 0)
			mentor.setApply_f_doc_fk(myMentor.getApply_f_doc_fk());
		else {
			int doc_fk = fileService.fileUpload(e_file3);
			mentor.setApply_f_doc_fk(doc_fk);
		}
		mentorMapper.update(mentor);
		return "redirect:mentorapply_submit#submit";
	}

	/* 멘토링 신청서 삭제, 작성자-남하영 */
	@RequestMapping("mentorapply_delete")
	public String mentorapply_delete(@RequestParam(value = "id") int id) {
		mentorMapper.delete(id);
		return "redirect:mypost#apply";
	}

	/* 멘티신청, 작성자-남하영 */
	@RequestMapping("mentee_update")
	public String mentee_update(Model model, @RequestParam(value = "id") int id) {
		Team team = new Team();
		User user = UserService.getCurrentUser();
		if (user.getType() != 4) {
			user.setType(4);
			team.setGroup_m_apply_id(id);
			team.setGroup_mentee_id(user.getId());
			teamMapper.insert(team);
		} else if (user.getType() == 4) {
			user.setType(1);
			teamMapper.deleteMentee(user.getId());
		}
		userMapper.type_update(user);
		return "redirect:menteeapply#select";
	}

	@RequestMapping("mentee_update_detail")
	public String mentee_update_detail(Model model, @RequestParam(value = "id") int id) {
		Team team = new Team();
		User user = UserService.getCurrentUser();
		if (user.getType() != 4) {
			user.setType(4);
			team.setGroup_m_apply_id(id);
			team.setGroup_mentee_id(user.getId());
			teamMapper.insert(team);
		} else if (user.getType() == 4) {
			user.setType(1);
			teamMapper.deleteMentee(user.getId());
		}
		userMapper.type_update(user);
		return "redirect:menteeapply_detail?id=" + id;
	}

	@RequestMapping("mentee_update_mypost")
	public String mentee_update_mypost(Model model, @RequestParam(value = "id") int id) {
		Team team = new Team();
		User user = UserService.getCurrentUser();
		if (user.getType() != 4) {
			user.setType(4);
			team.setGroup_m_apply_id(id);
			team.setGroup_mentee_id(user.getId());
			teamMapper.insert(team);
		} else if (user.getType() == 4) {
			user.setType(1);
			teamMapper.deleteMentee(user.getId());
		}
		userMapper.type_update(user);
		return "redirect:mypost#apply";
	}

	@RequestMapping(value = "timetable", method = RequestMethod.GET)
	public String timetable(Model model, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		Setting setting = userMapper.findSetting();

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);

		if(!((today.compareTo(setting.getSm_start_date()) >= 0) &&
				(today.compareTo(setting.getSm_expire_date()) <= 0 ))) {
			writer.println("<script>alert('멘토링 활동 기간이 아닙니다.');history.back();</script>");
			writer.close();
			return null;
		}

		User user = UserService.getCurrentUser();
		Team team=teamMapper.findTeamByMember(user.getId());
		int time_team = team.getGroup_m_apply_id();
		List<TimetableDTO> timetable = timetableMapper.findAllTeamItem(time_team);
		List<TimetableDTO> mytimetable = timetableMapper.findMyTimeTable(user.getId());

		model.addAttribute("mytimetable", mytimetable);
		model.addAttribute("timetable", timetable);

		return "user/timetable";
	}

	@RequestMapping(value = "timetable", method = RequestMethod.POST)
	public String timetable(Model model, Checkboxes checkboxes, HttpServletRequest request) {

		User user = UserService.getCurrentUser();
		Team team=teamMapper.findTeamByMember(user.getId());
		int time_team = team.getGroup_m_apply_id();

		timetableMapper.delete(time_team, user.getId());

		if (checkboxes.getMon() != null) {
			for (int i = 0; i < checkboxes.getMon().size(); ++i) {
				timetableMapper.insert(1, Integer.parseInt(checkboxes.getMon().get(i)), time_team,user.getId());
			}
		}
		if (checkboxes.getTue() != null) {
			for (int i = 0; i < checkboxes.getTue().size(); ++i) {
				timetableMapper.insert(2, Integer.parseInt(checkboxes.getTue().get(i)), time_team, user.getId());
			}
		}
		if (checkboxes.getWed() != null) {
			for (int i = 0; i < checkboxes.getWed().size(); ++i) {
				timetableMapper.insert(3, Integer.parseInt(checkboxes.getWed().get(i)), time_team, user.getId());
			}
		}
		if (checkboxes.getThu() != null) {
			for (int i = 0; i < checkboxes.getThu().size(); ++i) {
				timetableMapper.insert(4, Integer.parseInt(checkboxes.getThu().get(i)), time_team, user.getId());
			}
		}
		if (checkboxes.getFri() != null) {
			for (int i = 0; i < checkboxes.getFri().size(); ++i) {
				timetableMapper.insert(5, Integer.parseInt(checkboxes.getFri().get(i)), time_team, user.getId());
			}
		}
		List<TimetableDTO> timetable2 = timetableMapper.findAllTeamItem(time_team);
		model.addAttribute("timetable", timetable2);

		return "redirect:timetable#save";
}

	@RequestMapping(value = "report", method = RequestMethod.GET)
	public String report(Model model, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		Setting setting = userMapper.findSetting();

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);

		if(!((today.compareTo(setting.getSm_start_date()) >= 0) &&
				(today.compareTo(setting.getSm_expire_date()) <= 0 ))) {
			writer.println("<script>alert('멘토링 활동 기간이 아닙니다.');history.back();</script>");
			writer.close();
			return null;
		}

		User user = UserService.getCurrentUser();

		List<Report> teamReports = userMapper.findAllReportsById(user.getId());
		Report conditionReports = userMapper.findAllConditionById(user.getId());

		int totalReport = userMapper.findStudyCount();

		model.addAttribute("teamReports", teamReports);
		model.addAttribute("conditionReports", conditionReports);
		model.addAttribute("totalReport", totalReport);
		model.addAttribute("userType", user.getType());
		return "user/report";
	}

	@RequestMapping("report_detail")
	public String report_detail(Model model, @RequestParam("id") int id, HttpServletRequest request) {
		String old_url = request.getHeader("referer");
		Report report = userMapper.findOneReport(id);
		model.addAttribute("report", report);
		model.addAttribute("url", old_url);
		return "user/report_detail";
	}

	@RequestMapping(value = "report_create", method = RequestMethod.GET)
	public String mentorapply(Model model) {
		Report report = new Report();
		model.addAttribute("report", report);
		return "user/report_create";
	}

	@RequestMapping(value = "report_create", method = RequestMethod.POST)
	public String mentorapply(Model model, HttpServletRequest request, @RequestBody MultipartFile file3,
			@RequestBody MultipartFile file4) {

		User user = UserService.getCurrentUser();
		report.setRep_u_id(user.getId());

		report.setSubject(request.getParameter("subject"));
		report.setPlace(request.getParameter("place"));
		report.setDay(request.getParameter("day"));
		report.setStart_time(request.getParameter("start_time"));
		report.setEnd_time(request.getParameter("end_time"));
		report.setStudy_content(request.getParameter("study_content"));

		if (!file3.isEmpty() && !file4.isEmpty()) {
			int f_photo_fk = fileService.fileUpload(file3);
			int f_study_fk = fileService.fileUpload(file4);

			report.setRep_f_photo_id(f_photo_fk);
			report.setRep_f_study_id(f_study_fk);
		}
		mentorMapper.insert_report(report);

		return "redirect:report#report";
	}

	@RequestMapping("mypost")
	public String mypost(Model model, Pagination pagination) {

		//if(UserService.getCurrentUser().getType()==2) model.addAttribute("boards", boardMapper.findAllManager());
		model.addAttribute("boards", boardMapper.findAllNoManager());

		model.addAttribute("board", "내가 쓴 글");
		//model.addAttribute("postBoards", userService.findAllArticleBydUser(pagination));
		model.addAttribute("postReports", userService.findAllReportByUser());
		model.addAttribute("postComments", userService.findAllCommentByUser());

		//하영
		User user = UserService.getCurrentUser();
		Mentor mentor = mentorMapper.findByMentor_u_id(user.getId());
		Setting setting = userMapper.findSetting();
		int period=0;

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);

		if( (today.compareTo(setting.getMentor_start_date()) >= 0) &&
				(today.compareTo(setting.getMentor_expire_date()) <= 0 ) ) {
			period=2; //멘토 모집 기간
		} else if( (today.compareTo(setting.getMentee_start_date()) >= 0) &&
				(today.compareTo(setting.getMentee_expire_date()) <= 0 ) ) {
			period=3; //멘티 모집 기간
		}

		if((today.compareTo(setting.getMentee_start_date()) >= 0) && (user.getType() == 1 || user.getType() == 4)) {
			mentor=null;
		}

		if (mentor != null)
			mentor.setType(user.getType());
		else if (user.getType() == 4) {
			Team team = teamMapper.findTeamByMember(user.getId());
			mentor = mentorMapper.findOne(team.getGroup_m_apply_id());
			mentor.setType(user.getType());
		}

		model.addAttribute("mentor", mentor);
		model.addAttribute("userType", user.getType());
		model.addAttribute("period", period);

		return "user/mypost";
	}

	@RequestMapping(value = "modifyMyReport", method = RequestMethod.GET)
	public String modifyMyReport(Model model, @RequestParam("id") int id) {
		Report report = userMapper.findOneReport(id);
		model.addAttribute("report", report);
		return "user/report_create";
	}

	@RequestMapping(value = "modifyMyReport", method = RequestMethod.POST)
	public String modifyMyReport(Model model, @RequestParam("id") int id, HttpServletRequest request,
			@RequestBody MultipartFile file1, @RequestBody MultipartFile file2) {

		report.setSubject(request.getParameter("subject"));
		report.setPlace(request.getParameter("place"));
		report.setDay(request.getParameter("day"));
		report.setStart_time(request.getParameter("start_time"));
		report.setEnd_time(request.getParameter("end_time"));
		report.setStudy_content(request.getParameter("study_content"));

		int f_photo_fk;
		int f_study_fk;

		if (!file1.isEmpty()) {
			f_photo_fk = fileService.fileUpload(file1);
			report.setRep_f_photo_id(f_photo_fk);
		}
		if (!file2.isEmpty()) {
			f_study_fk = fileService.fileUpload(file2);
			report.setRep_f_study_id(f_study_fk);
		}

		mentorMapper.update_report(id, report);

		return "redirect:mypost#fh5co-tab-feature-vertical6myReport";
	}

	@RequestMapping(value = "deleteMyReport", method = RequestMethod.GET)
	public String deleteMyReport(@RequestParam("id") int id) {
		System.out.println(id);
		mentorMapper.deleteMyReport(id);
		return "redirect:mypost#fh5co-tab-feature-vertical6myReport";
	}

	@RequestMapping(value="sendEmail", method=RequestMethod.GET)
	public String sendEmail(Model model) {
		Email email = new Email();
		model.addAttribute("email", email);
		return "user/sendEmail";
	}

	@RequestMapping(value="searchSendEmail", method=RequestMethod.POST)
	public String searchSendEmail(Model model, Email email, @RequestBody MultipartFile file, HttpServletRequest request) {
		User user = UserService.getCurrentUser();
		String all = request.getParameter("all");
		if(all.equals("no")){
			String to = request.getParameter("to");
			if(file.isEmpty()){
				emailService.sendSimpleMessage(user, to, email.getSubject(), email.getText());
			}
			else{
				emailService.sendMessageWithAttachment(user, to, email.getSubject(), email.getText(), file);
			}
		}
		else{
			if(all.equals("all")){
				if(file.isEmpty()){
					emailService.sendSimpleMessageAllUser(user, userService.findAllEmail(), email.getSubject(), email.getText());
				}
				else{
					emailService.sendMessageWithAttachmentAllUser(user, userService.findAllEmail(), email.getSubject(), email.getText(), file);
				}
			}
			else if(all.equals("manager")){
				if(file.isEmpty()){
					emailService.sendSimpleMessageAllUser(user, userService.findManagerEmail(), email.getSubject(), email.getText());
				}
				else{
					emailService.sendMessageWithAttachmentAllUser(user, userService.findManagerEmail(), email.getSubject(), email.getText(), file);
				}
			}
			else if(all.equals("mentor")){
				if(file.isEmpty()){
					emailService.sendSimpleMessageAllUser(user, userService.findMentorEmail(), email.getSubject(), email.getText());
				}
				else{
					emailService.sendMessageWithAttachmentAllUser(user, userService.findMentorEmail(), email.getSubject(), email.getText(), file);
				}
			}
			else if(all.equals("mentee")){
				if(file.isEmpty()){
					emailService.sendSimpleMessageAllUser(user, userService.findMenteeEmail(), email.getSubject(), email.getText());
				}
				else{
					emailService.sendMessageWithAttachmentAllUser(user, userService.findMenteeEmail(), email.getSubject(), email.getText(), file);
				}
			}
		}

		return "redirect:sendEmail?success";
	}

	@RequestMapping(value="searchEmail", method=RequestMethod.POST)
	public String searchEmail(Model model, HttpServletRequest request) {
		Email email = new Email();
		String type = request.getParameter("type");
		List<User> users;
		if(type.equals("1")) users = userMapper.findByUserName(request.getParameter("search"));
		else if(type.equals("2")) users = userMapper.findByManagerName(request.getParameter("search"));
		else if(type.equals("3")) users = userMapper.findByMentorName(request.getParameter("search"));
		else if(type.equals("4")) users = userMapper.findByMenteeName(request.getParameter("search"));
		else users = userMapper.findByName(request.getParameter("search"));
		model.addAttribute("email", email);
		model.addAttribute("users", users);
		return "user/sendEmail";
	}

	@RequestMapping("meminfo")
	public String meminfo() {
		return "user/meminfo";
	}

	@RequestMapping("mentoring_info")
	public String mentoring_info() {
		return "user/mentoring_info";
	}

	@RequestMapping(value = "meminfo", method = RequestMethod.GET)
	public String meminfo(Model model) {
		model.addAttribute("board", "회원정보 수정");
		model.addAttribute("user", UserService.getCurrentUser());
		return "user/meminfo";
	}

	@RequestMapping(value = "meminfo_processing", method = RequestMethod.POST)
	public String meminfo_processing(Model model, HttpServletRequest request, HttpServletResponse response) {
		User user = userService.changeMeminfo(request);
		if (user == null)
			return "redirect:meminfo?error";
		if (!request.getParameter("newPw").equals("")) {
			UserService.logout(request, response);
			return "redirect:/mybatisEx/guest/login";
		}

		return "redirect:meminfo";
	}

	@RequestMapping(value = "memDrop", method = RequestMethod.GET)
	public String memDrop(Model model, HttpServletRequest request, HttpServletResponse response) {
		userService.memDrop();
		UserService.logout(request, response);
		return "redirect:/mybatisEx/guest/login";
	}

	@RequestMapping("file/download")
	public void download(@RequestParam("id") int id, HttpServletResponse response) throws Exception {
		fileService.fileDownload(id, response);
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

}