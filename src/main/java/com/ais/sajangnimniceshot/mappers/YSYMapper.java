package com.ais.sajangnimniceshot.mappers;

import org.apache.ibatis.annotations.Mapper;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.ReserveBean;

@Mapper
public interface YSYMapper {
    boolean authenticateMember(MemberBean memberBean);
    MemberBean getMemberInfo(String memNickname);
    ReserveBean getReserveInfo(Long reserveCode);
}
