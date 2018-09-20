import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alphanumeric": AlphanumericCipher(),
        "ROT13": ROT13Cipher(),
        "Triple": TripleCipher()
    ]
    
    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
    
}
