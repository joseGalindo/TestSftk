//
//  DestacadosViewModel.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/14/23.
//

import Foundation
import Combine

protocol DestacadoViewModelProtocol: class {
    func simulateApiCall()
}

class DestacadoViewModel: DestacadoViewModelProtocol {
  
    @Published var destacados: [DestacadoResponse]?
    var cancellables = Set<AnyCancellable>()
    
    init() {}
    
    func simulateApiCall() {
        guard let mockedData: [DestacadoResponse] = self.readMockData() else { return }
        destacados = mockedData
    }
    
    private func readMockData<T: Codable>() -> T? {
        guard let path = Bundle.main.path(forResource: "DestacadosResponse", ofType: "json") else {
            return nil
        }
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        guard let data2 = data else { return nil }
        if let jsonResult = try? JSONDecoder().decode(T.self, from: data2) {
            return jsonResult
        }
        return nil
    }
}

