package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.DeliveryDAO;
import DTO.Delivery;

public class DeliveryServiceImpl implements DeliveryService {
		
	DeliveryDAO delDao = new DeliveryDAO();
	
	@Override
	public int joinCount() {
		int count = 0;
		try {
			count = delDao.joinCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	

	@Override
	public int filterJoinCount(String column, String value) {
		int count = 0;
		try {
			count = delDao.filterJoinCount(column, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
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
	
	public List<Delivery> regJoinList(String column, String value, int pageCut, int offset) {
		List<Delivery> list = null;
		try {
			list = delDao.regJoinList(column, value, pageCut, offset);
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
	public int insert(Delivery delivery) {
		int result = 0;
		try {
			result = delDao.insert(delivery);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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
	
	// 회원전용 목록
	@Override
	public List<Delivery> listByUserId(String userId) {
		List<Delivery> list = null;
		try {
			list = delDao.listByUserId(userId);
		} catch (Exception e) {
			System.err.println("회원전용 배송 조회 중 에러...");
			e.printStackTrace();
		}
		return list;
	}

	// 로그 
	private DeliveryDAO deliveryDAO = new DeliveryDAO();

    @Override
    public Delivery findByDelIdx(Long delIdx) {
        return deliveryDAO.findByDelIdx(delIdx);
    }




}


