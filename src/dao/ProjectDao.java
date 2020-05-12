package dao;

import java.util.List;

import model.Project;

public interface ProjectDao {

	public int insertProject(Project project);
	
	public int insertProjectMember(int pNum, int mNum);

	public int updateProject(Project project);

	public int deleteProject(int pNum);
	
	public int deleteProjectMember(int pNum, int mNum);

	public int selectProjectMemberListSize(int pNum);

	public Project selectProjectByPNum(int pNum);

	public List<Project> selectProjectByMNum(int mNum);

}
