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
public class ClienteDAO extends Conexion {
    public int insertarCliente(Cliente c){
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO cliente(nombre, edad, idCategoria) VALUES (?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getNombre());
            pre.setInt(2, c.getEdad());
            pre.setInt(3, c.getIdCategoria());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        
        return res;
    }
    
    public ArrayList<Cliente> mostrarClientes(){
        ArrayList<Cliente> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM cliente cl INNER JOIN categoria ca ON cl.idCategoria=ca.idCategoria";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Cliente c = new Cliente();
                c.setIdCliente(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setEdad(rs.getInt(3));
                c.setIdCategoria(4);
                c.setCategoria(rs.getString(6));
                
                lista.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public int modificarCliente(Cliente c){
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE cliente SET nombre=?, edad=?, idCategoria=? WHERE idCliente=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getNombre());
            pre.setInt(2, c.getEdad());
            pre.setInt(3, c.getIdCategoria());
            pre.setInt(4, c.getIdCliente());
            
            res = pre.executeUpdate();            
        } catch (SQLException e) {
            System.out.println("Error al modificar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }    
    
    public int eliminarCliente(Cliente c){
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM cliente WHERE idCliente=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, c.getIdCliente());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
