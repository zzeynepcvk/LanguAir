# 📦 Kurulum Talimatları

## ✅ Gerekli Yazılımlar
- macOS 13 veya üstü
- Xcode 15 veya üstü
- iOS 17.0+ yüklü bir fiziksel iPhone cihaz

## 📥 Kurulum Adımları

1. Projeyi GitHub üzerinden indir:

git clone https://github.com/zeynepcevik/LanguAir.git


2. İndirilen klasörde `LanguAir.xcodeproj` dosyasına çift tıklayarak projeyi Xcode ile açın.

3. Gerçek bir iPhone cihazını USB ile bilgisayara bağlayın.

4. Xcode'da hedef cihaz olarak iPhone’unuzu seçin (simülatör değil).

5. Gerekli yetkileri verin (kamera, hareket algılama vs.).

6. Ardından **Cmd + R** tuşuna basarak projeyi derleyin ve çalıştırın.

---

## 🧨 Olası Sorunlar ve Çözümleri

- **Model yüklenemedi**  
RealityViewContainer'da kullanılan `modelName`, `.usdz` dosyası ile birebir aynı olmalıdır. Büyük/küçük harfe dikkat!

- **AR sahnesi siyah kalıyor**  
iOS simülatörü yerine fiziksel cihaz kullanmalısınız. Simülatör ARKit desteklemez.

- **Model çok büyük veya çakışıyor**  
ARSceneView.swift içinde `setScale(...)` ve `position` ayarlarıyla modelleri küçültebilir ve aralarını açabilirsiniz.

---

## 🧪 Test Ortamı
- Geliştirme: macOS 13.6 + Xcode 15.1
- Test Cihazı: iPhone 11 (iOS 17.5)

---

📌 Daha fazla yardım için GitHub Issues sekmesinden bizimle iletişime geçebilirsiniz.
