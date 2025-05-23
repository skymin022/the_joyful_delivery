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
}
