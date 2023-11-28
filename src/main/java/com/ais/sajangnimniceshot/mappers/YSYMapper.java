package com.ais.sajangnimniceshot.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;

@Mapper
public interface YSYMapper {
	// 이게 뭘까
    boolean authenticateMember(MemberBean memberBean);
    
    // 회원 정보(닉네임)
    MemberBean getMemberInfo(String memNickname);
    
    // 예약 가능 날짜
//    ReservationBean findAvailableRsv(String memNickname);
    
    List<ReservationBean> getReservation(String rsvCode);
    // 
    boolean checkDate(String rsvDate, String rsvTime);
    
    int insertReservation(String memNickname, String rsvTime, String rsvDate, String rsvCount, String rsvHole,
			String rsvCaddy, String rsvClothes, String rsvShoes, String rsvStatus, String rsvPrice);
    
//    int updateReservation(String rsvCode, String memNickname);
    
    boolean checkDateOverlap(@Param("rsvDate") String rsvDate, @Param("rsvTime") String rsvTime);

}
