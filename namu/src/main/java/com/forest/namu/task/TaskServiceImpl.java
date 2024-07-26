package com.forest.namu.task;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;


import com.forest.namu.admin.mapper.SingoManageMapper;

@Service
public class TaskServiceImpl implements TaskService{
	
	@Autowired
	private SingoManageMapper mapper;
	
	
	
	@Scheduled(cron="0 0 3 * * *")
	@Override
	public void automaticRepeatOperation() {
	 try{
			mapper.releaseUser();
			mapper.releaseMember();
		} catch (Exception e){
			e.printStackTrace();
		}
		
	}

}
