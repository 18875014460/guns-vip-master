package cn.stylefeng.guns.modular.demos.entity;

import lombok.extern.slf4j.Slf4j;

/**
 * <p>
 *1克隆
 * <p>
 *
 * @author YXM
 * @date 2020/8/11
 */
@Slf4j
public class Clone implements Cloneable{
    private String name;
    private String address;

    @Override
    public Clone clone(){
        Clone test=null;
        //浅克隆
        try {
            test=(Clone) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
            log.info("exception ex={}",e.getMessage());
        }
        return test;
    }



}
