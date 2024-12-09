//
//  AppliedJobsView.swift
//  joblist
//
//  Created by Pelangi Masita Wati on 09/12/24.
//

import SwiftUI

struct AppliedJobsView: View {
    let jobs: [WelcomeElement]

    var body: some View {
        List(jobs) { job in
            Text(job.positionName)
        }
    }
}
