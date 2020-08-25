package cn.stylefeng.guns.modular.demos.entity;

import lombok.extern.slf4j.Slf4j;

/**
 * <p>
 *1克隆:方法重写
 * <p>
 *
 * @author YXM
 * @date 2020/8/11
 */
@Slf4j
public class CloneTest implements Cloneable{
    private String name;
    private String address;
    private Clone clone;

    @Override
    public CloneTest clone(){
        CloneTest test=null;
        //浅克隆
        try {
            test=(CloneTest) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
            log.info("exception ex={}",e.getMessage());
        }

        //深克隆
        assert test != null;
        test.clone=clone.clone();
        return test;
    }



}
