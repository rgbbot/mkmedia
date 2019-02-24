package com.pashafinogenov.mkmedia.db.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.pashafinogenov.mkmedia.services.Format;
import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "content")
@Data
public class ContentModel implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String contentName;
    private Integer episosesCount;
    private Integer episodesDuration;
    private Integer year;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "audience_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private AudienceModel audience;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "genre_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private GenreModel genre;

    private String contentDescription;

    @Enumerated(EnumType.STRING)
    @Column(name = "format" , columnDefinition="ENUM('SD', 'HD', 'Full_HD', 'Ultra_HD')" ,nullable = false)
    private Format format;

    @Transient
    @JsonIgnore
    private Integer isDeleted;

}
