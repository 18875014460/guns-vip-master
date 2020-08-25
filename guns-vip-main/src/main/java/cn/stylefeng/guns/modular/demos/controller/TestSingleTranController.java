
package cn.stylefeng.guns.modular.demos.controller;

import cn.stylefeng.guns.modular.demos.service.TranTestService;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.kernel.model.response.SuccessResponseData;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * 测试单数据源回滚
 *
 * @author stylefeng
 * @date 2018/7/20 23:39
 */
@RestController
@RequestMapping("/tran/single")
@AllArgsConstructor
public class TestSingleTranController extends BaseController {


    private final TranTestService testMultiDbService;

    @RequestMapping("/success")
    public Object testSuccess() {
        testMultiDbService.testSingleSuccess();
        return SuccessResponseData.success();
    }

    @RequestMapping("/fail")
    public Object testFail() {
        testMultiDbService.testSingleFail();
        return SuccessResponseData.success();
    }

    public static void main(String[] args) {
        System.out.println("Date "+new Date());
        System.out.println("LocalDateTime  "+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy:MM:dd HH:mm:ss")));
    }
}

