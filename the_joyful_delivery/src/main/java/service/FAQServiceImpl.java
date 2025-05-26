package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.FAQDAO;
import DTO.FAQ;

public class FAQServiceImpl implements FAQService {
		
	FAQDAO fd = new FAQDAO();
	
	@Override
	public List<FAQ> list() {
		List<FAQ> list = null;
		
		try {
			list = fd.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FAQ> listBy(Map<String, Object> fields) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageInfo<FAQ> page() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FAQ select(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(FAQ faq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FAQ insertKey(FAQ faq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(FAQ faq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
