package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.InquiryDAO;
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
	public PageInfo<Inquiry> page() {
		// TODO Auto-generated method stub
		return null;
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
