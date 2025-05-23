package DTO;


import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Table("drivers")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Driver {
	
	@Pk
	private int idx;
	private String name;
	private String number;
}
