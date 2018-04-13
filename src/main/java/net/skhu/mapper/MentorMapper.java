package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Mentor;
import net.skhu.dto.Report;

@Mapper
public interface MentorMapper {
	Mentor findOne(int id);
	Mentor findByMentor_u_id(int mentor_u_id);
	List<Mentor> findMentor();
	List<Mentor> findAll();
	void update(Mentor mentor);
	void update_m_condition(Mentor mentor);
	void delete(int id);
	void insert_apply(Mentor mentor);
	void insert_report(Report report);
	void update_report(int id, Report report);
	void deleteMyReport(int id);
}