package DAO;

import java.sql.SQLException;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import DTO.PayDTO;

public class PayDAO extends BaseDAOImpl<PayDTO> {

    // 결제정보 삽입 메서드
    public boolean insertPaymentInfo(PayDTO dto) {
        String sql = "INSERT INTO payment_info " +
                     "(order_number, tracking_number, card_number, depositor_name, " +
                     "sender_name, waybill_password, phone, email, receiver_name, address, address_detail) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

            psmt.setString(1, dto.getOrderNumber());
            psmt.setString(2, dto.getTrackingNumber());
            psmt.setString(3, dto.getCardNumber());
            psmt.setString(4, dto.getDepositorName());
            psmt.setString(5, dto.getSenderName());
            psmt.setString(6, dto.getWaybillPassword());
            psmt.setString(7, dto.getPhone());
            psmt.setString(8, dto.getEmail());
            psmt.setString(9, dto.getReceiverName());
            psmt.setString(10, dto.getAddress());
            psmt.setString(11, dto.getAddressDetail());

            int result = psmt.executeUpdate();
            return result == 1;  // 1행이 정상 입력됐으면 true 반환

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
