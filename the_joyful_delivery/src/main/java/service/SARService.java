package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;
import DTO.SAR;

public interface SARService {

	// C.R.U.D
	public List<SAR> list();
	public List<SAR> listBy(Map<String, Object> fields);
	public PageInfo<SAR> page(String keyword, List<String> columList);
	public SAR select(int no);
	public int insert(SAR sar);
	public SAR insertKey(SAR sar);
	public int update(SAR sar);
	public int delete(int no);
	
	// index 페이지 공지사항 3개
	public List<SAR> top3Anno();
}
