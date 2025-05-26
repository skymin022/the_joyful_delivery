package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.Page;
import com.alohaclass.jdbc.dto.PageInfo;

import DAO.FAQDAO;
import DTO.FAQ;
import DTO.User;

public class FAQServiceImpl implements FAQService {
		
	FAQDAO faqDao = new FAQDAO();
	
	@Override
	public List<FAQ> listDesc() {
		List<FAQ> list = null;
		
		try {
			list = faqDao.listDesc();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<FAQ> list() {
		List<FAQ> list = null;
		
		try {
			list = faqDao.list();
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
	public PageInfo<FAQ> page(String keyword, List<String> columList) {
		PageInfo<FAQ> pageInfo = null; 
		try {
			Page pageObj = new Page(1, 10);
			pageInfo = faqDao.page(pageObj, keyword, columList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageInfo;
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
