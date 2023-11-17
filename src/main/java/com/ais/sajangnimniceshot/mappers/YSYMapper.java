package com.ais.sajangnimniceshot.mappers;

import org.apache.ibatis.annotations.Mapper;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;

@Mapper
public interface YSYMapper {
	// 이게 뭘까
    boolean authenticateMember(MemberBean memberBean);
    
    // 회원 정보(닉네임)
    MemberBean getMemberInfo(String memNickname);
    
    // 예약시간 정보
    ReservationBean getReserveTime(String rsvTime);
    
    // 예약날짜 정보
    ReservationBean getReserveDate(String rsvDate);
    
    ReservationBean findReserve(String memNickname);
}
