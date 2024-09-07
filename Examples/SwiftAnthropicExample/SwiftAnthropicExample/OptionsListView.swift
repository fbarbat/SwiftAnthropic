//
//  OptionsListView.swift
//  SwiftAnthropicExample
//
//  Created by James Rochabrun on 2/24/24.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

import SwiftAnthropic
import SwiftUI

struct OptionsListView: View {
   
   let service: AnthropicService
   
   @State private var selection: APIOption? = nil
   
   /// https://docs.anthropic.com/claude/reference/getting-started-with-the-api
   enum APIOption: String, CaseIterable, Identifiable {
      
      case message = "Message"
      case messageFunctionCall = "Function Call"

      var id: String { rawValue }
   }

   var body: some View {
      List(APIOption.allCases, id: \.self, selection: $selection) { option in
         Text(option.rawValue)
            .sheet(item: $selection) { selection in
               VStack {
                  Text(selection.rawValue)
                     .font(.largeTitle)
                     .padding()
                  switch selection {
                  case .message:
                     MessageDemoView(observable: .init(service: service))
                  case .messageFunctionCall:
                     MessageFunctionCallingDemoView(observable: .init(service: service))
                  }
               }
            }
      }
   }
}
