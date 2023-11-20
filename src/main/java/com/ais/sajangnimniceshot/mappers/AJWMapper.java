package com.ais.sajangnimniceshot.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ais.sajangnimniceshot.beans.ReservationBean;

@Mapper

public interface AJWMapper {
	
	/*
	 * String booking(String memNickname, String rsvCount, String hole, String
	 * caddy, String clothes, String shose, String price, String tiCode, String
	 * date, String status, String rsvCode);
	 */
	
	String booking(ReservationBean reservationBean);
}

/* xml부분
 * SELECT RSV_CODE AS RSVCODE, TO_CHAR(RSV_DATE, 'YYYY-MM-DD') AS RSVDATE,
 * RSV_TIME AS RSVTIME, RSV_MEMNICKNAME AS RSVMEMNICKNAME FROM RSVDS JOIN RS
 * ONMEMBE RSV_MEMNICKNAME = MEM_NICKNAME WHERE RSV_MEMNICKNAME = #{memNickname}
 */