//
//  StatisticsView.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var viewModel: StatisticsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("My students")
                    .foregroundColor(Color("prim"))
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.bottom)
                
                if viewModel.totalSessions == 0 {
                    
                    Image("sempty")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 260)
                    
                } else {
                    
                    Image("stat")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 260)
                }
                
                Text("Total Training Sessions:")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("\(viewModel.totalSessions)")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("Total Sessions")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("\(viewModel.sessionsDuration):00")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("Total Sessions")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                }
                
                HStack {
                    
                    Text("Goals and Achievements")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("bg"))
                            .font(.system(size: 13, weight: .medium))
                            .padding(2)
                            .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                    })
                    
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.goals, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedGoal = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    Text(index.goalSName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text("\(index.goalAchievement ?? ""): \(index.goalDescription ?? "")")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                            })
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchGoals()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAdd ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        UIApplication.shared.endEditing()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd  = false
                        }
                    }
                
                VStack {
                    
                    ZStack {
                        
                        HStack {
                            
                            Button(action: {
                                
                                UIApplication.shared.endEditing()
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd  = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(5)
                                    .background(Circle().fill(.white.opacity(0.2)))
                            })
                            
                            Spacer()
                            
                        }
                        
                        Text("Add achievement")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                        
                    }
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Student name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.goalSName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.goalSName)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Achievement name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.goalAchievement.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.goalAchievement)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Description")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.goalDescription.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.goalDescription)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    Button(action: {
                        
                        UIApplication.shared.endEditing()
                        
                        viewModel.addGoal()
                        
                        viewModel.goalSName = ""
                        viewModel.goalAchievement = ""
                        viewModel.goalDescription = ""
                        
                        viewModel.fetchGoals()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd  = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        
                    })
                    .disabled(viewModel.goalSName.isEmpty || viewModel.goalAchievement.isEmpty || viewModel.goalDescription.isEmpty ? true : false)
                    .opacity(viewModel.goalSName.isEmpty || viewModel.goalAchievement.isEmpty || viewModel.goalDescription.isEmpty ? 0.5 : 1)
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg"))                .ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAdd  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDetail ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        UIApplication.shared.endEditing()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail  = false
                        }
                    }
                
                VStack {
                    
                    ZStack {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail  = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(5)
                                    .background(Circle().fill(.white.opacity(0.2)))
                            })
                            
                            Spacer()
                            
                        }
                        
                        Text(viewModel.selectedGoal?.goalSName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                        
                    }
                    
                    Text(viewModel.selectedGoal?.goalSName ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    Text(viewModel.selectedGoal?.goalAchievement ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    Text(viewModel.selectedGoal?.goalDescription ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail  = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        
                    })
                    
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                .offset(y: viewModel.isDetail  ? 0 : UIScreen.main.bounds.height)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            }
        )
    }
}

#Preview {
    StatisticsView(viewModel: StatisticsViewModel())
}


extension UIApplication {
    
    public func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
