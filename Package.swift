// swift-tools-version: 5.6
import PackageDescription

let package = Package(
  name: "PXSwiftGenPlugin",
  products: [
    .plugin(name: "PXSwiftGenPlugin", targets: ["PXSwiftGenPlugin"]),
    .plugin(name: "PXSwiftGen-Generate", targets: ["PXSwiftGen-Generate"])
  ],
  dependencies: [],
  targets: [
    .plugin(
      name: "PXSwiftGenPlugin",
      capability: .buildTool(),
      dependencies: ["pxswiftgen"]
    ),
    .plugin(
      name: "PXSwiftGen-Generate",
      capability: .command(
        intent: .custom(
          verb: "generate-code-for-resources",
          description: "Creates type-safe for all your resources"
        ),
        permissions: [
          .writeToPackageDirectory(reason: "This command generates source code")
        ]
      ),
      dependencies: ["pxswiftgen"]
    ),
    .binaryTarget(
      name: "pxswiftgen",
      url: "https://github.com/pixohq/PXSwiftGen/releases/download/1.0.2/pxswiftgen-1.0.2.artifactbundle.zip",
      checksum: "75fcfd0a7709a92b2e57fe9140ca66f6ce7a56ce3cda03e1dbe9728944a513c9"
    )
  ]
)
