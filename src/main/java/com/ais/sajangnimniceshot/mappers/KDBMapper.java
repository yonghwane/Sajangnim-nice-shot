package com.ais.sajangnimniceshot.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;

@Mapper
public interface KDBMapper {
    boolean authenticateMember(MemberBean memberBean);
    MemberBean getMemberInfo(String memNickname);

}
