import SwiftUI

struct ContentView: View {
    @State private var selectedLanguage: String? = nil
    @State private var showARScene = false
    @State private var showQuiz = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // ✅ Arka plan görseli
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // ✅ Var olan tüm içerik
                VStack(spacing: 30) {
                    Text("Select Mode")
                        .font(.title)
                        .padding(.top, -100)
                    Spacer().frame(height: 360)
                    Button("🇬🇧 English") {
                        selectedLanguage = "english"
                        showARScene = true
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("🇷🇺 Russian") {
                        selectedLanguage = "russian"
                        showARScene = true
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("🧠 Quiz") {
                        showQuiz = true
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
            }
            .navigationDestination(isPresented: $showARScene) {
                if let lang = selectedLanguage {
                    ARSceneView(selectedLanguage: lang)
                }
            }
            .navigationDestination(isPresented: $showQuiz) {
                QuizLanguageSelectionView()
            }
        }
    }
}
