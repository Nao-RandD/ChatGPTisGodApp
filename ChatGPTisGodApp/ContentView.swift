//
//  ContentView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/05.
//

import SwiftUI

struct ContentView: View {
    @State var circleCenter = CGPoint.zero
    @State var isCircleScaled = false
    @State var isGodHere = true

    var body: some View {
        NavigationView {
            VStack {
                Image(isGodHere ? "god": "no-god")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipShape(Rectangle())
                    .scaleEffect(isCircleScaled ? 1.5 : 1)
                    .animation(.easeInOut, value: isCircleScaled)
                    .offset(x: circleCenter.x - 25, y: circleCenter.y - 25)
                    .animation(.spring(response: 0.3, dampingFraction: 0.1), value: circleCenter)
                    .gesture(
                        DragGesture(minimumDistance: 0).onChanged { value in
                            circleCenter = value.location
                        }
                    )
                HStack {
                    Toggle(
                        "Scale",
                        isOn: $isCircleScaled
                    )
                    Toggle(
                        "isGodHere",
                        isOn: $isGodHere
                    )
                }
                .padding(.horizontal)
                List {
                    Text("テキスト")
                    Text("テキスト")
                    Text("テキスト")
                }
                Button(action: {

                }) {
                    Text("神に送る")
                }
                .navigationBarTitle(Text("神との対話"))
                .navigationBarItems(trailing: Text("＋"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
