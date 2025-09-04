package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.RegionNameDAO;
import DTO.RegionName;

public class RegionServiceImpl implements RegionService {
	
	RegionNameDAO rnDao = new RegionNameDAO();

	@Override
	public List<RegionName> list() {
		
		return null;
	}

	@Override
	public List<RegionName> listBy(Map<String, Object> fields) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageInfo<RegionName> page() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RegionName select(int no) {
		RegionName regionName = null;
		try {
			regionName = rnDao.select(no);
		} catch (Exception e) {
			System.err.println("del_no 로 위치 테이블 조회 중 에러...");
			e.printStackTrace();
		}
		return regionName;
	}

	@Override
	public int insert(RegionName regionName) {
		int result = 0;
		try {
			result = rnDao.insert(regionName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public RegionName insertKey(RegionName regionName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(RegionName regionName) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
