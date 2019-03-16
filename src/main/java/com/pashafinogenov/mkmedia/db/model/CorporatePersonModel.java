package com.pashafinogenov.mkmedia.db.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "corporate_person")
@Data
public class CorporatePersonModel implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String firstName;
    private String secondName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "departament_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private DepartmentModel department;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "position_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private PositionModel position;

    private String phoneNumber;
    private String email;

    @OneToMany(targetEntity = ContentModel.class, mappedBy = "id", orphanRemoval = false, fetch = FetchType.LAZY)
    @Transient
    @JsonIgnore
    private List<ContentSalesModel> contentSales;



}
