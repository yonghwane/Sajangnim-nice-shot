package com.ais.sajangnimniceshot.services;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertSame;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ais.sajangnimniceshot.beans.ReservationBean;
import com.ais.sajangnimniceshot.mappers.SHSMapper;

@SpringBootTest
class SHSServiceTest {

	@Autowired
    private SHSMapper shsMapper;
	
	@Test
	void rsvCodeTest() {
			String rsv = "1";
			boolean flag = true;
	        System.out.println("type : " + this.shsMapper.getRsvCodeSearch(rsv));
	        assertSame(flag, this.shsMapper.getRsvCodeSearch(rsv));
	        
	}
	
	@Test
	void dataTest() {
	    //맞는지 비교할 데이터
	    List<String> expectedList = new ArrayList<>();
	    expectedList.add("1"); //예약번호
	    expectedList.add("shin"); //예약자명
	    expectedList.add("2023-12-02"); //예약일
	    expectedList.add("0900"); //예약시간
	    expectedList.add("4"); //인원수
	    expectedList.add("2"); //홀
	    expectedList.add("3"); //캐디
	    expectedList.add("6"); //옷
	    expectedList.add("8"); //신발
	    expectedList.add("F"); //상태
	    expectedList.add("15000"); //가격
	   
	    String rsv = "1"; //검색하려는 예약번호
	    List<ReservationBean> getActualList = this.shsMapper.getReservationDetail(rsv);
	    //DB에서 가져온 데이터
	    List<String> actualList = new ArrayList<>();
	    for (ReservationBean reservation : getActualList) {
	    	actualList.add(reservation.getRsvCode());
	    	actualList.add(reservation.getRsvMemNickname());
	    	actualList.add(reservation.getRsvDate());
	    	actualList.add(reservation.getRsvTime());
	    	actualList.add(reservation.getRsvCount());
	    	actualList.add(reservation.getRsvHole());
	    	actualList.add(reservation.getRsvCaddy());
	    	actualList.add(reservation.getRsvClothes());
	    	actualList.add(reservation.getRsvShoes());
	    	actualList.add(reservation.getRsvStatus());
	    	actualList.add(reservation.getRsvPrice());

	    }
	    
	    System.out.println("expectedList: " + expectedList);
	    System.out.println("actualList: " + actualList);
	    
	    for (int i = 0; i < expectedList.size(); i++) {
	        String expectedItem = expectedList.get(i);
	        String actualItem = actualList.get(i);
	        assertEquals(expectedItem, actualItem, "리스트의 " + (i+1) + "번째 아이템이 다릅니다.");
	    }
	    
	    
	}
}
