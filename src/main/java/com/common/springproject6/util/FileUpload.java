package com.common.springproject6.util;

import com.common.springproject6.dao.ShoeDAO;
import com.common.springproject6.vo.ShoeVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Date;

@Service
public class FileUpload {
        private final ShoeDAO shoeDao;

    @Autowired
    public FileUpload(ShoeDAO shoeDao) {
        this.shoeDao = shoeDao;
    }

    public ShoeVO uploadPhoto(HttpServletRequest request){
        String filename="";
        int sizeLimit=15*1024*1024;

        String realPath = request.getServletContext().getRealPath("resources/image");
        System.out.println(realPath);
        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdir();

        ShoeVO one=null;
        MultipartRequest multipartRequest=null;
        try{
            multipartRequest= new MultipartRequest(request,realPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
            filename=multipartRequest.getFilesystemName("photo");
            one=new ShoeVO();
            String id=multipartRequest.getParameter("id");
            if(id!=null&&!id.equals("")) one.setId(Integer.parseInt(id));
            one.setName(multipartRequest.getParameter("name"));
            one.setShoeType(multipartRequest.getParameter("shoeType"));
            one.setStyle(multipartRequest.getParameter("style"));
            one.setColor(multipartRequest.getParameter("color"));
            one.setDescription(multipartRequest.getParameter("description"));
            one.setWornDate(Date.valueOf(multipartRequest.getParameter("wornDate")));
            one.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));

            if(id!=null && !id.isEmpty()){
                ShoeVO vo= shoeDao.getMenu(Integer.parseInt(id));
                String oldfilename=vo.getImage();
                if(filename!=null && oldfilename!=null)
                    FileUpload.deleteFile(request,oldfilename);
                else if(filename==null&&oldfilename!=null)
                    filename=oldfilename;
            }
            one.setImage(filename);
        } catch (
                IOException e) {
            throw new RuntimeException(e);
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename) {
        String realPath = request.getServletContext().getRealPath("resources/image");
        File file=new File(realPath+"/"+filename);
        if(file.exists()) file.delete();
    }
}
