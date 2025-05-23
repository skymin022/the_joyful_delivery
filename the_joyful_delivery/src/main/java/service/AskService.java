package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DTO.Delivery;

public interface AskService {

	// C.R.U.D
		public List<Delivery> list();
		public List<Delivery> listBy(Map<String, Object> fields);
		public PageInfo<Delivery> page();
		public Delivery select(int no);
		public int insert(AskService askService);
		public Delivery insertKey(AskService askService);
		public int update(AskService askService);
		public int delete(int no);
		int count() throws Exception;
	
}
