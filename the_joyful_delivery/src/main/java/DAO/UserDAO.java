package DAO;


import com.alohaclass.jdbc.dao.BaseDAOImpl;

import DTO.User;

public class UserDAO extends BaseDAOImpl<User> {

	public User select(String id) {
	    User user = null;

	    try {
	        // DB 연결 상태 체크
	        if (con == null || con.isClosed()) {
	            System.out.println("DB 커넥션이 유효하지 않습니다.");
	            // 필요하면 여기서 재연결 시도 또는 예외 처리
	        } else {
	            System.out.println("DB 커넥션 정상 작동 중");
	        }

	        String sql = "SELECT * FROM users WHERE ID = ?";
	        psmt = con.prepareStatement(sql);
	        psmt.setString(1, id.trim());
	        rs = psmt.executeQuery();

	        while(rs.next()) {
	            user = new User();
	            user.setIdx(rs.getInt("idx"));
	            user.setId(rs.getString("ID"));
	            user.setPassword(rs.getString("password"));
	            user.setUsername(rs.getString("username"));
	            user.setEmail(rs.getString("email"));
	            user.setAddress(rs.getString("address"));
	            user.setBirth(rs.getString("birth")); 
	            user.setSignUpDate(rs.getTimestamp("sign_up_date"));
	            user.setWithdrawal(rs.getBoolean("withdrawal"));
	            user.setPNumber(rs.getString("p_number"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        System.err.println("로그인 - db데이터 가져오는 중 오류 발생 ");
	    }
	    return user;
	}

}

