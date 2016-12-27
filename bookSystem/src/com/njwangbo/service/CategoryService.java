package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Category;

public interface CategoryService {

	/** 
	 * 显示所有分类
	 * @return 分类的集合
	 * @see [类、类#方法、类#成员]
	 */
	public List<Category> showAllCategory();
	
	/** 
	 * 添加一级分类
	 * @param c Category对象
	 * @see [类、类#方法、类#成员]
	 */
	public void addCategorya(Category c);
	
	/** 
	 * 添加二级分类
	 * @param c Category对象
	 * @see [类、类#方法、类#成员]
	 */
	public void addCategoryb(Category c);
	
	/** 
	 * 根据cid删除分类
	 * @param cid 分类编号
	 * @see [类、类#方法、类#成员]
	 */
	public void deleteCategory(String cid);
	
	/** 
	 * 修改一级分类
	 * @param c Category对象
	 * @see [类、类#方法、类#成员]
	 */
	public void updateCategorya(Category c);
	
	/** 
	 * 修改二级分类
	 * @param c Category对象
	 * @see [类、类#方法、类#成员]
	 */
	public void updateCategoryb(Category c);
	
	/** 
	 * 根据cid查找分类
	 * @param cid 分类编号
	 * @return 编号为cid的分类
	 * @see [类、类#方法、类#成员]
	 */
	public Category showCategoryByCid(String cid);
	
	/** 
	 * 根据pid查找分类
	 * @param pid 分类编号
	 * @return 编号为pid的分类
	 * @see [类、类#方法、类#成员]
	 */
	public List<Category> showCategoryByPid(String pid);

}
