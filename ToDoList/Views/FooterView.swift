//
//  FooterView.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 04/10/23.
//

import SwiftUI

struct FooterView: View {
    let tilt: Double
    let bgClr: Color
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bgClr)
                .rotationEffect(Angle(degrees: tilt))
        }
        .frame(width: UIScreen.main.bounds.width * 3,
                   height: 100)
        .offset(y: 100)
    }
}


#Preview {
    FooterView(tilt: -15, bgClr: .pink)
}
