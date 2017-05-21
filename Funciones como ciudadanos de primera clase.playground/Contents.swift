import Foundation

// (String) -> [String: AnyObject]
func parseAsJSON(_ response: String) -> [String: AnyObject] {
	let data = response.data(using: .utf8)!

	return try! JSONSerialization.jsonObject(with: data) as! [String: AnyObject]
}

func parseAsXML(_ response: String) -> [String: AnyObject] {
	return [:]
}

func parseAsHTML(_ response: String) -> [String: AnyObject] {
	return [:]
}

parseAsJSON("{\"data\": 42}")

func data(from url: URL) -> [String: AnyObject] {
	let data = NSData(contentsOf: url)! as Data
	let content = String(data: data, encoding: .utf8)
}