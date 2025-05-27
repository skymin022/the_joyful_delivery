package DTO;

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
public class CheckoutDTO {
@Pk
private int idx;
private int userIdx;
}