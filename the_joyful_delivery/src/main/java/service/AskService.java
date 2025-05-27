package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DTO.AskDTO;
import DTO.Delivery;

public interface AskService {

	// C.R.U.D
		public List<AskDTO> list();
		public List<AskDTO> listBy(Map<String, Object> fields);
		public PageInfo<AskDTO> page();
		public AskDTO select(int no);
		public int insert(AskDTO askDto);
		public AskDTO insertKey(AskDTO askDto);
		public int update(AskDTO AskDto);
		public int delete(int no);
		int count() throws Exception;
		public int getFilterOptions(Map<String, String> filterOptions);
	
}
