//
//  AppViewModel.swift
//  CryptoApp
//
//  Created by Juan Sebastian Orozco Buitrago on 4/15/22.
//

import SwiftUI

class AppViewModel: ObservableObject {
    
    @Published var coins: [CryptoModel]?
    @Published var currentCoin: CryptoModel?
    
    init() {
        Task {
            do {
                try await fecthCryptoData()
            } catch {
                // Handle Error
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - Fetching Crypto Data
    func fecthCryptoData() async throws {
        //MARK: - Using Latest Async / Await
        guard let url = url else { return }
        
        let session = URLSession.shared
        
        let response = try await session.data(from: url)
        let jsonData = try JSONDecoder().decode([CryptoModel].self, from: response.0)
        
        // Alternative For DispatchQueue Main
        
        await MainActor.run(body: {
            self.coins = jsonData
            if let firstCoin = jsonData.first {
                self.currentCoin = firstCoin
            }
        })
    }
    
}
