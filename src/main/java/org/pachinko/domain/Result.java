package org.pachinko.domain;

import org.pachinko.exception.ExceptionEnum;
import lombok.Data;

/**
 * Description:统一返回对象
 * User: xiao
 * Date: 2018/3/4
 * Time: 下午1:32
 */
@Data
public class Result<T> {

    private Integer code;
    private String message;
    private T data;

    public Result(){
        this.code = ExceptionEnum.SUCCESS.getCode();
        this.message = ExceptionEnum.SUCCESS.getMessage();
    }

    public static <T> Result<T> create(){
        return new Result<T>();
    }

    public Result<T> error(Integer code,String message){
        this.code = code;
        this.message = message;
        return this;
    }

    public Result<T> error(ExceptionEnum resultEnum){
        this.code = resultEnum.getCode();
        this.message = resultEnum.getMessage();
        return this;
    }

}
