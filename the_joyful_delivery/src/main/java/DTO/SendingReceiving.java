package DTO;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("sending_and_receiving")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SendingReceiving {

	@Pk
	private int idx;
	private String sName;
	private String sNumber;
	private String sAddress;
	private String rName;
	private String rNumber;
	private String rAddress;
}
