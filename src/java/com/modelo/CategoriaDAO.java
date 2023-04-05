/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Virgilio Ramos
 */
public class CategoriaDAO extends Conexion {
    public ArrayList<Categoria> mostarCategorias(){
        ArrayList<Categoria> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM categoria";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            
            while(rs.next()){
                Categoria c = new Categoria();
                c.setIdCategoria(rs.getInt(1));
                c.setCategoria(rs.getString(2));
                lista.add(c);
            }
            
        } catch (Exception e) {
            System.out.println("Error al mostrar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
}
