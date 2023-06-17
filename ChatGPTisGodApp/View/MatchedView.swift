//
//  MatchedView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/19.
//

import SwiftUI

struct MatchedView: View {
    @State var isShowQuestionView: Bool = false
    @State var isShowTitle = true
    @Namespace var namespace
    @Binding var isShowNavigationBar: Bool

    var body: some View {
        ZStack {
            if isShowQuestionView {
                VStack {
                    HStack {
                        if isShowTitle {
                            Text("神への質問")
                                .font(.largeTitle.weight(.bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            .matchedGeometryEffect(id: "Title", in: namespace)
                        } else {
                            Spacer()
                        }
                        Button(action: {
                            withAnimation {
                                isShowQuestionView.toggle()
                                isShowNavigationBar.toggle()
                                if !isShowTitle {
                                    isShowTitle.toggle()
                                }
                            }
                        }, label: {
                            Image(systemName: "x.circle.fill")
                        })
                    }
                    QuestionView(isShowTitle: $isShowTitle)
                        .opacity(isShowQuestionView ? 1 : 0)
                        .matchedGeometryEffect(id: "questionView", in: namespace)
                }
                .padding(20)
                .background(
                    Image("BackgroundImage")
                        .resizable()
                        .cornerRadius(20).matchedGeometryEffect(id: "radius", in: namespace)
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .foregroundStyle(.white)
                .padding(20)
            } else {
                VStack {
                    Text("神に質問してみる")
                        .font(.largeTitle.weight(.semibold))
                        .frame(maxWidth: .infinity, minHeight: 250, alignment: .leading)
                    .matchedGeometryEffect(id: "Title", in: namespace)
                }
                .padding(20)
                .background(
                    Image("BackgroundImage")
                        .resizable()
                        .cornerRadius(20).matchedGeometryEffect(id: "radius", in: namespace)
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .foregroundStyle(.white)
                .padding(20)
                .onTapGesture {
                    withAnimation {
                        isShowQuestionView.toggle()
                        isShowNavigationBar.toggle()
                    }
                }
            }
        }

    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView(isShowNavigationBar: .constant(false))
    }
}
