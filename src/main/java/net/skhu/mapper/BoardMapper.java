package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Board;

@Mapper
public interface BoardMapper {
	List<Board> findAll();
	List<Board> findAllManager();
	List<Board> findAllNoManager();
	List<Board> findAllWithArticle();
	Board findOne(int id);
}
