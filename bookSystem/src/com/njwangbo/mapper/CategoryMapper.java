package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Category;


/**
 * <一句话功能简述>
 *  
 * @author 
 * @version  [V1.00, 2016-11-9]
 * @see  [相关类/方法]
 * @since V1.00
 */
public interface CategoryMapper {
	/** 
	 * 显示所有分类
	 * @return 分类的集合
	 * @see [类、类#方法、类#成员]
	 */
	public List<Category> findAllCategory();
	
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
	public Category findCategoryByCid(String cid);
	
	/** 
	 * 根据pid查找分类
	 * @param pid
	 * @return	编号为pid的分类
	 * @see [类、类#方法、类#成员]
	 */
	public List<Category> findCategoryByPid(String pid);

}
