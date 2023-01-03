import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    
    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String, platform: Platform) -> Project {
        let targets = makeAppTargets(
            name: name,
            platform: platform,
            dependencies: [.package(product: "MyAppKit")]
        )
        return Project(
            name: name,
            packages: [.local(path: "MyAppKit")],
            targets: targets,
            additionalFiles: [.glob(pattern: Path("Configuration/*.xcconfig"))]
        )
    }
    
    // MARK: - Private
    
    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, platform: Platform, dependencies: [TargetDependency]) -> [Target] {
        let targetSettings = Settings.settings(
            base: [
                "MARKETING_VERSION": "$(PRODUCT_BUNDLE_VERSION)",
                "CURRENT_PROJECT_VERSION": "$(PRODUCT_BUNDLE_BUILD)",
                "PRODUCT_BUNDLE_IDENTIFIER": "$(PRODUCT_BUNDLE_IDENTIFIER)",
                "INFOPLIST_KEY_UILaunchScreen_Generation": "YES",
                "SUPPORTED_PLATFORMS": "iphoneos iphonesimulator macosx",
                "SUPPORTS_MAC_DESIGNED_FOR_IPHONE_IPAD": "NO"
            ],
            configurations: [
                .debug(name: "Debug", xcconfig: Path("Configuration/Debug.xcconfig")),
                .release(name: "Release", xcconfig: Path("Configuration/Release.xcconfig"))
            ]
        )
        let infoPlist = InfoPlist.extendingDefault(with: [
            "CFBundleShortVersionString": "$(PRODUCT_BUNDLE_VERSION)",
            "CFBundleVersion": "$(PRODUCT_BUNDLE_BUILD)",
            "CFBundleIdentifier": "$(PRODUCT_BUNDLE_IDENTIFIER)",
            "UIApplicationSceneManifest": ["UIApplicationSupportsMultipleScenes": "YES"],
            "UILaunchScreen": ["UILaunchScreen": [:]]
        ])
        
        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "com.mydomain.\(name)",
            infoPlist: infoPlist,
            sources: ["\(name)/Sources/**"],
            resources: [
                .glob(
                    pattern: Path("\(name)/Resources/**"),
                    excluding: [Path("\(name)/Resources/\(name).entitlements")]
                )
            ],
            entitlements: Path("\(name)/Resources/\(name).entitlements"),
            dependencies: dependencies,
            settings: targetSettings
        )
        
        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "com.mydomain.\(name)Tests",
            infoPlist: infoPlist,
            sources: ["\(name)/Tests/**"],
            entitlements: Path("\(name)/Resources/\(name).entitlements"),
            dependencies: [.target(name: "\(name)")],
            settings: targetSettings
        )
        return [mainTarget, testTarget]
    }
    
}
