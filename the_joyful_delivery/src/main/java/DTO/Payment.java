package DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("payment")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Payment {
    private int idx;	  // 결제 idx
    private Long dIdx;     // 배송idx
    private String pCard; // 결제 카드
    private int pAmount;  // 결제 금액
    private Date pDate;   // 결제 날짜
}
