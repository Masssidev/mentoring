package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.dto.Comment;
import net.skhu.dto.Report;
import net.skhu.dto.Setting;
import net.skhu.dto.User;
import net.skhu.model.Option;
import net.skhu.model.ReportPagination;

@Mapper
public interface UserMapper {
	User findOneByUser_id(String user_id);

	User findOneById(int id);

	List<User> findAll();

	List<User> findAllManager(String startKeyword, String endKeyword);

	List<User> findAllMentor(String startKeyword, String endKeyword);

	List<User> findAllMentee(String startKeyword, String endKeyword);

	List<User> findAllUser(String startKeyword, String endKeyword);

	List<User> findByName(String keyword);

	List<User> findByUserName(String keyword);

	List<User> findByManagerName(String keyword);

	List<User> findByMentorName(String keyword);

	List<User> findByMenteeName(String keyword);

	void deleteReport(int id);

	void update(User user);

	void type_update(User user);

	void delete(int id);

	void insertWithDep(User user);

	void insertWithMinor(User user);

	void insertWithDouble(User user);

	void insertWithExcel(User user);

	void m_setting(Setting setting);

	void m_survey(@Param("link") String link, @Param("id") int id);

	Setting findSetting();

	List<Report> findAllWithReports();

	List<Report> findAllCondition();

	List<Report> findAllReports(ReportPagination pagination);

	List<Report> findAllReportsById(int id);

	List<Report> findAllBySearch(String startKeyword, String endKeyword);

	List<Report> findAllReportsByWriter(int id);

	List<Comment> findAllCommentsByWriter(int id);

	Report findAllConditionById(int id);

	Report selectExcelList(int id);

	int findStudyCount();

	int findType(int id);

	String findStartSM();

	Report findOneReport(int id);

	void auth_update(int type, int id);

	List<User> findManagerByTerm(String startKeyword, String endKeyword);

	List<User> findMentorByTerm(String startKeyword, String endKeyword);

	List<User> findMenteeByTerm(String startKeyword, String endKeyword);

	List<User> findUserByTerm(String startKeyword, String endKeyword);

	void dropUser(int id);

    int count(ReportPagination pagination);

	Option[] orderBy = { new Option(0, "팀명"), new Option(1, "빠른작성일"), new Option(2, "최근작성일") };

}
