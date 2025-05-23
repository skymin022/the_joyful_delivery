package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;
import DTO.Driver;

public interface DriverService {

	// C.R.U.D
	public List<Driver> list();
	public List<Driver> listBy(Map<String, Object> fields);
	public PageInfo<Driver> page();
	public Driver select(int no);
	public int insert(Driver driver);
	public Driver insertKey(Driver driver);
	public int update(Driver driver);
	public int delete(int no);
}
