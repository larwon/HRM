package com.itbiz.hrmapp.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbiz.hrmapp.command.insa.InsaDeleteCommand;
import com.itbiz.hrmapp.command.insa.InsaFileDownCommand;
import com.itbiz.hrmapp.command.insa.InsaIdCheckCommand;
import com.itbiz.hrmapp.command.insa.InsaInputFormCommand;
import com.itbiz.hrmapp.command.insa.InsaListCommand;
import com.itbiz.hrmapp.command.insa.InsaProfileCommand;
import com.itbiz.hrmapp.command.insa.InsaUpdateFormCommand;
import com.itbiz.hrmapp.dto.InsaDto;

@Controller
public class InsaController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private InsaInputFormCommand insaInputFormCommand;
	private InsaIdCheckCommand insaIdCheckCommand;
	private InsaUpdateFormCommand insaUpdateFormCommand;
	private InsaDeleteCommand insaDeleteCommand;
	private InsaProfileCommand insaProfileCommand;
	private InsaFileDownCommand insaFileDownCommand;
	private InsaListCommand insaListCommand;
	
	@Autowired
	private void setCommand(InsaInputFormCommand insaInputFormCommand, InsaIdCheckCommand insaIdCheckCommand, 
								InsaUpdateFormCommand insaUpdateFormCommand, InsaDeleteCommand insaDeleteCommand,
								InsaProfileCommand insaProfileCommand, InsaFileDownCommand insaFileDownCommand,
								InsaListCommand insaListCommand) {
		this.insaInputFormCommand = insaInputFormCommand;
		this.insaIdCheckCommand = insaIdCheckCommand;
		this.insaUpdateFormCommand = insaUpdateFormCommand;
		this.insaDeleteCommand = insaDeleteCommand;
		this.insaProfileCommand = insaProfileCommand;
		this.insaFileDownCommand = insaFileDownCommand;
		this.insaListCommand = insaListCommand;
	}
	
	// 단순 이동
	@RequestMapping(value = { "/", "index.do" }, method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "insaInput.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insaInput(MultipartHttpServletRequest multipartRequest, Model model) {
		model.addAttribute("multipartRequest", multipartRequest);
		return insaInputFormCommand.execute(sqlSession, model);
	}
	
	// 
	@RequestMapping(value = "idCheck.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> insaIdCheck(@RequestBody InsaDto insaDto, Model model) {
		if (insaDto != null) {
			model.addAttribute("insaDto", insaDto);
		}
		return insaIdCheckCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value = "insaUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insaUpdate(MultipartHttpServletRequest multipartRequest, Model model) {
		model.addAttribute("multipartRequest", multipartRequest);
		return insaUpdateFormCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value = "insa/{sabun}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberDelete(@PathVariable("sabun") int sabun, @RequestBody InsaDto insaDto, Model model) {
		model.addAttribute("sabun", sabun);
		if (insaDto != null) {
			model.addAttribute("insaDto", insaDto);
		}
		return insaDeleteCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value = "insaProfile/{sabun}", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> insaProfile(@PathVariable("sabun") int sabun, Model model) {
		model.addAttribute("sabun", sabun);
		return insaProfileCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value = "insaFileDown/{sabun}", method = RequestMethod.GET)
	@ResponseBody
	public void insaFileDown(@PathVariable("sabun") int sabun, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		model.addAttribute("sabun", sabun);
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		insaFileDownCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value = "insaList.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> insaList(@RequestBody InsaDto insaDto, Model model) {
		if (insaDto != null) {
			model.addAttribute("insaDto", insaDto);
		}
		return insaListCommand.execute(sqlSession, model);
	}
	

}
