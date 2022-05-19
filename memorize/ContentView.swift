//
//  ContentView.swift
//  memorize
//
//  Created by Israel Alfaro on 17/5/22.
//

import SwiftUI

struct ContentView: View {
    @State var emojiCount = 3
    
    var emojis: Array<String> = ["🥑", "🍔", "🍟", "🍎", "🍇", "🥥", "🍒", "🫐", "🍑", "🍈", "🍌", "🌮", "🌯", "🍜", "🍞", "🥞", "🧇", "🍕", "🍧", "🍥", "🥪", "🥓", "🍪", "🍺", "🍩", "🍮"]
    
    var columns: [GridItem] = [GridItem(.adaptive(minimum: 100))]
    //Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer(minLength: 20)
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
