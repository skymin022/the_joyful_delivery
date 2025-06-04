package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;

import DTO.Delivery;

import DTO.Payment;
import DTO.User;

public interface PayService {

	// C.R.U.D
	
    public List<Payment> list();
    public List<Payment> listBy(Map<String, Object> fields);
    public PageInfo<Payment> page();
    public Payment select(int no);
    public int insert(Payment payment);
    public Payment insertKey(Payment payment, Payment order, Delivery delivery);
    public int update(Payment payment);
    public int delete(int no);
    
    
	boolean processPayment(Payment payDTO) throws Exception;
}