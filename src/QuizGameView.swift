import SwiftUI

struct QuizGameView: View {
    var language: String
    @Environment(\.presentationMode) var presentationMode

    @State private var currentIndex = 0
    @State private var score = 0
    @State private var isCorrect: Bool? = nil
    @State private var gameOver = false
    @State private var isVictory = false

    private var questions: [QuizQuestion] {
        getQuestions(for: language)
    }

    var body: some View {
        VStack(spacing: 20) {
            if gameOver {
                VStack(spacing: 16) {
                    Text(isVictory ? "🎉 Tebrikler!" : "❌ Game Over")
                        .font(.largeTitle)
                        .bold()
                    Text("Your Score: \(score)/\(questions.count * 10)")
                        .font(.title2)

                    Button("Return to Main Menu") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            } else {
                let question = questions[currentIndex]

                Text("What is this?")
                    .font(.title2)

                RealityViewContainer(modelName: question.modelName)
                    .id(question.modelName) 
                    .frame(height: 300)


                ForEach(question.choices, id: \.self) { choice in
                    Button(choice) {
                        handleAnswer(selected: choice)
                    }
                    .buttonStyle(.borderedProminent)
                }

                if let correct = isCorrect {
                    Text(correct ? "✅ Correct!" : "❌ Wrong Answer")
                        .foregroundColor(correct ? .green : .red)
                }
            }
        }
        .padding()
        .navigationTitle("Quiz")
    }

    func handleAnswer(selected: String) {
        guard isCorrect == nil else { return } // tekrar tıklamayı engelle
        let currentQuestion = questions[currentIndex]

        if selected == currentQuestion.correctAnswer {
            isCorrect = true
            score += 10

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                isCorrect = nil
                currentIndex += 1

                if currentIndex >= questions.count {
                    isVictory = true
                    gameOver = true
                }
            }
        } else {
            isCorrect = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                gameOver = true
            }
        }
    }
}
