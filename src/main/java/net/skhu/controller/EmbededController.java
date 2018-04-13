package net.skhu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Comment;
import net.skhu.mapper.ArticleMapper;
import net.skhu.mapper.CommentMapper;
import net.skhu.model.Pagination;
import net.skhu.service.UserService;

@Controller
@RequestMapping("/embeded")
public class EmbededController {

	@Autowired CommentMapper commentMapper;
	@Autowired UserService userService;
	@Autowired ArticleMapper articleMapper;

	@RequestMapping("comment")
	public String comment(Model model, @RequestParam(value = "id") int id) {
		Comment newComment = new Comment();
		model.addAttribute("comments", commentMapper.findAllByArticle(id));
		model.addAttribute("newComment", newComment);
		model.addAttribute("user", UserService.getCurrentUser().getId());
		return "embeded/comment";
	}

	@RequestMapping(value = "comment_create", method = RequestMethod.POST)
	public String comment_create(Model model, Comment newComment, @RequestParam(value = "id") int id) {
		userService.addComment(newComment, id);
		return "redirect:comment?id="+id;
	}

	@RequestMapping(value = "comment_edit", method = RequestMethod.POST)
	public String comment_edit(Model model, @RequestParam(value = "cid") int cid, HttpServletRequest request,
			@RequestParam(value = "id") int id) {
		userService.editComment(request, cid);
		return "redirect:comment?id=" + id;
	}

	@RequestMapping("comment_delete")
	public String comment_delete(Model model, @RequestParam(value = "cid") int cid, @RequestParam(value = "id") int id) {
		commentMapper.delete(cid);
		return "redirect:comment?id=" + id;
	}

	@RequestMapping(value = "mypostList", method = RequestMethod.GET)
	public String mypostList(Model model, Pagination pagination) {
		model.addAttribute("articles", userService.findAllByUser(pagination));
		return "embeded/mypostList";
	}

	@RequestMapping("mypost_board_delete")
	public String mypost_board_delete(Model model, @RequestParam(value = "id") int id, Pagination pagination) {
		articleMapper.delete(id);
		return "redirect:mypostList?" + pagination.getQueryString();
	}

}
