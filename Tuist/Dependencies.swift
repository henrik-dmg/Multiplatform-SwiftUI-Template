import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .local(path: "./MyAppKit")
    ],
    platforms: [.iOS, .macOS]
)
