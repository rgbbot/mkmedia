package com.pashafinogenov.mkmedia.db.repositories;

import com.pashafinogenov.mkmedia.db.model.ContentSalesModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContentSalesRepository extends CrudRepository<ContentSalesModel, Long> {

    ContentSalesModel findById(Integer valueOf);
    List<ContentSalesModel> findAll();
}
