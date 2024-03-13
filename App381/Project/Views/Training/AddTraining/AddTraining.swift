//
//  AddTraining.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI

struct AddTraining: View {

    @StateObject var viewModel: TrainingPlanViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {

                    ZStack {
                        
                        Text("Create")
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.myGroups, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.curGroup = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.curGroup.isEmpty {
                                
                                HStack {
                                    
                                    Text("Group")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(viewModel.curGroup)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                }
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Date")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.trDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.trDate)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        VStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Part 1:")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.trPart.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.trPart)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.4))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                                .padding(.vertical, 8)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Duration:")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.trDuration.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.trDuration)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.4))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                                .padding(.vertical, 8)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Exercise 1:")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.trExercise.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.trExercise)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            
                        }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                    }
                }
                
                Button(action: {
                    
                    viewModel.totalSessions += 1
                    viewModel.sessionsDuration += 1
                    
                    viewModel.trGroup = viewModel.curGroup
                    
                    viewModel.addTraining()
                    
                    viewModel.trDate = ""
                    viewModel.trPart = ""
                    viewModel.trDuration = ""
                    viewModel.trExercise = ""
                    viewModel.curGroup = ""
                    
                    viewModel.fetchTrainings()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .disabled(viewModel.trDate.isEmpty || viewModel.trPart.isEmpty || viewModel.curGroup.isEmpty || viewModel.trDuration.isEmpty || viewModel.trExercise.isEmpty ? true : false)
                .opacity(viewModel.trDate.isEmpty || viewModel.trPart.isEmpty || viewModel.curGroup.isEmpty || viewModel.trDuration.isEmpty || viewModel.trExercise.isEmpty ? 0.5 : 1)
            }
            .padding()
        }
    }
}

#Preview {
    AddTraining(viewModel: TrainingPlanViewModel())
}
