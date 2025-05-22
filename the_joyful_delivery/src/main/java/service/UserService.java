package service;

import java.util.List;
import com.alohaclass.jdbc.dto.PageInfo;
import DTO.Users;

public interface UserService {

	// C.R.U.D
	public List<Users> list();
	public PageInfo<Users> page();
	public Users select(int no);
	public int insert(Users user);
	public Users insertKey(Users user);
	public int update(Users user);
	public int delete(int no);
}
