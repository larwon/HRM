package com.itbiz.hrmapp.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itbiz.hrmapp.command.insacom.InsaComViewCommand;

@Controller
public class InsaComController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private InsaComViewCommand insaComViewCommand;
	
	@Autowired
	private void setCommand(InsaComViewCommand insaComViewCommand) {
		this.insaComViewCommand = insaComViewCommand;
	}
	
	@RequestMapping(value = "insaInputForm.do", method = RequestMethod.GET)
	public String insaComTable(Model model) {
		insaComViewCommand.execute(sqlSession, model);
		return "insa/insaInputForm";
	}
	
	@RequestMapping(value = "insaListForm.do", method = RequestMethod.GET)
	public String insaComTable2(Model model) {
		insaComViewCommand.execute(sqlSession, model);
		return "insa/insaListForm";
	}
	
	@RequestMapping(value = "insaUpdateForm.do", method = RequestMethod.GET)
	public String insaComTable3(Model model) {
		insaComViewCommand.execute(sqlSession, model);
		return "insa/insaUpdateForm";
	}

}
