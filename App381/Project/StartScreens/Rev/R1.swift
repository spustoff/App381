//
//  R1.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    
                    Text("Be in touch with your students!")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 20)
                    
                    Text("Connect your student groups to the account ")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
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
    R1()
}
