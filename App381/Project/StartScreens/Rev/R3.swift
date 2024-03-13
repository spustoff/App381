//
//  R3.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R3")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    
                    Text("Explore statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 20)
                    
                    Text("Awesome statistics system")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 19).fill(Color("prim")))
                    })
                    .padding()
                }
                .frame(height: 250)
            }
        }
    }
}

#Preview {
    R3()
}
