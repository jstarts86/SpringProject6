package com.common.springproject6.dao;

import com.common.springproject6.vo.ShoeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ShoeDAO {
    private final String SHOE_INSERT="insert into SHOE (name,shoeType,style,color,description,wornDate,price,image) values (?,?,?,?,?,?,?,?)";
    private final String SHOE_UPDATE = "update SHOE set name=?, shoeType=?, style=?, color=?, description=?, wornDate=?, price=?, image=?, modDate=current_timestamp where id=?";
    private final String SHOE_DELETE="delete from SHOE where id=?";

    private final String SHOE_GET = "select * from SHOE where id=?";

    private final String SHOE_LIST="select * from SHOE order by id desc";

    @Autowired
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public int insertMenu(ShoeVO vo){
        return template.update(SHOE_INSERT,new Object[]{vo.getName(),vo.getShoeType(),vo.getStyle(),vo.getColor(),vo.getDescription(),vo.getWornDate(),vo.getPrice(),vo.getImage()});
    }

    public int deleteMenu(int id){
        return template.update(SHOE_DELETE,
                new Object[]{id});
    }

    public int updateMenu(ShoeVO vo){
        return template.update(SHOE_UPDATE,
                new Object[]{vo.getName(),vo.getShoeType(),vo.getStyle(),vo.getColor(),vo.getDescription(),vo.getWornDate(),vo.getPrice(),vo.getImage()});
    }

    public ShoeVO getMenu(int id){
        return template.queryForObject(SHOE_GET,
                new Object[]{id},
                new BeanPropertyRowMapper<ShoeVO>(ShoeVO.class));
    }

    public List<ShoeVO> getMenuList(){
        return template.query(SHOE_LIST, new RowMapper<ShoeVO>() {
            @Override
            public ShoeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                ShoeVO data=new ShoeVO();
                data.setId(rs.getInt("id"));
                data.setName(rs.getString("name"));
                data.setShoeType(rs.getString("shoeType"));
                data.setColor(rs.getString("color"));
                data.setDescription(rs.getString("description"));
                data.setWornDate(rs.getDate("wornDate"));
                data.setPrice(rs.getInt("price"));
                data.setImage(rs.getString("image"));
                return data;
            }
        });
    }
}
