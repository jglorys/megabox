package com.megabox.auditorium.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.auditorium.dao.AuditoriumDAO;
import com.megabox.auditorium.model.Auditorium;

@Service
public class AuditoriumBO {
	@Autowired
	private AuditoriumDAO auditoriumDAO;
	
	public List<Auditorium> getAuditoriumList() {
		return auditoriumDAO.selectAuditoriumList();
	}
	
	public Auditorium getAuditorium(int id) {
		return auditoriumDAO.selectAuditorium(id);
	}
	
	public int getSeatCnt(int id) {
		return auditoriumDAO.selectSeatCnt(id);
	}
	
	
}
