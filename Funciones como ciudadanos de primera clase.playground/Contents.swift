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

protocol Parser {
	func parse(_ response: String) -> [String: AnyObject]
}

class JSONParser: Parser {
	func parse(_ response: String) -> [String: AnyObject] {
		return parseAsJSON(response)
	}
}

class XMLParser: Parser {
	func parse(_ response: String) -> [String: AnyObject] {
		return parseAsXML(response)
	}
}

class HTMLParser: Parser {
	func parse(_ response: String) -> [String: AnyObject] {
		return parseAsHTML(response)
	}
}

func data(from url: URL, parser: Parser) -> [String: AnyObject] {
	let data = NSData(contentsOf: url)! as Data
	let content = String(data: data, encoding: .utf8)!

	return parser.parse(content)
}

let url = URL(string: "http://swiftfuncional.com/exercises/posts/1")!

data(from: url, parser: JSONParser())