package dao;

public interface ProjectMemberDao {
	
	public int insertProjectMember(int pNum, int mNum);
	public int deleteProjectMember(int pNum, int mNum);
	public int deleteProjectMemberByPNum(int pNum);

}
