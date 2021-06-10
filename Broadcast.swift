import Foundation

class Broadcast: NSObject, NetServiceDelegate, ObservableObject {
    let service = NetService(domain: "local.", type: "_ahoy._tcp.", name: "Ahoy", port: Int32(55443))
    
    @Published var log = ""
    
    override init() {
        super.init()
        service.delegate = self
    }
    
    func start() {
        service.publish()
    }
    
    func stop() {
        service.stop()
    }
    
    func netServiceWillPublish(_ sender: NetService) {
        let message = "netServiceWillPublish: was called"
        print(message)
        log += message + ";\n"
    }
    
    func netServiceDidPublish(_ sender: NetService) {
        let message = "netServiceDidPublish: was called"
        print(message)
        log += message + ";\n"
    }
    
    func netServiceDidStop(_ sender: NetService) {
        let message = "netServiceDidStop: was called"
        print(message)
        log += message + ";\n"
    }
    
    func netService(_ sender: NetService, didNotPublish errorDict: [String : NSNumber]) {
        let message = "netService:didNotPublish: was called; errorDict: \(errorDict)"
        print(message)
        log += message + ";\n"
    }
}
