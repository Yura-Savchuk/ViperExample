//
//  LoginService.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 30.12.2021.
//

import Foundation

enum LoginServiceError: LocalizedError {
    case fileAccessError
    case invalidJSONFormat
    case userNotFound
    case incorrectPassword
    
    var errorDescription: String? {
        get {
            NSLocalizedString(errorReason(), comment: "")
        }
    }
    
    private func errorReason() -> String {
        switch self {
        case .fileAccessError: return "Не удалось получить доступ к файлу."
        case .invalidJSONFormat: return "Не удалось считать JSON файл."
        case .userNotFound: return "Пользователь не найден."
        case .incorrectPassword: return "Не верный пароль."
        }
    }
}

class LoginService {
    
    private let queue = DispatchQueue.global(qos: .userInitiated)
    
    func login(_ userName: String, _ password: String, _ completion: @escaping ((Result<Any?, Error>) -> Void)) {
        let initialQueue = OperationQueue.current?.underlyingQueue
        queue.async { [weak self] in
            sleep(5)
            guard let strongSelf = self else { return }
            let result = strongSelf.login(userName, password)
            initialQueue?.async {
                completion(result)
            }
        }
        
    }
    
    private func login(_ userName: String, _ password: String) -> Result<Any?, Error> {
        guard let data = fetchUsersDataFromFile() else {
            return .failure(LoginServiceError.fileAccessError)
        }
        
        do {
            let users = try JSONDecoder().decode(Array<APIUser>.self, from: data)
            guard let user = users.first(where: {$0.userName == userName}) else {
                return .failure(LoginServiceError.userNotFound)
            }
            if user.passwordHash == password.sha1() {
                UserDefaults.userToken = user.token
                return .success(nil)
            }
            return .failure(LoginServiceError.incorrectPassword)
        }
        catch {
            return .failure(LoginServiceError.invalidJSONFormat)
        }
    }
    
    private func fetchUsersDataFromFile() -> Data? {
        if let url = Bundle.main.url(forResource: "Users", withExtension: "json") {
            return FileManager.default.contents(atPath: url.path)
        }
        return nil
    }
    
    func isUserLoggedIn() -> Bool {
        return UserDefaults.userToken != nil
    }
    
    func logout() {
        UserDefaults.userToken = nil
    }
    
}
