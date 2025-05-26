package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;
import DTO.Delivery;

public interface DeliveryService {

	// C.R.U.D
	public List<Delivery> list();
	public List<Delivery> listBy(Map<String, Object> fields);
	public PageInfo<Delivery> page();
	public Delivery select(int no);
	public int insert(Delivery delivery);
	public Delivery insertKey(Delivery delivery);
	public int update(Delivery delivery);
	public int delete(int no);
	int count() throws Exception;
	
	// 알클라이브러리x 메서드
	public List<Delivery> regJoinList(int pageCut, int offset);
	public int joinCount();
	public int filterJoinCount(String column, String value);
	
	// 회원전용 택배 조회
	public List<Map<String, Object>> getDeliveryDetailsByUserId(String loginId);
}
