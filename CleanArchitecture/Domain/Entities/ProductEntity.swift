//
//  ProductEntity.swift
//  CleanArchitecture
//
//  Created by Faizan Akbar on 03/03/2025.
//


struct ProductEntity: Codable {
    let products: [ProductItemEntity]
    let total: Int
}

struct ProductItemEntity: Codable, Identifiable, Hashable {
    let id: Int
    let title, description: String
//    let category: Category
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
//    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
//    let availabilityStatus: AvailabilityStatus
//    let reviews: [Review]
//    let returnPolicy: ReturnPolicy
    let minimumOrderQuantity: Int
//    let meta: Meta
    let images: [String]
    let thumbnail: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ProductItemEntity, rhs: ProductItemEntity) -> Bool {
        return lhs.id == rhs.id
    }
}
