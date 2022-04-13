//
//  LineView.swift
//  Test
//
//  Created by Ульяна Гритчина on 12.04.2022.
//

import SwiftUI

struct LineView: View {
    var body: some View {
        Rectangle()
            .frame(width: 345, height: 1)
            .foregroundColor(Color("LineColor"))
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView()
    }
}
