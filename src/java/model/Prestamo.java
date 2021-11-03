/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Alejandro
 */
public class Prestamo {
    private String dpi;

    public Prestamo(String dpi) {
        this.dpi = dpi;
    }

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }


    @Override
    public String toString() {
        return "Prestamo{" + "dpi=" + dpi + '}';
    }



   
}
