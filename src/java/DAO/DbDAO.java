/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;

/**
 *
 * @author iserg
 */
public interface DbDAO <T>{
    public ArrayList<T> getAll();
    public void save(Object data);
}
