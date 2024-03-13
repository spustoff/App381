//
//  Not.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI
import OneSignalFramework

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("prim3")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    
                    Text("Don't miss anything important")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    Text("Get the most up-to-date information")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        OneSignal.Notifications.requestPermission({ accepted in
                          print("User accepted notifications: \(accepted)")
                            status = true
                        }, fallbackToSettings: true)
                        
                    }, label: {
                        
                        Text("Enable Notifications")
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
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .padding(5)
                            .background(Circle().fill(Color.white.opacity(0.2)))
                    })
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}


#Preview {
    Not()
}
