//
//  SubmissionDetailView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import SwiftUI

struct SubmissionDetailView: View {
    let submission: Submission
    var body: some View {
        VStack {
            VStack(alignment: .center){
                Text(submission.name)
                Text(submission.description)
            }
        }
    }
}


#Preview {
    SubmissionDetailView(submission: Submission(name: "Rear-naked choke", description: "One of the most effective submissions used in no-gi BJJ."))
}


