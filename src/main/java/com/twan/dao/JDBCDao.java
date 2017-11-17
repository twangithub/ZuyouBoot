package com.twan.dao;

import com.twan.entity.*;
import com.twan.util.JDBCUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Wu Wei
 * @date 2017-8-9 17:07:18
 */
@Repository("JdbcDao")
public class JDBCDao implements Dao {

    private static final Logger logger = Logger.getLogger(JDBCDao.class.getName());
    private static final Connection conn = JDBCUtils.getConnection();

    private static BasicRowProcessor processor = new BasicRowProcessor();
    private static QueryRunner runner = new QueryRunner();
    @Override
    public int addStudent(Student student) {
        int res = 0;
        String sql = "INSERT INTO student(name,course)VALUES(?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, student.getName());
            pre.setString(2, student.getCourse());
            res = pre.executeUpdate();
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        return res;
    }
    
    @Override
    public List<?> findAllStudent() {
        List<?> students = null;
        String sql = "SELECT * FROM student";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            students = JDBCUtils.TranverseToList(rs, Student.class);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        return students;
    }

    @Override
    public int updateStudent(Student student) {
        int res = 0;
        String sql = "UPDATE student SET name = ?,course = ? WHERE id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, student.getName());
            pre.setString(2, student.getCourse());
            pre.setLong(3, student.getId());
            res = pre.executeUpdate();
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        return res;
    }

    @Override
    public int delStudentById(long id) {
        int res = 0;
        String sql = "DELETE FROM student WHERE id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setLong(1, id);
            res = pre.executeUpdate();
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        return res;
    }

    @Override
    public List<?> findAllRooms() {
        List<?> result = null;
        String sql = "SELECT * FROM zyroom";
        try {
            //PreparedStatement pre = conn.prepareStatement(sql);
            //ResultSet rs = pre.executeQuery();
            //result = processor.toBeanList(rs,Room.class);

            result = runner.query(conn,sql,new BeanListHandler<>(Room.class));

        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public List<?> findAllTechs() {
        List<?> result = null;
        String sql = "SELECT * FROM zyuser";
        try {
            result = runner.query(conn,sql,new BeanListHandler<>(Tech.class));
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public List<?> findAllProjs() {
        List<?> result = null;
        String sql = "SELECT * FROM zyprogram";
        try {
            result = runner.query(conn,sql,new BeanListHandler<>(Proj.class));
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public List<?> findAllGoods() {
        List<?> result = null;
        String sql = "SELECT * FROM zygood";
        try {
            result = runner.query(conn,sql,new BeanListHandler<>(Good.class));
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
