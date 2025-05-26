package DTO;
import java.util.Date;



import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("faq")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FAQ {
	
	@Pk
	private int idx;
	private String title;
	private String content;
	private Date createdAt;
	private Date updatedAt;
	
}
