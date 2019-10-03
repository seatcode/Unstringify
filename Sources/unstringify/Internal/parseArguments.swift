import Foundation
import UnstringifyFramework

typealias Arguments = (localizablePath: String, outputPath: String)

func parseArguments(from arguments: [String] = CommandLine.arguments) throws -> Arguments {
    func printUsage() {
        print("\nUsage: \(arguments[0]) inputPath outputPath\n")
    }

    if arguments.count < 3 {
        printUsage()
        throw ParseArgumentsError.tooFewArguments
    } else if arguments.count > 3 {
        printUsage()
        throw ParseArgumentsError.tooManyArguments
    }
    return (arguments[1], arguments[2])
}
