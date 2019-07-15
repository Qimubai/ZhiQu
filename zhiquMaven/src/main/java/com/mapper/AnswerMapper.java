package com.mapper;

import com.po.Answer;

public interface AnswerMapper {
	//添加答案
	public  int addAnswer(Answer paramAnswer) throws Exception;
	//统计回答数（没有实现）
	public Integer countAnsw(Integer paramInteger) throws Exception;
}
