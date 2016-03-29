package com.nbreds.projectPlanning.label.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.label.VO.Label;

@Repository
public class labelDAO {
	@Autowired
	private SqlSession sqlSession;

	public void saveLabel(Label label) {
		sqlSession.insert("label.saveLabel", label);
	}
	
	public List<Label> getLabelsByIno(int ino) {
		return sqlSession.selectList("label.getLabelsByIno", ino);
	}
	
	public List<Label> getAllLabel() {
		return sqlSession.selectList("label.getAllLabel");
	}
}
