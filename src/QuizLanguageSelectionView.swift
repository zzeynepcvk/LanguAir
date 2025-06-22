//
//  QuizLanguageSelectionView.swift
//  LanguAir1
//
//  Created by Zeynep Çevik on 18.06.2025.
//


import SwiftUI

struct QuizLanguageSelectionView: View {
    @State private var selectedLanguage: String? = nil
    @State private var shouldNavigate = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Select Quiz Language")
                    .font(.title)

                Button("🇬🇧 English") {
                    selectedLanguage = "english"
                    shouldNavigate = true
                }

                Button("🇷🇺 Russian") {
                    selectedLanguage = "russian"
                    shouldNavigate = true
                }

                NavigationLink(
                    destination: selectedLanguage.map { QuizGameView(language: $0) },
                    isActive: $shouldNavigate
                ) {
                    EmptyView()
                }

            }
            .padding()
        }
    }
}
