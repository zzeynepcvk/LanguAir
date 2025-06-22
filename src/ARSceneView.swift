import SwiftUI
import RealityKit
import ARKit

struct ARSceneView: View {
    var selectedLanguage: String

    var body: some View {
        ARViewContainer(selectedLanguage: selectedLanguage)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ARItem {
    let modelName: String
    let label: String
    let pronunciation: String
}

struct ARViewContainer: UIViewRepresentable {
    var selectedLanguage: String

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)

        let items = getItems(for: selectedLanguage)
        var usedPositions: [SIMD3<Float>] = []

        for item in items {
            var position: SIMD3<Float>
            repeat {
                position = SIMD3<Float>(
                    Float.random(in: -0.6...0.6),
                    Float.random(in: -0.2...0.2),
                    Float.random(in: -1.2 ... -0.3)
                )
            } while usedPositions.contains(where: { distance($0, position) < 0.5 })
            usedPositions.append(position)

            let anchor = AnchorEntity(world: position)

            do {
                var modelEntity = try Entity.loadModel(named: item.modelName)
                modelEntity.setScale(SIMD3<Float>(0.1, 0.1, 0.1), relativeTo: modelEntity)

                modelEntity.generateCollisionShapes(recursive: true)
                arView.installGestures([.rotation, .scale, .translation], for: modelEntity)

                // Yazı mesh'i oluştur
                let textMesh = MeshResource.generateText(
                    item.label,
                    extrusionDepth: 0.001,
                    font: .systemFont(ofSize: 0.1),
                    containerFrame: .zero,
                    alignment: .center,
                    lineBreakMode: .byWordWrapping
                )

                let textMaterial = SimpleMaterial(color: .white, isMetallic: false)
                let textEntity = ModelEntity(mesh: textMesh, materials: [textMaterial])
                textEntity.setScale([0.15, 0.15, 0.15], relativeTo: textEntity)

                // ✅ Modelin görsel yüksekliğini hesapla
                let bounds = modelEntity.visualBounds(relativeTo: nil)
                let modelHeight = bounds.extents.y

                // ✅ Yazıyı modelin altına yerleştir
                textEntity.position = [0.2, 0.0, 0]  // Modelin yanına koyduk, görünmemesi artık imkansız


                modelEntity.addChild(textEntity)
                anchor.addChild(modelEntity)
                arView.scene.anchors.append(anchor)

            } catch {
                print("❌ Model yüklenemedi: \(error)")
            }
        }

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func getItems(for language: String) -> [ARItem] {
        if language == "english" {
            return [
                ARItem(modelName: "camera", label: "Camera", pronunciation: "Cam-e-ra"),
                ARItem(modelName: "passport", label: "Passport", pronunciation: "Pass-port"),
                ARItem(modelName: "map", label: "Map", pronunciation: "Map"),
                ARItem(modelName: "plane", label: "Plane", pronunciation: "Plein"),
                ARItem(modelName: "suitcase", label: "Suitcase", pronunciation: "Suit-case"),
                ARItem(modelName: "shopping_cart", label: "Shopping Cart", pronunciation: "Shop-ing cart")
            ]
        } else {
            return [
                ARItem(modelName: "camera", label: "Камера", pronunciation: "Ka-me-ra"),
                ARItem(modelName: "passport", label: "Паспорт", pronunciation: "Pas-port"),
                ARItem(modelName: "map", label: "Карта", pronunciation: "Kar-ta"),
                ARItem(modelName: "plane", label: "Самолёт", pronunciation: "Sa-mo-lyot"),
                ARItem(modelName: "suitcase", label: "Чемодан", pronunciation: "Che-mo-dan"),
                ARItem(modelName: "shopping_cart", label: "Корзина", pronunciation: "Kar-zi-na")
            ]
        }
    }
}
