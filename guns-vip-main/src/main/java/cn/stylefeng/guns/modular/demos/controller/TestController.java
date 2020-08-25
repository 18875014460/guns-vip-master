package cn.stylefeng.guns.modular.demos.controller;

import org.springframework.core.convert.converter.Converter;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 *
 * <p>
 *
 * @author YXM
 * @date 2020/8/12
 */
public class TestController {
    public static void main(String[] args) {
        List<String> list = Arrays.asList("柠檬", "石榴花", "茉莉", "火龙果", "水蜜桃");
        List<String> list1 = list.stream().filter(x -> x.length() == 2).collect(Collectors.toList());
        System.out.println(list1.toString());

        Converter<String, Integer> converter = Integer::valueOf;
        Integer converted = converter.convert("123");
        System.out.println(converted);


        Map<Integer, Double> map = new HashMap<>(2);
        map.put(1, 98d);
        map.put(2, 20d);



        map.forEach((x, y) -> map.put(x, Math.round(y*0.89*100)* 0.01d));

        System.out.println(map.toString());

    }


}
