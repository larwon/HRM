-- DROP TABLE INSA CASCADE CONSTRAINTS;

-- SELECT * FROM INSA;

DROP SEQUENCE INSA_SEQ;
CREATE SEQUENCE INSA_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999
NOCYCLE
NOCACHE;

DROP TABLE INSA;
CREATE TABLE INSA(
	SABUN NUMBER PRIMARY KEY, -- 사번
	NAME VARCHAR2(50), -- 이름
	ENG_NAME VARCHAR2(50), -- 영어이름
	ID VARCHAR2(50), -- 아이디
	PWD VARCHAR2(64), -- 패스워드
	PHONE VARCHAR2(20), -- 전화번호
	HP VARCHAR2(20), -- 핸드폰번호
	REG_NO VARCHAR2(50), -- 주민등록번호
	YEARS NUMBER, -- 나이
	EMAIL VARCHAR2(100), -- 이메일
	JOIN_GBN_CODE VARCHAR2(50), -- 직종
	SEX VARCHAR2(20), -- 성별
	ZIP NUMBER, -- 우편번호
	ADDR1 VARCHAR2(100), -- 주소1(도-리 주소)
	ADDR2 VARCHAR2(100), -- 주소2(세부주소)
	POS_GBN_CODE VARCHAR2(50), -- 직위구분코드
	DEPT_CODE VARCHAR2(50), -- 부서코드
	SALARY NUMBER, -- 연봉
	JOIN_TYPE VARCHAR2(50), -- 입사여부
	GART_LEVEL VARCHAR2(50), -- 등급
	PUT_YN VARCHAR2(50), -- 투입여부
	MIL_YN VARCHAR2(50), -- 입대여부
	MIL_TYPE VARCHAR2(50), -- 군별
	MIL_LEVEL VARCHAR2(50), -- 계급
	MIL_STARTDATE VARCHAR2(50), -- 입영일자
	MIL_ENDDATE VARCHAR2(50), -- 전역일자
	KOSA_REG_YN VARCHAR2(50), -- KOSA등록
	KOSA_CLASS_CODE VARCHAR2(50), -- KOSA등급
	JOIN_DAY VARCHAR2(50), -- 입사일
	RETIRE_DAY VARCHAR2(50), -- 퇴사일
	CMP_REG_NO VARCHAR2(50), -- 사업자등록번호
	CRM_NAME VARCHAR2(100), -- 업체
	CMP_REG_IMAGE VARCHAR2(300), -- 사업자등록증
	SELF_INTRO VARCHAR2(4000), -- 자기소개
	CARRIER VARCHAR2(300), -- 이력서
	PROFILE_IMAGE VARCHAR2(300) -- 프로필 이미지
);
--	CARRIER_IMAGE VARCHAR2(300), -- 이력서 이미지

INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'이지상','leejisang','leejisang314','1q2w3e4r','031-948-1982','010-4911-5000','930314-1111111',29,'leejisang314@naver.com','1203','101',10893,'경기 파주시 가온로 27','(목동동) 1007동 904호','201','305',2800,'401','501','602','701','801','901','2013-03-26','2014-12-25','1001','1101','2021-08-30',NULL,'123-45-67890','아이티앤비즈','cmpreg_1632279053685.jpg','안녕하세요','carrier_1632279048744.jpg','bonobono_1632279046052.jpg');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'탁미란','takmiran','takmiran','1q2w3e4r','02-2934-8293','010-5285-3994','990517-2222222',23,'takmiran@gmail.com','1201','102',6267,'서울 강남구 남부순환로 2609','(도곡동)','203','304',2400,'402','501','601','702',NULL,NULL,NULL,NULL,'1001','1101','2020-09-01',NULL,'589-28-75732','아이티앤비즈','cmpreg_1632279053685.jpg',NULL,NULL,'chick_1632279051232.jpg');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'설재범','seoljaebum','seoljaebum','1q2w3e4r','032-648-2363','010-7467-2111','970314-1111111',25,'seoljaebum@naver.com','1204','101',10544,'경기 고양시 덕양구 가양대로 110','(덕은동)','202','305',3800,'401','502','601','701','802','901','2013-08-26','2014-05-25','1001','1102','2021-08-12',NULL,'321-76-67746','아이티앤비즈',NULL,'안녕하세요','carrier_1632279048744.jpg','kkobugi_1632279055946.jpg');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'유나영','yunayoung','yunayoung','1q2w3e4r','02-8487-2342','010-6339-7148','890119-2222222',33,'yunayoung@gmail.com','1205','102',10895,'경기 파주시 가람로 6','(와동동)','202','302',3500,'401','502','601','702',NULL,NULL,NULL,NULL,'1001','1102','2020-09-02','2021-08-30','523-12-12523','아이티앤비즈',NULL,NULL,NULL,'pikachu_1632279058200.jpg');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'임강민','imkangmin','imkangmin','1q2w3e4r','031-632-3462','010-4912-4701','911130-1111111',31,'imkangmin@naver.com','1202','101',10893,'경기 파주시 가온로 27','(목동동) 1007동 904호','201','305',4800,'402','503','602','701','803','902','2013-02-26','2014-11-25','1001','1103','2021-08-30',NULL,'234-48-28457','아이티앤비즈',NULL,'안녕하세요',NULL,'spongebob_1632279060339.jpg');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'오가영','ohgayoung','ohgayoung','1q2w3e4r','02-564-8432','010-5443-5830','980824-2222222',24,'ohgayoung@gmail.com','1201','102',16597,'경기 수원시 권선구 권선로 390','(평동)','201','304',3300,'402','503','601','702',NULL,NULL,NULL,NULL,'1001','1103','2020-09-01',NULL,'163-73-15845','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'홍남규','hongnamgyu','hongnamgyu','1q2w3e4r','032-754-7849','010-1932-1332','931225-1111111',29,'hongnamgyu@naver.com','1203','101',12265,'경기 남양주시 가운로가재울길 1','(다산동)','202','305',5800,'401','504','601','701','804','903','2013-04-26','2014-01-25','1001','1103','2021-08-19',NULL,'123-33-87924','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'양장미','yangjangmi','yangjangmi','1q2w3e4r','063-4875-4567','010-2438-8474','980103-2222222',24,'yangjangmi@gmail.com','1204','102',06307,'서울 강남구 개포로 202','(개포동)','203','302',3500,'401','504','601','702',NULL,NULL,NULL,NULL,'1001','1103','2020-09-10','2021-08-30','456-87-15468','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'하치원','hachiwon','hachiwon','1q2w3e4r','043-854-2774','010-4630-7751','910907-1111111',31,'hachiwon@naver.com','1202','101',02591,'서울 동대문구 서울시립대로3길 6','(전농동)','206','305',3700,'401','501','601','701','802','904','2013-05-26','2014-02-25','1001','1102','2021-08-30',NULL,'672-82-16467','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'심혜린','shimhyerin','shimhyerin','1q2w3e4r','064-1456-5178','010-9374-5864','950517-2222222',27,'shimhyerin@daum.net','1201','102',06313,'서울 강남구 논현로 4','(개포동)','201','303',4500,'402','501','601','702',NULL,NULL,NULL,NULL,'1001','1102','2020-09-02',NULL,'482-55-45678','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'오승헌','ohseungheon','ohseungheon','1q2w3e4r','031-2378-3715','010-9705-7507','961212-1111111',26,'ohseungheon@kakao.com','1205','101',06774,'서울 서초구 강남대로 27','(양재동)','201','305',4700,'401','502','601','701','801','905','2013-01-26','2014-10-25','1001','1101','2021-08-17',NULL,'784-94-77648','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'풍애정','pungaejung','pungaejung','1q2w3e4r','063-7647-8769','010-9199-9770','970308-2222222',25,'pungaejung@daum.net','1203','102',07946,'서울 양천구 공항대로 530','(목동)','202','301',3700,'401','502','601','702',NULL,NULL,NULL,NULL,'1001','1101','2020-09-11','2021-09-18','483-15-78962','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'노덕수','rohdeoksoo','rohdeoksoo','1q2w3e4r','043-5784-8657','010-5748-8896','880121-1111111',34,'rohdeoksoo@kakao.com','1205','101',46716,'부산 강서구 강동송백1길 7','(강동동)','206','305',2900,'402','503','602','701','803','906','2013-02-26','2014-11-25','1001','1101','2021-08-12',NULL,'567-02-74158','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'임영신','imYoungshin','imYoungshin','1q2w3e4r','064-2146-3786','010-4314-4595','920717-2222222',30,'imYoungshin@daum.net','1204','102',42459,'대구 남구 대경길 6','(대명동)','205','302',3500,'402','503','601','702',NULL,NULL,NULL,NULL,'1001','1102','2020-09-05',NULL,'566-78-47854','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'신무영','shinmooyoung','shinmooyoung','1q2w3e4r','033-545-5467','010-1669-6751','860331-1111111',36,'shinmooyoung@kakao.com','1202','101',30123,'세종특별자치시 가온로 9','(다정동, 가온마을 10단지)','204','305',3900,'401','504','601','701','804','907','2013-11-26','2014-08-25','1001','1103','2021-08-24',NULL,'845-76-94385','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'김나영','kimnayoung','kimnayoung','1q2w3e4r','054-844-4683','010-7558-8648','970224-2222222',25,'kimnayoung@daum.net','1201','102',25522,'강원 강릉시 강릉대로 33','(홍제동)','206','304',4500,'402','504','601','702',NULL,NULL,NULL,NULL,'1001','1103','2020-09-05',NULL,'795-84-73851','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'남병헌','nambyunghun','nambyunghun','1q2w3e4r','033-7893-4569','010-9227-6911','950319-1111111',27,'nambyunghun@kakao.com','1201','101',21439,'인천 부평구 경인로 671','(십정동)','202','305',2800,'402','502','601','701','801','907','2013-05-26','2014-02-25','1002',NULL,'2021-08-19',NULL,'978-55-25498','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'조미란','jomiran','jomiran','1q2w3e4r','061-777-8344','010-1573-5417','930107-2222222',29,'jomiran@nate.com','1202','102',14408,'경기 부천시 고리울로 6','(고강동, 다솔주택)','204','305',3900,'402','501','601','702',NULL,NULL,NULL,NULL,'1002',NULL,'2020-09-11','2021-09-12','576-85-45782','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'윤치원','yoonchiwon','yoonchiwon','1q2w3e4r','043-7584-4677','010-1335-5393','881231-1111111',34,'yoonchiwon@yahoo.com','1204','101',34303,'대전 대덕구 대덕대로 1283','(문평동)','205','305',5000,'401','501','601','701','802','906','2013-03-26','2014-12-25','1001','1102','2021-08-10',NULL,'278-59-47825','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'설혜린','seolhyerin','seolhyerin','1q2w3e4r','054-8/4-5671','010-4930-8289','960503-2222222',26,'seolhyerin@nate.com','1204','102',21994,'인천 연수구 컨벤시아대로 43','(송도동)','205','303',3700,'402','502','601','702',NULL,NULL,NULL,NULL,'1001','1101','2020-09-15',NULL,'275-74-84752','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'신광조','shinkwangjo','shinkwangjo','1q2w3e4r','033-785-4387','010-1544-4096','930508-1111111',29,'shinkwangjo@yahoo.com','1205','101',05408,'서울 강동구 양재대로 1303','(성내동)','204','305',4800,'401','503','602','701','803','905','2013-05-26','2014-02-25','1001','1101','2021-08-30',NULL,'584-47-46195','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'황이경','hwangyikyung','hwangyikyung','1q2w3e4r','061-567-1656','010-5275-2813','920201-2222222',30,'hwangyikyung@nate.com','1202','102',13541,'경기 성남시 분당구 판교백현로 104','(판교동)','202','304',3500,'401','503','601','702',NULL,NULL,NULL,NULL,'1001','1102','2020-09-15',NULL,'298-83-14114','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'성병헌','sungbyunghun','sungbyunghun','1q2w3e4r','031-756-7775','010-3325-1846','861027-1111111',36,'sungbyunghun@yahoo.com','1205','101',04100,'서울 마포구 서강로 136','(노고산동) 3층','202','305',3500,'401','504','601','701','804','904','2013-08-26','2014-05-25','1001','1103','2021-08-17',NULL,'468-99-85249','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'표혜린','pyohyerin','pyohyerin','1q2w3e4r','02-8942-5714','010-3365-2020','961201-2222222',26,'pyohyerin@nate.com','1201','102',62316,'광주 광산구 2순환로 2474','(신가동)','201','301',3900,'402','504','601','702',NULL,NULL,NULL,NULL,'1002',NULL,'2020-09-11','2021-09-18','458-38-58547','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'서동건','seodonggun','seodonggun','1q2w3e4r','031-9458-4675','010-9091-9517','010622-1111111',21,'seodonggun@yahoo.com','1201','101',41498,'대구 북구 3공단로 3','(노원동3가)','206','305',4800,'401','501','601','701','801','903','2013-03-26','2014-12-25','1001','1102','2021-08-11',NULL,'995-10-83645','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'전미래','jeonmilae','jeonmilae','1q2w3e4r','02-467-1991','010-4303-4885','930401-2222222',29,'jeonmilae@daum.net','1202','102',26130,'강원 정선군 정선읍 5일장길 8','4층','203','306',2200,'402','501','601','702',NULL,NULL,NULL,NULL,'1001','1102','2020-09-20','2021-09-12','967-22-47471','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'정경구','jeongkyunggu','jeongkyunggu','1q2w3e4r','031-2485-3348','010-2245-6212','990506-1111111',23,'jeongkyunggu@daum.net','1204','101',07345,'서울 영등포구 63로 6-2','(여의도동)','205','305',3800,'401','502','601','701','802','902','2013-09-26','2014-06-25','1001','1102','2021-08-25',NULL,'876-07-16497','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'신경님','singyeongnim','singyeongnim','1q2w3e4r','055-8444-3755','010-9091-8540','951130-2222222',27,'singyeongnim@daum.net','1203','102',01080,'서울 강북구 노해로7가길 1','(수유동)','204','305',2500,'401','502','602','702',NULL,NULL,NULL,NULL,'1001','1103','2020-09-10',NULL,'859-56-58478','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'표치원','pyochiwon','pyochiwon','1q2w3e4r','054-576-8655','010-8302-1012','000802-1111111',22,'pyochiwon@daum.net','1203','101',48556,'부산 남구 8부두로 1','(감만동)','204','305',2900,'401','503','601','701','803','901','2013-07-26','2014-04-25','1001','1102','2021-08-24',NULL,'558-76-55832','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'강미란','kangmiran','kangmiran','1q2w3e4r','054-578-5668','010-3168-7685','931202-2222222',29,'kangmiran@yahoo.com','1204','102',01079,'서울 강북구 노해로9가길 2','(수유동, 해오름베스트빌)','201','306',3500,'402','503','601','702',NULL,NULL,NULL,NULL,'1002',NULL,'2020-09-20',NULL,'738-28-75732','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'설무열','seolmooyeol','seolmooyeol','1q2w3e4r','055-4991-4573','010-4469-5548','930102-1111111',29,'seolmooyeol@nate.com','1203','101',18367,'경기 화성시 10용사로 49','(병점동)','202','305',3800,'401','504','601','701','804','901','2013-09-26','2014-06-25','1001','1103','2021-08-11',NULL,'585-99-76764','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'송애정','songaejung','songaejung','1q2w3e4r','041-045-3458','010-1041-2930','951001-2222222',27,'songaejung@yahoo.com','1203','102',07628,'서울 강서구 남부순환로11가길 11','(공항동)','205','301',2600,'402','504','601','702',NULL,NULL,NULL,NULL,'1001','1103','2020-09-23',NULL,'882-44-78445','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'복무영','bogmuyeong','bogmuyeong','1q2w3e4r','041-4562-1546','010-8462-4555','991018-1111111',23,'bogmuyeong@nate.com','1205','101',01115,'서울 강북구 수유로12가길 2','(수유동)','201','305',2800,'401','501','602','701','804','901','2013-01-26','2014-10-25','1001','1103','2021-08-10',NULL,'686-58-77668','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'문재인','moonjaein','moonjaein','1q2w3e4r','041-654-7345','010-3475-8917','940212-2222222',28,'moonjaein@yahoo.com','1205','102',01211,'서울 강북구 도봉로13가길 3','(미아동)','203','306',3500,'402','501','601','702',NULL,NULL,NULL,NULL,'1001','1101','2020-09-30','2021-09-12','686-78-14474','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'손오성','sonohseong','sonohseong','1q2w3e4r','064-7474-8697','010-9852-7728','010708-1111111',21,'sonohseong@nate.com','1202','101',05252,'서울 강동구 고덕로14가길 6','(암사동)','206','305',2500,'401','502','601','701','803','901','2013-05-26','2014-02-25','1001','1101','2021-08-08',NULL,'489-28-31205','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'양미래','yangmilae','yangmilae','1q2w3e4r','02-4687-3745','010-4505-6397','020721-2222222',20,'yangmilae@gmail.com','1202','102',05322,'서울 강동구 천중로15가길 1','(천호동)','206','303',2700,'402','502','601','702',NULL,NULL,NULL,NULL,'1002',NULL,'2020-09-30',NULL,'557-25-87555','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'추남규','choonamgyu','choonamgyu','1q2w3e4r','064-498-7531','010-4043-4007','930629-1111111',29,'choonamgyu@naver.com','1201','101',08864,'서울 관악구 문성로16가길 1','(신림동)','202','305',2600,'401','503','601','701','802','901','2013-11-26','2014-08-25','1001','1101','2021-08-25',NULL,'321-46-45805','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'고아리','goali','goali','1q2w3e4r','064-7406-8465','010-3078-9755','940920-2222222',28,'goali@kakao.com','1204','102',01109,'서울 강북구 솔매로17가길 5','(미아동)','202','302',2700,'402','503','601','702',NULL,NULL,NULL,NULL,'1001','1101','2020-09-23',NULL,'717-77-08545','아이티앤비즈',NULL,NULL,NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'정동건','jeongdonggun','jeongdonggun','1q2w3e4r','031-768-6725','010-5751-6670','000519-1111111',22,'jeongdonggun@kakao.com','1203','101',01163,'서울 강북구 도봉로18가길 3','(미아동)','201','305',2900,'401','504','601','701','801','901','2013-11-26','2014-08-25','1001','1103','2021-08-08',NULL,'850-79-00548','아이티앤비즈',NULL,'안녕하세요',NULL,'');
INSERT INTO INSA VALUES(INSA_SEQ.NEXTVAL,'심하얀','simhayan','simhayan','1q2w3e4r','02-546-1649','010-8249-1708','021210-2222222',20,'simhayan@gmail.com','1203','102',07772,'서울 강서구 곰달래로15가길 19','(화곡동, 청운아트빌)','203','305',3500,'402','504','602','702',NULL,NULL,NULL,NULL,'1001','1102','2020-09-01',NULL,'484-65-85047','아이티앤비즈',NULL,NULL,NULL,'');

