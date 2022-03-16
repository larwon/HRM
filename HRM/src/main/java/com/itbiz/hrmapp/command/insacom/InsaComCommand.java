package com.itbiz.hrmapp.command.insacom;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface InsaComCommand {
	
	public void execute(SqlSession sqlSession, Model model);

}
