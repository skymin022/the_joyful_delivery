package DAO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import DTO.Delivery;

public class DeliveryDAO extends BaseDAOImpl<Delivery> {

	// 전체 행 조회
	public List<Delivery> regJoinList(int pageCut, int offset) {
		List<Delivery> list = new ArrayList<>();
		System.out.println(pageCut + " " + offset);
		
		String sql = "SELECT d.*, r.status AS r_status "
				    + "FROM deliveries d "
				    + "INNER JOIN region_name r ON d.idx = r.del_idx "
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
		System.out.println("요청 조건 : " + column + " = " + value);
		String chooseColumn = "d.";
		if(column.equals("r_status")) {
			chooseColumn = "";
			column = "r.status";
		}
		
		String sql = "SELECT d.*, r.status AS r_status "
			    + "FROM deliveries d "
			    + "INNER JOIN region_name r ON d.idx = r.del_idx "
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
}
