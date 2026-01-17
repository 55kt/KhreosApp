//
//  KhreosApp.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

@main
struct KhreosApp: App {
    // MARK: - Properties
    @State private var path: NavigationPath = .init()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                TabBarView(path: $path)
                    .navigationDestination(for: NavigationPage.self) { page in
                        switch page {
                        case .details:
                            DetailsView(path: $path)
                                .navigationBarBackButtonHidden(true)
                        }
                    }
            }
            .onAppear {
                print(FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first)
            }
        }
    }
}
