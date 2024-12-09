//
//  JobDetailView.swift
//  joblist
//
//  Created by Pelangi Masita Wati on 09/12/24.
//

import SwiftUI

struct JobDetailView: View {
    let job: WelcomeElement
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: job.corporateLogo))
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
                
                Text(job.positionName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Company: \(job.corporateName)")
                    .font(.headline)
                
                Text("Status: \(job.status.rawValue)")
                
                Text(job.salaryFrom > 0 ? "Salary: Rp\(job.salaryFrom) - Rp\(job.salaryTo)" : "Salary: Negotiable")
                    .font(.subheadline)
                
                Text("Description")
                    .font(.title2)
                    .padding(.top)
                
                Text(job.descriptions)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: {
                    print("Applied to \(job.positionName)")
                }) {
                    Text("Apply Now")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle(job.positionName)
    }
}
