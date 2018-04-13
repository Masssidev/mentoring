package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Team;

@Mapper
public interface TeamMapper {
	void insert(Team team);
	void delete(int id);
	void deleteMentee(int id);
	List<Team> findTeamByMentor(int id); //멘토 신청서 ID로 가져옴
	Team findTeamByMember(int id); //멤버id로 검색
	List<Team> findAll(String startKeyword, String endKeyword);
	List<Team> findMentoringByName(String keyword);
	int count();
}