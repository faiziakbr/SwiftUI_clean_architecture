//
//  FetchProductUseCase.swift
//  CleanArchitecture
//
//  Created by Faizan Akbar on 03/03/2025.
//

import Combine

final class FetchProductsUseCase {
    private let repository: ProductRepository
    
    init(repository: ProductRepository = ProductRepositoryImp(remoteDataSource: ProductRemoteDataSource())) {
        self.repository = repository
    }
    
    func execute(limit: Int, skip: Int) -> AnyPublisher<ProductEntity, Error>{
        return repository.getProducts(limit: limit, skip: skip)
    }
}
