package com.njwangbo.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.CategoryMapper;
import com.njwangbo.po.Category;
import com.njwangbo.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryMapper categoryMapper;
	
	public List<Category> showAllCategory() {
		return categoryMapper.findAllCategory();
	}

	public void addCategorya(Category c) {
		categoryMapper.addCategorya(c);
	}
	
	public void addCategoryb(Category c) {
		categoryMapper.addCategoryb(c);
	}

	public void deleteCategory(String cid) {
		categoryMapper.deleteCategory(cid);
	}

	public void updateCategorya(Category c) {
		categoryMapper.updateCategorya(c);
	}
	
	public void updateCategoryb(Category c) {
		categoryMapper.updateCategoryb(c);
	}

	public Category showCategoryByCid(String cid) {
		return categoryMapper.findCategoryByCid(cid);
	}

	public List<Category> showCategoryByPid(String pid) {
		return categoryMapper.findCategoryByPid(pid);
	}

}
