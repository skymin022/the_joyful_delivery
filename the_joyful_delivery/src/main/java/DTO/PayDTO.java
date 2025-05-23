package DTO;
import lombok.Data;


@Data
public class PayDTO {
    private String orderNumber;
    private String trackingNumber;
    private String cardNumber;
    private String depositorName;
    private String senderName;
    private String waybillPassword;
    private String phone;
    private String email;
    private String receiverName;
    private String address;
    private String addressDetail;
}
