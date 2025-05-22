package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;
import DTO.RegionName;

public interface RegionService {

	// C.R.U.D
	public List<RegionName> list();
	public List<RegionName> listBy(Map<String, Object> fields);
	public PageInfo<RegionName> page();
	public RegionName select(int no);
	public int insert(RegionName regionName);
	public RegionName insertKey(RegionName regionName);
	public int update(RegionName regionName);
	public int delete(int no);
}
