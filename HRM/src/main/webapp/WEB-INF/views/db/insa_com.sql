-- DROP TABLE INSA_COM CASCADE CONSTRAINTS;

-- SELECT * FROM INSA_COM;

DROP SEQUENCE INSA_COM_SEQ;
CREATE SEQUENCE INSA_COM_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999
NOCYCLE
NOCACHE;

DROP TABLE INSA_COM;
CREATE TABLE INSA_COM(
	GUBUN VARCHAR2(50), -- 구분
	CODE VARCHAR2(50), -- 코드
	NAME VARCHAR2(50), -- 이름
	NOTE VARCHAR2(500), -- 비고
	CONSTRAINT INSA_COM_PK PRIMARY KEY (GUBUN, CODE)
);

-- 직종 체크
INSERT INTO INSA_COM VALUES('job_check', '1201', '정보보안전문가', NULL);
INSERT INTO INSA_COM VALUES('job_check', '1202', '네트워크엔지니어', NULL);
INSERT INTO INSA_COM VALUES('job_check', '1203', '프로그래머', NULL);
INSERT INTO INSA_COM VALUES('job_check', '1204', '시스템엔지니어', NULL);
INSERT INTO INSA_COM VALUES('job_check', '1205', '데이터베이스관리자', NULL);

-- 성별
INSERT INTO INSA_COM VALUES('gender', '101', '남자', NULL);
INSERT INTO INSA_COM VALUES('gender', '102', '여자', NULL);

-- 직위
INSERT INTO INSA_COM VALUES('position', '201', '사원', NULL);
INSERT INTO INSA_COM VALUES('position', '202', '주임', NULL);
INSERT INTO INSA_COM VALUES('position', '203', '대리', NULL);
INSERT INTO INSA_COM VALUES('position', '204', '과장', NULL);
INSERT INTO INSA_COM VALUES('position', '205', '차장', NULL);
INSERT INTO INSA_COM VALUES('position', '206', '부장', NULL);

-- 부서
INSERT INTO INSA_COM VALUES('dept', '301', '총무팀', NULL);
INSERT INTO INSA_COM VALUES('dept', '302', '경리부', NULL);
INSERT INTO INSA_COM VALUES('dept', '303', '경영팀', NULL);
INSERT INTO INSA_COM VALUES('dept', '304', '인사과', NULL);
INSERT INTO INSA_COM VALUES('dept', '305', '영업팀', NULL);
INSERT INTO INSA_COM VALUES('dept', '306', '홍보팀', NULL);

-- 입사구분
INSERT INTO INSA_COM VALUES('join_gu', '401', '신입', NULL);
INSERT INTO INSA_COM VALUES('join_gu', '402', '경력', NULL);

-- 등급
INSERT INTO INSA_COM VALUES('rank', '501', '초급', NULL);
INSERT INTO INSA_COM VALUES('rank', '502', '중급', NULL);
INSERT INTO INSA_COM VALUES('rank', '503', '고급', NULL);
INSERT INTO INSA_COM VALUES('rank', '504', '특급', NULL);

-- 투입여부
INSERT INTO INSA_COM VALUES('input_check', '601', '가능', NULL);
INSERT INTO INSA_COM VALUES('input_check', '602', '불가능', NULL);

-- 군필여부
INSERT INTO INSA_COM VALUES('army_check', '701', '군필자', NULL);
INSERT INTO INSA_COM VALUES('army_check', '702', '미필자', NULL);

-- 군별
INSERT INTO INSA_COM VALUES('army_type', '801', '육군', NULL);
INSERT INTO INSA_COM VALUES('army_type', '802', '해군', NULL);
INSERT INTO INSA_COM VALUES('army_type', '803', '해병대', NULL);
INSERT INTO INSA_COM VALUES('army_type', '804', '공군', NULL);

-- 계급
INSERT INTO INSA_COM VALUES('classes', '901', '병장', NULL);
INSERT INTO INSA_COM VALUES('classes', '902', '하사', NULL);
INSERT INTO INSA_COM VALUES('classes', '903', '중사', NULL);
INSERT INTO INSA_COM VALUES('classes', '904', '상사', NULL);
INSERT INTO INSA_COM VALUES('classes', '905', '중위', NULL);
INSERT INTO INSA_COM VALUES('classes', '906', '대위', NULL);
INSERT INTO INSA_COM VALUES('classes', '907', '소령', NULL);

-- KOSA등록
INSERT INTO INSA_COM VALUES('kosa', '1001', '등록', NULL);
INSERT INTO INSA_COM VALUES('kosa', '1002', '미등록', NULL);

-- KOSA등급
INSERT INTO INSA_COM VALUES('kosa_rank', '1101', '초급', NULL);
INSERT INTO INSA_COM VALUES('kosa_rank', '1102', '중급', NULL);
INSERT INTO INSA_COM VALUES('kosa_rank', '1103', '고급', NULL);