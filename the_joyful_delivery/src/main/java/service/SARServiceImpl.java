package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.SARDAO;
import DTO.SAR;

public class SARServiceImpl implements SARService {
	
	SARDAO sarDao = new SARDAO();
	
	@Override
	public List<SAR> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SAR> listBy(Map<String, Object> fields) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageInfo<SAR> page(String keyword, List<String> columList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SAR select(int no) {
		SAR sar = null;
		
		try {
			sar = sarDao.select(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sar;
	}

	@Override
	public int insert(SAR sar) {
		int result = 0;
		try {
			result = sarDao.insert(sar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public SAR insertKey(SAR sar) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(SAR sar) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SAR> top3Anno() {
		// TODO Auto-generated method stub
		return null;
	}

}
