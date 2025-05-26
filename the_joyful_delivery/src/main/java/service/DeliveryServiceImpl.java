package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.DeliveryDAO;
import DAO.JDBConnection;
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
	
	// 회원전용 목록
	@Override
	public List<Map<String, Object>> getDeliveryDetailsByUserId(String userId) {
	    List<Map<String, Object>> list = new ArrayList<>();

	    String sql = """
	        SELECT 
	            ROW_NUMBER() OVER (ORDER BY d.idx) AS 번호,
	            d.idx AS 주문번호,
	            d.keyword AS 배송_내역,
	            CONCAT(sr.s_name, ' / ', sr.s_address) AS 보내는_사람_주소,
	            CONCAT(sr.r_name, ' / ', sr.r_address) AS 받는_사람_주소,
	            d.pre_pos AS 선불_후불,
	            d.status AS 배송_상태,
	            p.p_amount AS 금액,
	            p.p_date AS 결제날짜
	        FROM deliveries d
	        JOIN users u ON d.user_idx = u.idx
	        JOIN sending_and_receiving sr ON d.sr_idx = sr.idx
	        LEFT JOIN payment p ON p.d_idx = d.idx
	        WHERE u.ID = ?
	    """;

	    JDBConnection db = new JDBConnection(); // DB 연결 클래스 사용

	    try {
	        db.psmt = db.con.prepareStatement(sql);
	        db.psmt.setString(1, userId);
	        db.rs = db.psmt.executeQuery();

	        while (db.rs.next()) {
	            Map<String, Object> row = new HashMap<>();
	            row.put("번호", db.rs.getInt("번호"));
	            row.put("주문번호", db.rs.getLong("주문번호"));
	            row.put("배송_내역", db.rs.getString("배송_내역"));
	            row.put("보내는_사람_주소", db.rs.getString("보내는_사람_주소"));
	            row.put("받는_사람_주소", db.rs.getString("받는_사람_주소"));
	            row.put("선불_후불", db.rs.getString("선불_후불"));
	            row.put("배송_상태", db.rs.getString("배송_상태"));
	            row.put("금액", db.rs.getInt("금액"));
	            row.put("결제날짜", db.rs.getTimestamp("결제날짜"));
	            list.add(row);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        System.err.println("🚨 배송 정보 조회 중 오류: " + e.getMessage());
	    } finally {
	        try { if (db.rs != null) db.rs.close(); } catch (Exception e) {}
	        try { if (db.psmt != null) db.psmt.close(); } catch (Exception e) {}
	        try { if (db.con != null) db.con.close(); } catch (Exception e) {}
	    }

	    return list;
	}




}
