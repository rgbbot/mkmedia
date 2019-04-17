package com.dev.mkmedia.db.entity;

import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "person_area")
@Data
public class PersonArea implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "corporate_person_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private CorporatePerson corporatePerson;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "area_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private Area area;

}
