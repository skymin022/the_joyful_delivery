-- inquiries 			- 1:1 문의 테이블
-- sending_and_receiving - 발신자 및 수신자 정보 테이블
-- user_roles 			- 사용자 권한 테이블
-- companies 			- 회사 정보 테이블
-- users 				- 사용자 정보 테이블
-- reimbursement 		- 피해 보상 정보 테이블
-- payment 				- 결제 정보 테이블
-- copy_of_inquiries 	- 문의 답변 복사본 테이블
-- region_name 			- 지역명 테이블
-- charge 				- 요금 관련 체크 테이블
-- deliveries 			- 배송 정보 테이블
-- announcement 		- 공지사항 테이블
-- drivers 				- 운전자 정보 테이블

-- 계정 : mini_team1		비번 : 123456	    스키마 : delivery
-- 19행 부터 끝까지 복사 후 workbench 에 붙여넣기 후 ctrl + shift + enter 

-- 테이블 생성
-- 1. 기존 테이블 삭제
DROP TABLE IF EXISTS copy_of_inquiries;
DROP TABLE IF EXISTS inquiries;
DROP TABLE IF EXISTS region_name;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS sending_and_receiving;
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS reimbursement;
DROP TABLE IF EXISTS charge;
DROP TABLE IF EXISTS announcement;
DROP TABLE IF EXISTS faq;

-- 2. 테이블 생성 (의존성 없는 순서대로)
CREATE TABLE `user_roles` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT,
    `role` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`idx`)
);

CREATE TABLE `faq` (
	`idx`	BIGINT	NOT NULL AUTO_INCREMENT,
	`title`	VARCHAR(200)	NOT NULL,
	`content`	TEXT	NOT NULL,
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `sending_and_receiving` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT,
    `s_name` VARCHAR(100) NOT NULL,
    `s_number` VARCHAR(100) NOT NULL,
    `s_address` VARCHAR(200) NOT NULL,
    `r_name` VARCHAR(100) NOT NULL,
    `r_number` VARCHAR(100) NOT NULL,
    `r_address` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`idx`)
);

CREATE TABLE `drivers` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `number` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`idx`)
);

CREATE TABLE `users` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'index',
    `role_idx` BIGINT NOT NULL DEFAULT 1,
    `ID` VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `username` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `address` VARCHAR(200) NOT NULL,
    `birth` VARCHAR(100) NOT NULL,
    `sign_up_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `withdrawal` BOOLEAN NOT NULL DEFAULT FALSE,
    `p_number` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`idx`)
);

CREATE TABLE `deliveries` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT,
    `user_idx` BIGINT NULL COMMENT 'index',
    `driver_idx` BIGINT NULL,
    `sr_idx` BIGINT NOT NULL,
    `keyword` VARCHAR(100) NOT NULL,
    `status` ENUM('배송중', '배송완료', '픽업전') NOT NULL,
    `value` INT NOT NULL,
    `pre_pos` ENUM('선불', '후불') NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `reser_name` VARCHAR(200) NOT NULL,
    `success` BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (`idx`)
);

CREATE TABLE `region_name` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT,
    `del_idx` BIGINT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `status` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`idx`)
);

CREATE TABLE `payment` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT,
    `d_idx` BIGINT NOT NULL,
    `p_card` VARCHAR(200) ,
    `p_amount` INT NOT NULL,
    `p_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`idx`)
);

CREATE TABLE `inquiries` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT,
    `user_no` BIGINT NOT NULL COMMENT 'index',
    `title` VARCHAR(200) NOT NULL,
    `content` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `check_answer` BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (`idx`)
);

CREATE TABLE `copy_of_inquiries` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT,
    `inquiry_idx` BIGINT NOT NULL,
    `content` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`idx`)
);

CREATE TABLE `reimbursement` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT,
    `damage` INT NOT NULL,
    `reimburse_pay` INT NOT NULL,
    PRIMARY KEY (`idx`)
);

CREATE TABLE `charge` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT,
    `w_check` INT NOT NULL,
    `s_check` INT NOT NULL,
    `r_check` INT NOT NULL,
    PRIMARY KEY (`idx`)
);

CREATE TABLE `announcement` (
    `idx` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `content` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`idx`)
);

-- 3. 외래키 설정
ALTER TABLE `users`
    ADD CONSTRAINT `FK_users_role_idx`
    FOREIGN KEY (`role_idx`) REFERENCES `user_roles`(`idx`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `inquiries`
    ADD CONSTRAINT `FK_inquiries_user_no`
    FOREIGN KEY (`user_no`) REFERENCES `users`(`idx`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `copy_of_inquiries`
    ADD CONSTRAINT `FK_copy_inquiries_inquiry_idx`
    FOREIGN KEY (`inquiry_idx`) REFERENCES `inquiries`(`idx`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `deliveries`
    ADD CONSTRAINT `FK_deliveries_user_idx`
    FOREIGN KEY (`user_idx`) REFERENCES `users`(`idx`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `FK_deliveries_driver_idx`
    FOREIGN KEY (`driver_idx`) REFERENCES `drivers`(`idx`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `FK_deliveries_sr_idx`
    FOREIGN KEY (`sr_idx`) REFERENCES `sending_and_receiving`(`idx`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `region_name`
    ADD CONSTRAINT `FK_region_name_del_idx`
    FOREIGN KEY (`del_idx`) REFERENCES `deliveries`(`idx`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `payment`
    ADD CONSTRAINT `FK_payment_d_idx`
    FOREIGN KEY (`d_idx`) REFERENCES `deliveries`(`idx`)
    ON DELETE CASCADE ON UPDATE CASCADE;
