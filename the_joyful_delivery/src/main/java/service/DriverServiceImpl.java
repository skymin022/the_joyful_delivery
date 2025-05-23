package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.DriverDAO;
import DTO.Driver;

public class DriverServiceImpl implements DriverService {
	
	DriverDAO driverDao = new DriverDAO();
	
	@Override
	public List<Driver> list() {
		List<Driver> list = null;
		try {
			list = driverDao.list();
		} catch (Exception e) {
			System.err.println("배달기사 전체 조회 중 에러...");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Driver> listBy(Map<String, Object> fields) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageInfo<Driver> page() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Driver select(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Driver driver) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Driver insertKey(Driver driver) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Driver driver) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
