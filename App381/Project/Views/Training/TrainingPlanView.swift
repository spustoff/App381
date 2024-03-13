//
//  TrainingPlanView.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI

struct TrainingPlanView: View {
    
    @StateObject var viewModel = TrainingPlanViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Training plan")
                    .foregroundColor(Color("prim"))
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.bottom)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {

                    ForEach(viewModel.days, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentDay = index
                            
                        }, label: {
                            
                            VStack {
                                
                                Circle()
                                    .fill(viewModel.currentDay == index ? Color("prim") : .gray)
                                    .frame(width: 6, height: 6)
                                
                                Text(index)
                                    .foregroundColor(viewModel.currentDay == index ? Color("prim") : .gray)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text("Mar")
                                    .foregroundColor(viewModel.currentDay == index ? Color("prim") : .gray)
                                    .font(.system(size: 12, weight: .regular))
                            }
                            .padding(.horizontal)
                        })
                        }
                    }
                }
                .frame(height: 40)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.bottom)
                
                if viewModel.trainings.isEmpty {
                    
                    VStack(spacing: 13) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        
                        Text("You don’t have any plans")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .semibold))
                                .padding(8)
                                .background(Circle().fill(.white.opacity(0.1)))
                        })
                    }
                    
                } else {
                    
                    ScrollView(.vertical,showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.trainings, id: \.self) { index in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(index.trGroup ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedTraining = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            Text("see all")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .semibold))
                                        })
                                    }
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            
                                            Text("\(index.trDuration ?? "")minutes")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                                .padding(4)
                                                .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim2")))
                                            
                                            Text(index.trPart ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                        }
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 19).fill(Color("bg2")))
                                    
                                }
                            }
                        }
                    }
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .semibold))
                                .padding(8)
                                .background(Circle().fill(.white.opacity(0.1)))
                        })
                    }
                }
            }
            .padding()
        }
        .onAppear{
            
            viewModel.fetchTrainings()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTraining(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            TrainingDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    TrainingPlanView()
}
