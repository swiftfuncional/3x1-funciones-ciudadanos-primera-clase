import Foundation

func parse(_ response: String) -> [String: AnyObject] {
	let data = response.data(using: .utf8)!

	return try! JSONSerialization.jsonObject(with: data) as! [String: AnyObject]
}