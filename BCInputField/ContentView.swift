//
//  ContentView.swift
//  BCInputField
//
//  Created by SherifShokry on 31/08/2021.
//

import SwiftUI

struct ContentView: View {

    
    @StateObject private var contentBuilder =  FormContentBuilderImpl()
    
    var body: some View {
    
        
        ScrollView{
            
//            VStack(alignment: .center, , spacing: 16, content: {
            
            LazyVGrid(columns: [GridItem(.flexible(minimum: 50))],spacing : 20, content: {
             
                ForEach(contentBuilder.content) { component in
                    switch component {
                    case is TextFormComponent :
                        TextFieldFormView(component: component as! TextFormComponent)
                            .environmentObject(contentBuilder)
                    case is DateFormComponent :
                        DateFormView(component: component as! DateFormComponent)
                            .environmentObject(contentBuilder)
                    case is ButtonFormComponent :
                        ButtonFormView(component: component as! ButtonFormComponent,handler: { id in
                            switch id {
                            case .submit:
                                //validate
                                contentBuilder.validate()
                                break
                            default:
                                break
                            }
                        })
                    default:
                        EmptyView()
                    }
            }
            })
            .padding(16)
            .onChange(of: contentBuilder.state, perform: { state in
                switch state {
                case .valid(user: let user):
                    print("Form Is Valid With User : \(user)")
                case .fail(error: let error):
                    print("Failed : \(error.errorDescription)")
                case .none:
                    break
                }
            })
        
   
        
    
        }
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
