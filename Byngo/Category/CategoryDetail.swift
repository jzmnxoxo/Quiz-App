//
//  CategoryDetail.swift
//  CategoryApp
//
//  Created by iosuser on 12/11/2021.
//

import SwiftUI
import MapKit

struct CategoryDetail: View {
    
    @EnvironmentObject var categoryData: ModelDataCat
    @Environment(\.presentationMode) var presentationMode
    @State var category: Category
    
    @State var selected: Int = 0
    @State private var isSelected = false
    
    @State private var isStarted = false
    
    let Difficulty = ["Beginner", "Intermediate", "Advanced"]
    
    var categoryIndex: Int {
        categoryData.categories.firstIndex(where: {$0.id==category.id}) ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            
            Text(category.title)
                .font(.largeTitle)
                .bold()
            
           
            Rectangle()
                .frame(width: 350, height: 50)
                .foregroundColor(.clear)
            
            //beginner
            Button( action: {
                selected = 0
                isSelected.toggle()
                
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 70)
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .cornerRadius(10)
                    Text("BEGINNER")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                }
            }
            .sheet(isPresented: $isSelected, onDismiss: didDismiss) {
                VStack {
                    HStack {
                        Button( action: {
                            isSelected.toggle()
                        }) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 50)
                                    .foregroundColor(.clear)
                                    .opacity(0.1)
                                    .cornerRadius(10)
                                Text("Back")
                                    .foregroundColor(.blue)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                
                            }
                        }
                        
                        Spacer()
                    }
                    
                    Text(category.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(60)
                    
                    Text("Difficulty: \(Difficulty[selected])")
                        .font(.title)
                        .padding(55)
                    
                    Text("10 Qs")
                        .font(.title)
                        .padding(50)
                    
                    Spacer()
                    Button( action: {
                        //start quiz
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 70)
                                .foregroundColor(.gray)
                                .opacity(0.1)
                                .cornerRadius(10)
                            Text("START!")
                                .font(.title)
                                .foregroundColor(.black)
                                .bold()
                                .multilineTextAlignment(.center)
                            
                        }
                    }
                }
            }
            
            
            Rectangle()
                .frame(width: 350, height: 30)
                .foregroundColor(.clear)
            
            //intermediate
            Button( action: {
                selected = 1
                isSelected.toggle()
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 70)
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .cornerRadius(10)
                    Text("INTERMEDIATE")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                }
            }
            .sheet(isPresented: $isSelected, onDismiss: didDismiss) {
                VStack {
                    HStack {
                        Button( action: {
                            isSelected.toggle()
                        }) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 50)
                                    .foregroundColor(.clear)
                                    .opacity(0.1)
                                    .cornerRadius(10)
                                Text("Back")
                                    .foregroundColor(.blue)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                
                            }
                        }
                        
                        Spacer()
                    }
                    
                    Text(category.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(60)
                    
                    Text("Difficulty: \(Difficulty[selected])")
                        .font(.title)
                        .padding(55)
                    
                    Text("10 Qs")
                        .font(.title)
                        .padding(50)
                    Spacer()
                    Button( action: {
                        //start quiz
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 70)
                                .foregroundColor(.gray)
                                .opacity(0.1)
                                .cornerRadius(10)
                            Text("START!")
                                .font(.title)
                                .foregroundColor(.black)
                                .bold()
                                .multilineTextAlignment(.center)
                            
                        }
                    }
                }
            }
            
            Rectangle()
                .frame(width: 350, height: 30)
                .foregroundColor(.clear)
            
            //advanced
            Button( action: {
                selected = 2
                isSelected.toggle()
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 70)
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .cornerRadius(10)
                    Text("ADVANCED")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                }
            }
            .sheet(isPresented: $isSelected, onDismiss: didDismiss) {
                VStack {
                    HStack {
                        Button( action: {
                            isSelected.toggle()
                        }) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 50)
                                    .foregroundColor(.clear)
                                    .opacity(0.1)
                                    .cornerRadius(10)
                                Text("Back")
                                    .foregroundColor(.blue)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                
                            }
                        }
                        
                        Spacer()
                    }
                    
                    Text(category.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(60)
                    
                    Text("Difficulty: \(Difficulty[selected])")
                        .font(.title)
                        .padding(55)
                    
                    Text("10 Qs")
                        .font(.title)
                        .padding(50)
                    Spacer()
                    Button( action: {
                        //start quiz
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 70)
                                .foregroundColor(.gray)
                                .opacity(0.1)
                                .cornerRadius(10)
                            Text("START!")
                                .font(.title)
                                .foregroundColor(.black)
                                .bold()
                                .multilineTextAlignment(.center)
                            
                        }
                    }
                }
            }
            
            Spacer()
            
            
        }
        .padding()
        
    }
    
    func didDismiss() {
        // dismissing action.
    }
}

struct CategoryDetail_Previews: PreviewProvider {
    static var categoryData = ModelDataCat()
    
    static var previews: some View {
        CategoryDetail(category: categoryData.categories[0])
            .environmentObject(ModelDataCat())
    }
}

