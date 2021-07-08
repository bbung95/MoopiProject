package com.moopi.mvc.service.moim;

import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Moim;


public interface MoimService {
	
	public void addMoim(Moim moim) throws Exception;
	
	public Moim getMoim(int mmNo) throws Exception;
	
	public Map<String, Object> getMoimList(Search search) throws Exception;
	
	public void updateMoim(Moim moim) throws Exception;

}
