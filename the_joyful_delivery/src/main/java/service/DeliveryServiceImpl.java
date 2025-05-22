package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.DeliveryDAO;
import DTO.Delivery;

public class DeliveryServiceImpl implements DeliveryService {
		
	DeliveryDAO delDao = new DeliveryDAO();
	
	public List<Delivery> regJoinList() {
		List<Delivery> list = null;
		try {
			list = delDao.regJoinList();
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

}
