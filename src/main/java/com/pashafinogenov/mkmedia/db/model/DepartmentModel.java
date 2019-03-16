package com.pashafinogenov.mkmedia.db.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "department")
@Data
public class DepartmentModel implements Serializable {

    @Id
    private Integer id;
    private String departmentName;

    @OneToMany(targetEntity = ContentModel.class, mappedBy = "id", orphanRemoval = false, fetch = FetchType.LAZY)
    @Transient
    @JsonIgnore
    private List<CorporatePersonModel> corporatePersons;

}
