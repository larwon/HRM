package com.itbiz.hrmapp.command.insa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.itbiz.hrmapp.dao.InsaDao;
import com.itbiz.hrmapp.dto.InsaDto;

public class InsaListCommand implements InsaCommand {
	
	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		InsaDto insaDto = (InsaDto) map.get("insaDto");
		
		int page = insaDto.getPage();
		
		InsaDao insaDao = sqlSession.getMapper(InsaDao.class);
		
		int totalRecord = insaDao.pageCount(insaDto);
		int recordPerPage = 10;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = (endRecord < totalRecord) ? endRecord : totalRecord;
		int totalPage = totalRecord / recordPerPage; // 전체 페이지의 개수
		if (totalRecord % recordPerPage != 0) {
			totalPage++;
		}
		totalPage = (totalPage >= page) ? totalPage : page;
		int pagePerBlock = 5;
		int beginPage = ((page - 1) / pagePerBlock) * pagePerBlock + 1;
		int endPage = beginPage + pagePerBlock - 1;
		endPage = endPage < totalPage ? endPage : totalPage;
		
		Map<String, Integer> paging = new HashMap<>();
		paging.put("totalRecord", totalRecord);
		paging.put("page", page);
		paging.put("totalPage", totalPage);
		paging.put("pagePerBlock", pagePerBlock);
		paging.put("beginPage", beginPage);
		paging.put("endPage", endPage);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("paging", paging);
		insaDto.setBeginRecord(beginRecord);
		insaDto.setEndRecord(endRecord);
		
		List<InsaDto> list = insaDao.insaList(insaDto);
		resultMap.put("list", list);
		resultMap.put("pageCount", totalRecord);
		if (list.size() > 0) {
			resultMap.put("listResult", true);
			return resultMap;
		} else {
			resultMap.put("listResult", false);
		}
		
		return resultMap;
	}
	

}
