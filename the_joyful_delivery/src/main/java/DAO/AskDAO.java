package DAO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import DTO.Announcement;
import DTO.AskDTO;
import DTO.User;

public class AskDAO extends BaseDAOImpl<AskDTO> {

	
	public List<AskDTO> AskDTO() {
		List<AskDTO> list = new ArrayList<>();
		
		String sql = "SELECT idx, title, content, created_at, type, adm_answer "
				   + "FROM inquiries "
				   + "ORDER BY created_at DESC";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				AskDTO askDto = new AskDTO();
				askDto.setIdx(rs.getInt("idx"));
				askDto.setTitle(rs.getString("title"));
				askDto.setContent(rs.getString("content"));
				askDto.setCreatedAt(rs.getDate("craeted_at"));
				askDto.setType(rs.getString("type"));
				askDto.setAdmAnswer(rs.getString("adm_answer"));
				
			}
//				list.add(
//						(rs.getIdx(1), rs.getUserNo(2), rs.getTitle(3), rs.getContent(4), rs.getCreatedAt(6), rs.getCheckAnswer(7), rs.getType(8), rs.getAdmAnswer(9));
//			}
		} catch (Exception e) {
			System.err.println("ask dsec 리스트 조회중 로ㅠ");
			e.printStackTrace();
		}
		return list;
	}
	
	
}
