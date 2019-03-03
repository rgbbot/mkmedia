package com.pashafinogenov.mkmedia.db.repositories;

import com.pashafinogenov.mkmedia.db.model.ContentModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContentRepository extends CrudRepository<ContentModel, Long> {

    ContentModel findById(Integer valueOf);
    List<ContentModel> findAll();
}
