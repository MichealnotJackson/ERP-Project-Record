package com.lab.erp.dao.c.c3;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Erp_OnlinereceiverDAO {
private SqlSession sqlSession;
	
	@Autowired
	public Erp_OnlinereceiverDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	
}
