# LaunchLibraryAPI

Swift package for consuming the Launch Library API (http://launchlibrary.net/docs/1.4.1/api.html)

### What is Launch Library?
Launch Library is a free-of-charge REST API for accessing information regarding past and future rocket launches.  The service is maintained by a team of volunteers who use first-party sources to validate information.

http://launchlibrary.net

### Usage

```
import LaunchLibraryAPI

// ...

let params: [APIParameter: String] = [.mode: "verbose", .next: "30"]

APIService.shared.GET(endpoint: .launch, params: params) { [weak self] (result: Result<PaginatedResponse<Launch>, APIError>) in
    guard let strongSelf = self else { return }

    switch result {
    case .success(let response):
        let launches = strongSelf.response?.results
    case .failure(_):
        break
    }
}
```

### Installation with Swift Package Manager
The Swift Package Manager is nicely integrated into Xcode 11. 
