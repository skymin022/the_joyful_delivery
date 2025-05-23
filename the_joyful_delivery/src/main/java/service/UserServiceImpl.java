package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;
import DAO.UserDAO;
import DTO.User;

public class UserServiceImpl implements UserService {
	
	private UserDAO userDAO = new UserDAO();

	@Override
	public List<User> list() {
		List<User> list = null;
		try {
			list = userDAO.list();
		} catch (Exception e) {
			System.err.println("유저 전체 조회 중 에러");
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<User> listBy(Map<String, Object> fields) {
		List<User> list = null;
		try {
			list = userDAO.listBy(fields);
		} catch (Exception e) {
			System.err.println("특정 유저 조회");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public PageInfo<User> page() {
		// TODO Auto-generated method stub
		return null;
	}

	public User select(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User insertKey(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User select(String userId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
    public boolean login(User user) {
        User dbUser = null;
        try {
            dbUser = selectUserById(user.getId());
            System.out.println("입력 아이디: " + user.getId());
            System.out.println("DB 조회 결과: " + dbUser);
            System.out.println("입력 비밀번호: " + user.getPassword());
            System.out.println("DB 비밀번호: " + (dbUser != null ? dbUser.getPassword() : "null"));
        } catch (Exception e) {
            System.err.println("로그인 시 오류 발생");
            e.printStackTrace();
        }

        return dbUser != null && dbUser.getPassword().equals(user.getPassword());
    }

   @Override
    public User selectUserById(String id) {
        return userDAO.select(id);
    }

   @Override
   public boolean insertUser(User user) {
	    int result = userDAO.insert(user);
	    boolean success = result > 0;

	    if (success) {
	        System.out.println("회원가입 성공");
	    } else {
	        System.err.println("회원가입 실패");
	    }

	    return success;
	}

	@Override
	public boolean isUserIdDuplicate(String id) {
		if (id == null || id.trim().isEmpty()) {
		        return false; // 빈 값 처리
		}
		return userDAO.select(id.trim()) != null;
	}


}
