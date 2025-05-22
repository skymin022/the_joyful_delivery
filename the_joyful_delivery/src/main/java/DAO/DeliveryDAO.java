package DAO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import DTO.Delivery;

public class DeliveryDAO extends BaseDAOImpl<Delivery> {

	public List<Delivery> regJoinList() {
		List<Delivery> list = new ArrayList<>();
		
		String sql = "SELECT *, r.status r_status FROM deliveries d INNER JOIN "
				   + "region_name r ON d.idx = r.del_idx "
				   + "WHERE r.created_at IN "
				   + "(SELECT MAX(created_at) FROM region_name GROUP BY del_idx)";
		try {
			psmt = con.prepareStatement(sql);
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
	
	public List<Delivery> regJoinList(String column, String value) {
		List<Delivery> list = new ArrayList<>();
		System.out.println("요청 조건 : " + column + " = " + value);
		String chooseColumn = "d.";
		if(column.equals("r_status")) {
			chooseColumn = "";
			column = "r.status";
		}
		String sql = "SELECT *, r.status r_status FROM deliveries d INNER JOIN "
				   + "region_name r ON d.idx = r.del_idx "
				   + "WHERE r.created_at IN "
				   + "(SELECT MAX(created_at) FROM region_name GROUP BY del_idx) "
				   + "AND " +chooseColumn+column+  " LIKE ?";
		
		System.out.println(sql);
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%" + value + "%");
			
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
}
