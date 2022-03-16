package com.itbiz.hrmapp.command.insa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.itbiz.hrmapp.dao.InsaDao;
import com.itbiz.hrmapp.dto.InsaDto;

public class InsaDeleteCommand implements InsaCommand {
	
	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		int sabun = (int) map.get("sabun");
		InsaDto insaDto = (InsaDto) map.get("insaDto");
		
		InsaDao insaDao = sqlSession.getMapper(InsaDao.class);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String pwd = insaDto.getPwd();
		String pwd_check = insaDto.getPwd_check();
		
		if (pwd.equals("")) {
			resultMap.put("deleteResult", -0); // 패스워드 공백
		} else if (pwd_check.equals("")) {
			resultMap.put("deleteResult", -1); // 패스워드 확인 공백
		} else if (!(pwd.equals(pwd_check))) {
			resultMap.put("deleteResult", -2); // 패스워드 확인 불일치
		} else if (insaDao.login(sabun, pwd) == null) {
			resultMap.put("deleteResult", -3); // 아이디 패스워드 불일치
		}
		else {
			resultMap.put("deleteResult", 1);
			insaDao.insaDelete(sabun);
		}

		return resultMap;
	}
	

}
