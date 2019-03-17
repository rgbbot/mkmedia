package com.pashafinogenov.mkmedia.db.repository;

import com.pashafinogenov.mkmedia.db.entity.Content;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContentRepository extends CrudRepository<Content, Long> {

    Content findById(Integer valueOf);
    List<Content> findAll();
}
