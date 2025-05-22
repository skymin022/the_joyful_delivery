package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;
import DTO.Inquiry;

public interface InquiryService {

	// C.R.U.D
	public List<Inquiry> list();
	public List<Inquiry> listBy(Map<String, Object> fields);
	public PageInfo<Inquiry> page();
	public Inquiry select(int no);
	public int insert(Inquiry inquiry);
	public Inquiry insertKey(Inquiry inquiry);
	public int update(Inquiry inquiry);
	public int delete(int no);
}
