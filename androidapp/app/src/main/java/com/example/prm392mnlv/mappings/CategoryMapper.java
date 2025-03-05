package com.example.prm392mnlv.mappings;

import com.example.prm392mnlv.dto.response.CategoryResponse;
import com.example.prm392mnlv.models.Category;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface CategoryMapper {

    CategoryMapper INSTANCE = Mappers.getMapper(CategoryMapper.class);

    Category toModel(CategoryResponse dto);
}
