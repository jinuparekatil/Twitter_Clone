//
//  Search Cell.swift
//  Twitter_Clone
//
//  Created by Jinu on 14/06/2024.
//

import SwiftUI

struct Search_Cell: View {
    var tags = ""
    var tweets = ""
    var body: some View {
        VStack(alignment: .leading,spacing: 5, content: {
            Text("Hello")
                .fontWeight(.heavy)
            Text(tweets + "Tweets")
                .fontWeight(.light )
        })
    }
}

#Preview {
    Search_Cell()
}
