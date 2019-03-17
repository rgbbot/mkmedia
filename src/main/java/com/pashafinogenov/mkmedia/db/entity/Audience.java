package com.pashafinogenov.mkmedia.db.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "audience")
@Data
public class Audience implements Serializable {

    @Id
    private Integer id;
    private String audienceAge;

    @OneToMany(targetEntity = Content.class, mappedBy = "id", orphanRemoval = false, fetch = FetchType.LAZY)
    @Transient
    @JsonIgnore
    private List<Content> contentModels;

}
