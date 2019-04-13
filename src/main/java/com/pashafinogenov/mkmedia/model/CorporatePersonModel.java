package com.pashafinogenov.mkmedia.model;

import lombok.ToString;

import java.util.List;

@ToString
public class CorporatePersonModel {

    public Integer id;
    public String firstName;
    public String lastName;
    public String position;
    public String department;
    public List<String> areas;
    public String phoneNumber;
    public String email;

}
