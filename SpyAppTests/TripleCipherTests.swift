import XCTest
@testable import SpyApp

class TripleCipherTests: XCTestCase {

    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = TripleCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }

    func test_multiplyCharAndDigit(){
        let plaintext = "abc123"
        let result = cipher.encode(plaintext, secret: "3")
        XCTAssertEqual("jkl:;<", result)
    }
}
