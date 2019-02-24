package com.pashafinogenov.mkmedia.rest;

import com.pashafinogenov.mkmedia.db.model.ContentModel;
import com.pashafinogenov.mkmedia.db.repositories.ContentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequiredArgsConstructor
public class AppResource {

    private final ContentRepository contentRepository;

    @GetMapping("/api/content/{id}")
    @Transactional
    public ResponseEntity<ContentModel> retrievePointsByParams(
            @PathVariable(value = "id", required = false) Integer id
    ) {
        ContentModel contentModel = contentRepository.findById(id);
        return new ResponseEntity<>(contentModel, HttpStatus.OK);
    }

}
