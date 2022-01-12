//
//  ProductsService.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 10.01.2022.
//

import Foundation

enum ProductsServiceError: LocalizedError {
    case fileAccessError
    case invalidJSONFormat
    
    var errorDescription: String? {
        get {
            NSLocalizedString(errorReason(), comment: "")
        }
    }
    
    private func errorReason() -> String {
        switch self {
        case .fileAccessError: return "Не удалось получить доступ к файлу."
        case .invalidJSONFormat: return "Не удалось считать JSON файл."
        }
    }
}

class ProductsService: NSObject {
    
    private let queue = DispatchQueue.global(qos: .userInitiated)

    func products(_ completion: @escaping ((Result<[Product], Error>) -> Void)) {
        let initialQueue = OperationQueue.current?.underlyingQueue
        queue.async { [weak self] in
            sleep(5)
            guard let strongSelf = self else { return }
            let result = strongSelf.products()
            initialQueue?.async {
                completion(result)
            }
        }
        
    }
    
    private func products() -> Result<[Product], Error> {
        guard let data = fetchProductsDataFromFile() else {
            return .failure(LoginServiceError.fileAccessError)
        }
        
        do {
            let products = try JSONDecoder().decode(Array<Product>.self, from: data)
            return .success(products)
        }
        catch {
            return .failure(LoginServiceError.invalidJSONFormat)
        }
    }
    
    private func fetchProductsDataFromFile() -> Data? {
        if let url = Bundle.main.url(forResource: "Products", withExtension: "json") {
            return FileManager.default.contents(atPath: url.path)
        }
        return nil
    }
    
}
