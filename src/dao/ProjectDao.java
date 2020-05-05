package dao;

import java.util.List;

import model.Project;

public interface ProjectDao {
	
	public int insertProject(Project project);
	public int updateProject(Project project);
	public Project selectProjectByPNum(int pNum);
	public List<Project> selectProjectByMNum(int mNum);

}
