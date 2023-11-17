package com.ais.sajangnimniceshot.beans;


import lombok.Data;

@Data
public class ReservationBean {
    private String rsvCode;
    private String rsvMemNickname;
    private String rsvDate;
    private String rsvTime;
    private String rsvCount;
    private String rsvHole;
    private String rsvCaddy;
    private String rsvClothes;
    private String rsvShoes;
    private String rsvStatus;
    private String rsvPrice;
}