package com.babpool.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.babpool.common.vo.PagingVO;
import com.babpool.common.vo.SearchVO;
import com.babpool.free.vo.FreeBoardVO;
import com.babpool.market.vo.MarketVO;
import com.babpool.member.vo.MailAuthVO;
import com.babpool.member.vo.MemberVO;
import com.babpool.member.vo.MyPageVO;

@Mapper
public interface MemberDao {
	//로그인
	public MemberVO getMember(MemberVO vo);
	public void updateAdmin(String id);
	
	public MemberVO getMemberbyId(@Param("memId")String memId);
	public MemberVO idCheck(@Param("id")String id);
	public MemberVO nickCheck(@Param("nick")String nick);
	public void registMember(MemberVO vo);

	//회원관리
	public List<MemberVO> getmemberList(SearchVO search);
	public int getTotalRowCount(SearchVO search);
	public int updateLikeFood(@Param("like")String like, @Param("id")String id);
	public int updatephone(@Param("phone")String phone, @Param("id")String id);
	public int memberPermit(@Param("id")String id);
	public int memberBan(@Param("id")String id);
	public int changePw(@Param("id")String id, @Param("newpass")String newpass);
	
	//메일인증
	public int insertMailAuth(@Param("mail")String mail,@Param("authKey")String authKey);
	public MailAuthVO getMailAuth(String mail);   //여기저기서 쓰임. 인증되었는지 확인하는데에도 쓰임
	public int updateMailAuth(@Param("mail")String mail,@Param("authKey")String authKey); //인증키 재발급+같은메일로다시가입할때
	//부모창 mail인증하기 버튼

	public MemberVO mailCheck(String email); //비밀번호 찾기 이메일 확인
	public int updateRandPw(@Param("mail")String mail, @Param("randString")String randString);
	public int completeAuth(String mail);  //인증완, 자식창 확인버튼
	
	
}
