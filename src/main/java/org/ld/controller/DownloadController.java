package org.ld.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import sun.net.www.URLConnection;

@Controller
public class DownloadController {    
    @RequestMapping(value="/download-resource")
   public void downloadResource(HttpServletResponse response, @RequestBody String fp, @RequestBody String fname) {
//    public void downloadResource(HttpServletResponse response) { 
//    	String fp = "log/rec", fname="rec.log";
    	Path file = Paths.get(fp);
        if (Files.exists(file)) {
        	String mimeType = URLConnection.guessContentTypeFromName(fname);
        	if(mimeType == null)
        		mimeType = "application/octet-stream";
            response.setContentType(mimeType);
            response.addHeader("Content-Disposition", 
                    "attachment; filename=" + fname);
/*
如果文件名有中文的话，进行URL编码，让中文正常显示
response.addHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));
*/
            try {
                Files.copy(file, response.getOutputStream());
            } catch (IOException ex) {
            }
        }
    }
}