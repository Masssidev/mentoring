package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.FileDTO;

@Mapper
public interface FileMapper {
	FileDTO findOne(int id);
	List<FileDTO> findAll();
	void fileUpload(FileDTO file);
	void update(FileDTO file);
	void delete(int id);
	String getImage(int id);
}