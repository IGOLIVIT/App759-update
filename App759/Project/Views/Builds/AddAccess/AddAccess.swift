//
//  AddAccess.swift
//  App759
//
//  Created by IGOR on 11/08/2024.
//

import SwiftUI

struct AddAccess: View {
    
    @StateObject var viewModel: BuildsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        }
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.acName = viewModel.selectedAccessory?.accName ?? ""
                        viewModel.acPhoto = viewModel.selectedAccessory?.accPhoto ?? ""
                        viewModel.acBuild = viewModel.selectedAccessory?.accName ?? ""
                        
                        viewModel.AccNameForAdd = viewModel.selectedAccessory?.accName ?? ""
                        
                        viewModel.addAddedAccessory()
                        
                        viewModel.acName = ""
                        viewModel.acPhoto = ""
                        viewModel.acBuild = ""

                        viewModel.fetchAddedAccessories()
                        
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddAddedAcc = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                    })
                    
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.accessories, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.selectedAccessory = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    ZStack {
                                        
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .regular))
                                            .frame(width: 25)
                                            .background(Circle().fill(.blue))
                                            .opacity(viewModel.selectedAccessory == index ? 1 : 0)
                                        
                                        Circle()
                                            .stroke(.black)
                                            .frame(width: 20)
                                            .opacity(viewModel.selectedAccessory == index ? 0 : 1)
                                        
                                    }
                                    
                                    Image(index.accPhoto ?? "")
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                    
                                    Text(index.accName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Spacer()
                                }
                            })
                        }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchAccessories()
        }
    }
}

#Preview {
    AddAccess(viewModel: BuildsViewModel())
}
