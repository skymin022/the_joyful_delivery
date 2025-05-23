package DTO;


import java.util.Date;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("announcement")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Announcement {
	
	@Pk
	private int idx;
	private String aName;
	private String aContent;
	private Date aCreatedAt;
	private Date aUpdatedAt;
}
