# the_joyful_delivery

 Delivery Service Platform
회원 관리, 배송 예약, 결제 처리, 고객센터 기능을 갖춘 종합 택배 예약 및 관리 시스템입니다.
사용자는 회원가입 후 손쉽게 배송 예약과 결제를 진행할 수 있으며, 실시간 배송 조회 및 고객센터 문의 서비스를 지원합니다.

📌 2. 주요 기능 및 서비스 구현
🔑 회원 관리 및 인증
- 회원가입 / 로그인 / 로그아웃 기능 제공
- 회원가입 시, 아이디 중복 검사, 비밀번호 및 연락처 인증
- 로그인 시 세션(Session) 및 쿠키(Cookie)를 이용한 자동 로그인 처리
- 회원 정보 수정 기능 (비밀번호, 연락처, 이메일, 주소 수정 가능, 유효성 검사 수행 계정 복구 기능)
- 이름 + 이메일 OR 아이디를 통한 아이디/비밀번호 찾기

📦 배송 예약 및 조회
- 3단계 예약 프로세스 (물품 정보 입력 ➡ 보내는 사람 정보 입력 ➡ 받는 사람 정보 및 결제 정보 입력)
- 예약 완료 시 (운송장 번호 자동 생성, 기사 배정 랜덤 생성)
- 배송 조회 기능 (운송장 번호 기반으로 실시간 배송 상태 및 위치 확인 가능, 회원 전용 배송 내역 페이지 제공)
- 로그인한 회원의 배송/결제 이력 조회 가능 (배송 상태와 최신 위치 정보를 함께 표시)

💳 결제 처리 및 결과 안내
- 결제 페이지(paypage.jsp)에서 예약 정보 + 결제 정보 확인 후 진행
- 결제 결과 안내 (성공 → paysuccess.jsp 이동, 실패 → payfail.jsp 이동)
- 결제 완료 후 배송 예약 및 송장 정보와 데이터베이스 연동 저장

📞 고객센터 및 문의 관리
- 공지사항 / FAQ 최신순 조회 가능, 검색 기능 지원
- 1:1 문의 회원별 문의 내역 조회 가능
- 문의 등록 및 답변 기능 지원
- 관리자 페이지 (문의사항 목록 조회, 답변 등록 가능)
- 문의 답변 시 모달창 UI 제공 → 직관적이고 빠른 처리 가능

🛠️ 기술 스택
- Backend: Java, JSP/Servlet, JDBC
- Database: MySQL (DB 설계 및 연동)
- Frontend: HTML5, CSS3, JavaScript, jQuery
- Server: Apache Tomcat
- Tools: GitHub, Eclipse/IntelliJ

✅ 프로젝트 특징
- 회원 인증부터 결제, 고객센터까지 연결된 End-to-End 서비스 제공
- 데이터 무결성을 위한 유효성 검사와 보안 처리(세션/쿠키 관리)
- UI/UX를 고려한 단계별 예약 및 모달 창 기반 관리자 답변 시스템


<details>
  <h3>클릭해서 열기</h3>
 
  ![Image](https://github.com/user-attachments/assets/161c940e-949d-47d6-ac64-f321a4cc543f)
</details>

## 택배 조회 관리 시스템 
![Image](https://github.com/user-attachments/assets/eba0cf71-a297-4370-b885-8408d371c7c3)
![Image](https://github.com/user-attachments/assets/3acfc971-6ef5-4fc6-9ac7-095373b23b58)
![Image](https://github.com/user-attachments/assets/c36cb228-7805-4dbc-9921-9c6f25d58b1b)
![Image](https://github.com/user-attachments/assets/f5882a22-996e-4ee7-86e5-cf349ca3a543)
![Image](https://github.com/user-attachments/assets/f222ba97-f429-4eb6-acab-ebe53ebbecb7)
![Image](https://github.com/user-attachments/assets/1ce04970-92aa-4be8-bc7e-0d3e75c40ee1)
![Image](https://github.com/user-attachments/assets/b30b9b88-4ca8-4e28-9aaa-9601075ccd3b)
![Image](https://github.com/user-attachments/assets/ac56ce7b-122c-4bc9-bd0f-572e77c554e3)
![Image](https://github.com/user-attachments/assets/967e9854-e6cc-49c4-a840-c61d692b26f6)
![Image](https://github.com/user-attachments/assets/7c66937f-da19-4a1c-a40e-243d727d211b)
![Image](https://github.com/user-attachments/assets/64391d8b-d28d-46a0-8986-ca044bf5f84e)
![Image](https://github.com/user-attachments/assets/a7c3a7a5-eef0-497e-96ac-096584d1b405)
![Image](https://github.com/user-attachments/assets/06b1cf34-5a6d-4b58-9af8-a38e84a1fb27)
![Image](https://github.com/user-attachments/assets/540b883d-b1fa-4e36-88e6-2d1b729dfd22)
![Image](https://github.com/user-attachments/assets/2af8dfbc-3910-464a-8251-8ef4b4ab3474)
![Image](https://github.com/user-attachments/assets/4c7c5ab5-fbb4-4bc6-9a03-68713ee02ef9)
![Image](https://github.com/user-attachments/assets/1a907852-c312-401e-bc9a-de6c48cf457f)
![Image](https://github.com/user-attachments/assets/d121884e-bda8-47b1-8c86-95fdf0f8f8c2)
![Image](https://github.com/user-attachments/assets/2cb9b691-c7b2-4684-a0f6-0cbba88d7111)
![Image](https://github.com/user-attachments/assets/5d275c9d-e5be-4b1f-ac62-3dd78b961344)
![Image](https://github.com/user-attachments/assets/bedd8f38-8bac-4965-be30-06814292ee44)
![Image](https://github.com/user-attachments/assets/5f4cd3df-cc63-48c8-b5d5-a2dc3562c093)
![Image](https://github.com/user-attachments/assets/161c940e-949d-47d6-ac64-f321a4cc543f)
![Image](https://github.com/user-attachments/assets/bc0ebd01-005a-42c4-a56e-bb2ed81bd023)
![Image](https://github.com/user-attachments/assets/e6344c87-5999-47b3-8eee-6660240af795)
![Image](https://github.com/user-attachments/assets/dede77a9-90fd-4f46-8db8-757aaf703b3d)
