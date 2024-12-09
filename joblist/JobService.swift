//
//  JobService.swift
//  joblist
//
//  Created by Pelangi Masita Wati on 09/12/24.
//

import Foundation

class JobService: ObservableObject {
    @Published var jobs: [WelcomeElement] = []
    let url = URL(string: "https://test-server-klob.onrender.com/fakeJob/apple/academy")!
    
    func fetchJobs() {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedJobs = try JSONDecoder().decode(Welcome.self, from: data)
                    DispatchQueue.main.async {
                        self.jobs = decodedJobs
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
}
