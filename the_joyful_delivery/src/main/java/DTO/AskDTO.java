package DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Pk;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


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

}
