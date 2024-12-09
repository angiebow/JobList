//
//  JobModel.swift
//  joblist
//
//  Created by Pelangi Masita Wati on 09/12/24.
//

// MARK: - WelcomeElement
import Foundation

struct WelcomeElement: Codable, Identifiable {
    var id: String { jobVacancyCode }
    
    let jobVacancyCode, positionName, corporateID, corporateName: String
    let status: Status
    let descriptions: String
    let corporateLogo: String
    let applied: JSONNull?
    let salaryFrom, salaryTo: Int
    let postedDate: String?

    enum CodingKeys: String, CodingKey {
        case jobVacancyCode, positionName
        case corporateID = "corporateId"
        case corporateName, status, descriptions, corporateLogo, applied, salaryFrom, salaryTo, postedDate
    }
}


enum Status: String, Codable {
    case karyawanKontrak = "Karyawan Kontrak"
    case karyawanTetap = "Karyawan Tetap"
    case magang = "Magang"
}

typealias Welcome = [WelcomeElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(
                JSONNull.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Wrong type for JSONNull"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
