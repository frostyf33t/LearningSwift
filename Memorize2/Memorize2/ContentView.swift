//
//  ContentView.swift
//  Memorize2
//

//  Created by Mehdi S on 8/3/21.
//  Still not completed!  This is part of working through a lesson on Stanford's iOS course.

import SwiftUI


struct ContentView: View {
    var transEmojis = ["🚆","🚒","🛳","🏍","🛬","🚢","🚖","🚁"]
    var peopleEmojis = ["🤓","😥","🤥","😱","🤯","🥵","😍","😇"]
    var emojiCount = 8
    var body: some View {
        ScrollView{
            VStack{
                Text("Memorize!")
                    .font(.largeTitle)
            }
            VStack{
                LazyVGrid(columns: [GridItem(.adaptive(minimum : 65))]){
                    ForEach(transEmojis[0..<emojiCount], id: \.self){ transEmojis in
                        CardView(content: transEmojis).aspectRatio(2/3,contentMode: .fit)
                    }
        }
                .foregroundColor(.red)
            }
            Spacer()
            HStack(alignment: .center, spacing: 1.0){
                Image(systemName: "sportscourt")
                    
                    
                Spacer()
                Image(systemName: "face.smiling")
                Spacer()
                Image(systemName: "car")
                    
            
            }
            .padding(.all)
            .frame(width: 237.0, height: 725.0)
            .scaledToFill()
            .tabItem { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Item Label@*/Text("Label")/*@END_MENU_TOKEN@*/ }
            
            
        }
        .padding(.horizontal)
    }
        
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
            Text(content).font(.largeTitle)
            }
            else{
                shape.fill()
                    
            }
        }
        .onTapGesture {isFaceUp = !isFaceUp }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}


