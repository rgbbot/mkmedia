package com.dev.mkmedia.db.repository;

import com.dev.mkmedia.db.entity.ContentSales;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContentSalesRepository extends CrudRepository<ContentSales, Long> {

    ContentSales findById(Integer valueOf);
    List<ContentSales> findAll();
}
