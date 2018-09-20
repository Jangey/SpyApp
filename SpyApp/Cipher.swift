import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decode(_ plaintext: String, secret: String) -> String?
}

/*
 Ceaser:
 
 Shifting each input char by secret space.
 Valid input can be char, digit and symbol.
 
 Plaintext :    12345ABCDEFG
 Encode:        23456BCDEFGH
 
 */
struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}



/*
 Alphanumeric:
 
 Shifting each input char by secret space.
 Valid input can be only letter and number.
 Shifting by 1:
 Z maps to 0, 9 maps to A
 Shifting by -1:
 A maps to 9, 0 maps to Z
 
 Plaintext :    XYZ789
 Encode:        YZ089A
 
 */
struct AlphanumericCipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        let newPlaintext = plaintext.uppercased()
        
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in newPlaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy
            
            // cyclical characters between A-Z or 0-9
            if shiftedUnicode > 90 {
                shiftedUnicode = shiftedUnicode - 43
            } else if 58 <= shiftedUnicode && shiftedUnicode <= 64 {
                shiftedUnicode = shiftedUnicode + 7
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        let newPlaintext = plaintext.uppercased()
        
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        
        for character in newPlaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode - shiftBy
            
            // cyclical characters between A-Z or 0-9
            if shiftedUnicode < 48 {
                shiftedUnicode = shiftedUnicode + 43
            } else if 58 <= shiftedUnicode && shiftedUnicode <= 64 {
                shiftedUnicode = shiftedUnicode - 7
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}



/*
 ROT13:
 
 Shifting only letter 13 space.
 Valid input can be only letter.
 No secret request (If input secret, print out "Error encoding")
 
 
 Plaintext :    ABCDEFGHIJKLMNOPQRSTUVWXYZ
 Encode:        ZYXWVUTSRQPONMLKJIHGFEDCBA
 
 */
struct ROT13Cipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        let newPlaintext = plaintext.uppercased()
        if secret != "" {
            return nil
        } else {
            var encoded = ""
            
            for character in newPlaintext {
                let unicode = character.unicodeScalars.first!.value
                
                // check input only vaild for A-Z
                var shiftedUnicode = unicode
                if unicode < 65 || unicode > 90 {
                    return nil
                } else if unicode <= 77 {
                    shiftedUnicode += 13
                } else {
                    shiftedUnicode -= 13
                }
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
            return encoded
        }
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        let newPlaintext = plaintext.uppercased()
        if secret != "" {
            return nil
        } else {
            var decoded = ""
            
            for character in newPlaintext {
                let unicode = character.unicodeScalars.first!.value
                
                // check input only vaild for A-Z
                var shiftedUnicode = unicode
                if unicode < 65 || unicode > 90 {
                    return nil
                } else if unicode <= 77 {
                    shiftedUnicode += 13
                } else {
                    shiftedUnicode -= 13
                }
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                decoded = decoded + shiftedCharacter
            }
            return decoded
        }
    }
}



/*
 Triple:
 
 Shifting each input char by 3 * secret space.
 Valid input can be char, digit and symbol.
 
 Plaintext :    123abc
 secret:        3
 Encode:        :;<jkl
 
 */
struct TripleCipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + (3 * shiftBy)
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - (3 * shiftBy)
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}
