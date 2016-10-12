package org.ld.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;

import sun.net.www.URLConnection;

@Controller
public class DownloadController {    
    @RequestMapping(value="/download")
    public void downloadResource1(HttpServletResponse response,String fp) {
    	File file = new File(fp);        
        System.out.println(file);
        
        if (file.exists()) {
        	String mimeType = URLConnection.guessContentTypeFromName(file.getName());
        	System.out.println(mimeType);
        	if(mimeType == null)
        		mimeType = "application/octet-stream";
            response.setContentType(mimeType);
            response.addHeader("Content-Disposition", 
                    "attachment; filename=" + file.getName());
            byte[] buffer = new byte[1024];
            FileInputStream fis = null;
            BufferedInputStream bis = null;
            // if using Java 7, use try-with-resources
            try {
                fis = new FileInputStream(file);
                bis = new BufferedInputStream(fis);
                OutputStream os = response.getOutputStream();
                int i = bis.read(buffer);
                while (i != -1) {
                    os.write(buffer, 0, i);
                    i = bis.read(buffer);
                }
            } catch (IOException ex) {
                // do something, 
                // probably forward to an Error page
            } finally {
                if (bis != null) {
                    try {
                        bis.close();
                    } catch (IOException e) {
                    }
                }
                if (fis != null) {
                    try {
                        fis.close();
                    } catch (IOException e) {
                    }
                }
            }
        }
    }
}