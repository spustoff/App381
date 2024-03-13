//
//  SettingsView.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(Color("prim"))
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Button(action: {
                        
                        guard let url = URL(string: DataManager().usagePolicy) else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "doc.text.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color("bg2")))
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Rate Us")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color("bg2")))
                    })
                }
            } 
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
