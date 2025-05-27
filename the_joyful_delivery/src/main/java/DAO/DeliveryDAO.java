package DAO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import DTO.Delivery;
import DTO.Payment;
import DTO.SendingReceiving;

public class DeliveryDAO extends BaseDAOImpl<Delivery> {

	// 전체 행 조회
	public List<Delivery> regJoinList(int pageCut, int offset) {
		List<Delivery> list = new ArrayList<>();
		
		String sql = "SELECT d.*, r.status AS r_status, dr.name "
				    + "FROM deliveries d "
				    + "INNER JOIN region_name r ON d.idx = r.del_idx "
				    + "INNER JOIN drivers dr ON d.driver_idx = dr.idx "
				    + "INNER JOIN ( "
				    + "    SELECT del_idx, MAX(created_at) AS max_created "
				    + "    FROM region_name "
				    + "    GROUP BY del_idx "
				    + ") AS latest ON r.del_idx = latest.del_idx AND r.created_at = latest.max_created "
				    + "LIMIT ? OFFSET ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, pageCut);
			psmt.setInt(2, offset);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Delivery delivery = new Delivery();
				delivery.setIdx(rs.getInt("idx"));
				delivery.setUserIdx(rs.getInt("user_idx"));
				delivery.setDriverIdx(rs.getInt("driver_idx"));
				delivery.setSrIdx(rs.getInt("sr_idx"));
				delivery.setKeyword(rs.getString("keyword"));
				delivery.setValue(rs.getInt("value"));
				delivery.setPrePos(rs.getString("pre_pos"));
				delivery.setCreatedAt(rs.getDate("created_at"));
				delivery.setStatus(rs.getString("status"));
				delivery.setRegStatus(rs.getString("r_status"));
				delivery.setName(rs.getString("name"));
				
				list.add(delivery);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 필터링 없을 때 카운트
	public int joinCount() {
			
			int count = 0;
			String sql = "SELECT COUNT(*) "
				    + "FROM deliveries d "
				    + "INNER JOIN region_name r ON d.idx = r.del_idx "
				    + "INNER JOIN ( "
				    + "    SELECT del_idx, MAX(created_at) AS max_created "
				    + "    FROM region_name "
				    + "    GROUP BY del_idx "
				    + ") AS latest ON r.del_idx = latest.del_idx AND r.created_at = latest.max_created";
			try {
				psmt = con.prepareStatement(sql);
				rs = psmt.executeQuery();
				if(rs.next()) count = rs.getInt(1);
			} catch (Exception e) {
				System.err.println("택배 - 로그 조인 카운트 조회 중 에러...");
				e.printStackTrace();
			}
			return count;
	}
	
	// 필터링 검색
	public List<Delivery> regJoinList(String column, String value, int pageCut, int offset) {
		List<Delivery> list = new ArrayList<>();
		String chooseColumn = "d.";
		if(column.equals("r_status")) {
			chooseColumn = "";
			column = "r.status";
		}
		
		String sql = "SELECT d.*, r.status AS r_status, dr.name "
			    + "FROM deliveries d "
			    + "INNER JOIN region_name r ON d.idx = r.del_idx "
			    + "INNER JOIN drivers dr ON d.driver_idx = dr.idx "
			    + "INNER JOIN ( "
			    + "    SELECT del_idx, MAX(created_at) AS max_created "
			    + "    FROM region_name "
			    + "    GROUP BY del_idx "
			    + ") AS latest ON r.del_idx = latest.del_idx AND r.created_at = latest.max_created "
			    + "WHERE " +chooseColumn+column+ " LIKE ? "
			    + "LIMIT ? OFFSET ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%" + value + "%");
			psmt.setInt(2, pageCut);
			psmt.setInt(3, offset);
			
			rs = psmt.executeQuery();
		
			while(rs.next()) {
				Delivery delivery = new Delivery();
				delivery.setIdx(rs.getInt("idx"));
				delivery.setUserIdx(rs.getInt("user_idx"));
				delivery.setDriverIdx(rs.getInt("driver_idx"));
				delivery.setSrIdx(rs.getInt("sr_idx"));
				delivery.setKeyword(rs.getString("keyword"));
				delivery.setValue(rs.getInt("value"));
				delivery.setPrePos(rs.getString("pre_pos"));
				delivery.setCreatedAt(rs.getDate("created_at"));
				delivery.setStatus(rs.getString("status"));
				delivery.setRegStatus(rs.getString("r_status"));
				delivery.setName(rs.getString("name"));
				
				list.add(delivery);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 필터링 했을 때 카운트
	public int filterJoinCount(String column, String value) {
		int count = 0;
		
		String chooseColumn = "d.";
		if(column.equals("r_status")) {
			chooseColumn = "";
			column = "r.status";
		}
		
		String sql = "SELECT COUNT(*) "
			    + "FROM deliveries d "
			    + "INNER JOIN region_name r ON d.idx = r.del_idx "
			    + "INNER JOIN ( "
			    + "    SELECT del_idx, MAX(created_at) AS max_created "
			    + "    FROM region_name "
			    + "    GROUP BY del_idx "
			    + ") AS latest ON r.del_idx = latest.del_idx AND r.created_at = latest.max_created "
			    + "WHERE " +chooseColumn+column+ " LIKE ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%" + value + "%");
			rs = psmt.executeQuery();
			
			if(rs.next()) count = rs.getInt(1);
		} catch (Exception e) {
			System.err.println("택배 - 로그 조인, 필터 카운트 조회 중 에러...");
			e.printStackTrace();
		}
		return count;
	}
	
