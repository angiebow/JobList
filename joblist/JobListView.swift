//
//  JobListView.swift
//  joblist
//
//  Created by Pelangi Masita Wati on 09/12/24.
//

import SwiftUI

struct JobListView: View {
    @StateObject private var jobService = JobService()
    
    var body: some View {
        NavigationView {
            List(jobService.jobs) { job in
                NavigationLink(destination: JobDetailView(job: job)) {
                    HStack {
                        AsyncImage(url: URL(string: job.corporateLogo))
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(job.positionName)
                                .font(.headline)
                            Text(job.corporateName)
                                .font(.subheadline)
                            Text("Status: \(job.status.rawValue)")
                                .font(.caption)
                            Text(job.salaryFrom > 0 ? "Rp\(job.salaryFrom) - Rp\(job.salaryTo)" : "Negotiable")
                                .font(.caption)
                        }
                    }
                }
            }
            .onAppear {
                jobService.fetchJobs()
            }
            .navigationTitle("Job Vacancies")
        }
    }
}
