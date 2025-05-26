-- 상세 정보 
SELECT
    d.del_idx AS 주문번호,
    '****-****-****-1234' AS 카드정보,  -- 실제 카드 정보 컬럼이 있다면 해당 컬럼 사용
    CURRENT_DATE AS 결제날짜,           -- 실제 결제일 컬럼이 있다면 해당 컬럼 사용
    p.p_amount AS 금액
FROM deliveries d
JOIN payment p ON d.del_idx = p.d_idx
WHERE d.del_idx = ?; -- ← 클릭한 행의 del_idx를 여기에 바인딩


-- 메인 
SELECT
    ROW_NUMBER() OVER (ORDER BY d.del_idx) AS 번호,
    d.keyword AS 배송_내역,
    CONCAT(sr.s_name, ' / ', sr.s_address) AS 보내는_사람_주소,
    CONCAT(sr.r_name, ' / ', sr.r_address) AS 받는_사람_주소,
    d.pre_pos AS 선불_후불,
    d.status AS 배송_상태
FROM deliveries d
JOIN sending_and_receiving sr ON d.sr_idx = sr.sr_idx;
