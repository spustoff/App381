//
//  TrainingDetail.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI

struct TrainingDetail: View {

    @StateObject var viewModel: TrainingPlanViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedTraining?.trGroup ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .padding()
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 18, weight: .medium))
                                
                                Text("Back")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 18, weight: .medium))
                                
                                Spacer()
                            }
                        })
                        
                        Spacer()
                    }
                }
                
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Text(viewModel.selectedTraining?.trDate ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            HStack {
                                
                                Text(viewModel.selectedTraining?.trPart ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                             
                                Text(viewModel.selectedTraining?.trDuration ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.4))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                                .padding(.bottom)
                            
                            Text(viewModel.selectedTraining?.trExercise ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 19).fill(Color("bg2")))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    TrainingDetail(viewModel: TrainingPlanViewModel())
}
