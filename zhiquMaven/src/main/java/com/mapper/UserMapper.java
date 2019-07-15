package com.mapper;

import com.po.User;
import java.util.List;
import java.util.Map;

public interface UserMapper {
	public int UserRegister(User user) throws Exception;
    //µÇÂ¼
	public  User selectUser(User user) throws Exception;
  
	public List<Map<String, Object>> selectQuesByUname(Integer paramInteger) throws Exception;
  
	public List<Map<String, Object>> queryAnswByUname(Integer paramInteger) throws Exception;
  
	public  User selectUserByName(String paramString) throws Exception;
  
	public  User selectUserById(Integer paramInteger);
  
	public Integer updateUserById(User paramUser);
  
	public Integer deleteUserByName(String paramString);
}
