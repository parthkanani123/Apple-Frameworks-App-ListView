//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by parth kanani on 24/02/24.
//

import SwiftUI

struct FrameworkTitleView: View
{
    let framework: Framework
    
    var body : some View
    {
        HStack
        {
            Image(framework.imageName)
                .resizable()
                .frame(width: 60, height: 60)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6) // if our text is shrink in small grids it max shrink 60% of orginal size not less than that
                .padding()
        }
    }
}


#Preview {
    FrameworkTitleView(framework: MockData.sampleFramework)
}
