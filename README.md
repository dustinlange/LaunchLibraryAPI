# LaunchLibraryAPI

[![Build Status](https://app.bitrise.io/app/364818605c2b5b91/status.svg?token=fANlrqLBpVtTFRwLH99lTg&branch=develop)](https://app.bitrise.io/app/364818605c2b5b91)
[![codecov](https://codecov.io/gh/dustinlange/LaunchLibraryAPI/branch/develop/graph/badge.svg)](https://codecov.io/gh/dustinlange/LaunchLibraryAPI)
[![Swift Package Manager Compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager)
![](https://img.shields.io/badge/swift-5-223344.svg?logo=swift&labelColor=FA7343&logoColor=white)

Swift package for consuming the Launch Library API (http://launchlibrary.net/docs/1.4.1/api.html)

## What is Launch Library?
Launch Library is a free-of-charge REST API for accessing information regarding past and future rocket launches.  The service is maintained by a team of volunteers who use first-party sources to validate information.

http://launchlibrary.net

## Installation
### Swift Package Manager
Add this as a dependency to your `Packages.swift`:
```swift
import PackageDescription

let package = Package(
    name: "MyPackage",
        dependencies: [
        // Other dependencies
        .Package(url: "https://github.com/dustinlange/LaunchLibraryAPI.git", majorVersion: 1)
    ]
)
```
## Usage

```swift
import LaunchLibraryAPI

// ...

let params: [APIParameter: String] = [.mode: "verbose", .next: "30"]
let request = PaginatedRequest<Launch>(.launch, params)

request.fetch() { [weak self] result in
    guard let strongSelf = self else { return }
    
    switch result {
    case .success(let response):
        let launches = strongSelf.response?.results
        print(launches)
    case .failure(_):
        break
    }
}
```
