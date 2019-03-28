package com.pashafinogenov.mkmedia.db.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "languages")
@Data
public class Language implements Serializable {

    @Id
    private Integer id;
    private String language;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "content", fetch = FetchType.LAZY)
    @Transient
    @JsonIgnore
    private List<ContentLanguage> contentLanguages;

}
