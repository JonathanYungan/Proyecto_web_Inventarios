package com.distribuida.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.distribuida.dao.ProductosDAO;
import com.distribuida.entities.Productos;

@Controller
@RequestMapping("/productos") // Path principal
public class ProductosController {

    @Autowired
    private ProductosDAO productosDAO;

    @GetMapping("/findAll") // Path secundario
    public String findAll(Model model) {
        List<Productos> productos = productosDAO.findAll();
        model.addAttribute("productos", productos);
        return "listar-productos"; // Nombre del formulario EJ. listar-productos.html o listar-productos.jsp
    }

    @GetMapping("/findOne")
    public String findOne(@RequestParam("idProducto") @Nullable Integer idProducto,
                          @RequestParam("opcion") @Nullable Integer opcion,
                          Model model) {
        if (idProducto != null) {
            Productos producto = productosDAO.findOne(idProducto);
            model.addAttribute("producto", producto);
        }
        if (opcion == 1) return "add-productos"; // Actualización
        else return "del-productos"; // Eliminación
    }

    @PostMapping("/add")
    public String add(@RequestParam("idProducto") @Nullable Integer idProducto,
                      @RequestParam("nombre") @Nullable String nombre,
                      @RequestParam("descripcion") @Nullable String descripcion,
                      @RequestParam("precio") @Nullable Double precio,
                      @RequestParam("stock") @Nullable Integer stock,
                      ModelMap modelMap) {

        if (idProducto == null) {
            Productos producto = new Productos();
            producto.setNombre(nombre);
            producto.setDescripcion(descripcion);
            producto.setPrecio(precio);
            producto.setStock(stock);
            productosDAO.add(producto);
        } else {
            Productos producto = new Productos();
            producto.setIdProducto(idProducto);
            producto.setNombre(nombre);
            producto.setDescripcion(descripcion);
            producto.setPrecio(precio);
            producto.setStock(stock);
            productosDAO.up(producto);
        }
        return "redirect:/productos/findAll"; // Redirigir al formulario web por path o URL.
    }

    @GetMapping("/del")
    public String del(@RequestParam("idProducto") @Nullable Integer idProducto) {
        productosDAO.del(idProducto);
        return "redirect:/productos/findAll";
    }
}
