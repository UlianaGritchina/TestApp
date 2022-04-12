//
//  PostView.swift
//  Test
//
//  Created by Ульяна Гритчина on 12.04.2022.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack {
            HStack {
                Image("startProfilPhoto")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("John Doe")
                Spacer()
            }.padding()
            
            Text("If you're looking for a cute dessert for a party or even just a little pick-me up, try making some of @bakedbyjosie's bite sized cheesecakes! For more delicious baked goods, watch Baked by Josie")
                .font(.system(size: 14))
                .padding(.horizontal)
            
            Image("startProfilPhoto")
                .resizable()
                .scaledToFill()
                .frame(width: 375, height: 275)
        }.padding(.bottom, 76)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
