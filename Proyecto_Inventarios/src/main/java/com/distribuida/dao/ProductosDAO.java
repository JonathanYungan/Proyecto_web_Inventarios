package com.distribuida.dao;

import java.util.List;

import com.distribuida.entities.Productos;

public interface ProductosDAO {

	//crud basico
	
		public List<Productos> findAll();
		
		public Productos findOne(int id);
		
		public void add(Productos productos);
		
		public void up(Productos productos);
		
		public void del(int id);
		
		//crud avanzados
		
}
