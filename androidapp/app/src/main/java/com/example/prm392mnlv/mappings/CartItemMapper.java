package com.example.prm392mnlv.mappings;

import com.example.prm392mnlv.dto.request.CartItemCreateRequest;
import com.example.prm392mnlv.dto.request.CartItemUpdateRequest;
import com.example.prm392mnlv.dto.response.CartItemResponse;
import com.example.prm392mnlv.models.CartItem;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper(uses = MappingMethods.class)
public interface CartItemMapper {

    CartItemMapper INSTANCE = Mappers.getMapper(CartItemMapper.class);

    @Mapping(target = "unitPrice", qualifiedByName = {"MappingMethods", "DoubleToBigDecimal"})
    CartItem toModel(CartItemResponse dto);

    CartItemCreateRequest toCreateRequest(CartItem model);

    CartItemUpdateRequest toUpdateRequest(CartItem model);
}
