package com.pashafinogenov.mkmedia.db.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "areas")
@Data
public class Area implements Serializable {

    @Id
    private Integer id;
    private String areaName;

    @OneToMany(targetEntity = Content.class, mappedBy = "id", orphanRemoval = false, fetch = FetchType.LAZY)
    @Transient
    @JsonIgnore
    private List<ContentSales> contentSales;

}
