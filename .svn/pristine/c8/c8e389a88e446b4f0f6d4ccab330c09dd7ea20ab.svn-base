package com.babpool.attach.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.babpool.attach.service.IAttachService;
import com.babpool.attach.vo.AttachVO;
import com.babpool.exception.BizNotEffectedException;
import com.babpool.exception.BizNotFoundException;

@Controller
public class AttachController {
	@Value("#{util['file.upload.path']}")
	private String uploadPath;
	
	@Inject
	private IAttachService attachService;
	

	// @PathVariable 사용하여 url상의 경로를 변수에 할당 "/attach/download/25625"
	@RequestMapping("/attach/download/{atchNo:[0-9]{1,16}}")
	public void process(@PathVariable(name = "atchNo") int atchNo, HttpServletResponse resp) throws Exception {
		try {
			// 서비스를 통해 첨부파일 가져오기
			AttachVO vo = attachService.getAttach(atchNo);
			System.out.println();
			// 파일명에 한글이 있는경우 처리
			String originalName = new String(vo.getAtchOriginalName().getBytes("utf-8"), "iso-8859-1");
			System.out.println("originalName"+originalName);
			String filePath = File.separatorChar + vo.getAtchPath();
			System.out.println("filePath"+filePath);
			String fileName = vo.getAtchName();
			
			//경로에 있는 파일 찾기
			File f = new File(filePath, fileName);
			if (!f.isFile()) {
				throw new BizNotFoundException("해당 첨부파일이 존재하지 않습니다.");
			}
			// 다운로드를 위한 헤더 생성
			resp.setHeader("Content-Type", "application/octet-stream;");
			resp.setHeader("Content-Disposition", "attachment;filename=\"" + originalName + "\";");
			resp.setHeader("Content-Transfer-Encoding", "binary;");
			resp.setContentLength((int) f.length()); // 진행율
			resp.setHeader("Pragma", "no-cache;");
			resp.setHeader("Expires", "-1;");
			// 저장된 파일을 응답객체의 스트림으로 내보내기,  resp의 outputStream에  해당파일을 복사
			FileUtils.copyFile(f, resp.getOutputStream());
			resp.getOutputStream().close();
			attachService.increaseDownHit(atchNo);
		} catch (BizNotFoundException e) {
			printMessage(resp, "해당 첨부파일이 존재하지 않습니다.");
		} catch (BizNotEffectedException e) {
			e.printStackTrace(); //거의 일어나지않기때문에...
		}catch (IOException e) {
			resp.reset();
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
		}
	}

	//정상적인 다운로드가 안될 경우 메시지 처리
	private void printMessage(HttpServletResponse resp, String msg) throws Exception {
		resp.setCharacterEncoding("utf-8");
		resp.setHeader("Content-Type", "text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		//target이 지정되지 않은 경우 history.back() 으로 처리
		out.println("<script type='text/javascript'>");
		out.println(" alert('" + msg + "');");
		out.println(" self.close();");
		out.println("</script>");
		out.println("<h4>첨부파일 문제 " + msg + "</h4>");
		out.println("<button onclick='self.close()'>닫기</button>");
	}
	

	
}
