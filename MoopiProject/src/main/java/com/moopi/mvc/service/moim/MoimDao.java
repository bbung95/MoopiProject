package com.moopi.mvc.service.moim;

import java.util.List;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Moim;

public interface MoimDao {

	public void insertMoim(Moim moim) throws Exception;
	
	public List<Moim> getMoimList(Search search) throws Exception;
	
	public Moim findMoim(int mmNo) throws Exception;
	
	public void updateMoim(Moim moim) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
}
