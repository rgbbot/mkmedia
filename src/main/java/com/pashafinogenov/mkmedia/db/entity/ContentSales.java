package com.pashafinogenov.mkmedia.db.entity;

import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "content_sales")
@Data
public class ContentSales implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "content_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private Content content;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "area_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private Area area;

    private String rights;
    private Boolean isExclusive;
    private Date dateFrom;
    private Date dateTo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "corporate_person_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private CorporatePerson corporatePerson;

}
