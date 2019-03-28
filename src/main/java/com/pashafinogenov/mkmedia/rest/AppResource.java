package com.pashafinogenov.mkmedia.rest;

import com.pashafinogenov.mkmedia.db.entity.Content;
import com.pashafinogenov.mkmedia.db.entity.ContentSales;
import com.pashafinogenov.mkmedia.db.repository.ContentRepository;
import com.pashafinogenov.mkmedia.db.repository.ContentSalesRepository;
import com.pashafinogenov.mkmedia.model.ContentInfoModel;
import com.pashafinogenov.mkmedia.model.ContentModel;
import com.pashafinogenov.mkmedia.model.ContentSalesModel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@Slf4j
@RequiredArgsConstructor
public class AppResource {

    private static final String DELIMITER = " - ";
    private static final String EMPTY_SPACE = " ";
    private final ContentRepository contentRepository;
    private final ContentSalesRepository contentSalesRepository;

    /**
     * Content Info.
     * @param id - content table primary key
     * @return
     */
    @GetMapping("/api/content/{id}") //это для contentInfo да
    @Transactional
    public ResponseEntity<ContentInfoModel> getContentById(
            @PathVariable(value = "id", required = false) Integer id
    ) {
        Content contentModel = contentRepository.findById(id);
        return new ResponseEntity<>(this.convertContentInfoToModel(contentModel), HttpStatus.OK);
    }

    /**
     * Content list.
     * @return
     */
    @GetMapping("/api/content") // eto dlya content
    @Transactional
    public ResponseEntity<List<ContentModel>> getAllContentRows() {
        List<Content> contentModelList = contentRepository.findAll();
        return new ResponseEntity<>(this.convertContentToModel(contentModelList), HttpStatus.OK);
    }

    /**
     * Get content_sales by id. Not used for now.
     * @param id
     * @return
     */
    @GetMapping("/api/content_sales/{id}")
    @Transactional
    public ResponseEntity<ContentSales> getSalesById(
            @PathVariable(value = "id", required = false) Integer id
    ) {
        ContentSales contentSales = contentSalesRepository.findById(id);
        return new ResponseEntity<>(contentSales, HttpStatus.OK);
    }

    /**
     * TOPs.
     * @return
     */
    @GetMapping("/api/tops")
    @Transactional
    public ResponseEntity<List<ContentSalesModel>> getTops() {
        List<ContentSales> contentSales = contentSalesRepository.findAll();
        return new ResponseEntity<>(this.convertContentSalesToModel(contentSales), HttpStatus.OK);
    }

    private List<ContentSalesModel> convertContentSalesToModel(List<ContentSales> contentSales) {
        return contentSales.stream().map(
                sales -> {
                    ContentSalesModel contentSalesModel = new ContentSalesModel();
                    contentSalesModel.contentName = sales.getContent().getContentName();
                    contentSalesModel.areaName = sales.getArea().getAreaName();
                    contentSalesModel.rights = sales.getRights();
                    contentSalesModel.isExclusive = sales.getIsExclusive();
                    String dateFrom = sales.getDateFrom().toString();
                    String dateTo = sales.getDateTo().toString();
                    contentSalesModel.period = dateFrom + DELIMITER + dateTo;
                    contentSalesModel.fullName = sales.getCorporatePerson().getFirstName() + EMPTY_SPACE + sales.getCorporatePerson().getSecondName();

                    return contentSalesModel;
                }
        ).collect(Collectors.toList());
    }

    private List<ContentModel> convertContentToModel(List<Content> contents) {
        return contents.stream().map(
                content -> {
                    ContentModel contentModel = new ContentModel();
                    contentModel.id = content.getId();
                    contentModel.pictureLink = content.getPictureLink();
                    contentModel.contentName = content.getContentName();
                    contentModel.episodesCount = content.getEpisodesCount();
                    contentModel.episodesDuration = content.getEpisodesDuration();
                    contentModel.year = content.getYear();
                    contentModel.genreName = content.getGenre().getGenreName();
                    contentModel.audienceAge = content.getAudience().getAudienceAge();
                    contentModel.episodesLanguage = content.getContentLanguages()
                            .stream()
                            .map(cl -> cl.getLanguage().getLanguage())
                            .collect(Collectors.toList());
                    contentModel.format = content.getFormat().name();
                    return contentModel;
        }).collect(Collectors.toList());
    }

       private ContentInfoModel convertContentInfoToModel(Content content) {
        ContentInfoModel contentInfoModel = new ContentInfoModel();
        contentInfoModel.id = content.getId();
        contentInfoModel.videoLink = content.getVideoLink();
        contentInfoModel.contentName = content.getContentName();
        contentInfoModel.contentDescription = content.getContentDescription();

        return contentInfoModel;
    }

}
