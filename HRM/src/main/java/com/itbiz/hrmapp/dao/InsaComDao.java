package com.itbiz.hrmapp.dao;

import java.util.List;

import com.itbiz.hrmapp.dto.InsaComDto;

public interface InsaComDao {
	
	public List<InsaComDto> jobList();
	public List<InsaComDto> gender();
	public List<InsaComDto> position();
	public List<InsaComDto> dept();
	public List<InsaComDto> joinGu();
	public List<InsaComDto> rank();
	public List<InsaComDto> inputCheck();
	public List<InsaComDto> armyCheck();
	public List<InsaComDto> armyType();
	public List<InsaComDto> classes();
	public List<InsaComDto> kosa();
	public List<InsaComDto> kosaRank();

}
