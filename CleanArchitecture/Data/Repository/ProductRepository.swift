//
//  ProductRepository.swift
//  CleanArchitecture
//
//  Created by Faizan Akbar on 03/03/2025.
//


import Combine

protocol ProductRepository {
    func getProducts(limit: Int, skip: Int) -> AnyPublisher<ProductEntity, Error>
}

final class ProductRepositoryImp: ProductRepository {
    
    private let remoteDataSource: ProductRemoteDataSource
    
    init(remoteDataSource: ProductRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getProducts(limit: Int, skip: Int) -> AnyPublisher<ProductEntity, any Error> {
        return remoteDataSource.fetchProducts(limit: limit, skip: skip)
    }
}
