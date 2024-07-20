//
//  AnthropicAPI.swift
//
//
//  Created by James Rochabrun on 1/28/24.
//

// MARK: AnthropicAPI

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

// MARK: AnthropicAPI+Endpoint

struct AnthropicAPI {

   let base: String
   let apiPath: APIPath

   enum APIPath {
      case messages
      case textCompletions
   }
}
extension AnthropicAPI: Endpoint {

   var path: String {
      switch apiPath {
      case .messages: return "/v1/messages"
      case .textCompletions: return "/v1/complete"
      }
   }
}
