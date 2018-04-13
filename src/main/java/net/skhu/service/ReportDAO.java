package net.skhu.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.skhu.DB;
import net.skhu.dto.Report;

public class ReportDAO {

	public static List<Report> findAll() throws Exception {
		String sql = "SELECT r.*, m.group_name " + "FROM report r left join mentor_apply m ON r.rep_u_id=m.mentor_u_id";
		try (Connection connection = DB.getConnection("sm");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			ArrayList<Report> list = new ArrayList<Report>();
			while (resultSet.next()) {
				Report report = new Report();
				report.setId(resultSet.getInt("id"));
				report.setCreate_date(resultSet.getString("create_date"));
				report.setSubject(resultSet.getString("subject"));
				report.setPlace(resultSet.getString("place"));
				report.setGroup_name(resultSet.getString("group_name"));
				list.add(report);
			}

			return list;
		}
	}

	public static Report findOne(int id) throws Exception {
		String sql = "SELECT r.*, u.name " + "FROM report r left join user u on r.rep_u_id=u.id where r.id=?";
		try (Connection connection = DB.getConnection("sm");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					Report report = new Report();
					report.setId(resultSet.getInt("id"));
					report.setCreate_date(resultSet.getString("create_date"));
					report.setSubject(resultSet.getString("subject"));
					report.setPlace(resultSet.getString("place"));
					report.setDay(resultSet.getString("day"));
					report.setStart_time(resultSet.getString("start_time"));
					report.setEnd_time(resultSet.getString("end_time"));
					report.setStudy_content(resultSet.getString("study_content"));
					report.setName(resultSet.getString("name"));
					return report;
				}
			}
			return null;
		}
	}
}
