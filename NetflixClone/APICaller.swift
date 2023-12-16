//
//  APICaller.swift
//  NetflixClone
//
//  Created by Yiğithan Sönmez on 1.12.2023.
//

import Foundation

enum APIError: Error{
    case failedToGetData
}

class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        let headers = [
          "accept": "application/json",
          "Authorization": APIKeys.Tmdb
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/trending/movie/day?language=en-US")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else{
                return
            }
            
            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
                
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        })

        dataTask.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Movie], Error>) -> Void){
        let headers = [
          "accept": "application/json",
          "Authorization": APIKeys.Tmdb
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/trending/tv/day?language=en-US")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        })

        dataTask.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        let headers = [
          "accept": "application/json",
          "Authorization": APIKeys.Tmdb
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        })

        dataTask.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        let headers = [
          "accept": "application/json",
          "Authorization": APIKeys.Tmdb
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        })

        dataTask.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        let headers = [
          "accept": "application/json",
          "Authorization": APIKeys.Tmdb
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        })

        dataTask.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        let headers = [
          "accept": "application/json",
          "Authorization": APIKeys.Tmdb
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else{
                return
            }
            
            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
                
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        })

        dataTask.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        let headers = [
          "accept": "application/json",
          "Authorization": APIKeys.Tmdb
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/search/movie?query=\(query)&include_adult=false&language=en-US&page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else{
                return
            }
            
            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
                
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        })

        dataTask.resume()
    }
}
