package DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("region_name")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RegionName {
	
	@Pk
	private long idx;
	private long delIdx;
	private Date createdAt;
	private String status;
}
