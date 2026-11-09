// swift-tools-version:5.6

// Copyright 2026 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "BigoAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "BigoAdapterTarget",
      targets: ["BigoAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/bigo-ads/BigoADS-Swift-Package.git",
      exact: "6.2.0"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.3.0"
    ),
  ],
  targets: [
    .target(
      name: "BigoAdapterTarget",
      dependencies: [
        .target(name: "BigoAdapter"),
        .product(name: "BigoADS", package: "BigoADS-Swift-Package"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "BigoAdapterTarget",
      linkerSettings: [
        .linkedLibrary("c++")
      ]
    ),
    .binaryTarget(
      name: "BigoAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/bigo/BigoAdapter-6.2.0.0.zip",
      checksum: "5fca24aa0e3b06629cb3737ad78ccbed7773e55711551188a14927cde9f0d135"
    ),
  ]
)
