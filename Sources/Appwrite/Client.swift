//
// Client.swift
//
// Created by Armino <devel@boioiong.com>
// GitHub: https://github.com/armino-dev/sdk-generator
//

import Foundation

open class Client {

    // MARK: Properties

    open var selfSigned = false

    open var endpoint = "https://appwrite.io/v1"

    open var headers: [String: String] = [
      "content-type": "",
      "x-sdk-version": "appwrite:swift:0.6.2"
    ]

    open var useCookies: Bool = false
    
    open var cookies: [HTTPCookie] = []
    
    // MARK: Methods

    // default constructor
    public init(useCookies: Bool = true) {
        self.useCookies = useCookies
    }

        ///
    /// Set Project
    ///
        /// Your Appwrite project ID
    ///
        /// @param String value
    ///
    /// @return Client
    ///
    open func setProject(value: String) -> Client {

        _ = self.addHeader(key: "X-Appwrite-Project", value: value)
        return self
    }

        ///
    /// Set Key
    ///
        /// Your Appwrite project secret key
    ///
        /// @param String value
    ///
    /// @return Client
    ///
    open func setKey(value: String) -> Client {

        _ = self.addHeader(key: "X-Appwrite-Key", value: value)
        return self
    }

        ///
    /// Set Locale
    ///
        /// @param String value
    ///
    /// @return Client
    ///
    open func setLocale(value: String) -> Client {

        _ = self.addHeader(key: "X-Appwrite-Locale", value: value)
        return self
    }

        ///
    /// Set Mode
    ///
        /// @param String value
    ///
    /// @return Client
    ///
    open func setMode(value: String) -> Client {

        _ = self.addHeader(key: "X-Appwrite-Mode", value: value)
        return self
    }

    
    ///
    /// @param Bool status
    /// @return Client
    ///
    open func setSelfSigned(status: Bool = true) -> Client {

        _ = self.selfSigned = status
        return self
    }

    ///
    /// @param String endpoint
    /// @return Client
    ///
    open func setEndpoint(endpoint: String) -> Client {

        _ = self.endpoint = endpoint
        return self
    }

    ///
    /// @param String key
    /// @param String value
    ///
    open func addHeader(key: String, value: String) -> Client {

        _ = self.headers[key.lowercased()] = value.lowercased()

        return self
    }

    ///
    open func httpBuildQuery(params: [String: Any], prefix: String = "") -> String {
        var output: String = ""
        for (key, value) in params {
            let finalKey: String = prefix.isEmpty ? key : (prefix + "[" + key + "]")
            if (value is AnyCollection<Any>) {
                output += self.httpBuildQuery(params: value as! [String : Any], prefix: finalKey)
            } else {
                output += "\(value)"
            }
            output += "&"
        }
        return output
    }
    
    func getCookies() -> [HTTPCookie] {
        let storage = HTTPCookieStorage.shared
        return storage.cookies(for: URL(string: self.endpoint)!) ?? []
    }
    
    func setCookies(cookies: [HTTPCookie]) {
        let storage = HTTPCookieStorage.shared
        storage.setCookies(cookies, for: URL(string: self.endpoint), mainDocumentURL: nil)
    }
    
    func deleteCookies() {
        let storage = HTTPCookieStorage.shared
        for cookie in getCookies() {
            storage.deleteCookie(cookie)
        }
    }
    
    

    ///
    /// Make an API call
    ///
    /// @param String method
    /// @param String path
    /// @param Array params
    /// @param Array headers
    /// @return Array|String
    /// @throws Exception
    ///
    func call(method:String, path:String = "", headers:[String: String] = [:], params:[String: Any] = [:]) -> Any {
        
        print(self.useCookies ? "Performing API call using cookies" : "No cookies used")
        
        print("Method: ", method)
        print("Path: ", path)
        print("Headers: ", headers)
        print("Params: ", params)
        
        
        self.headers.merge(headers){(_, new) in new}
        
        print("All headers: ", self.headers)
        
        let targetURL:URL = URL(string: self.endpoint + path + (( method == HTTPMethod.get.rawValue && !params.isEmpty ) ? "?" + httpBuildQuery(params: params) : ""))!

        var query: String = ""

        var responseStatus: Int = HTTPStatus.unknown.rawValue
        var responseType: String = ""
        var responseBody: Any = ""

        switch (self.headers["content-type"]) {
            case "application/json":
              do {
                let json = try JSONSerialization.data(withJSONObject:params, options: [])
                query = String( data: json, encoding: String.Encoding.utf8)!
              } catch {
                print("Failed to parse json: \(error.localizedDescription)")
              }
              break
            default:
              query = self.httpBuildQuery(params: params)
              break
        }

        var request = URLRequest(url: targetURL)
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.httpCookieAcceptPolicy = .always
        sessionConfig.httpCookieStorage = .shared
        
        //let session = URLSession.shared
        let session = URLSession(configuration: sessionConfig)
        
        for (key, value) in self.headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        request.httpMethod = method
        request.setValue("appwrite://sdk.generator.app", forHTTPHeaderField: "Referer")
        
        if (method.uppercased() == "POST") {
            request.httpBody = query.data(using: .utf8)
        }
        
        if (self.useCookies) {
            request.httpShouldHandleCookies = true
            request.setValue("Login: remember", forHTTPHeaderField: "Cookie")
        }
        
        let semaphore = DispatchSemaphore(value: 0)

        self.cookies = self.getCookies()
        print("Cookies before request: ", self.cookies)
        
        session.dataTask(with: request) { data, response, error in
            if (error != nil) {
                print(error!)
                return
            }
            do {
                let httpResponse = response as! HTTPURLResponse
                responseStatus = httpResponse.statusCode

                if (responseStatus == HTTPStatus.internalServerError.rawValue) {
                    print(responseStatus)
                    return
                }

                responseType = httpResponse.mimeType ?? ""
                
                //print("All HTTP Headers: ", httpResponse.allHeaderFields)
                
                if (self.useCookies && (httpResponse.allHeaderFields["Set-Cookie"] != nil)) {
                    self.setCookies(cookies: HTTPCookie.cookies(withResponseHeaderFields: httpResponse.allHeaderFields["Set-Cookie"] as! [String : String], for: URL(string: self.endpoint)!))
                }

                if (responseType == "application/json") {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    responseBody = json
              } else {
                    responseBody = String(data: data!, encoding: String.Encoding.utf8)!
              }
            } catch {
                print(error)
            }

            semaphore.signal()
        }.resume()

        _ = semaphore.wait(wallTimeout: .distantFuture)
        
        self.cookies = getCookies()
        print("Cookies after set: ", cookies)
        
        return responseBody
    }

}

extension Client {

    public enum HTTPStatus: Int {
      case unknown = -1

      case ok = 200
      case created = 201
      case accepted = 202

      case movedPermanently = 301
      case found = 302

      case badRequest = 400
      case notAuthorized = 401
      case paymentRequired = 402
      case forbidden = 403
      case notFound = 404
      case methodNotAllowed = 405
      case notAcceptable = 406

      case internalServerError = 500
      case notImplemented = 501
    }

    public enum HTTPMethod: String {
      case get

      case post
      case put
      case patch

      case delete

      case head
      case options
      case connect
      case trace
    }

    public enum CustomError: Error {
        case generalError(String)
    }

}
