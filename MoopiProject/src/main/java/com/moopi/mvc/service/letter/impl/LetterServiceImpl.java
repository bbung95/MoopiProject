package com.moopi.mvc.service.letter.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Letter;
import com.moopi.mvc.service.letter.LetterDao;
import com.moopi.mvc.service.letter.LetterService;

@Service("letterServiceImpl")
public class LetterServiceImpl implements LetterService{

	@Autowired
	@Qualifier("letterDaoImpl")
	private LetterDao letterDao;
	
	//Constructor
	public LetterServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addLetter(Letter letter) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Letter getLetter(int letterNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getLetterList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateLetter(Letter letter) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
