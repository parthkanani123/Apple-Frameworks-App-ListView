//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by parth kanani on 23/02/24.
//

import SwiftUI

struct FrameworkDetailView: View 
{
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false;
    
    var body: some View
    {
        VStack
        {
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button
            {
                isShowingSafariView = true // Declarative :- we just chamging the source of truth of data, the UI reacts
            } label: {
//                AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
//            .foregroundColor(.blue)
//            .buttonBorderShape(.roundedRectangle(radius: 20))
            .tint(.white)
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework,
                        isShowingDetailView: .constant(false)) // when you do binding and you are not passing anything into the preview this is just the way kind of like hard code bindings for your preview
        .preferredColorScheme(.dark)
}
