package com.twan.service;

import com.twan.entity.Result;
import com.twan.entity.Student;

/**
 * BaseService Layer
 *
 * @author Wu Wei
 * @date 2017-8-6 20:31:29
 */
public interface BaseService {

    public Result addStudent(Student student);
    
    public Result findAllStudent();

    public Result updateStudent(Student student);
    
    public Result delStudentById(String id);
}
