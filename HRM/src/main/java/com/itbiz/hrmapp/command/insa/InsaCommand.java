package com.itbiz.hrmapp.command.insa;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface InsaCommand {
	
	public Map<String, Object> execute(SqlSession sqlSession, Model model);

}
