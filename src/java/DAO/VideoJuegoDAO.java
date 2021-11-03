/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import model.Videojuego;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import util.DataBaseAccess;
/**
 *
 * @author iserg
 */
public class VideoJuegoDAO implements DbDAO {
    
    @Override
    public ArrayList<Videojuego> getAll() {
        ResultSet rset=null;
        ArrayList<Videojuego> lstVideojuego = new ArrayList();
        try {

            Statement stmt = DataBaseAccess.conn.createStatement();
            
            String sql = "select idVd,nombreCliente from videojuego where estado ='Disponible' ";
            rset = stmt.executeQuery(sql);
            while(rset.next()){
                lstVideojuego.add( new Videojuego(
                        rset.getInt("idVd"),
                        rset.getString("nombreCliente")));
            }

        }catch(SQLException ex){
            System.out.println("Exception = " + ex.getMessage());
        }
        return lstVideojuego;
    }

      @Override
    public void save(Object data) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
