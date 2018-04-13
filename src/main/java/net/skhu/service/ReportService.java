package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.dto.Report;
import net.skhu.mapper.UserMapper;
import net.skhu.model.Option;
import net.skhu.model.ReportPagination;

@Service
public class ReportService {
	@Autowired
	UserMapper userMapper;

	public Report findOne(int id) {
		return userMapper.findOneReport(id);
	}

	public List<Report> findAllReports(ReportPagination pagination) {
		int count = userMapper.count(pagination);
		pagination.setRecordCount(count);
		return userMapper.findAllReports(pagination);
	}

	public Option[] getOrderByOptions() {
		return UserMapper.orderBy;
	}

}
