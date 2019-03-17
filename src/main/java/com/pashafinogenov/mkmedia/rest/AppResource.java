package com.pashafinogenov.mkmedia.rest;

import com.pashafinogenov.mkmedia.db.entity.Content;
import com.pashafinogenov.mkmedia.db.entity.ContentSales;
import com.pashafinogenov.mkmedia.db.repository.ContentRepository;
import com.pashafinogenov.mkmedia.db.repository.ContentSalesRepository;
import com.pashafinogenov.mkmedia.model.ContentSalesModel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@Slf4j
@RequiredArgsConstructor
public class AppResource {

    public static final String DELIMITER = " - ";
    public static final String EMPTY_SPACE = " ";
    private final ContentRepository contentRepository;
    private final ContentSalesRepository contentSalesRepository;

    @GetMapping("/api/content/{id}")
    @Transactional
    public ResponseEntity<Content> getContentById(
            @PathVariable(value = "id", required = false) Integer id
    ) {
        Content contentModel = contentRepository.findById(id);
        return new ResponseEntity<>(contentModel, HttpStatus.OK);
    }

    @GetMapping("/api/content")
    @Transactional
    public ResponseEntity<List<Content>> getAllContentRows() {
        List<Content> contentModelList = contentRepository.findAll();
        return new ResponseEntity<>(contentModelList, HttpStatus.OK);
    }

    @GetMapping("/api/content_sales/{id}")
    @Transactional
    public ResponseEntity<ContentSales> getSalesById(
            @PathVariable(value = "id", required = false) Integer id
    ) {
        ContentSales contentSales = contentSalesRepository.findById(id);
        return new ResponseEntity<>(contentSales, HttpStatus.OK);
    }

    @GetMapping("/api/tops")
    @Transactional
    public ResponseEntity<List<ContentSalesModel>> getTops() {
        List<ContentSales> contentSales = contentSalesRepository.findAll();
        return new ResponseEntity<>(this.convertToModel(contentSales), HttpStatus.OK);
    }

    private List<ContentSalesModel> convertToModel(List<ContentSales> contentSales) {
        return contentSales.stream().map(
                sales -> {
                    ContentSalesModel contentSalesModel = new ContentSalesModel();
                    contentSalesModel.contentName = sales.getContent().getContentName();
                    contentSalesModel.areaName = sales.getArea().getAreaName();
                    contentSalesModel.rights = sales.getRights();
                    contentSalesModel.isExclusive = sales.getIsExclusive();

                    DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
                    String dateFrom = df.format(sales.getDateFrom());
                    String dateTo = df.format(sales.getDateTo());
                    contentSalesModel.period = dateFrom + DELIMITER + dateTo;
                    contentSalesModel.fullName = sales.getCorporatePerson().getFirstName() + EMPTY_SPACE + sales.getCorporatePerson().getSecondName();

                    return contentSalesModel;
                }
        ).collect(Collectors.toList());
    }

}
