package com.common.springproject6.service;

import com.common.springproject6.dao.ShoeDAO;
import com.common.springproject6.dto.ShoeDTO;
import com.common.springproject6.util.FileUpload;
import com.common.springproject6.vo.ShoeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Service
public class ShoeService {
        private final ShoeDAO shoeDao;
    private final FileUpload fileUpload;

    @Autowired
    public ShoeService(ShoeDAO shoeDao, FileUpload fileUpload) {
        this.shoeDao = shoeDao;
        this.fileUpload=fileUpload;
    }
    public ShoeDTO infoSimpleList(){
        List<ShoeVO> voList= shoeDao.getMenuList();
        ShoeDTO dto=new ShoeDTO();

        List<ShoeDTO.SimpleInfo> list=new ArrayList<>();
        for (ShoeVO vo:voList) {
            list.add(ShoeDTO.SimpleInfo.builder()
                    .id(vo.getId())
                    .name(vo.getName())
                    .shoeType(vo.getShoeType())
                    .style(vo.getStyle())
                    .image(vo.getImage())
                    .build());
        }
        dto.setSimpleInfoList(list);
        return dto;
    }

    public int insertMenu(HttpServletRequest request){
        ShoeVO vo = fileUpload.uploadPhoto(request);
        return shoeDao.insertMenu(vo);
    }

    public ShoeDTO info(int id) {
        ShoeVO vo= shoeDao.getMenu(id);
        ShoeDTO dto=new ShoeDTO();
        dto.setInfo(ShoeDTO.Info.builder()
                .id(vo.getId())
                .name(vo.getName())
                .style(vo.getStyle())
                .shoeType(vo.getShoeType())
                .color(vo.getColor())
                .description(vo.getDescription())
                .wornDate(vo.getWornDate())
                .price(vo.getPrice())
                .image(vo.getImage())
                .build());
        return dto;
    }

    public Object getVo(int id) {
        return shoeDao.getMenu(id);
    }

    public int editMenu(HttpServletRequest request) {
        ShoeVO vo= fileUpload.uploadPhoto(request);
        return shoeDao.updateMenu(vo);
    }

    public int deleteMenu(HttpServletRequest request,int id) {
        ShoeVO vo= shoeDao.getMenu(id);
        FileUpload.deleteFile(request,vo.getImage());
        return shoeDao.deleteMenu(id);
    }
}
