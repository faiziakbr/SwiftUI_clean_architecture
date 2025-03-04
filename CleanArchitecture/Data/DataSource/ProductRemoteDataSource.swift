//
//  Untitled.swift
//  CleanArchitecture
//
//  Created by Faizan Akbar on 03/03/2025.
//

import Combine

final class ProductRemoteDataSource {
    
    func fetchProducts(limit: Int, skip: Int) -> AnyPublisher<ProductEntity, Error> {
        return APIClient.shared.request(APIEndpoint.getProducts(limit: limit, skip: skip))
            .map { (dto: ProductDTO) in
                ProductEntity(products:  dto.products.map { ProductItemEntity(id: $0.id, title: $0.title, description: $0.description, price: $0.price, discountPercentage: $0.discountPercentage, rating: $0.rating, stock: $0.stock, tags: $0.tags, brand: $0.brand, sku: $0.sku, weight: $0.weight, warrantyInformation: $0.warrantyInformation, shippingInformation: $0.shippingInformation, minimumOrderQuantity: $0.minimumOrderQuantity, images: $0.images, thumbnail: $0.thumbnail)}, total: dto.total)
               
            }
            .eraseToAnyPublisher()
    }
}
