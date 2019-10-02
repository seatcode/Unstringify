import Foundation

typealias Arguments = (localizablePath: String, outputPath: String)

func parseArguments(from arguments: [String] = CommandLine.arguments) throws -> Arguments {
    enum Error: Swift.Error {
        case tooFewArguments
        case tooManyArguments
    }

    func printUsage() {
        print("\nUsage: \(arguments[0]) inputPath outputPath\n")
    }

    if arguments.count < 3 {
        printUsage()
        throw Error.tooFewArguments
    } else if arguments.count > 3 {
        printUsage()
        throw Error.tooManyArguments
    }
    return (arguments[1], arguments[2])
}
