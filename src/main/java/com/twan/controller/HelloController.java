package com.twan.controller;

import org.springframework.web.bind.annotation.*;

/**
 * Created by twan on 2017/10/20.
 * 亲测可用
 * 第一种启动方式:tomcat,默认
 * 第二种启动方式:cd到项目目录 mvn spring-boot:run
 * 第三种启动方式:第一步:mvn install 第二步:java -jar xxxx-snapshot.jar
 */
@RestController
@RequestMapping(value = "/hello")
public class HelloController {

    // 访问方式:http://127.0.0.1:8080/hello/say
    //@RequestMapping(value = "/say",method = RequestMethod.GET)
    //简写为一下的注解,还有PostMapping等
    @GetMapping(value = "/say")
    public String say(){
        return "Hello success";
    }

    // get,post都能访问, 不推荐
    @RequestMapping(value = "/noRequestMethod")
    public String noRequestMethod(){
        return "xxxxxx";
    }

    // 访问方式: http://127.0.0.1:8080/hello/say/23
    @RequestMapping(value = "/sayWithParam/{id}",method = RequestMethod.GET)
    public String sayWithParam(@PathVariable("id") Integer id){
        return "id: "+id;
    }

    // 如果用传统的方式: http://127.0.0.1:8080/hello/say?id=23
    @RequestMapping(value = "/sayWithParamAndTradition",method = RequestMethod.GET)
    public String sayWithParamAndTradition(@RequestParam("id") Integer id){
        return "id: "+id;
    }

    // 使用传统的方式, 带默认参数, 相当于访问:http://127.0.0.1:8080/hello/say?id=0
    @RequestMapping(value = "/sayWithParamAndTraditionAndDefaultParam",method = RequestMethod.GET)
    public String sayWithParamAndTraditionAndDefaultParam(@RequestParam(value = "id",required = false,defaultValue = "0") Integer myId){
        return "id: "+myId;
    }

}

