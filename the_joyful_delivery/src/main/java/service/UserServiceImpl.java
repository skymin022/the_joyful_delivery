package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;
import DAO.UserDAO;
import DTO.Users;

public class UserServiceImpl implements UserService {
	
	UserDAO userDAO = new UserDAO();

	@Override
	public List<Users> list() {
		List<Users> list = null;
		try {
			list = userDAO.list();
		} catch (Exception e) {
			System.err.println("유저 전체 조회 중 에러");
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Users> listBy(Map<String, Object> fields) {
		List<Users> list = null;
		try {
			list = userDAO.listBy(fields);
		} catch (Exception e) {
			System.err.println("특정 유저 조회");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public PageInfo<Users> page() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Users select(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Users user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Users insertKey(Users user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Users user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}



}
