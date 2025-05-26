package DAO;

import java.sql.SQLException;

import com.alohaclass.jdbc.dao.BaseDAOImpl;


import DTO.Payment;

public class PayDAO extends BaseDAOImpl<Payment> {

    // 결제정보 삽입 메서드
	public boolean insertPaymentInfo(Payment dto) {
	    String sql = "INSERT INTO payment_info " +
	                 "(order_number, tracking_number, card_number, depositor_name, " +
	                 "sender_name, waybill_password, phone, email, receiver_name, address, address_detail) " +
	                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	    try {
	        psmt = con.prepareStatement(sql);

	        psmt.setInt(1, dto.getIdx());
	        psmt.setInt(2, dto.getDIdx());

	        int result = psmt.executeUpdate(); // ✅ 이게 정답
	        return result == 1;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
}

