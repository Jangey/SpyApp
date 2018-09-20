import XCTest
@testable import SpyApp

class ROT13CipherTests: XCTestCase {

    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = ROT13Cipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "")
        
        XCTAssertEqual(String(UnicodeScalar(UInt8(plaintext.uppercased().unicodeScalars.first!.value) + 13)), result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }

}
