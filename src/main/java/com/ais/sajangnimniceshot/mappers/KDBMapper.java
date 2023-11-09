package com.ais.sajangnimniceshot.mappers;

import org.apache.ibatis.annotations.Mapper;

import com.ais.sajangnimniceshot.beans.MemberBean;

@Mapper
public interface KDBMapper {
    boolean authenticateMember(MemberBean memberBean);
    MemberBean getMemberInfo(String memNickname);

}
