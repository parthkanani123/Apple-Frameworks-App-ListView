//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by parth kanani on 23/02/24.
//

import SwiftUI

struct FrameworkListView: View
{
    // FrameworkGridView is destoyed and recreated all the time but viewModel is going to be held of elsewhere and persist & maintenance data bcz of @StateObject, it's going to stay alive while FrameworkGridView gets destoyed and recreated all the time
    @StateObject var viewModel = FrameworkListViewModel()
    
    // @StateObject -> creating a new viewModel
    // @ObservedObject -> passing one in
    
    var body: some View
    {
        NavigationView
        {
            // list has built-in tap gesture and scroll view
            List
            {
                ForEach(MockData.frameworks) { framework in
                    
                    NavigationLink(destination:
                        FrameworkDetailView(framework:framework,
                        isShowingDetailView:
                        $viewModel.isShowingDetailView))
                    {
                        FrameworkTitleView(framework: framework)
                        // whatever is tapped on the list which is our framework titleView that's when you trigger navigation link
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label)) // Back Button
    }
}

#Preview {
    FrameworkListView()
        .preferredColorScheme(.dark)
}

