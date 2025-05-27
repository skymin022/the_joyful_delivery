package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.AskDAO;
import DTO.AskDTO;
import DTO.Delivery;
import servlet.AskServlet;

public class AskServiceImpl implements AskService {

	AskDAO askDao = new AskDAO();
	
	@Override
	public List<AskDTO> list() {
		List<AskDTO> list = null;
		
		try {
			list = askDao.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<AskDTO> listBy(Map<String, Object> fields) {
		List<AskDTO> list = null;
		
		try {
			list = askDao.listBy(fields);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public PageInfo<AskDTO> page() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AskDTO select(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(AskDTO askDto) {
		int result = 0;
		try {
			result = askDao.insert(askDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result > 0) {
			return 0;
		}
		return 0;
	}

	@Override
	public AskDTO insertKey(AskDTO askDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(AskDTO askDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getFilterOptions(Map<String, String> filterOptions) {
		
		Map<String, String> qnaFilter = new HashMap<String, String>();
		return 0;
	}
	
	

}
