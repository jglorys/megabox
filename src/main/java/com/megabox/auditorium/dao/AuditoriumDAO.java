package com.megabox.auditorium.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.megabox.auditorium.model.Auditorium;

@Repository
public interface AuditoriumDAO {
	
	public List<Auditorium> selectAuditoriumList();
	
	public Auditorium selectAuditorium(int id);

	public int selectSeatCnt(int id);
}
