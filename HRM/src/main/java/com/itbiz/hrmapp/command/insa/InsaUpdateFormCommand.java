package com.itbiz.hrmapp.command.insa;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbiz.hrmapp.dao.InsaDao;

public class InsaUpdateFormCommand implements InsaCommand {
	
	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) map.get("multipartRequest");
		
		InsaDao insaDao = sqlSession.getMapper(InsaDao.class);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String sabun = multipartRequest.getParameter("sabun");
		String name = multipartRequest.getParameter("name");
		String eng_name = multipartRequest.getParameter("eng_name");
		String id = multipartRequest.getParameter("id");
		String pwd = multipartRequest.getParameter("pwd");
		String pwd_check = multipartRequest.getParameter("pwd_check");
		String phone = multipartRequest.getParameter("phone");
		String hp = multipartRequest.getParameter("hp");
		String reg_no = multipartRequest.getParameter("reg_no");
		String years = multipartRequest.getParameter("years");
		String email = multipartRequest.getParameter("email");
		String join_gbn_code = multipartRequest.getParameter("join_gbn_code");
		String sex = multipartRequest.getParameter("sex");
		String zip = multipartRequest.getParameter("zip");
		String addr1 = multipartRequest.getParameter("addr1");
		String addr2 = multipartRequest.getParameter("addr2");
		String pos_gbn_code = multipartRequest.getParameter("pos_gbn_code");
		String dept_code = multipartRequest.getParameter("dept_code");
		String salary = multipartRequest.getParameter("salary").replaceAll(",", "");
		String join_type = multipartRequest.getParameter("join_type");
		String gart_level = multipartRequest.getParameter("gart_level");
		String put_yn = multipartRequest.getParameter("put_yn");
		String mil_yn = multipartRequest.getParameter("mil_yn");
		String mil_type = multipartRequest.getParameter("mil_type");
		String mil_level = multipartRequest.getParameter("mil_level");
		String mil_startdate = multipartRequest.getParameter("mil_startdate");
		String mil_enddate = multipartRequest.getParameter("mil_enddate");
		String kosa_reg_yn = multipartRequest.getParameter("kosa_reg_yn");
		String kosa_class_code = multipartRequest.getParameter("kosa_class_code");
		String join_day = multipartRequest.getParameter("join_day");
		String retire_day = multipartRequest.getParameter("retire_day");
		String cmp_reg_no = multipartRequest.getParameter("cmp_reg_no");
		String crm_name = multipartRequest.getParameter("crm_name");
		String cmp_reg_image = insaDao.insaProfile(Integer.parseInt(sabun)).getCmp_reg_image();
		String self_intro = multipartRequest.getParameter("self_intro");
		String carrier = insaDao.insaProfile(Integer.parseInt(sabun)).getCarrier();
		String profile_image = insaDao.insaProfile(Integer.parseInt(sabun)).getProfile_image();
		
		int i_sabun = insaDao.insaProfile(Integer.parseInt(sabun)).getSabun();
		
		if (!(phone.equals("")) && !(Pattern.matches("^\\d{2,3}-\\d{3,4}-\\d{4}$", phone))) {
			resultMap.put("insaUpdateResult", 0); // 전화번호 정규화 불일치
		} else if (hp.equals("")) {
			resultMap.put("insaUpdateResult", -1); // 핸드폰번호 항목 공백
		} else if (!(Pattern.matches("^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$", hp))) {
			resultMap.put("insaUpdateResult", -2); // 핸드폰번호 정규화 불일치
		} else if (!(reg_no.equals("")) && !(Pattern.matches("^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$", reg_no))) {
			resultMap.put("insaUpdateResult", -3); // 주민번호 정규화 불일치
		} else if (email.equals("@")) {
			resultMap.put("insaUpdateResult", -4); // 이메일 공백
		} else if (insaDao.emailCheck(id, email) != null) {
			resultMap.put("insaUpdateResult", -5); // 이메일 중복
		} else if (!(Pattern.matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-z]{2,3}$", email))) {
			resultMap.put("insaUpdateResult", -6); // 이메일 정규화 불일치
		} else if (join_day.equals("")) {
			resultMap.put("insaUpdateResult", -7); // 입사일자 공백
		} else if (pwd.equals("")) {
			resultMap.put("insaUpdateResult", -8); // 패스워드 공백
		} else if (pwd_check.equals("")) {
			resultMap.put("insaUpdateResult", -9); // 패스워드 확인 공백
		} else if (!(pwd.equals(pwd_check))) {
			resultMap.put("insaUpdateResult", -10); // 패스워드 확인 불일치
		} else if (insaDao.login(i_sabun, pwd) == null) {
			resultMap.put("insaUpdateResult", -11); // 아이디 패스워드 불일치
		} else {
			// file
			List<MultipartFile> files = multipartRequest.getFiles("files");
			
			int num = 0;
			String[] arrayFileName = new String[3];
			
			// 첨부를 하나씩 꺼내기
			for (MultipartFile file : files) {
				
				// 꺼낸 첨부가 있는지 검사
				if (file != null && !file.isEmpty()) {
					
					// MultipartFile file에서 첨부하는 파일명을 알아냅니다.
					String originalFilename = file.getOriginalFilename();
					
					// 업로드 할 파일명의 중복 방지 대책을 수립합니다.
					// 원래파일명_업로드시간.확장자
					
					// abcde.jpg
					// 확장자 (jpg 구하기)
					String extension = originalFilename.substring( originalFilename.lastIndexOf(".") + 1 );
					// 파일명 (abcde 구하기)
					String filename = originalFilename.substring( 0, originalFilename.lastIndexOf(".") );
					
					// 업로드 할 파일명 만들기 (abcde_업로드시간.jpg)
					String uploadFilename = filename +
							                "_" +
							                System.currentTimeMillis() +
							                "." +
							                extension;
					
					arrayFileName[num] = uploadFilename;
					System.out.println((num + 1) + "번째 파일명: " + arrayFileName[num]);
					// 업로드 할 경로 구하기
					// 업로드는 resources/storage 디렉토리에 저장하기로 합니다.
					// 자바 코드로 storage 디렉토리를 만들기 때문에 미리 만들어 둘 필요가 없습니다.
					String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
					
					// 업로드 할 경로가 없으면 storage 디렉토리를 만듭니다.
					File dir = new File(realPath);
					if ( !dir.exists() ) {
						dir.mkdirs();
					}
					
					// 이제 업로드 할 파일명(uploadFilename)과 경로(realPath)를 모두 알고 있습니다.
					File uploadFile = new File(realPath, uploadFilename);
					
					// 첨부한 파일(MultipartFile file) -> 업로드 (uploadFile) 합니다.
					try {
						file.transferTo(uploadFile);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					// 테이블에 데이터를 저장합니다.
					if (num == 2) {
						insaDao.insaUpdate(sabun, name, eng_name, phone, hp, reg_no, years, email, join_gbn_code, sex, zip, addr1, addr2, pos_gbn_code, dept_code, salary,
								join_type, gart_level, put_yn, mil_yn, mil_type, mil_level, mil_startdate, mil_enddate, kosa_reg_yn, kosa_class_code, join_day,
								retire_day, cmp_reg_no, crm_name, arrayFileName[1], self_intro, arrayFileName[2], arrayFileName[0]);  // 첨부가 있는 경우
					}
					num += 1;
				} else if (num == 2 && carrier != null) {
					arrayFileName[num] = carrier;
					System.out.println((num + 1) + "번째 파일명: " + arrayFileName[num]);
					insaDao.insaUpdate(sabun, name, eng_name, phone, hp, reg_no, years, email, join_gbn_code, sex, zip, addr1, addr2, pos_gbn_code, dept_code, salary,
							join_type, gart_level, put_yn, mil_yn, mil_type, mil_level, mil_startdate, mil_enddate, kosa_reg_yn, kosa_class_code, join_day,
							retire_day, cmp_reg_no, crm_name, arrayFileName[1], self_intro, arrayFileName[2], arrayFileName[0]);
					num += 1;
				} else if (num == 1 && cmp_reg_image != null) {
					arrayFileName[num] = cmp_reg_image;
					System.out.println((num + 1) + "번째 파일명: " + arrayFileName[num]);
					num += 1;
				} else if (num == 0 && profile_image != null) {
					arrayFileName[num] = profile_image;
					System.out.println((num + 1) + "번째 파일명: " + arrayFileName[num]);
					num += 1;
				} else {
					arrayFileName[num] = "";
					if (num == 2) {
						insaDao.insaUpdate(sabun, name, eng_name, phone, hp, reg_no, years, email, join_gbn_code, sex, zip, addr1, addr2, pos_gbn_code, dept_code, salary,
								join_type, gart_level, put_yn, mil_yn, mil_type, mil_level, mil_startdate, mil_enddate, kosa_reg_yn, kosa_class_code, join_day,
								retire_day, cmp_reg_no, crm_name, arrayFileName[1], self_intro, arrayFileName[2], arrayFileName[0]);  // 첨부가 없는 경우
					}
					num += 1;
				}
			}
			resultMap.put("insaUpdateResult", 1);
		}
		return resultMap;
	}
	

}
