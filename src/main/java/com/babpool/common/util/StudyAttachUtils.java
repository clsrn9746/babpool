package com.babpool.common.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.babpool.attach.vo.AttachVO;

@Component
public class StudyAttachUtils {
	@Value("#{util['file.upload.path']}")
	private String uploadPath;

	/** 다중 MultipartFile에서 VO 설정 및 업로드 파일 처리 후 List 리턴 */
	public List<AttachVO> getAttachListByMultiparts(MultipartFile[] boFiles, String category, String path)
			throws IOException {
		List<AttachVO> atchList = new ArrayList<AttachVO>();
		for (int i = 0; i < boFiles.length; i++) {
			MultipartFile multipart = boFiles[i];
			AttachVO vo = this.getAttachByMultipart(multipart, category, path);
			if (vo != null) {
				atchList.add(vo);
			}
		}
		return atchList;
	}

	/** MultipartFile에서 VO 설정 및 업로드 파일 처리 후 리턴, 없는 경우 null */
	public AttachVO getAttachByMultipart(MultipartFile multipart, String category, String path) throws IOException {
		if (!multipart.isEmpty()) {
			String fileName = UUID.randomUUID().toString();
			AttachVO vo = new AttachVO();

			// 본래 파일명 세팅
			vo.setAtchOriginalName(multipart.getOriginalFilename());
			// 파일 사이즈 세팅
			vo.setAtchFileSize(multipart.getSize());
			// 파일 타입
			vo.setAtchContentType(multipart.getContentType());
			// 이름, 카테고리, 경로, 사이즈 세팅
			vo.setAtchCategory(category);
			vo.setAtchName(fileName);
			vo.setAtchPath(path);
			vo.setAtchFancySize(fancySize(multipart.getSize()));

			System.out.println(category);
			System.out.println(fileName);
			System.out.println(path);
			System.out.println(vo.getAtchFancySize());
			System.out.println(vo.getAtchOriginalName());

			String filePath = uploadPath + File.separatorChar + vo.getAtchPath();
			vo.setAtchPath(filePath);
			System.out.println(filePath);

			FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(filePath, fileName));
			// 여기서 실제 파일이 저장(regist에서 실행됬다), inputStream을 file로 변환하는 메소드
			// multipart.transferTo(new File(filePath, fileName)); // 비슷한 역할
			return vo;
		} else {
			return null;
		}
	}

	private DecimalFormat df = new DecimalFormat("#,###.0");

	private String fancySize(long size) {
		if (size < 1024) { // 1k 미만
			return size + " Bytes";
		} else if (size < (1024 * 1024)) { // 1M 미만
			return df.format(size / 1024.0) + " KB";
		} else if (size < (1024 * 1024 * 1024)) { // 1G 미만
			return df.format(size / (1024.0 * 1024.0)) + " MB";
		} else {
			return df.format(size / (1024.0 * 1024.0 * 1024.0)) + " GB";
		}
	}

}