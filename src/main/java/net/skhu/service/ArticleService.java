package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.dto.Article;
import net.skhu.mapper.ArticleMapper;
import net.skhu.model.Pagination;

@Service
public class ArticleService {
	@Autowired ArticleMapper articleMapper;

	public List<Article> findAll(Pagination pagination) {
        int count = articleMapper.count(pagination);
        pagination.setRecordCount(count);
        return articleMapper.findAllByBoard(pagination);
    }

}
