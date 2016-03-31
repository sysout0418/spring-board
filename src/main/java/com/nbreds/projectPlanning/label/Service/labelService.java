package com.nbreds.projectPlanning.label.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.label.Dao.labelDAO;
import com.nbreds.projectPlanning.label.VO.Label;

@Service
public class labelService {
	@Autowired
	labelDAO labeldao;
	
	public void saveLabel(Label label) {
		labeldao.saveLabel(label);
	}
	
	public List<Label> getLabelsByIno(int ino) {
		return labeldao.getLabelsByIno(ino);
	}
	
	public List<Label> getAllLabel() {
		return labeldao.getAllLabel();
	}

	public List<Label> getLabelsByPno(int pno) {
		return labeldao.getLabelsByPno(pno);
	}

	public void removeLabel(int lno) {
		labeldao.removeLabel(lno);
	}

	public Label getLabelByLno(int lno) {
		return labeldao.getLabelByLno(lno);
	}

	public void editLabelBylno(Label label) {
		labeldao.editLabelBylno(label);
	}
}