import XCTest
@testable import WalletConnectSign

final class SessionRequestTests: XCTestCase {

    func testRequestTtlDefault() {
        let request = Request.stub()

        XCTAssertEqual(request.calculateTtl(), SessionRequestProtocolMethod.defaultTtl)
    }

    func testRequestTtlExtended() {
        let currentDate = Date(timeIntervalSince1970: 0)
        let expiry = currentDate.advanced(by: 500)
        let request = Request.stub(expiry: UInt64(expiry.timeIntervalSince1970))

        XCTAssertEqual(request.calculateTtl(currentDate: currentDate), 500)
    }

    func testRequestTtlNotExtendedMinValidation() {
        let currentDate = Date(timeIntervalSince1970: 0)
        let expiry = currentDate.advanced(by: 200)
        let request = Request.stub(expiry: UInt64(expiry.timeIntervalSince1970))

        XCTAssertEqual(request.calculateTtl(currentDate: currentDate), SessionRequestProtocolMethod.defaultTtl)
    }

    func testRequestTtlNotExtendedMaxValidation() {
        let currentDate = Date(timeIntervalSince1970: 0)
        let expiry = currentDate.advanced(by: 700000)
        let request = Request.stub(expiry: UInt64(expiry.timeIntervalSince1970))

        XCTAssertEqual(request.calculateTtl(currentDate: currentDate), SessionRequestProtocolMethod.defaultTtl)
    }
}

private extension Request {

    static func stub(expiry: UInt64? = nil) -> Request {
        return Request(
            topic: "topic",
            method: "method",
            params: AnyCodable("params"),
            chainId: Blockchain("eip155:1")!,
            expiry: expiry
        )
    }
}
