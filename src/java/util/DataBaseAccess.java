/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author iserg
 */
public class DataBaseAccess {
    public static Connection conn;

    static{
        try{
            if(conn == null){
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection("jdbc:postgresql://ec2-52-204-213-254.compute-1.amazonaws.com:5432/d9bsq98bjkrjbh","hihujuaylegcge","cd6cadefe328f45bc77750a190ec484011810e3995ba880e49c66b482e068e0e");
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
    } 
}
