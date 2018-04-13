package net.skhu.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.dto.Introduce;
import net.skhu.mapper.IntroduceMapper;

@Service
public class ManagerService {

	@Autowired IntroduceMapper introduceMapper;

	public void introduce_edit(int id, HttpServletRequest request) {
		if(id==0) {
			Introduce introduce = new Introduce();
			introduce.setContent(request.getParameter("content"));
			introduce.setTitle(request.getParameter("title"));
			introduceMapper.insert(introduce);
		}
		else {
			Introduce introduce = introduceMapper.findOne(id);
			introduce.setContent(request.getParameter("content"));
			introduce.setTitle(request.getParameter("title"));
			introduceMapper.update(introduce);
		}
	}
}
