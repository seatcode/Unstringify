import Foundation
import UnstringifyFramework

typealias Arguments = (localizablePath: String, outputPath: String, templatePath: String?)

func parseArguments(from arguments: [String] = CommandLine.arguments) throws -> Arguments {
    func printUsage() {
        print("\nUsage: \(arguments[0]) inputPath outputPath [templatePath]\n")
    }
    
    switch arguments.count {
    case 0,1,2:
        printUsage()
        throw ParseArgumentsError.tooFewArguments
    case 3:
        return (arguments[1], arguments[2], nil)
    case 4:
        return (arguments[1], arguments[2], arguments[3])
    default:
        printUsage()
        throw ParseArgumentsError.tooManyArguments
    }
}
