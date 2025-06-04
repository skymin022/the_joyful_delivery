package DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("inquiries")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AskDTO {
	
	@Pk
	private int idx;
	private int userNo;
	private String title;
	private String content;
	private Date createdAt;
	private int checkAnswer;
	private String type;
	private String admAnswer;
}
