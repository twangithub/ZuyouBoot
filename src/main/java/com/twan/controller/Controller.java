package com.twan.controller;

import com.twan.entity.Result;
import com.twan.entity.Student;
import javax.annotation.Resource;

import org.springframework.web.bind.annotation.*;
import com.twan.service.BaseService;

/**
 * 控制器Controller
 *
 * @author Wu Wei
 * @date 2017-8-8 17:53:21
 */
@RestController
@RequestMapping("/room")
public class Controller {

    @Resource
    private BaseService service;

    //////////////////// demo start //////////////
    /**
     * 新增
     *
     * @param student
     * @return
     */
    @PostMapping("/addStudent")
    public Result addStudent(@RequestBody Student student) {
        return service.addStudent(student);
    }
    
    /**
     * 查询
     *
     * @return
     */
    @PostMapping("/findAllStudent")
    public Result findAllStudent() {
        return service.findAllStudent();
    }

    /**
     * 更新
     *
     * @param student
     * @return
     */
    @PostMapping("/updateStudent")
    public Result updateStudent(@RequestBody Student student) {
        return service.updateStudent(student);
    }
    
    /**
     * 删除
     *
     * @param id
     * @return
     */
    @PostMapping("/delStudentById")
    public Result delStudentById(@RequestParam("id") String id) {
        return service.delStudentById(id);
    }

    // 访问地址: http://127.0.0.1:8181/test/student/testCanRun
    @GetMapping("/testCanRun")
    public String testCanRun() {
        return "congratulations! success!";
    }

    //////////////////// demo end //////////////
    @GetMapping("/findAllRooms")
    public Result findAllRooms() {
        return service.findAllRooms();
    }

    @GetMapping("/findAllTechs")
    public Result findAllTechs() {
        return service.findAllTechs();
    }

    @GetMapping("/findAllProjs")
    public Result findAllProjs() {
        return service.findAllProjs();
    }

    @GetMapping("/findAllGoods")
    public Result findAllGoods() {
        return service.findAllGoods();
    }

}
