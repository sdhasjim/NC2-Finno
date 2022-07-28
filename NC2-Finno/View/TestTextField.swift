//
//  TestTextField.swift
//  NC2-Finno
//
//  Created by Samuel Dennis on 28/07/22.
//

import SwiftUI

struct TestTextField: View {
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            TextField(
                "Username",
                text: $username,
                onEditingChanged: { (isBegin) in
                    if isBegin {
                        print("Begins editing")
                    } else {
                        print("Finishes editing")
                    }
                },
                onCommit: {
                    print("commit")
                }
            )
        }
    }
}

struct TestTextField_Previews: PreviewProvider {
    static var previews: some View {
        TestTextField()
    }
}
