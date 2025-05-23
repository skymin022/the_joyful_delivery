package DTO;


import java.util.Date;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("deliveries")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Delivery {
	
	@Pk
	private int idx;
	private int userIdx;
	private int driverIdx;
	private int srIdx;
	private String keyword;
	private String status;
	private int value;
	private String prePos;
	private Date createdAt;
	private String reserName;	// 예약명
	private boolean success;
	
	// 조인해서 가져올 컬럼 원래는 이렇게 하면 안됨.
	@Column(exist = false)
	private String regStatus;
}
