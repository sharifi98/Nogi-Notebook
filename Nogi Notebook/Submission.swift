//
//  File.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import Foundation


struct Submission: Identifiable, Decodable {
    var id: UUID = UUID()  // This will generate a UUID whenever a new instance is created.
    let name: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name, description
    }
    
    // Custom Decoder Initializer
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
    }
    
    // Manual Initializer
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}


struct SubmissionList: Decodable {
    let nogi_submissions: [Submission]
}


func loadSubmissions() -> SubmissionList? {
    guard let url = Bundle.main.url(forResource: "submissions", withExtension: "json") else {
        print("Invalid file path.")
        return nil
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(SubmissionList.self, from: data)
        return jsonData
    } catch {
        print("Error decoding data: \(error)")
        return nil
    }
}
