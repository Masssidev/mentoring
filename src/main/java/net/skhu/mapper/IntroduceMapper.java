package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Introduce;

@Mapper
public interface IntroduceMapper {
	List<Introduce> findAll();
	Introduce findOne(int id);
	void update(Introduce introduce);
	void insert(Introduce introduce);
	void delete(int id);
}
