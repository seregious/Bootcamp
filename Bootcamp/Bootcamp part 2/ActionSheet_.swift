//
//  ActionSheet_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 14.02.2022.
//

import SwiftUI

struct ActionSheet_: View {
    
    @State var showActionSheet = false
    @State var actionSheetOption : ActionSheetOptions = .otherPost
    
    enum ActionSheetOptions {
        case myPost
        case otherPost
    }
    
    var body: some View {
        VStack {
        HStack{
            
            Circle()
                .frame(width: 30, height: 30)
            Text("@username")
            Spacer()
            Button {
                actionSheetOption = .myPost
                showActionSheet.toggle()
            } label: {
                Image(systemName: "ellipsis")
            }
            .accentColor(.primary)
        }
        .padding()
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
        .actionSheet(isPresented: $showActionSheet) {getActionSheet()}
    }
    
    func getActionSheet() -> ActionSheet {
        
        let shareButton : ActionSheet.Button = .default(Text("Share")) {
            
        }
        let reportButton : ActionSheet.Button = .destructive(Text("Report")) {
            
        }
        let deleteButton : ActionSheet.Button = .destructive(Text("Delete")) {
            
        }
        let cancelButton : ActionSheet.Button = .cancel()
        
        switch actionSheetOption {
        case .myPost:
            return ActionSheet(
                title: Text("What would you like to do?"),
                message: nil,
                buttons: [shareButton, reportButton, deleteButton, cancelButton])
        case .otherPost:
            return ActionSheet(
                title: Text("What would you like to do?"),
                message: nil,
                buttons: [shareButton, reportButton,cancelButton])
        }
//        let button1: ActionSheet.Button = .default(Text("defffault"))
//        let button2 : ActionSheet.Button = .destructive(Text("Destroy"))
//        let button3 : ActionSheet.Button = .cancel()
//
//        return ActionSheet(
//            title: Text("This is the title"),
//            message: Text("This is the massage"),
//            buttons: [button1, button2, button3])
    }
}

struct ActionSheet__Previews: PreviewProvider {
    static var previews: some View {
        ActionSheet_()
    }
}
