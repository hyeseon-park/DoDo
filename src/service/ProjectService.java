package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.AlarmDao;
import dao.ProjectDao;
import dao.ProjectMemberDao;
import model.Project;

@Service
public class ProjectService {
	/*
	 addProject : tbl_project에 프로젝트 생성 (+ 동시에 tbl_project_member에 프로젝트를 생성한 사람 insert, tbl_alarm에 초대한 멤버리스트 insert) 
	 modifyProject : tbl_project에 프로젝트 수정 
	 deleteProject : tbl_project에 프로젝트 삭제 (+ 동시에 tbl_project_member에 pNum 기준으로 삭제, alarm_tbl에서 pNum 기준으로 삭제)
	 getProject : pNum 기준으로 프로젝트 데이터 가져옴
	 getProjectList : mNum 기준으로 프로젝트 리스트 가져옴
	 deleteAlarm : 알람 삭제 (초대 알람 거절 실행는 메소드)
	 deleteProjectMember : 프로젝트 멤버 삭제 (프로젝트 나가기 선택시 실행되는 메소드)
	 */
	
	@Autowired
	ProjectDao projectDao;
	@Autowired
	AlarmDao alarmDao;
	@Autowired
	ProjectMemberDao projectMemberDao;
	
	@Transactional
	public boolean addProject(Project project, int mNum,List<Integer> inviteMebmerList) {
		if(projectDao.insertProject(project)>0) {
			if(projectMemberDao.insertProjectMember(project.getpNum(), mNum)>0) {
				for(int memberTo : inviteMebmerList) {
					alarmDao.insertAlarm(memberTo, mNum, project.getpNum());
				}
				return true;
			}
		}
		return false;
	}
	
	
	public boolean modifyProject(Project project) {
		return projectDao.updateProject(project)>0?true:false;
	}
	
	
	@Transactional
	public boolean deleteProject(int pNum) {
		if(alarmDao.deleteAlarmByPNum(pNum)>0) 
			if(projectMemberDao.deleteProjectMemberByPNum(pNum)>0) 
				if(projectDao.deleteProject(pNum)>0) 
					return true;
		
		return false;
	}
	
	
	public Project getProject(int pNum) {
		return projectDao.selectProjectByPNum(pNum);
	}
	
	
	public List<Project> getProjectList(int mNum){
		return projectDao.selectProjectByMNum(mNum);
	}
	
	public boolean deleteAlarm(int aNum) {
		return alarmDao.deleteAlarm(aNum)>0?true:false;
	}
	
	public boolean deleteProjectMember(int mNum, int pNum) {
		return projectMemberDao.deleteProejctMember(pNum, mNum)>0?true:false;
	}
	
}
