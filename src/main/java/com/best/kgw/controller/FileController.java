package com.best.kgw.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;

@Controller
public class FileController extends HttpServlet {
    Logger logger = LoggerFactory.getLogger(FileController.class);

    @PostMapping("fileUpload")
    protected String doPost(@RequestParam Map<String, Object> formData, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String realFolder = "";
        String saveFolder = "/fileUpload/sign/";

        //현재 파일경로
        ServletContext context = request.getServletContext();
        realFolder = context.getRealPath(saveFolder);
        logger.info("context : "+ realFolder);

        // 파일 저장 경로에 폴더가 없으면 생성
        File folder = new File(realFolder);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        // 파일 이름 설정
        String fileName = "1004.png";
        String filePath = realFolder + fileName;
        logger.info(filePath);
        // 업로드된 파일 저장
        for (Part part : request.getParts()) {
            // 파일 이름이 null이 아닌 경우에만 저장
            if (!fileName.isEmpty()) {
                logger.info(request.getParts().toString());
                part.write(filePath);
            }
        }
        return "redirect:/mypage/fileSelect.jsp";
    }

    @PostMapping("fileSave")
    protected void fileSave(@RequestParam("image") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String realFolder = "";
        String saveFolder = "/fileUpload/sign/";

        //현재 파일경로
        ServletContext context = request.getServletContext();
        realFolder = context.getRealPath(saveFolder);

        // 파일 저장 경로에 폴더가 없으면 생성
        File folder = new File(realFolder);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        // 파일 이름 설정
        String fileName = file.getOriginalFilename();
        String filePath = realFolder + fileName;
        logger.info(filePath);
        // 업로드된 파일 저장
        for (Part part : request.getParts()) {
            // 파일 이름이 null이 아닌 경우에만 저장
            if (!fileName.isEmpty()) {
                logger.info(request.getParts().toString());
                part.write(filePath);
            }
        }
    }
}