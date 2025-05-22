package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;
import DAO.UserDAO;
import DTO.User;

public class UserServiceImpl implements UserService {
	
	UserDAO userDAO = new UserDAO();

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
        User dbUser;
		try {
			dbUser = userDAO.select(user.getId());
		} catch (Exception e) {
			System.err.println("로그인 시 오류 발생 ");
			e.printStackTrace();
		}
        if (dbUser != null && dbUser.getPassword().equals(user.getPassword())) {
            return true;
        }
        return false;
    }


    @Override
    public User selectByUsername(String username) {
        return userDAO.selectByUsername(username);
    }



}
