package util;

import java.net.URLEncoder;
import java.util.Map;
import java.util.StringJoiner;

public class QueryStringBuilder {

	// 파라미터 쿼리에서 page 빼고 다시 연결하는 메서드
	public static String execute(Map<String, String[]> param) {
    StringJoiner sj = new StringJoiner("&");
    
    for(Map.Entry<String, String[]> entry : param.entrySet()) {
        String key = entry.getKey();
        if (!key.equals("page")) {
            for(String value : entry.getValue()) {
                try {
                    String encodedValue = URLEncoder.encode(value, "UTF-8");
                    sj.add(key + "=" + encodedValue);
                } catch (Exception e) {
                    sj.add(key + "=" + value);
                }
            }
        }
    }
    return sj.toString();
}
}
