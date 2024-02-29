//
//  frameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by parth kanani on 23/02/24.
//

import SwiftUI

// everything swiftUI has been struct so far but now we want to hold state so this is going to be class

// if you are not going to subclass make it final
final class FrameworkGridViewModel: ObservableObject // you want to confirm to ObservableObject, this way it can broadcast changes,
{
    // The stuff you want to broadcast you put a Published infront of it, now any time isShowingDetailView changes, hit broadcast it publishes and in our gridView  in our sheet is listening to that viewModel.isShowingDetailView. so whenever isShowingDetailView changes our sheet shows in dismisses(kadhi nakhe) accordingly as long as you set the right(true) Boolean
    @Published var isShowingDetailView = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),
    ]
    
    var selectedFramework: Framework?
    {
        // when selectedFramework change(when we tap on grid) we change isShowingDetailView to true and then we show our detilView
        didSet
        {
            isShowingDetailView = true
        }
    }
}
