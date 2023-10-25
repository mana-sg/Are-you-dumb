//
//  ButtonD.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 04/10/23.
//

import SwiftUI

struct ButtonD: View {
    let title: String
    let bgClr: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgClr)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    ButtonD(title: "Value", bgClr: .pink){
        
    }
}
