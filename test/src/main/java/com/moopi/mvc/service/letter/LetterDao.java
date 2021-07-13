package com.moopi.mvc.service.letter;

import java.util.List;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Letter;

public interface LetterDao {
	
	public void insertLetter(Letter letter) throws Exception;
	
	public List<Letter> getLetterList(Search search) throws Exception;
	
	public Letter findLetter(int letterNo) throws Exception;
	
	public void updateLetter(Letter letter) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
}
