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

func data(from url: URL, parser: (String) -> [String: AnyObject]) -> [String: AnyObject] {
	let data = NSData(contentsOf: url)! as Data
	let content = String(data: data, encoding: .utf8)!

	return parser(content)
}

let url = URL(string: "http://swiftfuncional.com/exercises/posts/1")!

let parser = parseAsJSON

data(from: url, parser: parser)
