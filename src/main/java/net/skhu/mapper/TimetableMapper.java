package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.TimetableDTO;


@Mapper
public interface TimetableMapper {
	void insert(int day, int time, int time_team, int user_id);
	void delete(int time_team, int user_id);
	List<TimetableDTO> findAllTeamItem(int time_team);
	List<TimetableDTO> findMyTimeTable(int user_id);

}