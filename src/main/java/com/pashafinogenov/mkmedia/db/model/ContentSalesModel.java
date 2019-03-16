package com.pashafinogenov.mkmedia.db.model;

import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "content_sales")
@Data
public class ContentSalesModel implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer contentNameId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "area_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private AreaModel area;

    private String rights;
    private Boolean isExclusive;
    private Date dateFrom;
    private Date dateTo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "corporate_person_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private CorporatePersonModel corporatePerson;

}
