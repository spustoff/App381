//
//  GroupDetail.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI

struct GroupDetail: View {
 
    @StateObject var viewModel: MyStudentsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {

                    ZStack {
                        
                        Text(viewModel.selectedGroup?.gName ?? "")
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
                            
                            Button(action: {
                                
                                CoreDataStack.shared.deleteGroup(withGName: viewModel.selectedGroup?.gName ?? "", completion: {
                                    
                                    viewModel.fetchGroupss()
                                })
                                
                                router.wrappedValue.dismiss()
                                
                            }, label: {
                                
                                Image(systemName: "trash.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 16, weight: .regular))
                            })
                        }
                    }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Information")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))

                            HStack( content: {
                                
                                Text("Name:")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text(viewModel.selectedGroup?.gName ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                                
                                Spacer()
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                        HStack( content: {
                            
                            Text("Average age:")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text(viewModel.selectedGroup?.gAge ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.decimalPad)
                            
                            Spacer()
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                        HStack( content: {
                            
                            Text("Sport:")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text(viewModel.selectedGroup?.gType ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.decimalPad)
                            
                            Spacer()
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        Text("Students")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))

                        HStack( content: {
                            
                            Text("Students:")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text(viewModel.selectedGroup?.gStudent ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.decimalPad)
                            
                            Spacer()
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    }
                }
                
                Button(action: {
                    
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
            }
            .padding()
        }
    }
}

#Preview {
    GroupDetail(viewModel: MyStudentsViewModel())
}
