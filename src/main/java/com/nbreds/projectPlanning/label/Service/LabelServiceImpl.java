package com.nbreds.projectPlanning.label.Service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.label.Dao.LabelDao;
import com.nbreds.projectPlanning.label.VO.Label;

@Service("LabelService")
public class LabelServiceImpl implements LabelService{
	private static final Logger logger = LoggerFactory.getLogger(LabelServiceImpl.class);
	
	@Resource(name="LabelDao")
	LabelDao labelDao;
	
	@Override
	public void saveLabel(Label label) {
		labelDao.saveLabel(label);
	}
	
	@Override
	public List<Label> getLabelsByIno(int ino) {
		return labelDao.getLabelsByIno(ino);
	}
	
	@Override
	public List<Label> getAllLabel() {
		return labelDao.getAllLabel();
	}

	@Override
	public List<Label> getLabelsByPno(int pno) {
		return labelDao.getLabelsByPno(pno);
	}

	@Override
	public void removeLabel(int lno) {
		labelDao.removeLabel(lno);
	}

	@Override
	public Label getLabelByLno(int lno) {
		return labelDao.getLabelByLno(lno);
	}

	@Override
	public void editLabelBylno(Label label) {
		labelDao.editLabelBylno(label);
	}
}