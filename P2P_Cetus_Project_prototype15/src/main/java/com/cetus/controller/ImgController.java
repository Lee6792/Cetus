package com.cetus.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class ImgController {
	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public void uploadimg(HttpServletRequest request,HttpServletResponse response, MultipartFile upload) throws Exception {
		log.info("upload 들어온다! ");
		
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
 
        //파일 이름 가져오기
        String fileName=upload.getOriginalFilename();
        log.info(fileName);
 
        //파일을 바이트 배열로 변환
        byte[] bytes=upload.getBytes();
 
        //이미지를 업로드할 디렉토리를 정해준다
        String uploadPath= request.getServletContext().getRealPath("resources/ckEimg") + "/";
        OutputStream out=new FileOutputStream(new File(uploadPath+fileName));
        log.info(bytes);
 
        //서버에 write
        out.write(bytes);
        
        //성공여부 가져오기
        String callback=request.getParameter("CKEditorFuncNum");
        log.info(callback);
        
        //클라이언트에 이벤트 추가 (자바스크립트 실행)
        PrintWriter printWriter=response.getWriter(); //자바스크립트 쓰기위한 도구
        String fileUrl= "../resources" + "/ckEimg/" + fileName;
        
        if(!callback.equals("3")) { // callback이 3일 경우만 성공한 것
        	 printWriter.println("<script>alert('이미지 업로드에 실패했습니다.');"+"</script>");

        }else {
        	 log.info("upload img 들어온다! "+fileUrl);
        	 try {
        		 Thread.sleep(3000); //3초 대기
        		 printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
    		 }catch(InterruptedException e) {
    			   e.printStackTrace();
    		  }
        }
        printWriter.flush();
	}
}
