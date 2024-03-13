//
//  AddNewGroup.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI

struct AddNewGroup: View {

    @StateObject var viewModel: MyStudentsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {

                    ZStack {
                        
                        Text("Create a new group")
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

                            ZStack(alignment: .leading, content: {
                                
                                Text("Name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.gName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.gName)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Average age")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.gAge.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.gAge)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                            Menu(content: {
                                
                                ForEach(viewModel.sportTypes, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentType = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentType.isEmpty {
                                    
                                    HStack {
                                        
                                        Text("Type of sport")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    
                                } else {
                                    
                                    HStack {
                                        
                                        Text(viewModel.currentType)
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
                                
                                Text("Student 1")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.gStudent.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.gStudent)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            .padding(.vertical)
                    }
                }
                
                Button(action: {
                    
                    viewModel.myGroups.append(viewModel.gName)
                    
                    viewModel.gType = viewModel.currentType
                    
                    viewModel.addGroup()
                    
                    viewModel.gName = ""
                    viewModel.gAge = ""
                    viewModel.gStudent = ""
                    viewModel.currentType = ""
                    
                    viewModel.fetchGroupss()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .disabled(viewModel.gName.isEmpty || viewModel.gAge.isEmpty || viewModel.currentType.isEmpty || viewModel.gStudent.isEmpty ? true : false)
                .opacity(viewModel.gName.isEmpty || viewModel.gAge.isEmpty || viewModel.currentType.isEmpty || viewModel.gStudent.isEmpty ? 0.5 : 1)
            }
            .padding()
        }
    }
}

#Preview {
    AddNewGroup(viewModel: MyStudentsViewModel())
}
