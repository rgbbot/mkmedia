package com.dev.mkmedia.db.repository;

import com.dev.mkmedia.db.entity.Content;
import com.dev.mkmedia.db.entity.CorporatePerson;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CorporatePersonRepository extends CrudRepository<CorporatePerson, Long> {

    Content findById(Integer valueOf);
    List<CorporatePerson> findAll();
}
