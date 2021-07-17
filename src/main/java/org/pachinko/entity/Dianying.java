package org.pachinko.entity;

import java.util.Date;

import lombok.Data;
import org.springframework.util.StringUtils;

@Data
public class Dianying {

    public enum DianyingType {
        DIANYING(1,"电影"),
        DIANSHIJU(2,"电视剧"),
        //动漫
        DONGMAN(3,"动漫"),
        FULI(4,"福利片");

        private int key;
        private String value;

        DianyingType(int key,String value) {
            this.key=key;
            this.value = value;
        }

        public String getValue(){
            return value;
        }
        public int getKey(){
            return key;
        }

        public static String getNameByKey(int key){
            if(key == 1){
                return DIANYING.value;
            }
            if(key == 2){
                return DIANSHIJU.value;
            }
            if(key == 3){
                return DONGMAN.value;
            }
            if(key == 4){
                return FULI.value;
            }
            return DIANYING.value;

        }

    }

    private Long id;
    private String title;
    private String tips;
    private String img;
    private String otherName;
    private String director;
    private String star;
    //类型
    private Integer type = DianyingType.DIANYING.key;
    private Double score;
    private String location;
    private String language;

    private Integer release = 0;
    private Integer filmLength = 0;
    private Date updateTime;
    private String description;
    private String jishu;
    private Integer status;

    //默认
    private Integer subType;

    private String localImg;

    //public String getLocalImg(){
    //
    //    if(StringUtils.isEmpty(localImg)){
    //        return img;
    //    }else{
    //        return localImg;
    //    }
    //}

    public enum DianyingSubType {
        //电影
        DONGZUO(1,"动作片"),
        XIJU(2,"喜剧片"),
        AIQING(3,"爱情片"),
        KEHUAN(4,"科幻片"),
        KONGBU(5,"恐怖片"),
        JUQING(6,"剧情片"),
        ZHANZHENG(7,"战争片"),

        //电视剧
        GUOCHAN(8,"国产剧"),
        XIANGGANG(9,"香港剧"),
        HANJU(10,"韩国剧"),
        OUMEI(11,"欧美剧"),
        TAIWAN(12,"台湾剧"),
        RIJU(13,"日本剧"),
        HAIWAI(14,"海外剧"),

        //综艺
        ZHONGYI(15,"综艺片"),

        DONGMAN(17,"动漫片"),

        FULI(16,"福利片"),
        LUNLI(18,"伦理片"),
        ;

        private int key;
        private String value;

        DianyingSubType(int key,String value) {
            this.key=key;
            this.value = value;
        }

        public String getValue(){
            return value;
        }
        public int getKey(){
            return key;
        }

        //
        public static int getSubTypeByName(String subTypeName){
            if(StringUtils.isEmpty(subTypeName)){
                return DianyingSubType.DONGZUO.key;
            }


            for(DianyingSubType subType:DianyingSubType.values()){
                if(subTypeName.contains(subType.value)){
                    return subType.key;
                }
            }
            //base
            return DianyingSubType.DONGZUO.key;
        }

        public static String getSubTypeName(int key){

            if(key == 0){
                return null;
            }

            for(DianyingSubType subType:DianyingSubType.values()){
                if(key == subType.key){
                    return subType.value;
                }
            }
            //base
            return DianyingSubType.DONGZUO.value;
        }
    }
}