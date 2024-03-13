//
//  Reviews.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color("prim3")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    
                    Text("Rate us in the AppStore")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 20)
                    
                    Text("Make the app better")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
