package com.mapper;

import com.po.Answer;

public interface AnswerMapper {
	//��Ӵ�
	public  int addAnswer(Answer paramAnswer) throws Exception;
	//ͳ�ƻش�����û��ʵ�֣�
	public Integer countAnsw(Integer paramInteger) throws Exception;
}
