package com.itbiz.hrmapp.command.insacom;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.itbiz.hrmapp.dao.InsaComDao;
import com.itbiz.hrmapp.dao.InsaDao;

public class InsaComViewCommand implements InsaComCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		InsaDao insaDao = sqlSession.getMapper(InsaDao.class);
		InsaComDao insaComDao = sqlSession.getMapper(InsaComDao.class);
		model.addAttribute("sabun", insaDao.sabun());
		model.addAttribute("jobList", insaComDao.jobList());
		model.addAttribute("gender", insaComDao.gender());
		model.addAttribute("position", insaComDao.position());
		model.addAttribute("dept", insaComDao.dept());
		model.addAttribute("joinGu", insaComDao.joinGu());
		model.addAttribute("rank", insaComDao.rank());
		model.addAttribute("inputCheck", insaComDao.inputCheck());
		model.addAttribute("armyCheck", insaComDao.armyCheck());
		model.addAttribute("armyType", insaComDao.armyType());
		model.addAttribute("classes", insaComDao.classes());
		model.addAttribute("kosa", insaComDao.kosa());
		model.addAttribute("kosaRank", insaComDao.kosaRank());
		
	}

}
