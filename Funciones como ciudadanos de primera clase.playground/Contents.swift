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

func data(from url: URL, type: Int) -> [String: AnyObject] {
	let data = NSData(contentsOf: url)! as Data
	let content = String(data: data, encoding: .utf8)!

	switch type {
	case 1:
		return parseAsJSON(content)
	case 2:
		return parseAsXML(content)
	case 3:
		return parseAsHTML(content)
	default:
		return [:]
	}
}

let url = URL(string: "http://swiftfuncional.com/exercises/posts/1")!

data(from: url, type: 1)