package com.mapper;

import com.po.Page;
import com.po.Question;
import java.util.List;
import java.util.Map;

public interface QuestionMapper {
	//添加问题
	public int addQuestion(Question paramQuestion) throws Exception;
  
	public List<Question> selectQues(Integer paramInteger) throws Exception;
  
	public List<Question> searchQuesList(Page paramPage);
  //搜索问题
	public List<Question> getQuesBycondtion(Page paramPage);
  
	public Integer searchTotalCount(Page paramPage);
  
	public List<Map<String, Object>> queryQandA(Integer paramInteger);
  
	public int deleteById(Integer paramInteger);
  
	public int updateQuesById(Question paramQuestion) throws Exception;
}
