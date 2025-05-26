package DAO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import DTO.FAQ;

public class FAQDAO extends BaseDAOImpl<FAQ>{

	public List<FAQ> listDesc() {
		List<FAQ> list = new ArrayList<>();
		String sql = "SELECT * FROM faq ORDER BY created_at DESC";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(new FAQ(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5)));
			}
		} catch (Exception e) {
			System.err.println("FAQ DESC 리스트 조회 중 에러...");
			e.printStackTrace();
		}
		return list;
	}
}
