package com.care.root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalServiceImpl {
	@Autowired CalMapper mapper;
	
	public void insert(InfoDTO dto) {
		mapper.insert(dto);
	}

}
