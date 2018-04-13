package net.skhu.controller;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.skhu.config.ExcelConfig;
import net.skhu.dto.Report;
import net.skhu.mapper.UserMapper;

@Controller
@RequestMapping("/report")
public class ExcelController {

	@Autowired
	UserMapper userMapper;

	@GetMapping("excel-xls")
	public ModelAndView xlsView(@RequestParam("id") int id) {
		Report report=userMapper.selectExcelList(id);
		return new ModelAndView("excelXlsView", getDefaultMap(report));
	}

//	@GetMapping("excel-xlsx")
//	public ModelAndView xlsxView() {
//		return new ModelAndView("excelXlsxView", getDefaultMap());
//	}
//
//	@GetMapping("excel-xlsx-streaming")
//	public ModelAndView xlsxStreamingView() {
//		return new ModelAndView("excelXlsxStreamingView", getDefaultMap());
//	}

	private Map<String, Object> getDefaultMap(Report report) {
		Map<String, Object> map = new HashMap<>();
		String title = null;
		try {
			title = new String((report.getGroup_name()+"_"+report.getCreate_date()).getBytes(), "ISO8859_1");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		map.put(ExcelConfig.FILE_NAME, title);
		map.put(ExcelConfig.HEAD, Arrays.asList("조이름", "작성자", "작성일", "스터디주제", "스터디장소", "이번 주 모임 요일", "스터디 시작 시각", "스터디 종료 시각", "스터디 내용"));
		map.put(ExcelConfig.BODY,
				Arrays.asList(
						Arrays.asList(report.getGroup_name(), report.getName(), report.getCreate_date(), report.getSubject(), report.getPlace(), report.getDay(), report.getStart_time(), report.getEnd_time(), report.getStudy_content())
				));
		return map;
	}
}
