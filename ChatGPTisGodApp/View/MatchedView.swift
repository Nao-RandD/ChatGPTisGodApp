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
        VStack {
            ZStack {
                if isShowQuestionView {
                    VStack {
                        HStack {
                            if isShowTitle {
                                Text("神への質問")
                                    .matchedGeometryEffect(id: "Title", in: namespace)
                                    .font(.largeTitle.weight(.bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            } else {
                                Spacer()
                            }
                            Button(action: {
                                withAnimation(.spring(dampingFraction: 0.5, blendDuration: 1.0)) {
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
                            .matchedGeometryEffect(id: "questionView", in: namespace)
                            .opacity(isShowQuestionView ? 1 : 0)
                    }
                    .padding(20)
                    .background(
                        Image("BackgroundImage")
                            .resizable()
                            .matchedGeometryEffect(id: "background", in: namespace)
                            .cornerRadius(20).matchedGeometryEffect(id: "radius", in: namespace)
                    )
                    .foregroundStyle(.white)
                    .padding(20)
                } else {
                    VStack {
                        Text("神への質問")
                            .matchedGeometryEffect(id: "Title", in: namespace)
                            .font(.largeTitle.weight(.semibold))
                            .frame(maxWidth: .infinity, minHeight: 250, alignment: .center)
                        EmptyView()
                            .matchedGeometryEffect(id: "questionView", in: namespace)
                    }
                    .background(
                        Image("BackgroundImage")
                            .resizable()
                            .matchedGeometryEffect(id: "background", in: namespace)
                            .cornerRadius(20).matchedGeometryEffect(id: "radius", in: namespace)
                    )
                    .foregroundStyle(.white)
                    .padding(20)
                    .onTapGesture {
                        withAnimation(.spring(dampingFraction: 0.5, blendDuration: 1.0)) {
                            isShowQuestionView.toggle()
                            isShowNavigationBar.toggle()
                        }
                    }
                }
            }
            ADBannerViewControllerRepresentable()
                .frame(height: 50)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 50, trailing: 10))
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView(isShowNavigationBar: .constant(false))
    }
}
