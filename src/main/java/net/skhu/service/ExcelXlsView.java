package net.skhu.service;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import net.skhu.utils.ExcelCommonUtil;

@Component
public class ExcelXlsView extends AbstractXlsxView {

	@Override

	public void buildExcelDocument(Map<String, Object> model,

			Workbook workbook,

			HttpServletRequest request,

			HttpServletResponse response) throws Exception {

		new ExcelCommonUtil(workbook, model, response).createExcel();

	}

}