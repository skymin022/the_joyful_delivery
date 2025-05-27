package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.PayDAO;
import DTO.Delivery;
import DTO.Payment;

public class PayServiceImpl implements payService {

    private PayDAO payDAO = new PayDAO();  // DAO 객체 생성 (필요시 DI 적용)
    
    // TODO: orderDAO, deliveryDAO 등이 있으면 같이 선언 필요
    
    @Override
    public List<Payment> list() {
        // TODO: 전체 결제 목록 조회 구현
        return null;
    }

    @Override
    public List<Payment> listBy(Map<String, Object> fields) {
        // TODO: 조건에 따른 결제 목록 조회 구현
        return null;
    }

    @Override
    public PageInfo<Payment> page() {
        // TODO: 페이징 처리 구현
        return null;
    }

    @Override
    public Payment select(int no) {
        // TODO: 결제번호로 결제 정보 조회 구현
        return null;
    }

   
    @Override
    public int insert(Payment payment, Payment order, Delivery delivery) throws Exception {
        int result = 0;
        try {
            // 결제 정보 저장
            result = payDAO.insert(payment);

            // TODO: 주문 정보 저장
            // if(orderDAO != null) orderDAO.insert(order);

            // TODO: 배송 정보 저장
            // if(deliveryDAO != null) deliveryDAO.insert(delivery);

        } catch (Exception e) {
            e.printStackTrace();
            throw e; // 예외를 호출자에게 던지기
        }
        return result;
    }

    @Override
    public Payment insertKey(Payment payment, Payment order, Delivery delivery) {
        // TODO
        return null;
    }

    @Override
    public int update(Payment payment) {
        // TODO
        return 0;
    }

    @Override
    public int delete(int no) {
        // TODO
        return 0;
    }

    @Override
    public boolean processPayment(Payment payDTO) throws Exception {
        // TODO
        return false;
    }
}
