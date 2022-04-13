//
//  ContentView.swift
//  Test
//
//  Created by Ульяна Гритчина on 12.04.2022.
//

import SwiftUI



struct HomeView: View {
    @StateObject var vm = HomeViewViewModel()
    var body: some View {
        ScrollView {
            VStack {
                Image(uiImage: UIImage(data: vm.coverImageData) ?? UIImage(named: "startCoverPhoto")!)
                    .resizable()
                    .frame(width: 345, height: 195)
                    .cornerRadius(20)
                    .overlay(ZStack {
                        Circle()
                            .frame(width: 200, height: 200)
                            .foregroundColor(.white)
                        Image(uiImage: UIImage(data: vm.profileImageData) ?? UIImage(named: "startProfilPhoto")!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 172, height: 172)
                            .clipShape(Circle())
                    }.offset(x: 0, y: 109))
                
                Text("John Doe")
                    .bold()
                    .font(.system(size: 22))
                    .frame(width: 145, height: 33)
                    .padding(.top, 109)
                
                Text(vm.bio)
                    .font(.system(size: 16))
                    .frame(width: 145, height: 33)
                
                LineView()
                
                HStack {
                    Text("Posts")
                        .bold()
                        .frame(width: 80, height: 21)
                        .font(.system(size: 24))
                    Spacer()
                }
                
                PostView()
                
                PostView()
            }
        }
        .onAppear { vm.updateData() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

