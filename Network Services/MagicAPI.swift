//
//  MagicAPI.swift
//  CollectionViewTeamJoseGen
//
//  Created by Jose Alarcon Chacon on 1/10/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation
final class MagicAPI {
    
static func updateMagic(completionHandler: @escaping (AppError?, [Card]?) -> Void) {
    NetworkHelper.shared.performDataTask(endpointURLString: "https://api.magicthegathering.io/v1/cards?contains=imageUrl") { (appError, data, httpResponse) in
        if let appError = appError {
            completionHandler(AppError.badURL(appError.errorMessage()),nil)
        } else if let data = data {
            do {
            let magic = try JSONDecoder().decode(MagicModel.self, from: data)
                completionHandler(nil, magic.cards)
            } catch {
                completionHandler(AppError.decodingError(error),nil)
            }
        }
}
    }
    static func upDateLanguage(completionHandler: @escaping(AppError?, ForeignWrapper?) -> Void) {
    NetworkHelper.shared.performDataTask(endpointURLString: "https://api.magicthegathering.io/v1/cards?contains=imageUrl") { (appError, data, httpResponse) in
        if let appError = appError {
            print(errno)
        } else if let data = data {
            do {
                let data = try JSONDecoder().decode(ForeignWrapper.self, from: data)
                completionHandler(nil,data)
            } catch {
                completionHandler(AppError.decodingError(error), nil)
            }
        }
    }
}

}
