import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alphanumeric": AlphanumericCeaserCipher()
    ]
    
    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
    
}
