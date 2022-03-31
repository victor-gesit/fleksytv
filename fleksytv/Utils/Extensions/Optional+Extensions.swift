//
//  Optional+Extensions.swift
//  fleksytv
//
//  Created by Victor Idongesit on 31/03/2022.
//

import Foundation

extension Optional where Wrapped: StringProtocol {
    var safelyUnwrapped: Wrapped { return self ?? "" }
}
