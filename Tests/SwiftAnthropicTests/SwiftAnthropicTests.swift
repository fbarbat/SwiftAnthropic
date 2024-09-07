import XCTest
@testable import SwiftAnthropic

final class SwiftAnthropicTests: XCTestCase {
    func testExample() async throws {
        guard let key = ProcessInfo.processInfo.environment["ANTHROPIC_KEY"] else {
            XCTFail("ANTHROPIC_KEY not found")
            return
        }
        
        let service = AnthropicServiceFactory.service(apiKey: key, debugEnabled: true)
        
        print("Starting")
        for try await response in try await service.streamMessage(.init(model: .claude3Haiku, messages: [.init(role: .user, content: .text("Hello"))], maxTokens: 10)) {
            print(response.delta?.text)
        }
        print("Done")
    }
}
