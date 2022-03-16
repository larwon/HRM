package com.itbiz.hrmapp.command.insa;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.itbiz.hrmapp.dao.InsaDao;
import com.itbiz.hrmapp.dto.InsaDto;

public class InsaProfileCommand implements InsaCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int sabun = (int) map.get("sabun");
		
		InsaDao insaDao = sqlSession.getMapper(InsaDao.class);
		Map<String, Object> resultMap = new HashMap<String, Object>();

		InsaDto insaDto = insaDao.insaProfile(sabun);
		
		if (insaDto != null) {
			resultMap.put("insaDto", insaDto);
			resultMap.put("result", true);
		} else {
			resultMap.put("result", false);
		}

		return resultMap;

	}

}
