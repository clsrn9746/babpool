package com.babpool.attach.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babpool.attach.dao.IAttachDao;
import com.babpool.attach.vo.AttachVO;
import com.babpool.exception.BizNotEffectedException;
import com.babpool.exception.BizNotFoundException;

@Service
public class AttachServiceImpl implements IAttachService{
	
	@Inject
	private IAttachDao attachDao;

	@Override
	public AttachVO getAttach(int atchNo) throws BizNotFoundException {
		AttachVO vo = attachDao.getAttach(atchNo);
		System.out.println("service AttachVO"+vo);
		if (vo == null) {
			throw new BizNotFoundException("첨부파일 [" + atchNo + "]에 대한 조회 실패");
		}
		return vo;
	}
	
	@Override
	public void increaseDownHit(int atchNo) throws BizNotEffectedException {
		int cnt=attachDao.increaseDownHit(atchNo);
		if(cnt==0) throw new BizNotEffectedException();
	}
	

	
	
	
	
}
