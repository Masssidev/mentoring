package net.skhu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.dto.Article;
import net.skhu.dto.Comment;
import net.skhu.dto.Report;
import net.skhu.dto.User;
import net.skhu.mapper.ArticleMapper;
import net.skhu.mapper.BoardMapper;
import net.skhu.mapper.CommentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.model.Pagination;
import net.skhu.utils.Encryption;

@Service
public class UserService {
	@Autowired
	UserMapper userMapper;
	@Autowired
	ArticleMapper articleMapper;
	@Autowired
	BoardMapper boardMapper;
	@Autowired
	CommentMapper commentMapper;
	@Autowired
	FileService fileService;

	public User login(String user_id, String pw) {
		User user = userMapper.findOneByUser_id(user_id);
		if (user == null)
			return null;
		if(user.getCondition()==1)
			return null;
		String password = Encryption.encrypt(pw, Encryption.SHA256);
		if (user.getPw().equals(password) == false)
			return null;
		return user;
	}

	public void join(User user) {
		String pw = Encryption.encrypt(user.getPw(), Encryption.SHA256);
		user.setPw(pw);

		if (user.getDouble_id() == 0 && user.getMinor_id() == 0) {
			userMapper.insertWithDep(user);
		} else {
			if (user.getDouble_id() == 0)
				userMapper.insertWithMinor(user);
			else if (user.getMinor_id() == 0)
				userMapper.insertWithDouble(user);
		}
		return;
	}

	public User changeMeminfo(HttpServletRequest request) {
		User user = UserService.getCurrentUser();
		String pw = Encryption.encrypt(request.getParameter("pw"), Encryption.SHA256);
		if (!(user.getPw().equals(pw))) {
			return null;
		}
		if (!request.getParameter("newPw").equals("")) {
			if (!(request.getParameter("newPw").equals(request.getParameter("newPw2")))) {
				return null;
			}
			user.setPw(Encryption.encrypt(request.getParameter("newPw"), Encryption.SHA256));
		}
		user.setEmail(request.getParameter("email"));
		user.setPhone(request.getParameter("phone"));
		userMapper.update(user);
		return user;
	}

	public void memDrop() {
		User user = UserService.getCurrentUser();
		userMapper.dropUser(user.getId());
		List<Article> articles = articleMapper.findByUser(user.getId());
		for(Article a: articles) {
			articleMapper.delete(a.getId());
		}
	}

	public List<Article> findAll(Pagination pagination) {
		int count = articleMapper.count(pagination);
		pagination.setRecordCount(count);
		List<Article> articles = articleMapper.findAllByBoard(pagination);
		if(pagination.getBd()==3){
			for(Article a: articles){
				a.setCom_count(commentMapper.countByArticle(a.getId(),a.getArt_u_id()));
			}
		}
		return articles;
	}

	public List<Article> findAllByUser(Pagination pagination) {
		User user = UserService.getCurrentUser();
		int count = articleMapper.countByUser(pagination, user.getId());
		pagination.setRecordCount(count);
		List<Article> articles = articleMapper.findAllByBoardAndUser(pagination, user.getId());

		return articles;
	}
/*
	public List<Board> findAllArticleBydUser(Pagination pagination){
		User user = UserService.getCurrentUser();
		int count = articleMapper.countByUser(user.getId(), pagination);
		pagination.setRecordCount(count);
		List<Board> boards;
		if(user.getType()==2) boards = boardMapper.findAllManager();
		else boards = boardMapper.findAllNoManager();
		for(Board board: boards) {
			Post post = new Post();
			post.setB_id(board.getId());
			post.setU_id(user.getId());
			List<Article> articles = articleMapper.findAllByBoardAndUser(user.getId(), pagination);
			board.setArticles(articles);
		}
		return boards;
	}
*/
	public String[] findAllEmail(){
		List<User> users = userMapper.findAll();
		int count = users.size();
		String[] emailList = new String[count];
		int i=0;
		for(User user: users){
			emailList[i] = user.getEmail();
			i++;
		}
		return emailList;
	}

	public String[] findManagerEmail(){
		List<User> users = userMapper.findAllManager("1999-1-1", "9999-12-12");
		int count = users.size();
		String[] emailList = new String[count];
		int i=0;
		for(User user: users){
			emailList[i] = user.getEmail();
			i++;
		}
		return emailList;
	}

	public String[] findMentorEmail(){
		List<User> users = userMapper.findAllMentor("1999-1-1", "9999-12-12");
		int count = users.size();
		String[] emailList = new String[count];
		int i=0;
		for(User user: users){
			emailList[i] = user.getEmail();
			i++;
		}
		return emailList;
	}

	public String[] findMenteeEmail(){
		List<User> users = userMapper.findAllMentee("1999-1-1", "9999-12-12");
		int count = users.size();
		String[] emailList = new String[count];
		int i=0;
		for(User user: users){
			emailList[i] = user.getEmail();
			i++;
		}
		return emailList;
	}

	public List<Report> findAllReportByUser(){
		User user = UserService.getCurrentUser();
		List<Report> reports=userMapper.findAllReportsByWriter(user.getId());
		return reports;
	}

	public List<Comment> findAllCommentByUser(){
		User user = UserService.getCurrentUser();
		List<Comment> comments=userMapper.findAllCommentsByWriter(user.getId());
		return comments;
	}

	public void createArticle(Article article, int type, @RequestBody MultipartFile file, HttpServletRequest request) {
		article.setArt_u_id(UserService.getCurrentUser().getId());
		article.setArt_b_id(type);
		article.setContent(request.getParameter("content"));
		if (!file.isEmpty()) {
			int art_f_id = fileService.fileUpload(file);
			article.setArt_f_id(art_f_id);
			articleMapper.insert(article);
		}
		else {
			articleMapper.insertNoFile(article);
		}
		return;
	}

	public void editArticle(Article article, @RequestBody MultipartFile file, HttpServletRequest request) {
		article.setContent(request.getParameter("content"));
		if (!file.isEmpty()) {
			int art_f_id = fileService.fileUpload(file);
			article.setArt_f_id(art_f_id);
		}
		articleMapper.update(article);
	}

	public void addComment(Comment newComment, int id){
		newComment.setCom_a_id(id);
		newComment.setCom_u_id(UserService.getCurrentUser().getId());
		commentMapper.insert(newComment);
	}

	public void editComment(HttpServletRequest request, int cid){
		Comment comment = new Comment();
		comment.setId(cid);
		comment.setC_content(request.getParameter("c_content"));
		commentMapper.update(comment);
	}

	public static User getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof MyAuthenticationProvider.MyAuthenticaion)
			return ((MyAuthenticationProvider.MyAuthenticaion) authentication).getUser();
		return null;
	}

	public static void setCurrentUser(User user) {
		((MyAuthenticationProvider.MyAuthenticaion) SecurityContextHolder.getContext().getAuthentication())
				.setUser(user);
	}

	public static void logout(HttpServletRequest request, HttpServletResponse response){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
  		if (auth != null){
  			new SecurityContextLogoutHandler().logout(request, response, auth);
  		}
	}
}
