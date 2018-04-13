package net.skhu.service;

import java.io.IOException;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

//import org.springframework.stereotype.Component;

import net.skhu.config.ExcelConfig;

@Component

public class ExcelReadService {

	//Workbook으로 변환 뒤, Stream을 이용하여 Row 갯수 만큼 Domain으로 바꾸고 해당 Stream을 List로 변환
    public <T> List<T> readExcelToList(MultipartFile multipartFile, Function<Row, T> rowFunc) throws IOException, InvalidFormatException {

        final Workbook workbook = readWorkbook(multipartFile);
        final Sheet sheet = workbook.getSheetAt(0); //첫번째 시트 read
        final int rowCount = sheet.getPhysicalNumberOfRows();

        return IntStream
                .range(1, rowCount)
                .mapToObj(rowIndex -> rowFunc.apply(sheet.getRow(rowIndex)))
                .collect(Collectors.toList());

    }

    //File을 Workbook으로 변환하기 전에 엑셀 파일인지 검증
    private Workbook readWorkbook(MultipartFile multipartFile) throws IOException, InvalidFormatException {
        verifyFileExtension(multipartFile);
        return multipartFileToWorkbook(multipartFile);
    }

    private void verifyFileExtension(MultipartFile multipartFile) throws InvalidFormatException {
        if( !isExcelExtension(multipartFile.getOriginalFilename()) ) {
            throw new InvalidFormatException("This file extension is not verify");
        }
    }

    private boolean isExcelExtension(String fileName) {
        return fileName.endsWith(ExcelConfig.XLS) || fileName.endsWith(ExcelConfig.XLSX);
    }

    private boolean isExcelXls(String fileName) {
        return fileName.endsWith(ExcelConfig.XLS);
    }

    private boolean isExcelXlsx(String fileName) {
        return fileName.endsWith(ExcelConfig.XLSX);
    }

    private Workbook multipartFileToWorkbook(MultipartFile multipartFile) throws IOException, InvalidFormatException {
        if( isExcelXls(multipartFile.getOriginalFilename()) ) { //xls
            return new HSSFWorkbook(multipartFile.getInputStream());
        } else { //xlsx
            return new XSSFWorkbook(multipartFile.getInputStream());
        }
    }
}