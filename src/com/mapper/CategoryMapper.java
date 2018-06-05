package com.mapper;
 
import java.util.List;

import com.model.Category;
 
public interface CategoryMapper {
 
      
    int add(Category category);
       
      
    void delete(int id);
       
      
    Category get(int id);
     
      
    int update(Category category);
       
      
    List<Category> list();
    
      
    int count();
    
    
    
}