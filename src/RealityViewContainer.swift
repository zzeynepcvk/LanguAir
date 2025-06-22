import SwiftUI
import RealityKit

struct RealityViewContainer: UIViewRepresentable {
    var modelName: String

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        do {
            // Modeli yükle
            let modelEntity = try Entity.loadModel(named: modelName)
            modelEntity.setScale([0.3, 0.3, 0.3], relativeTo: modelEntity)

            // Gesture (döndürme, yakınlaştırma, taşıma) ekle
            modelEntity.generateCollisionShapes(recursive: true)
            arView.installGestures([.rotation, .scale, .translation], for: modelEntity)

            // Modeli tutacak anchor oluştur
            let anchor = AnchorEntity(world: [0, 0, -0.8]) // Kameranın 50cm önüne yerleştir
            anchor.addChild(modelEntity)
            arView.scene.anchors.append(anchor)
        } catch {
            print("❌ Model yüklenemedi: \(error)")
        }

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
