package service;

import java.util.List;
import java.util.Map;
import com.alohaclass.jdbc.dto.PageInfo;
import DTO.FAQ;

public interface FAQService {
	
	// C.R.U.D
	public List<FAQ> list();
	public List<FAQ> listBy(Map<String, Object> fields);
	public PageInfo<FAQ> page();
	public FAQ select(int no);
	public int insert(FAQ faq);
	public FAQ insertKey(FAQ faq);
	public int update(FAQ faq);
	public int delete(int no);

}
