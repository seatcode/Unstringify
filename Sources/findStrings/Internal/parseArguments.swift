import Foundation

typealias Arguments = (rootPath: String, localizablePath: String, outputPath: String, excludedFile: String)

func parseArguments(from arguments: [String] = CommandLine.arguments) throws -> Arguments {
    enum Error: Swift.Error {
        case tooFewArguments
        case tooManyArguments
    }

    func printUsage() {
        print("\nUsage: \(arguments[0]) root_path localizable_path output_path [excluded_file]\n")
    }

    if arguments.count < 4 {
        printUsage()
        throw Error.tooFewArguments
    } else if arguments.count > 5 {
        printUsage()
        throw Error.tooManyArguments
    }

    if arguments.count == 5 {
        return (arguments[1], arguments[2], arguments[3], arguments[4])
    } else {
        return (arguments[1], arguments[2], arguments[3], "Unstringify.generated.swift")
    }
}

