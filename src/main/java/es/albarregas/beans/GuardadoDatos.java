/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.beans;

import java.util.Date;
import java.util.Enumeration;

/**
 *
 * @author Sergio
 */
public class GuardadoDatos {
    
public enum tipoId {NIF, NIE, Pasaporte}   

    private Short id;
    private String nombre;
    private Date fecha;
    private tipoId tipoIdentificacion;
    private String identificacion;
    

    public Short getId() {
        return id;
    }

    public void setId(Short id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public tipoId getTipoIdentificacion() {
        return tipoIdentificacion;
    }

    public void setTipoIdentificacion(tipoId tipoIdentificacion) {
        this.tipoIdentificacion = tipoIdentificacion;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    
    
    
    
    
    
    
    
    
    
}
