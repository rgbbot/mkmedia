package com.pashafinogenov.mkmedia.db.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.pashafinogenov.mkmedia.services.Format;
import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "content")
@Data
public class Content implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String contentName;
    private Integer episodesCount;
    private Integer episodesDuration;
    private Integer year;
    private String videoLink;
    private String pictureLink;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "audience_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private Audience audience;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "genre_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private Genre genre;

    private String contentDescription;

    @Enumerated(EnumType.STRING)
    @Column(name = "format" , columnDefinition="ENUM('SD', 'HD', 'Full_HD', 'Ultra_HD')" ,nullable = false)
    private Format format;

    @Transient
    @JsonIgnore
    private Boolean isDeleted;

    @OneToMany(targetEntity = Content.class, mappedBy = "id", orphanRemoval = false, fetch = FetchType.LAZY)
    @Transient
    @JsonIgnore
    private List<ContentSales> contentSales;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "content", fetch = FetchType.LAZY)
    private List<ContentLanguage> contentLanguages;

}
