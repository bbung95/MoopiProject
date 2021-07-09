package com.moopi.mvc.service.moim;

//import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

//import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Moim;

@Mapper
public interface MoimDao {

	//public void addMoim(Moim moim) throws Exception;
	
	//public List<Moim> getMoimList(Search search) throws Exception;
	
	public Moim getMoim(@Param("mmNo") int mmNo);
	
	//public void updateMoim(Moim moim) throws Exception;
	
	//public int getTotalCount(Search search) throws Exception;
}
