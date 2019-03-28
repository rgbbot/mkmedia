package com.pashafinogenov.mkmedia.model;

import lombok.ToString;

import java.util.List;

@ToString
public class ContentModel {

    public Integer id;
    public String pictureLink;
    public String contentName;
    public Integer episodesCount;
    public Integer episodesDuration;
    public Integer year;
    public String genreName;
    public String audienceAge;
    public List<String> episodesLanguage;
    public String format;

}
