package com.babpool.attach.service;

import org.springframework.stereotype.Service;

import com.babpool.attach.vo.AttachVO;
import com.babpool.exception.BizNotEffectedException;
import com.babpool.exception.BizNotFoundException;

@Service
public interface IAttachService {
	/** 첨부파일 상세 조회 */
	public AttachVO getAttach(int atchNo) throws BizNotFoundException;

	/** 다운로드 횟수 증가 */
	public void increaseDownHit(int atchNo) throws BizNotEffectedException;
}
