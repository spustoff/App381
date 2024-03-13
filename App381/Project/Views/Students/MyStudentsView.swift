//
//  MyStudentsView.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI

struct MyStudentsView: View {
    
    @StateObject var viewModel = MyStudentsViewModel()
    
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
                
                if viewModel.groups.isEmpty {
                    
                    VStack(spacing: 13) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        
                        Text("You don’t have any groups")
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
                            
                            ForEach(viewModel.groups, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedGroup = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            
                                            Text("Avg. age: \(index.gAge ?? "")y.o.")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                                .padding(4)
                                                .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim2")))
                                            
                                            Text(index.gName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            Text(index.gStudent ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Image(index.gType ?? "")
                                            
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 19).fill(Color("bg2")))
                                })
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
            
            viewModel.fetchGroupss()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddNewGroup(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            GroupDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    MyStudentsView()
}
