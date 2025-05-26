package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DAO.PayDAO;
import DTO.Delivery;

import DTO.Payment;

public class PayServiceImpl implements payService {

    private PayDAO payDAO = new PayDAO();  // DAO 객체 생성 (의존성 주입 사용 가능)

    

	@Override
	public List<Payment> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Payment> listBy(Map<String, Object> fields) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageInfo<Payment> page() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Payment select(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Payment payment, Payment order, Delivery delivery) {
		int result = 0;
		try {
			result = payDAO.insert(payment);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public Payment insertKey(Payment payment, Payment order, Delivery delivery) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Payment payment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean processPayment(Payment payDTO) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
}