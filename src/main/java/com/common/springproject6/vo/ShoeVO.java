package com.common.springproject6.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class ShoeVO {
    private int id;
    private String name;
    private String shoeType;
    private String style;
    private String color;
    private String description;
    private Date wornDate;
    private int price;
    private String image;
}
