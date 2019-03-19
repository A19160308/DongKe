package com.action;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
 
class Tools {
    void fileWriter(String path, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf-8");
        path = "../../"+path;
        path = this.getClass().getClassLoader().getResource(path).getPath().replaceAll("%20", " ");
        File file = new File(path);
        InputStream in = new FileInputStream(file);
        OutputStream out = response.getOutputStream();
        response.setHeader("content-disposition","attachment;filename="+ URLEncoder.encode(file.getName(),"utf-8"));
        byte[] b = new byte[1024];
        int length = 0;
        while((length=in.read(b))!=-1){
            out.write(b,0,length);
        }
        out.close();
        in.close();
    }
}