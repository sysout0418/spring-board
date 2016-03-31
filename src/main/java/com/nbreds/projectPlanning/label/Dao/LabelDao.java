package com.nbreds.projectPlanning.label.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.label.VO.Label;

@Repository("LabelDao")
public class LabelDao {
	private static final Logger logger = LoggerFactory.getLogger(LabelDao.class);	
	
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

	public List<Label> getLabelsByPno(int pno) {
		return sqlSession.selectList("label.getLabelsByPno", pno);
	}

	public void removeLabel(int lno) {
		sqlSession.delete("label.removeLabel", lno);
	}

	public Label getLabelByLno(int lno) {
		return sqlSession.selectOne("label.getLabelByLno", lno);
	}

	public void editLabelBylno(Label label) {
		sqlSession.update("label.editLabelBylno", label);
	}
}