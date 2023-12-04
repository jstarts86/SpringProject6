package com.common.springproject6.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
public class ShoeDTO {

    private List<SimpleInfo> simpleInfoList;
    private Info info;
    @Getter
    @Builder
    public static class Info{

        private int id;
        private String name;
        private String shoeType;
        private String color;
        private String style;
        private String description;
        private int price;
        private Date wornDate;
        private String image;
    }
    @Builder
    @Getter
    public static class SimpleInfo{
        private int id;
        private String name;
        private String shoeType;
        private String style;
        private String color;
        private String image;
    }
}
