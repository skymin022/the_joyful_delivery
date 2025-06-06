package DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("users")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
	
	@Pk
	private Integer idx;
	private Integer roleIdx;
	private String id;
	private String password;
	private String username;
	private String email;
	private String address;
	private String birth;
	private String pNumber;
	private Date signUpDate;
	private boolean withdrawal;
	
	// 출력 
	@Override
	public String toString() {
	    return "User{" +
	            "roleIdx=" + roleIdx +
	            ", id='" + id + '\'' +
	            ", password='[PROTECTED]'" +
	            ", username='" + username + '\'' +
	            ", email='" + email + '\'' +
	            ", address='" + address + '\'' +
	            ", birth='" + birth + '\'' +
	            ", pNumber='" + pNumber + '\'' +
	            '}';
	}

}
