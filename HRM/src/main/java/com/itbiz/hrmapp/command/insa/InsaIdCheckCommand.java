package com.itbiz.hrmapp.command.insa;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.itbiz.hrmapp.dao.InsaDao;
import com.itbiz.hrmapp.dto.InsaDto;

public class InsaIdCheckCommand implements InsaCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		InsaDto insaDto = (InsaDto) map.get("insaDto");
		
		InsaDao insaDao = sqlSession.getMapper(InsaDao.class);
		Map<String, Object> resultMap = new HashMap<String, Object>();

		String id = insaDto.getId();

		if (insaDao.idCheck(id) == null) {
			resultMap.put("idResult", 1);
		} else {
			resultMap.put("idResult", 0); // 중복된 아이디인 경우 0
		}

		return resultMap;

	}

}
