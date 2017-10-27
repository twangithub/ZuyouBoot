package com.twan.test;

import com.twan.entity.Student;
import com.twan.util.JDBCUtils;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 数据库连接测试
 *
 * @author Wu Wei
 * @date 2017-8-9 11:07:46
 */
public class DatabaseConnectionTest {

    public static void main(String[] args) {
        queryTest();
    }

    public static void queryTest() {
        try {
            Connection conn = JDBCUtils.getConnection();
            String sql = "select * from student where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, 1);
            ResultSet rs = pre.executeQuery();
            //结果集转换成实体对象
            List<?> list = JDBCUtils.TranverseToList(rs, Student.class);
            //循环遍历结果
            for (int i = 0; i < list.size(); i++) {
                Student student = (Student) list.get(i);
                System.out.println(student);
            }
        } catch (SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(DatabaseConnectionTest.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            JDBCUtils.close();
        }
    }
}
