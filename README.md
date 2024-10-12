
# Fotoğraf Paylaşma Uygulaması

Bu proje, Swift ile geliştirilmiş bir fotoğraf paylaşma uygulamasıdır. Kullanıcılar, uygulama üzerinden fotoğraflar yükleyebilir, paylaşabilir ve diğer kullanıcıların paylaştığı fotoğrafları görebilir. Veri tabanı olarak Firebase kullanılmıştır.

# Özellikler
- **Kullanıcı kaydı ve oturum açma:** Firebase Authentication kullanılarak, kullanıcılar e-posta ve şifre ile kaydolabilir ve oturum açabilir.
- **Fotoğraf paylaşımı:** Kullanıcılar, cihazlarındaki fotoğrafları Firebase Storage'a yükleyebilir ve diğer kullanıcılarla paylaşabilir.
- **Anlık güncellemeler:** Firebase Firestore ile, kullanıcılar gerçek zamanlı olarak fotoğraf güncellemelerini görebilir.
- **Fotoğraf görüntüleme:** Diğer kullanıcıların paylaştığı fotoğraflar liste şeklinde gösterilir.

# Kullanılan Teknolojiler
- **Swift (iOS)**
- **Firebase Authentication:** Kullanıcı oturum açma ve kaydı için.
- **Firebase Firestore:** Fotoğrafların meta verilerini saklamak için.
- **Firebase Storage:** Fotoğrafların güvenli bir şekilde depolanması için.
  
# Kurulum ve Kullanım
1. **Firebase Projesi Oluşturma:** Firebase Console'da yeni bir proje oluşturun ve Firebase SDK'yı uygulamanıza entegre edin.
2. **Bağımlılıkların Kurulumu:** Proje dizinine gidip `pod install` komutunu çalıştırın.
3. **Firebase Yapılandırması:** Firebase'den aldığınız `GoogleService-Info.plist` dosyasını Xcode projenize ekleyin.
4. **Projeyi Çalıştırma:** Xcode'da projeyi açın ve çalıştırın.
