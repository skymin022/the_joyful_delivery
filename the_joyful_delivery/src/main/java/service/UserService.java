package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.PageInfo;
import DTO.User;

public interface UserService {

	// C.R.U.D
	public List<User> list();
	public List<User> listBy(Map<String, Object> fields);
	public PageInfo<User> page(String keyword, List<String> columList);
	public User select(String userId);
	public int insert(User user);
	public User insertKey(User user);
	public int update(User user);
	public int delete(int no);
	
	// 로그인 
	boolean login(User user);
	User selectUserById(String id); // loginUser
	boolean insertUser(User user);
    boolean isUserIdDuplicate(String id); // 아이디 중복 검사
    
    // 아이디 비밀번호 찾기
    String findIdByNameAndEmail(String username, String email);
    String findPwByIdNameEmail(String id, String username, String email);
}
