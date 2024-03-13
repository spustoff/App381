//
//  U1.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("prim3")
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    
                    Text("Trade view")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 20)
                    
                    Text("Pump your skills to the maximum")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 19).fill(Color.white))
                    })
                    .padding()
                }
                .frame(height: 250)
            }
        }
    }
}

#Preview {
    U1()
}
