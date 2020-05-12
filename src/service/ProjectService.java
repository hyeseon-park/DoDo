package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.AlarmDao;
import dao.MemberDao;
import dao.ProjectDao;
import model.Member;
import model.Project;

@Service
public class ProjectService {

	@Autowired
	ProjectDao projectDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	AlarmDao alarmDao;

	@Transactional
	public boolean addProject(Project project, int mNum) {
		if (projectDao.insertProject(project) > 0) {
			if (projectDao.insertProjectMember(project.getpNum(), mNum) > 0) {
				return true;
			}
		}
		return false;
	}

	public boolean modifyProject(Project project) {
		return projectDao.updateProject(project) > 0 ? true : false;
	}

	public Project getProject(int pNum) {
		return projectDao.selectProjectByPNum(pNum);
	}

	public List<Project> getProjectList(int mNum) {
		return projectDao.selectProjectByMNum(mNum);
	}

	public List<Member> getProjectMemberList(int pNum) {
		return memberDao.selectMemberByPNum(pNum);
	}

	@Transactional
	public boolean removeProjectMember(int mNum, int pNum) {
		int projectMemberListSize = projectDao.selectProjectMemberListSize(pNum);
		if (projectMemberListSize == 1) {
			if (projectDao.deleteProject(pNum) > 0) {
				if (projectDao.deleteProjectMember(pNum, mNum) > 0) {
					alarmDao.deleteAlarmByPNum(pNum);
					return true;
				}
			}
		} else {
			if (projectDao.deleteProjectMember(pNum, mNum) > 0) {
				return true;
			}
		}
		return false;
	}

}
