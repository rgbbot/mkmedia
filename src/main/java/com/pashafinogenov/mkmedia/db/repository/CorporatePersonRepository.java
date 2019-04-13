package com.pashafinogenov.mkmedia.db.repository;

import com.pashafinogenov.mkmedia.db.entity.Content;
import com.pashafinogenov.mkmedia.db.entity.CorporatePerson;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CorporatePersonRepository extends CrudRepository<CorporatePerson, Long> {

    Content findById(Integer valueOf);
    List<CorporatePerson> findAll();
}
