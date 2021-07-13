package com.moopi.mvc.service.letter;

import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Letter;

public interface LetterService {
	
	public void addLetter(Letter letter) throws Exception;
	
	public Letter getLetter(int letterNo) throws Exception;
	
	public Map<String,Object> getLetterList(Search search) throws Exception;
	
	public void updateLetter(Letter letter) throws Exception;
	
}
