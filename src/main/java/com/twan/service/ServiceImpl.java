package com.twan.service;

import com.twan.dao.Dao;
import com.twan.entity.Result;
import com.twan.entity.Student;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 *
 * @author Wu Wei
 * @date 2017-8-8 18:06:30
 */
@Service
public class ServiceImpl implements BaseService {

    @Resource(name = "JdbcDao")
    private Dao dao;
    private static final Logger logger = Logger.getLogger(ServiceImpl.class.getName());

    @Override
    public Result addStudent(Student student) {
        Result result = new Result();
        try {
            int res = dao.addStudent(student);
            result.setCount(res);
        } catch (Exception e) {
            logger.log(Level.SEVERE, null, e);
        }
        return result;
    }

    @Override
    public Result findAllStudent() {
        Result result = new Result();
        try {
            List<?> students = dao.findAllStudent();
            result.setCount(1);
            result.setData(students);
        } catch (Exception e) {
            logger.log(Level.SEVERE, null, e);
        }
        return result;
    }

    @Override
    public Result updateStudent(Student student) {
        Result result = new Result();
        try {
            int res = dao.updateStudent(student);
            result.setCount(res);
        } catch (Exception e) {
            logger.log(Level.SEVERE, null, e);
        }
        return result;
    }

    @Override
    public Result delStudentById(String id) {
        Result result = new Result();
        try {
            int res = dao.delStudentById(Long.parseLong(id));
            result.setCount(res);
        } catch (Exception e) {
            logger.log(Level.SEVERE, null, e);
        }
        return result;
    }

    ////////////////////////// demo end ////////////////////
    @Override
    public Result findAllRooms() {
        Result result = new Result();
        try {
            List<?> res = dao.findAllRooms();
            result.setData(res);
        } catch (Exception e) {
            logger.log(Level.SEVERE, null, e);
        }
        return result;
    }

    @Override
    public Result findAllTechs() {
        Result result = new Result();
        try {
            List<?> res = dao.findAllTechs();
            result.setData(res);
        } catch (Exception e) {
            logger.log(Level.SEVERE, null, e);
        }
        return result;
    }

    @Override
    public Result findAllProjs() {
        Result result = new Result();
        try {
            List<?> res = dao.findAllProjs();
            result.setData(res);
        } catch (Exception e) {
            logger.log(Level.SEVERE, null, e);
        }
        return result;
    }

    @Override
    public Result findAllGoods() {
        Result result = new Result();
        try {
            List<?> res = dao.findAllGoods();
            result.setData(res);
        } catch (Exception e) {
            logger.log(Level.SEVERE, null, e);
        }
        return result;
    }
}
