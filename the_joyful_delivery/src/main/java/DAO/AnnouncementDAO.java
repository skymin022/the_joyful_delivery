package DAO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import DTO.Announcement;

public class AnnouncementDAO extends BaseDAOImpl<Announcement> {

	public List<Announcement> top3Anno() {
		List<Announcement> list = new ArrayList<>();
		
		String sql = "SELECT * FROM announcement "
				   + "ORDER BY created_at DESC "
				   + "LIMIT 3 OFFSET 0";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Announcement(rs.getInt("idx"), rs.getString("title"), rs.getString("content"), rs.getDate("created_at"), rs.getDate("updated_at")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
