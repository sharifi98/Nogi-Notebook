//
//  SubmissionListView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import SwiftUI

struct SubmissionListView: View {
    
    var submissions: SubmissionList? = loadSubmissions()
    
    var body: some View {
        NavigationView {
            List(submissions?.nogi_submissions ?? []) { submission in
                NavigationLink(destination: SubmissionDetailView(submission: submission)) {
                    VStack(alignment: .leading) {
                        Text(submission.name).font(.headline)
                        //Text(submission.description).font(.subheadline)
                    }
                }
            }
            .navigationTitle("No-Gi Submissions")
            .listStyle(.grouped)
        }
    }
}

#Preview {
    SubmissionListView()
}
