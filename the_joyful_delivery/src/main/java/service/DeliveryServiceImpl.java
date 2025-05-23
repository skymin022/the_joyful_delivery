package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.DeliveryDAO;
import DTO.Delivery;

public class DeliveryServiceImpl implements DeliveryService {
		
	DeliveryDAO delDao = new DeliveryDAO();
	
	@Override
	public List<Delivery> regJoinList(int pageCut, int offset) {
		List<Delivery> list = null;
		try {
			list = delDao.regJoinList(pageCut, offset);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Delivery> regJoinList(String column, String value) {
		List<Delivery> list = null;
		try {
			list = delDao.regJoinList(column, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	@Override
	public List<Delivery> list() {
		List<Delivery> list = null;
		try {
			list = delDao.list();
		} catch (Exception e) {
			System.err.println("모든 배송 조회중 에러...");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Delivery> listBy(Map<String, Object> fields) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageInfo<Delivery> page() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Delivery select(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Delivery Delivery) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Delivery insertKey(Delivery Delivery) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Delivery Delivery) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int count() {
		int count = 0;
		
		try {
			count = delDao.count();
		} catch (Exception e) {
			System.err.println("전체 행 조회 중 에러..");
			e.printStackTrace();
		}
		return count;
	}
}
