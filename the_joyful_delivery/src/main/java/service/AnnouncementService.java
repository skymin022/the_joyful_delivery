package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;
import DTO.Announcement;

public interface AnnouncementService {

	// C.R.U.D
	public List<Announcement> list();
	public List<Announcement> listBy(Map<String, Object> fields);
	public PageInfo<Announcement> page();
	public Announcement select(int no);
	public int insert(Announcement announcement);
	public Announcement insertKey(Announcement announcement);
	public int update(Announcement announcement);
	public int delete(int no);
}
