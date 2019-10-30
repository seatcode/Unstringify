import Foundation

let arguments = try parseArguments()

print("Generating enums...")

let keys = try generateKeys(localizablePath: arguments.localizablePath)

try writeSwiftFile(keys.standard,
                   keys.formatted,
                   keys.rich,
                   keys.richFormatted,
                   outputPath: arguments.outputPath,
                   templatePath: arguments.templatePath)

print("Done!")
