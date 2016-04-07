package com.nbreds.projectPlanning.label.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.label.VO.Label;

@Service
public interface LabelService {
	static final Logger logger = LoggerFactory.getLogger(LabelService.class);
	
	public void saveLabel(Label label);
	
	public List<Label> getLabelsByIno(int ino);
	
	public List<Label> getAllLabel();

	public List<Label> getLabelsByPno(int pno);

	public void removeLabel(int lno);

	public Label getLabelByLno(int lno);

	public void editLabelBylno(Label label);
}
