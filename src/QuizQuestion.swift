import SwiftUI

struct QuizQuestion {
    let modelName: String
    let correctAnswer: String
    let choices: [String]
}

func getQuestions(for language: String) -> [QuizQuestion] {
    if language == "english" {
        return [
            QuizQuestion(modelName: "suitcase", correctAnswer: "Suitcase", choices: ["Suitcase", "Camera", "Taxi"]),
            QuizQuestion(modelName: "passport", correctAnswer: "Passport", choices: ["Hotel", "Passport", "Map"]),
            QuizQuestion(modelName: "camera", correctAnswer: "Camera", choices: ["Bus", "Water Bottle", "Camera"]),
            QuizQuestion(modelName: "map", correctAnswer: "Map", choices: ["Plane", "Map", "Suitcase"]),
            QuizQuestion(modelName: "plane", correctAnswer: "Plane", choices: ["Camera", "Plane", "Passport"]),
            QuizQuestion(modelName: "shopping_cart", correctAnswer: "Shopping Cart", choices: ["Shopping Cart", "Map", "Bottle"])
        ]
    } else {
        return [
            QuizQuestion(modelName: "suitcase", correctAnswer: "Чемодан", choices: ["Камера", "Чемодан", "Такси"]),
            QuizQuestion(modelName: "passport", correctAnswer: "Паспорт", choices: ["Отель", "Карта", "Паспорт"]),
            QuizQuestion(modelName: "camera", correctAnswer: "Камера", choices: ["Телефон", "Камера", "Такси"]),
            QuizQuestion(modelName: "map", correctAnswer: "Карта", choices: ["Карта", "Самолёт", "Сумка"]),
            QuizQuestion(modelName: "plane", correctAnswer: "Самолёт", choices: ["Паспорт", "Самолёт", "Камера"]),
            QuizQuestion(modelName: "shopping_cart", correctAnswer: "Корзина", choices: ["Корзина", "Чемодан", "Молоко"])
        ]
    }
}
