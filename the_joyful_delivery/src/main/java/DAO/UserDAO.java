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

			while (rs.next()) {
				user = new User();
				user.setRoleIdx(rs.getInt("role_idx"));
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

	// 회원가입
	public int insert(User user) {
		int rows = 0;

		String sql = "INSERT INTO users (role_idx, ID, password, username, email, address, birth, p_number) "
				+ "VALUES (1, ?, ?, ?, ?, ?, ?, ?)";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user.getId());
			psmt.setString(2, user.getPassword());
			psmt.setString(3, user.getUsername());
			psmt.setString(4, user.getEmail());
			psmt.setString(5, user.getAddress());
			psmt.setString(6, user.getBirth());
			psmt.setString(7, user.getPNumber());

			rows = psmt.executeUpdate();

			System.out.println("사용자 INSERT 성공: " + rows + "행 삽입됨");

		} catch (Exception e) {
			System.err.println("사용자 INSERT 중 오류 발생");
			e.printStackTrace();
		}

		return rows;
	}


	// 아이디 찾기: 이름, 이메일로 아이디 조회
    public String findIdByNameAndEmail(String username, String email) {
        String foundId = null;
        String sql = "SELECT ID FROM users WHERE username = ? AND email = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, username);
            psmt.setString(2, email);
            rs = psmt.executeQuery();
            if (rs.next()) {
                foundId = rs.getString("ID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return foundId;
    }

    // 비밀번호 찾기: 아이디, 이름, 이메일로 비밀번호 조회 (실제 서비스에서는 임시 비번 발급/메일 발송 권장)
    public String findPwByIdNameEmail(String id, String username, String email) {
        String foundPw = null;
        String sql = "SELECT password FROM users WHERE ID = ? AND username = ? AND email = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, id);
            psmt.setString(2, username);
            psmt.setString(3, email);
            rs = psmt.executeQuery();
            if (rs.next()) {
                foundPw = rs.getString("password");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return foundPw;
    }
	


}
