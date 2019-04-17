package com.dev.mkmedia.rest;

import com.dev.mkmedia.db.entity.Content;
import com.dev.mkmedia.db.entity.ContentSales;
import com.dev.mkmedia.db.entity.CorporatePerson;
import com.dev.mkmedia.db.repository.ContentRepository;
import com.dev.mkmedia.db.repository.ContentSalesRepository;
import com.dev.mkmedia.db.repository.CorporatePersonRepository;
import com.dev.mkmedia.model.ContentInfoModel;
import com.dev.mkmedia.model.ContentModel;
import com.dev.mkmedia.model.ContentSalesModel;
import com.dev.mkmedia.model.CorporatePersonModel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
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
    private final CorporatePersonRepository corporatePersonRepository;

    /**
     * Content Info.
     *
     * @param id - content table primary key
     * @return
     */
    @GetMapping("/api/content/{id}")
    @Transactional
    public ResponseEntity<ContentInfoModel> getContentById(
            @PathVariable(value = "id", required = false) Integer id
    ) {
        Content contentModel = contentRepository.findById(id);
        return new ResponseEntity<>(this.toContentInfoModel(contentModel), HttpStatus.OK);
    }

    /**
     * Content list.
     *
     * @return
     */
    @GetMapping("/api/content")
    @Transactional
    public ResponseEntity<List<ContentModel>> getAllContentRows() {
        List<Content> contentModelList = contentRepository.findAll();
        return new ResponseEntity<>(this.toContentModel(contentModelList), HttpStatus.OK);
    }

    /**
     * Get content_sales by id. Not used for now.
     *
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
     *
     * @return
     */
    @GetMapping("/api/tops")
    @Transactional
    public ResponseEntity<List<ContentSalesModel>> getTops() {
        List<ContentSales> contentSales = contentSalesRepository.findAll();
        return new ResponseEntity<>(this.toContentSalesModel(contentSales), HttpStatus.OK);
    }

    /**
     * Corporate people.
     *
     * @return
     */
    @GetMapping("/api/persons")
    @Transactional
    public ResponseEntity<List<CorporatePersonModel>> getPeople() {
        List<CorporatePerson> corporatePeople = corporatePersonRepository.findAll();
        return new ResponseEntity<>(this.toCorporatePersonModel(corporatePeople), HttpStatus.OK);
    }

    private List<ContentSalesModel> toContentSalesModel(List<ContentSales> contentSales) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return contentSales.stream().map(
                sales -> {
                    ContentSalesModel contentSalesModel = new ContentSalesModel();
                    contentSalesModel.contentName = sales.getContent().getContentName();
                    contentSalesModel.areaName = sales.getArea().getAreaName();
                    contentSalesModel.rights = sales.getRights();
                    contentSalesModel.isExclusive = sales.getIsExclusive();
                    String dateFrom = format.format(sales.getDateFrom());
                    String dateTo = format.format(sales.getDateTo());
                    contentSalesModel.period = dateFrom + DELIMITER + dateTo;
                    contentSalesModel.fullName = sales.getCorporatePerson().getFirstName() + EMPTY_SPACE + sales.getCorporatePerson().getSecondName();

                    return contentSalesModel;
                }
        ).collect(Collectors.toList());
    }

    private List<ContentModel> toContentModel(List<Content> contents) {
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
                            .map(cl -> cl.getCLanguage().getLanguage())
                            .collect(Collectors.toList());
                    contentModel.format = content.getFormat().name();
                    return contentModel;
                }).collect(Collectors.toList());
    }

    private ContentInfoModel toContentInfoModel(Content content) {
        ContentInfoModel contentInfoModel = new ContentInfoModel();
        contentInfoModel.id = content.getId();
        contentInfoModel.videoLink = content.getVideoLink();
        contentInfoModel.contentName = content.getContentName();
        contentInfoModel.contentDescription = content.getContentDescription();

        return contentInfoModel;
    }

    private List<CorporatePersonModel> toCorporatePersonModel(List<CorporatePerson> corporatePeople) {
        return corporatePeople.stream().map(
                corporatePerson -> {
                    CorporatePersonModel corporatePersonModel = new CorporatePersonModel();
                    corporatePersonModel.id = corporatePerson.getId();
                    corporatePersonModel.firstName = corporatePerson.getFirstName();
                    corporatePersonModel.lastName = corporatePerson.getSecondName();
                    corporatePersonModel.position = corporatePerson.getPosition().getPositionName();
                    corporatePersonModel.department = corporatePerson.getDepartment().getDepartmentName();
                    corporatePersonModel.areas = corporatePerson.getPersonAreas()
                            .stream().map(personArea -> personArea.getArea().getAreaName())
                            .collect(Collectors.toList());
                    corporatePersonModel.phoneNumber = corporatePerson.getPhoneNumber();
                    corporatePersonModel.email = corporatePerson.getEmail();
                    corporatePersonModel.pictureLink = corporatePerson.getPictureLink();
                    corporatePersonModel.hierarchy = corporatePerson.getHierarchy();
                    return corporatePersonModel;
                }).collect(Collectors.toList());
    }

}
