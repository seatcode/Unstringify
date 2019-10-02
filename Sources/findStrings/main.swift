import Foundation
import UnstringifyFramework

let arguments = try parseArguments()
let stringsFile = try readFile(at: arguments.localizablePath)
print("Finding localizable keys...")
let keys = try parseKeys(stringsFile)
print("Gathering swift files...")
let files = try findFilesRecursively(rootPath: arguments.rootPath, extensions: ["swift"])
print("Generating report...")
try generateReport(files: files, keys: keys, outputPath: arguments.outputPath, excludedFile: arguments.excludedFile)

print("Done!")