	// listByUserId 메서드
	/**
	 * deliveries x region_name x drivers 테이블을 조인하여
	 * 사용자의 배송 내역을 조회하는 메서드
	 * @param loginId
	 * @return
	 */
	public List<Delivery> listByUserId(String loginId) {
		List<Delivery> list = new ArrayList<>();
		String sql = " SELECT d.*, "
		           + "        (SELECT status FROM region_name WHERE del_idx = d.idx ORDER BY created_at DESC LIMIT 1) AS r_status, "
		           + "        dr.name, "
		           + "        sr.s_name, "
		           + "        sr.s_address, "
		           + "        sr.r_name, "
		           + "        sr.r_address, "
		           + "        p.idx AS p_idx, "
		           + "        p.p_amount, "
		           + "        p.p_card, "
		           + "        p.p_date "
		           + " FROM deliveries d "
		           + " INNER JOIN drivers dr ON d.driver_idx = dr.idx "
		           + " INNER JOIN sending_and_receiving sr ON d.sr_idx = sr.idx "
		           + " LEFT JOIN payment p ON d.idx = p.d_idx "
		           + " WHERE d.user_idx = (SELECT idx FROM users WHERE id = ?) "
		           + " ORDER BY d.created_at DESC";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, loginId);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Delivery delivery = new Delivery();
				delivery.setIdx(rs.getInt("idx"));
				delivery.setUserIdx(rs.getInt("user_idx"));
				delivery.setDriverIdx(rs.getInt("driver_idx"));
				delivery.setSrIdx(rs.getInt("sr_idx"));
				delivery.setKeyword(rs.getString("keyword"));
				delivery.setValue(rs.getInt("value"));
				delivery.setPrePos(rs.getString("pre_pos"));
				delivery.setCreatedAt(rs.getDate("created_at"));
				delivery.setStatus(rs.getString("status"));
				delivery.setRegStatus(rs.getString("r_status"));
				delivery.setName(rs.getString("name"));
				
				// 받는사람 보내는사람 정보 설정
				SendingReceiving sr = new SendingReceiving();
				sr.setSName(rs.getString("s_name"));
				sr.setSAddress(rs.getString("s_address"));
				sr.setRName(rs.getString("r_name"));
				sr.setRAddress(rs.getString("r_address"));
				delivery.setSendingReceiving(sr);
				
				// 결제 정보 설정
				Payment payment = new Payment();
				payment.setIdx(rs.getInt("p_idx"));
				payment.setDIdx(rs.getInt("idx"));
				payment.setPCard(rs.getString("p_card"));
				payment.setPAmount(rs.getInt("p_amount"));
				payment.setPDate(rs.getDate("p_date"));
				delivery.setPayment(payment);
				
				list.add(delivery);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}	
	























