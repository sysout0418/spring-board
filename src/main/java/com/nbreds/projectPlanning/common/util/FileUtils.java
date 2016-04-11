package com.nbreds.projectPlanning.common.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Component("fileUtils")
public class FileUtils {

	// 파일이름을 랜덤으로 생성할 때 사용된다.
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	private static final String filePath = "/home/projectPlan/WebProject/upload/";

	public List<Map<String, Object>> parseInsertFileInfo(Issue issues, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		int ino = issues.getIno();
		int uno = issues.getUno();

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);

				listMap = new HashMap<String, Object>();
				listMap.put("ino", ino);
				listMap.put("uno", uno);
				listMap.put("originalName", originalFileName);
				listMap.put("storeName", storedFileName);
				listMap.put("fileSize", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}

	public List<Map<String, Object>> parseUpdateFileInfo(Issue issues, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		int ino = issues.getIno();
		int uno = issues.getUno();
		String[] fno = request.getParameterValues("fno");
		String requestName = null;
		String idx = null;

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				multipartFile.transferTo(new File(filePath + storedFileName));

				listMap = new HashMap<String, Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("ino", ino);
				listMap.put("uno", uno);
				listMap.put("originalName", originalFileName);
				listMap.put("storeName", storedFileName);
				listMap.put("fileSize", multipartFile.getSize());
				list.add(listMap);
			} else {
				requestName = multipartFile.getName();
				idx = requestName.substring(requestName.indexOf("_") + 1);
				if (fno != null && fno.length > 0) {
					for (int i = 0; i < fno.length; i++) {
						if (fno[i].equals(idx)) {
							listMap = new HashMap<String, Object>();
							listMap.put("IS_NEW", "N");
							listMap.put("fno", fno[i]);
							list.add(listMap);
						}
					}
				}
			}
		}
		return list;
	}

	public List<Map<String, Object>> parseInsertFileInfo(Milestone milestone, HttpServletRequest request) throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		int mno = milestone.getMno();

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);

				listMap = new HashMap<String, Object>();
				listMap.put("mno", mno);
				listMap.put("originalName", originalFileName);
				listMap.put("storeName", storedFileName);
				listMap.put("fileSize", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
}
