import Foundation
import UnstringifyFramework

func generateKeys(localizablePath: String) throws -> Keys {
    let content = try readFile(at: localizablePath)
    return try parseKeys(content)
}
