package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.Page;
import com.alohaclass.jdbc.dto.PageInfo;

import DAO.InquiryDAO;
import DTO.FAQ;
import DTO.Inquiry;

public class InquiryServiceImpl implements InquiryService {
	
	InquiryDAO inquiryDao = new InquiryDAO();
	
	@Override
	public List<Inquiry> list() {
		List<Inquiry> list = null;
		try {
			list = inquiryDao.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Inquiry> listBy(Map<String, Object> fields) {
		List<Inquiry> list = null;
		try {
			list = inquiryDao.listBy(fields);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public PageInfo<Inquiry> page(String keyword, List<String> columList) {
		PageInfo<Inquiry> pageInfo = null; 
		try {
			Page pageObj = new Page(1, 10);
			pageInfo = inquiryDao.page(pageObj, keyword, columList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pageInfo;
	}

	@Override
	public Inquiry select(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Inquiry inquiry) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Inquiry insertKey(Inquiry inquiry) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Inquiry inquiry) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}
}
