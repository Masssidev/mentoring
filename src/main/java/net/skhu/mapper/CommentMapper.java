package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.dto.Article;
import net.skhu.dto.Comment;

@Mapper
public interface CommentMapper {
	Comment findOne(int id);
	List<Comment> findAllByArticle(int com_a_id);
	List<Comment> findAllByUser(int com_u_id);
	int countByArticle(@Param("com_a_id") int com_a_id, @Param("com_u_id") int com_u_id);
	void insert(Comment comment);
	void update(Comment comment);
	void delete(int id);
	Article findBoardId(int id);
}
