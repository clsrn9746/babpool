package com.babpool.free.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babpool.attach.dao.IAttachDao;
import com.babpool.attach.vo.AttachVO;
import com.babpool.exception.BizNotEffectedException;
import com.babpool.exception.BizNotFoundException;
import com.babpool.exception.BizPasswordNotMatchedException;
import com.babpool.free.dao.IFreeBoardDao;
import com.babpool.free.vo.FreeBoardVO;
import com.babpool.notice.vo.NoticeVO;

@Service
public class FreeBoardSeriveImpl implements IFreeBoardService {

	@Inject
	IFreeBoardDao freeBoardDao;

	@Inject
	IAttachDao attachDao;
	


	@Override
	public FreeBoardVO getBoard(int freeBoardNo) {
		FreeBoardVO freeBoard = freeBoardDao.getFreeBoard(freeBoardNo);
		if (freeBoard == null) {

		}
		List<AttachVO> attaches = attachDao.getAttachListByParent(freeBoardNo, "FREE");
		freeBoard.setAttaches(attaches);
		return freeBoard;
	}

	@Override
	public void modifyBoard(FreeBoardVO freeBoard) {
		System.out.println("freeBoard"+freeBoard);
		
			freeBoardDao.updateBoard(freeBoard);
			// 추가될 파일들 insert
			List<AttachVO> attaches = freeBoard.getAttaches();
			System.out.println("attaches::"+attaches);
			if (attaches != null) {
				for (AttachVO attach : attaches) {
					attach.setAtchParentNo(freeBoard.getFreeBoardNo());
					attachDao.insertAttach(attach);
				}
			}else {
				System.out.println("파일 추가 안됨");
			}
			
			
			// 삭제할 파일번호들 가지고 삭제, (upload된 실제파일은 건들지 않습니다. )
			int delAtchNos[] = freeBoard.getDelAtchNos();
			System.out.println("delAtchNos:"+delAtchNos);
			if (delAtchNos != null && delAtchNos.length > 0) {
				
				attachDao.deleteAttaches(delAtchNos);
			}else{
			System.out.println("파일 삭제 안됨");
			}
		
	}

	
	
	
	
}
