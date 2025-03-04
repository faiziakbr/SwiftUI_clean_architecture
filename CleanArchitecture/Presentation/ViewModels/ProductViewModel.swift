//
//  ProductViewModel.swift
//  CleanArchitecture
//
//  Created by Faizan Akbar on 03/03/2025.
//

import Foundation
import Combine

final class ProductViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var filteredProducts: [ProductItemEntity] = []
    @Published var isLoading: Bool = false
    
    private(set) var originalproducts: [ProductItemEntity] = []
    private let fetchProductsUseCase: FetchProductsUseCase
    private var cancellables = Set<AnyCancellable>()
    
    private var currentPage = 1
    private let limit = 10
    private(set) var maxLimit = 10
    
    init(fetchProductsUseCase: FetchProductsUseCase = FetchProductsUseCase()) {
        self.fetchProductsUseCase = fetchProductsUseCase
        setupSearch()
    }
    
    func fetchProducts() {
        
        guard !isLoading, originalproducts.count < maxLimit else {
            print("Reached max limit of \(maxLimit), stopping further API calls.")
            return
        }
        isLoading = true
        let skip = (currentPage - 1) * limit
        let remainingItems = maxLimit - originalproducts.count
        let fetchLimit = min(limit, remainingItems)
        
        fetchProductsUseCase.execute(limit: fetchLimit, skip: skip)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self else { return }
                isLoading = false
                if case .failure(let error) = completion {
                    print("Error fetching products: \(error)")
                }
            }, receiveValue: { [weak self] response in
                guard let self else { return }
                maxLimit = response.total
                self.originalproducts.append(contentsOf: response.products)
                self.filteredProducts.append(contentsOf: response.products)
                if self.originalproducts.count >= maxLimit {
                    print("All \(self.originalproducts.count) items loaded. Stopping pagination.")
                } else {
                    self.currentPage += 1
                }
            })
            .store(in: &cancellables)
    }
    
    func reloadAllData() {
        filteredProducts = []
        originalproducts = []
        currentPage = 1
        fetchProducts()
    }
    
    //MARK: Private functions
    
    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .map { [weak self] text in
                guard let self = self else { return [] }
                return text.isEmpty ? self.originalproducts : self.originalproducts.filter { $0.title.lowercased().contains(text.lowercased()) }
            }
            .assign(to: &$filteredProducts)
    }
}
