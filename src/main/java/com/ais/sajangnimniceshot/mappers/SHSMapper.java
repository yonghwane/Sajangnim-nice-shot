package com.ais.sajangnimniceshot.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ais.sajangnimniceshot.beans.ReservationBean;

@Mapper
public interface SHSMapper {
	List<ReservationBean> getReservationDetail(String rsvCode);
	boolean getRsvCodeSearch(String rsv);
}
