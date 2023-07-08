//
//  QuestionView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/12.
//

import SwiftUI

struct QuestionView: View {
    @State var userInputText = ""
    @State var isAnswerViewShow = false
    @State var isShowToast = false
    @Binding var isShowTitle: Bool
    @FocusState var isFocusTextField
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        if !isAnswerViewShow {
            VStack {
                VStack {
                    Text("あなたの悩みは何ですか？")
                        .font(.title2)
                        .foregroundColor(.white)
                    TextField("最近仕事が疲れている", text: $userInputText, axis: .vertical)
                        .focused($isFocusTextField, equals: true)
                        .font(.title2)
                        .padding()
                        .minimumScaleFactor(0.5)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .frame(height: 400)
                        .foregroundColor(
                            Color.accentColor(colorScheme)
                        )
                        .background(
                            Color.componentBackgroundColor(colorScheme)
                        )
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.white, lineWidth: 3)
                        )
                        .toast(message: "質問を入力してください", isShowing: $isShowToast, duration: Toast.short)
                    Spacer()
                }
                .onTapGesture {
                    isFocusTextField.toggle()
                }
                Spacer()
                Button(action: {
                    if !userInputText.isEmpty {
                        isShowTitle.toggle()
                        isAnswerViewShow.toggle()
                    } else {
                        isShowToast = true
                    }
                }, label: {
                    Text("質問を献上")
                        .font(.title.weight(.bold))
                        .foregroundColor(Color.accentColor(colorScheme))
                })
                .frame(width: 250)
                .background(
                    Color.componentBackgroundColor(colorScheme)
                )
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.white, lineWidth: 3)
                )
            }
            .padding(20)
        } else {
            AnswerView(userQuestion: userInputText)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        QuestionView(isShowTitle: .constant(false))
    }
}
