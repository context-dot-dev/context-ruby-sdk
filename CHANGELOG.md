# Changelog

## [2.19.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.18.0...v2.19.0) (2026-09-22)


### Features

* **billing:** charge for 404s and skip fraud accounting ([#1152](https://github.com/context-dot-dev/context-ruby-sdk/issues/1152)) ([d1fa73e](https://github.com/context-dot-dev/context-ruby-sdk/commit/d1fa73e0809ce7acb5668f413f40b902e539fe72))
* **scrape:** add cache age support to byte downloads ([#1171](https://github.com/context-dot-dev/context-ruby-sdk/issues/1171)) ([9b2704f](https://github.com/context-dot-dev/context-ruby-sdk/commit/9b2704f21f51249319a1536a535b881769da0864))
* **scrape:** add unified scrape API ([#1182](https://github.com/context-dot-dev/context-ruby-sdk/issues/1182)) ([f96de1a](https://github.com/context-dot-dev/context-ruby-sdk/commit/f96de1aceca6305f47851701708cba674ed5c30b))
* **scrape:** align timeout options and public SDK methods ([#1207](https://github.com/context-dot-dev/context-ruby-sdk/issues/1207)) ([f1f8442](https://github.com/context-dot-dev/context-ruby-sdk/commit/f1f84420192e0b686f973187d2efdadd4a1509cd))
* **scrape:** support country for image scraping ([#1172](https://github.com/context-dot-dev/context-ruby-sdk/issues/1172)) ([9b2704f](https://github.com/context-dot-dev/context-ruby-sdk/commit/9b2704f21f51249319a1536a535b881769da0864))
* **scrape:** support custom screenshot headers ([#1169](https://github.com/context-dot-dev/context-ruby-sdk/issues/1169)) ([ea364f2](https://github.com/context-dot-dev/context-ruby-sdk/commit/ea364f242b9120982ee69006305a1929464d4dfe))
* **scrape:** support waitForMs for byte downloads ([#1170](https://github.com/context-dot-dev/context-ruby-sdk/issues/1170)) ([267301b](https://github.com/context-dot-dev/context-ruby-sdk/commit/267301b3da971db51c63102242ed0dece4ba6630))


### Bug Fixes

* **scrape:** reuse legacy caches across all output formats ([#1197](https://github.com/context-dot-dev/context-ruby-sdk/issues/1197)) ([007ad3f](https://github.com/context-dot-dev/context-ruby-sdk/commit/007ad3f81ba753e74093d5ee05dfe8df2db06be9))

## [2.18.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.17.1...v2.18.0) (2026-09-18)


### Features

* **api:** enable ZDR on remaining AI endpoints via OpenAI ([#1099](https://github.com/context-dot-dev/context-ruby-sdk/issues/1099)) ([36e5487](https://github.com/context-dot-dev/context-ruby-sdk/commit/36e548724224b3198e49d248735916f3af6d1b61))
* **products:** extract ProductGroup variants with images ([#1124](https://github.com/context-dot-dev/context-ruby-sdk/issues/1124)) ([dd14116](https://github.com/context-dot-dev/context-ruby-sdk/commit/dd141167200666c0bbb658f9a83ffa8896411aae))
* **scrape:** add CSS extraction rules to HTML scraping ([#1146](https://github.com/context-dot-dev/context-ruby-sdk/issues/1146)) ([4ed406d](https://github.com/context-dot-dev/context-ruby-sdk/commit/4ed406dfa5bf0dd2ad8e6652fb85ef9ebe37ff07))
* **web:** add URL-based scrape screenshot endpoint ([#1150](https://github.com/context-dot-dev/context-ruby-sdk/issues/1150)) ([52c8043](https://github.com/context-dot-dev/context-ruby-sdk/commit/52c80435c9c767bdb6ff782c487ada1263d9f767))


### Bug Fixes

* **api:** lower partial scrape timeout minimum to five seconds ([#1118](https://github.com/context-dot-dev/context-ruby-sdk/issues/1118)) ([871982b](https://github.com/context-dot-dev/context-ruby-sdk/commit/871982bff814f9cb698fc59f1e07c2d87c5a6dad))

## [2.17.1](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.17.0...v2.17.1) (2026-09-15)


### Bug Fixes

* **api:** guarantee search descriptions and align response types ([#1089](https://github.com/context-dot-dev/context-ruby-sdk/issues/1089)) ([7ee03fc](https://github.com/context-dot-dev/context-ruby-sdk/commit/7ee03fc233d3e975f01fd3d290defb48a6e6ad56))

## [2.17.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.16.0...v2.17.0) (2026-09-15)


### Features

* **answers:** add live web research with fast and ultra modes ([#954](https://github.com/context-dot-dev/context-ruby-sdk/issues/954)) ([838e943](https://github.com/context-dot-dev/context-ruby-sdk/commit/838e943b1fe34aeaf6f804ff534c22f62b4900fe))
* **api-keys:** enforce scoped API key permissions ([#1038](https://github.com/context-dot-dev/context-ruby-sdk/issues/1038)) ([7f87431](https://github.com/context-dot-dev/context-ruby-sdk/commit/7f874312c42b5c12020d71251f8bfc6eaa8ab2aa))
* **api:** unify timeout configuration and return partial results ([#1030](https://github.com/context-dot-dev/context-ruby-sdk/issues/1030)) ([7c0fa1f](https://github.com/context-dot-dev/context-ruby-sdk/commit/7c0fa1f308fc51885405c065aef2fd4ab8fe5725))
* **monitors:** add page selector filters ([#1037](https://github.com/context-dot-dev/context-ruby-sdk/issues/1037)) ([1f3a748](https://github.com/context-dot-dev/context-ruby-sdk/commit/1f3a74858133f69ea52c3a189f9ed8c80b80c0c6))
* **web:** add raw bytes scraping endpoint ([#1081](https://github.com/context-dot-dev/context-ruby-sdk/issues/1081)) ([e4b2347](https://github.com/context-dot-dev/context-ruby-sdk/commit/e4b23477deab52f1822eb2e3e2bbbca6b9cf9c07))


### Bug Fixes

* **api:** honour maxAgeMs=0 on brand retrieve, styleguide and fonts endpoints ([#998](https://github.com/context-dot-dev/context-ruby-sdk/issues/998)) ([78491ef](https://github.com/context-dot-dev/context-ruby-sdk/commit/78491ef8e43ab49074d011ce8c10e3cda5cb27db))
* **webhooks:** format Slack webhook notifications ([#1045](https://github.com/context-dot-dev/context-ruby-sdk/issues/1045)) ([4bd0df1](https://github.com/context-dot-dev/context-ruby-sdk/commit/4bd0df1c614713a46e366ca1320942fa777452fc))

## [2.16.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.15.0...v2.16.0) (2026-09-11)


### Features

* **api:** return request_id on every response ([012ba65](https://github.com/context-dot-dev/context-ruby-sdk/commit/012ba65ea7648ebd7b18fa7ad00955a13b8394b9))
* **logs:** expose request log endpoints in SDKs ([#1025](https://github.com/context-dot-dev/context-ruby-sdk/issues/1025)) ([5b22be7](https://github.com/context-dot-dev/context-ruby-sdk/commit/5b22be7bd1cb6401b8260b5a756b6ec040cbc6a8))


### Bug Fixes

* **api:** reject timeoutMS too short for waitForMs ([e8a6725](https://github.com/context-dot-dev/context-ruby-sdk/commit/e8a67255c9354f69d632697179a4d6270a4677ee))

## [2.15.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.14.0...v2.15.0) (2026-09-08)


### Features

* **webhooks:** add configurable retries and manual replay ([00388ec](https://github.com/context-dot-dev/context-ruby-sdk/commit/00388ec76d375d7466c9b0d85dfe983d2a369807))
* **webhooks:** simplify delivery APIs ([fbd879e](https://github.com/context-dot-dev/context-ruby-sdk/commit/fbd879eaa0c0008cba1c3b19f1fe1accb53d8771))

## [2.14.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.13.0...v2.14.0) (2026-09-03)


### Features

* **sitemap:** add subdomain discovery ([5630b67](https://github.com/context-dot-dev/context-ruby-sdk/commit/5630b67ab555ab5dabd06b0ade2c4d2837f13423))


### Bug Fixes

* **openapi:** strip empty-object defaults from the generated spec ([fcbb393](https://github.com/context-dot-dev/context-ruby-sdk/commit/fcbb393067fd9058bb2d443bd2a8f2a9e4b8f17c))

## [2.13.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.12.0...v2.13.0) (2026-08-27)


### Features

* initial stlc build ([bf63ae0](https://github.com/context-dot-dev/context-ruby-sdk/commit/bf63ae0769d9756a0b36480fd0c2d05ae939997c))

## 2.12.0 (2026-08-23)

Full Changelog: [v2.11.0...v2.12.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.11.0...v2.12.0)

### Features

* **api:** api update ([f7adbd6](https://github.com/context-dot-dev/context-ruby-sdk/commit/f7adbd63407b697245019ea9483dc090de9ba0ff))
* **api:** api update ([c26b304](https://github.com/context-dot-dev/context-ruby-sdk/commit/c26b30411607dcc2eaad14962d582f4588f5193f))
* **api:** api update ([852a96e](https://github.com/context-dot-dev/context-ruby-sdk/commit/852a96e58dab7e6fef53af10093119ffc237f52e))
* **api:** api update ([c16beb5](https://github.com/context-dot-dev/context-ruby-sdk/commit/c16beb55d66977611c58711b489132f347ab2c96))

## 2.11.0 (2026-08-18)

Full Changelog: [v2.10.0...v2.11.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.10.0...v2.11.0)

### Features

* **api:** api update ([9bff49f](https://github.com/context-dot-dev/context-ruby-sdk/commit/9bff49f9a966fd40691f2cd7a41ba96ec7679243))
* **api:** api update ([5b19e0c](https://github.com/context-dot-dev/context-ruby-sdk/commit/5b19e0ce1f7ad615a92e28440bec6ab3703ffe02))
* **api:** api update ([f4ccf22](https://github.com/context-dot-dev/context-ruby-sdk/commit/f4ccf220f130672950d3231a6b9952c166168ef9))

## 2.10.0 (2026-08-17)

Full Changelog: [v2.9.0...v2.10.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.9.0...v2.10.0)

### Features

* **api:** api update ([6f90ebf](https://github.com/context-dot-dev/context-ruby-sdk/commit/6f90ebff6164a8daf2f6c4bf8d1492ade1ad2779))
* **api:** api update ([95cbdde](https://github.com/context-dot-dev/context-ruby-sdk/commit/95cbddeb3a3351a03c394709dfeaf3fb5c98be92))
* **api:** api update ([97520df](https://github.com/context-dot-dev/context-ruby-sdk/commit/97520df52a798122460e2f219d7b582d2f6830da))
* **api:** api update ([2b73772](https://github.com/context-dot-dev/context-ruby-sdk/commit/2b737722e962cf7a5aba20a2b596d379f7f2bce0))
* **api:** api update ([630b415](https://github.com/context-dot-dev/context-ruby-sdk/commit/630b4156f12004d2da154e26003271cd143ccbb8))
* **api:** manual updates ([54ad450](https://github.com/context-dot-dev/context-ruby-sdk/commit/54ad450f892542378cec0ce5430d1436e1437a4d))

## 2.9.0 (2026-08-07)

Full Changelog: [v2.8.0...v2.9.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.8.0...v2.9.0)

### Features

* **api:** api update ([ea29f67](https://github.com/context-dot-dev/context-ruby-sdk/commit/ea29f67042bd6fd9b987d7ad4ad9f8993a871653))
* **api:** api update ([e7c64e4](https://github.com/context-dot-dev/context-ruby-sdk/commit/e7c64e4540db4cc313d70cebe5409739b052e567))
* **api:** api update ([975de89](https://github.com/context-dot-dev/context-ruby-sdk/commit/975de893c9145f20f541a443730d7d99f575a313))
* **api:** api update ([a1f13c2](https://github.com/context-dot-dev/context-ruby-sdk/commit/a1f13c2244b0ac81a58c350e6cba79875e0c4bf1))
* **api:** api update ([e7cfd87](https://github.com/context-dot-dev/context-ruby-sdk/commit/e7cfd87ff2e163f572cc33ee4b6af5be79811d03))
* **api:** api update ([c827408](https://github.com/context-dot-dev/context-ruby-sdk/commit/c8274088947813e1090d6232190b5333c025696a))
* **api:** api update ([5c09f03](https://github.com/context-dot-dev/context-ruby-sdk/commit/5c09f03dd90cda2cad388ac2605d6cadebf0e137))
* **api:** manual updates ([cf2f79f](https://github.com/context-dot-dev/context-ruby-sdk/commit/cf2f79ff77dca3e57069cfac612e7fd333a8d83f))

## 2.8.0 (2026-08-05)

Full Changelog: [v2.7.0...v2.8.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.7.0...v2.8.0)

### Features

* **api:** manual updates ([054713e](https://github.com/context-dot-dev/context-ruby-sdk/commit/054713ecd7a6c12c29a2aaf0df0ea0eeb0ff61fc))

## 2.7.0 (2026-08-01)

Full Changelog: [v2.6.0...v2.7.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.6.0...v2.7.0)

### Features

* **api:** api update ([b0bdc3e](https://github.com/context-dot-dev/context-ruby-sdk/commit/b0bdc3ec9322ce5854177cdaff808caaba427746))
* **api:** api update ([17848b3](https://github.com/context-dot-dev/context-ruby-sdk/commit/17848b313dcbd098b21902bd2bd2cab6d9ad5ce2))
* **api:** api update ([4db7386](https://github.com/context-dot-dev/context-ruby-sdk/commit/4db7386bf6f686a33beae7817ec9122e1adad47f))

## 2.6.0 (2026-07-31)

Full Changelog: [v2.5.0...v2.6.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.5.0...v2.6.0)

### Features

* **api:** api update ([cedd9b1](https://github.com/context-dot-dev/context-ruby-sdk/commit/cedd9b1191e1297236c2aa6dede3fa640380b651))
* **api:** api update ([98fedb9](https://github.com/context-dot-dev/context-ruby-sdk/commit/98fedb99aae187cff9284efd0a6c574b1b71d749))
* **api:** api update ([7a5cc9a](https://github.com/context-dot-dev/context-ruby-sdk/commit/7a5cc9aa3bd2c746d0e47a58fbc426453db3b8c7))
* **api:** api update ([6cfd0e8](https://github.com/context-dot-dev/context-ruby-sdk/commit/6cfd0e80f3860cfbddd595ac4c72461075775415))
* **api:** api update ([99bdfb2](https://github.com/context-dot-dev/context-ruby-sdk/commit/99bdfb24af9adfac64ee68ca714fb1176c1d61c0))
* **api:** manual updates ([d7a4669](https://github.com/context-dot-dev/context-ruby-sdk/commit/d7a46695c2ba5ec1f54eaedec751bfd1d1559c4b))

## 2.5.0 (2026-07-22)

Full Changelog: [v2.4.0...v2.5.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.4.0...v2.5.0)

### Features

* **api:** api update ([5af0d4b](https://github.com/context-dot-dev/context-ruby-sdk/commit/5af0d4b1954673356f6200967dbea5ea61685025))
* **api:** api update ([28793d8](https://github.com/context-dot-dev/context-ruby-sdk/commit/28793d84ed93dcf457aaf3f346056f2480f37724))
* **api:** api update ([c9c4475](https://github.com/context-dot-dev/context-ruby-sdk/commit/c9c447554772879c742d72ac88174a75fbff599a))
* **api:** api update ([72e6d90](https://github.com/context-dot-dev/context-ruby-sdk/commit/72e6d90baaeeb9181482488e7b49e511597d2175))
* **api:** api update ([2574f7d](https://github.com/context-dot-dev/context-ruby-sdk/commit/2574f7db809d8480db2b7ae2705fd2de6a1ce2ff))
* **api:** api update ([8fb7d29](https://github.com/context-dot-dev/context-ruby-sdk/commit/8fb7d29835d4ffe7eb53b1619d3da20fa45df52c))
* **api:** api update ([f5684a3](https://github.com/context-dot-dev/context-ruby-sdk/commit/f5684a355f24bf6a80aa904f09087a899f2121aa))
* **api:** manual updates ([2a83a5f](https://github.com/context-dot-dev/context-ruby-sdk/commit/2a83a5f976bf2b75964ea56ff07f99872acd5022))
* **stlc:** configurable CI runner and private-production-repo support in workflow templates ([f1c36e9](https://github.com/context-dot-dev/context-ruby-sdk/commit/f1c36e95f04eb617aa1769ba9cd21e3dad7bc5ee))

## 2.4.0 (2026-07-12)

Full Changelog: [v2.3.0...v2.4.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.3.0...v2.4.0)

### Features

* **api:** api update ([426deb1](https://github.com/context-dot-dev/context-ruby-sdk/commit/426deb18249b214c3ccaa44c1e654e75ef666dd2))

## 2.3.0 (2026-07-12)

Full Changelog: [v2.2.0...v2.3.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.2.0...v2.3.0)

### Features

* **api:** api update ([3fd9604](https://github.com/context-dot-dev/context-ruby-sdk/commit/3fd960488c341f082b6d312dda927aeee23dccff))
* **api:** api update ([bdd3176](https://github.com/context-dot-dev/context-ruby-sdk/commit/bdd3176c7f507880adb7becae314b816c6bbe9bc))
* **api:** api update ([d68d31d](https://github.com/context-dot-dev/context-ruby-sdk/commit/d68d31dc5aa77ad154789b6cf91e0b8558353214))
* **api:** api update ([d4c601e](https://github.com/context-dot-dev/context-ruby-sdk/commit/d4c601ea30aa1d47ef041d0439ab8b5d976cc8e2))
* **api:** api update ([03fa3ac](https://github.com/context-dot-dev/context-ruby-sdk/commit/03fa3ac3c7c61aba88846db890bf4d3fd22d1086))
* **api:** api update ([626d105](https://github.com/context-dot-dev/context-ruby-sdk/commit/626d1054da9622e88469bb9c3b755f43d1d75280))
* **api:** manual updates ([b7f6b2c](https://github.com/context-dot-dev/context-ruby-sdk/commit/b7f6b2c0a5bb91cc065bcc2ef497c9999414262c))

## 2.2.0 (2026-07-10)

Full Changelog: [v2.1.0...v2.2.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.1.0...v2.2.0)

### Features

* **api:** api update ([04e3709](https://github.com/context-dot-dev/context-ruby-sdk/commit/04e370916ae9679892d86fc297e3c935afa1e2c2))
* **api:** api update ([59b7e62](https://github.com/context-dot-dev/context-ruby-sdk/commit/59b7e62e57eff7482db12fe2dd1a97298620b88f))

## 2.1.0 (2026-07-08)

Full Changelog: [v2.0.0...v2.1.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v2.0.0...v2.1.0)

### Features

* **api:** api update ([7fe6a1f](https://github.com/context-dot-dev/context-ruby-sdk/commit/7fe6a1fbd2977c0669b7623ba96533b43789b8ae))
* **api:** api update ([cd5b872](https://github.com/context-dot-dev/context-ruby-sdk/commit/cd5b8725dcd7fb06d7bd684aa4ce11b81ca4409a))
* **api:** api update ([bdc4962](https://github.com/context-dot-dev/context-ruby-sdk/commit/bdc4962f436086be52293ea489960b6b6158726b))
* **api:** api update ([531ccbe](https://github.com/context-dot-dev/context-ruby-sdk/commit/531ccbeb9770c4340641353859064b50aa6d72bc))

## 2.0.0 (2026-07-06)

Full Changelog: [v1.36.0...v2.0.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.36.0...v2.0.0)

### Features

* **api:** api update ([b0511d9](https://github.com/context-dot-dev/context-ruby-sdk/commit/b0511d905641a19d59391ff26ac27d474016ac26))
* **api:** api update ([a146323](https://github.com/context-dot-dev/context-ruby-sdk/commit/a14632340e78b4b21be6c742f3792a7f14ca4fae))
* **api:** api update ([4a4a076](https://github.com/context-dot-dev/context-ruby-sdk/commit/4a4a0762b6c422c5507f847bb06b9ac0fb11e605))
* **api:** api update ([4682d0b](https://github.com/context-dot-dev/context-ruby-sdk/commit/4682d0b50170440ce7a3b60beadad10cefff3168))
* **api:** api update ([0026695](https://github.com/context-dot-dev/context-ruby-sdk/commit/00266958beb99d8747e4e5422a122792e0cb8080))
* **api:** api update ([3393a00](https://github.com/context-dot-dev/context-ruby-sdk/commit/3393a0047608f81e85a7c011ff3fd6356d7433a3))
* **api:** api update ([ab547fb](https://github.com/context-dot-dev/context-ruby-sdk/commit/ab547fb83535a1184f2aa1414b86022e4550704f))
* **api:** api update ([d71fbde](https://github.com/context-dot-dev/context-ruby-sdk/commit/d71fbde94bc39245091db193f120fa383efea82f))
* **api:** api update ([8fb393a](https://github.com/context-dot-dev/context-ruby-sdk/commit/8fb393a6a53d4ec6867efe8d9daf8458d9fa3cc8))
* **api:** manual updates ([b18f464](https://github.com/context-dot-dev/context-ruby-sdk/commit/b18f46485bf70c10b0a20459ed38b2991ea5add0))
* **api:** manual updates ([fa7f5bf](https://github.com/context-dot-dev/context-ruby-sdk/commit/fa7f5bfa1e892a7dff26b169bd3ea7a6d0863048))
* **api:** manual updates ([7277672](https://github.com/context-dot-dev/context-ruby-sdk/commit/7277672e289e4d8a54791a154e989ec6ba25e3b2))


### Chores

* **internal:** bound formatter parallelism to CPU count ([8b73d53](https://github.com/context-dot-dev/context-ruby-sdk/commit/8b73d53426ce571223386b1decabcb0bf58eaa37))

## 1.36.0 (2026-06-27)

Full Changelog: [v1.35.0...v1.36.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.35.0...v1.36.0)

### Features

* **api:** api update ([edf39d7](https://github.com/context-dot-dev/context-ruby-sdk/commit/edf39d75e9ca0a7b96ddac6467f9b50ceca0acf1))
* **api:** api update ([893f11d](https://github.com/context-dot-dev/context-ruby-sdk/commit/893f11d2746ccb636e971e12c24553043046cb11))
* **api:** api update ([59319b0](https://github.com/context-dot-dev/context-ruby-sdk/commit/59319b0421154c96a444f5e2d45b83e8f4bc9074))
* **api:** api update ([125ebe5](https://github.com/context-dot-dev/context-ruby-sdk/commit/125ebe5cb023b276c01bdc8c3cafbe8841dffddb))

## 1.35.0 (2026-06-25)

Full Changelog: [v1.34.0...v1.35.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.34.0...v1.35.0)

### Features

* **api:** api update ([26f4358](https://github.com/context-dot-dev/context-ruby-sdk/commit/26f43582d8d63b9ebd98f0ba04c64e93d61b185f))

## 1.34.0 (2026-06-19)

Full Changelog: [v1.33.0...v1.34.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.33.0...v1.34.0)

### Features

* **api:** api update ([94469da](https://github.com/context-dot-dev/context-ruby-sdk/commit/94469da02de1d8713f5bcb723cab05f0e23bb33d))

## 1.33.0 (2026-06-18)

Full Changelog: [v1.32.0...v1.33.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.32.0...v1.33.0)

### Features

* **api:** api update ([65310de](https://github.com/context-dot-dev/context-ruby-sdk/commit/65310de1d9739b217660fc4ab8e5462bc5a0f081))


### Bug Fixes

* **client:** send content-type header for requests with an omitted optional body ([63d0f66](https://github.com/context-dot-dev/context-ruby-sdk/commit/63d0f66c1d871786bf80989b7a8ad11b859ec12a))

## 1.32.0 (2026-06-11)

Full Changelog: [v1.31.0...v1.32.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.31.0...v1.32.0)

### Features

* **api:** api update ([67ddd60](https://github.com/context-dot-dev/context-ruby-sdk/commit/67ddd60fffad48a4cc6697fb940f6510bc04d0cb))
* **api:** api update ([e987167](https://github.com/context-dot-dev/context-ruby-sdk/commit/e9871675c89fd313209d95cd54071fe986dd772a))

## 1.31.0 (2026-06-08)

Full Changelog: [v1.30.0...v1.31.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.30.0...v1.31.0)

### Features

* **api:** api update ([2170040](https://github.com/context-dot-dev/context-ruby-sdk/commit/2170040142dab272a55f903f0d062b0d36d751aa))
* **api:** api update ([c57bae4](https://github.com/context-dot-dev/context-ruby-sdk/commit/c57bae40d99770e18c92d402eb71dc0aa651f522))

## 1.30.0 (2026-06-07)

Full Changelog: [v1.29.0...v1.30.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.29.0...v1.30.0)

### Features

* **api:** api update ([c897bbf](https://github.com/context-dot-dev/context-ruby-sdk/commit/c897bbf03235960c8036bd808c5239b935d94bf3))

## 1.29.0 (2026-06-07)

Full Changelog: [v1.28.0...v1.29.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.28.0...v1.29.0)

### Features

* **api:** api update ([9aa6127](https://github.com/context-dot-dev/context-ruby-sdk/commit/9aa6127b563032655648c3c24fe9564616ebe3f1))

## 1.28.0 (2026-06-06)

Full Changelog: [v1.27.0...v1.28.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.27.0...v1.28.0)

### Features

* **api:** api update ([22eb08f](https://github.com/context-dot-dev/context-ruby-sdk/commit/22eb08f65d1001052f1bd247a4d60e2680bb33ea))

## 1.27.0 (2026-06-01)

Full Changelog: [v1.26.0...v1.27.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.26.0...v1.27.0)

### Features

* **api:** manual updates ([e3971dc](https://github.com/context-dot-dev/context-ruby-sdk/commit/e3971dcc3b94f5b998562f8ecb82a292cc8f00bd))

## 1.26.0 (2026-06-01)

Full Changelog: [v1.25.0...v1.26.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.25.0...v1.26.0)

### Features

* **api:** api update ([d442168](https://github.com/context-dot-dev/context-ruby-sdk/commit/d442168b67accce12463e36f03630f155c1c7be3))
* **api:** api update ([f3a97c1](https://github.com/context-dot-dev/context-ruby-sdk/commit/f3a97c19ef01be5e6cf1ce7ecfa26c972edfdf33))
* **api:** api update ([8d8abf7](https://github.com/context-dot-dev/context-ruby-sdk/commit/8d8abf7c1600bce17ea26aa245f41b2e3199f722))

## 1.25.0 (2026-05-31)

Full Changelog: [v1.24.0...v1.25.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.24.0...v1.25.0)

### Features

* **api:** manual updates ([688e5f5](https://github.com/context-dot-dev/context-ruby-sdk/commit/688e5f56137aeac7c5219383f241a459173f961f))

## 1.24.0 (2026-05-30)

Full Changelog: [v1.23.0...v1.24.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.23.0...v1.24.0)

### Features

* **api:** api update ([7948cbf](https://github.com/context-dot-dev/context-ruby-sdk/commit/7948cbf296742dd0fea7c08c148962a35ed88c20))

## 1.23.0 (2026-05-19)

Full Changelog: [v1.22.0...v1.23.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.22.0...v1.23.0)

### Features

* **api:** api update ([5574aa6](https://github.com/context-dot-dev/context-ruby-sdk/commit/5574aa6793f9ff576b625cbb2e86fa819fd3bf36))

## 1.22.0 (2026-05-16)

Full Changelog: [v1.21.0...v1.22.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.21.0...v1.22.0)

### Features

* **api:** api update ([6e08ffc](https://github.com/context-dot-dev/context-ruby-sdk/commit/6e08ffc77cc708d31b9a3972bc3e2ac86c2fdb92))

## 1.21.0 (2026-05-16)

Full Changelog: [v1.20.1...v1.21.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.20.1...v1.21.0)

### Features

* **api:** manual updates ([b6c283e](https://github.com/context-dot-dev/context-ruby-sdk/commit/b6c283ee6c514421e07fb0b6d61aace62df318d1))

## 1.20.1 (2026-05-14)

Full Changelog: [v1.20.0...v1.20.1](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.20.0...v1.20.1)

### Bug Fixes

* **client:** elide content type header on requests without body ([f53ad05](https://github.com/context-dot-dev/context-ruby-sdk/commit/f53ad05fc7e00b2be604cc1e637998bf4ed187f5))

## 1.20.0 (2026-05-11)

Full Changelog: [v1.19.0...v1.20.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.19.0...v1.20.0)

### Features

* **api:** manual updates ([6d640e9](https://github.com/context-dot-dev/context-ruby-sdk/commit/6d640e9d1c52818badc55b8f9e5c545766a26d01))

## 1.19.0 (2026-05-11)

Full Changelog: [v1.18.0...v1.19.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.18.0...v1.19.0)

### Features

* **api:** api update ([ab9c393](https://github.com/context-dot-dev/context-ruby-sdk/commit/ab9c3935b669fbe2c7a8ffdd5bff7ea05fc2ae56))
* **api:** api update ([7f8b7b7](https://github.com/context-dot-dev/context-ruby-sdk/commit/7f8b7b7a720f3fdf5364ffaf7c7e55f171b72c0e))

## 1.18.0 (2026-05-10)

Full Changelog: [v1.17.0...v1.18.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.17.0...v1.18.0)

### Features

* **api:** api update ([b582c05](https://github.com/context-dot-dev/context-ruby-sdk/commit/b582c05376102bb0cb6f8d4d8c9a2cefdef8c1ec))
* **api:** api update ([4a4e4bb](https://github.com/context-dot-dev/context-ruby-sdk/commit/4a4e4bbc547662de263a307b213dd7eecd03a61d))
* **api:** manual updates ([ec963bb](https://github.com/context-dot-dev/context-ruby-sdk/commit/ec963bb99ac36d162552c76fb067e87144f21089))

## 1.17.0 (2026-05-09)

Full Changelog: [v1.16.0...v1.17.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.16.0...v1.17.0)

### Features

* **api:** api update ([ae638b0](https://github.com/context-dot-dev/context-ruby-sdk/commit/ae638b04d0e08bf93e2cdd1211236d841d5313b1))
* **api:** api update ([8376344](https://github.com/context-dot-dev/context-ruby-sdk/commit/8376344a7a72a7ff01906bc3d6a5913a4de60bcb))

## 1.16.0 (2026-05-07)

Full Changelog: [v1.15.0...v1.16.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.15.0...v1.16.0)

### Features

* **api:** api update ([f0b1f3a](https://github.com/context-dot-dev/context-ruby-sdk/commit/f0b1f3afd885c44cb464393b57d944fa27a6c0b5))

## 1.15.0 (2026-05-06)

Full Changelog: [v1.14.0...v1.15.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.14.0...v1.15.0)

### Features

* **api:** api update ([42c8282](https://github.com/context-dot-dev/context-ruby-sdk/commit/42c8282f18c421ca317b51c640ea42cc04c61230))

## 1.14.0 (2026-05-06)

Full Changelog: [v1.13.0...v1.14.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.13.0...v1.14.0)

### Features

* **api:** api update ([58cb73a](https://github.com/context-dot-dev/context-ruby-sdk/commit/58cb73a109e20f296f6a5f256a94d690b1203f70))

## 1.13.0 (2026-05-05)

Full Changelog: [v1.12.0...v1.13.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.12.0...v1.13.0)

### Features

* **api:** manual updates ([1017ae4](https://github.com/context-dot-dev/context-ruby-sdk/commit/1017ae4d595beb2e5b466326a4db19c78ce6db51))

## 1.12.0 (2026-05-01)

Full Changelog: [v1.11.0...v1.12.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.11.0...v1.12.0)

### Features

* **api:** api update ([59a9399](https://github.com/context-dot-dev/context-ruby-sdk/commit/59a93997a90f6afac755abf6686c139b92d8463e))

## 1.11.0 (2026-05-01)

Full Changelog: [v1.10.0...v1.11.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.10.0...v1.11.0)

### Features

* **api:** manual updates ([490fde0](https://github.com/context-dot-dev/context-ruby-sdk/commit/490fde06ead702db0640f9d1161c3d8ecedd31a9))

## 1.10.0 (2026-05-01)

Full Changelog: [v1.9.0...v1.10.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.9.0...v1.10.0)

### Features

* **api:** api update ([c74cbf3](https://github.com/context-dot-dev/context-ruby-sdk/commit/c74cbf354e15c2b56680b4248ed69462a1a84d23))
* **api:** api update ([cc57672](https://github.com/context-dot-dev/context-ruby-sdk/commit/cc576729ce6c522ee578e7dc5f99122463014515))
* support setting headers via env ([e625fee](https://github.com/context-dot-dev/context-ruby-sdk/commit/e625fee97a6d4f6ab25f69447b33521cac6a896c))

## 1.9.0 (2026-04-25)

Full Changelog: [v1.8.0...v1.9.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.8.0...v1.9.0)

### Features

* **api:** manual updates ([e1f12de](https://github.com/context-dot-dev/context-ruby-sdk/commit/e1f12de44bcadd047b5746fdddcd828a29107e1e))

## 1.8.0 (2026-04-24)

Full Changelog: [v1.7.0...v1.8.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.7.0...v1.8.0)

### Features

* **api:** api update ([84bfef2](https://github.com/context-dot-dev/context-ruby-sdk/commit/84bfef260d99a7a444c243edc4be1c72191929dd))
* **api:** api update ([5405b96](https://github.com/context-dot-dev/context-ruby-sdk/commit/5405b9676800e2004d92dd9f621dfc56972bacd2))

## 1.7.0 (2026-04-24)

Full Changelog: [v1.6.0...v1.7.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.6.0...v1.7.0)

### Features

* **api:** api update ([9c8b4d9](https://github.com/context-dot-dev/context-ruby-sdk/commit/9c8b4d9b1d813c5b7992998a3fa23cde63fe2f4c))

## 1.6.0 (2026-04-23)

Full Changelog: [v1.5.0...v1.6.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.5.0...v1.6.0)

### Features

* **api:** api update ([c1543f7](https://github.com/context-dot-dev/context-ruby-sdk/commit/c1543f7513b2d88b0c8ad8e209e62075bd9658bc))
* **api:** api update ([9c98e20](https://github.com/context-dot-dev/context-ruby-sdk/commit/9c98e20725dcda8466a2274b61be75943d0564d9))
* **api:** api update ([8ccafd9](https://github.com/context-dot-dev/context-ruby-sdk/commit/8ccafd9625079f40393fe23890958a80d8bdb4e8))


### Chores

* **internal:** more robust bootstrap script ([57b2d93](https://github.com/context-dot-dev/context-ruby-sdk/commit/57b2d93877e5ceeb388679f239e21c09b087b2a1))

## 1.5.0 (2026-04-19)

Full Changelog: [v1.4.0...v1.5.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.4.0...v1.5.0)

### Features

* **api:** api update ([30ef99f](https://github.com/context-dot-dev/context-ruby-sdk/commit/30ef99f9a0d61f6528aed16b080f376753b3447a))
* **api:** api update ([c9851eb](https://github.com/context-dot-dev/context-ruby-sdk/commit/c9851ebc0618d7433ed88f7062902fcec575b229))
* **api:** api update ([55529f6](https://github.com/context-dot-dev/context-ruby-sdk/commit/55529f63e23cf255645bdb2d0420bf24aaba28b1))
* **api:** api update ([51320a5](https://github.com/context-dot-dev/context-ruby-sdk/commit/51320a5677298ab231dc417ef3c54d6a75e640ba))
* **api:** api update ([5a69904](https://github.com/context-dot-dev/context-ruby-sdk/commit/5a69904d89cc873614e8320308eecac9304992d2))
* **api:** api update ([7d186fa](https://github.com/context-dot-dev/context-ruby-sdk/commit/7d186faf849e20bcd958beb5f46b71f6440b8358))
* **api:** api update ([2d439b9](https://github.com/context-dot-dev/context-ruby-sdk/commit/2d439b9814f0e3be9efead3d2e70e3e5d7e3a1f0))
* **api:** api update ([8b33b1e](https://github.com/context-dot-dev/context-ruby-sdk/commit/8b33b1ee26acc8314d9c285ea53e3531ba390a16))
* **api:** api update ([7b5ddec](https://github.com/context-dot-dev/context-ruby-sdk/commit/7b5ddec0b8e306df34a72ccd39e8d731168a62ea))
* **api:** api update ([b09024f](https://github.com/context-dot-dev/context-ruby-sdk/commit/b09024fa19c7aecafaf4fe4bd211bfc3738484ed))
* **api:** api update ([4e74fe3](https://github.com/context-dot-dev/context-ruby-sdk/commit/4e74fe3f395778efb1ca3f1e752f2f71e21a3191))
* **api:** manual updates ([f451afe](https://github.com/context-dot-dev/context-ruby-sdk/commit/f451afea50625bba49a808a4b193c451c7019571))
* **api:** manual updates ([11ea49f](https://github.com/context-dot-dev/context-ruby-sdk/commit/11ea49fac95ca680db1f9880b8b8590aa650b00a))
* **api:** manual updates ([739b99f](https://github.com/context-dot-dev/context-ruby-sdk/commit/739b99fddcd745960b3cf390cc9bff4220941ee8))
* **api:** manual updates ([d32eb69](https://github.com/context-dot-dev/context-ruby-sdk/commit/d32eb69f2bafb655156587bfb2daa659dcc3b731))

## 1.4.0 (2026-04-09)

Full Changelog: [v1.3.0...v1.4.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.3.0...v1.4.0)

### Features

* **api:** api update ([f475665](https://github.com/context-dot-dev/context-ruby-sdk/commit/f47566556bc4d2c81a52084979f83be62cb17cf2))
* **api:** api update ([a4e99e6](https://github.com/context-dot-dev/context-ruby-sdk/commit/a4e99e6e0659cb7b09375d7a467e9771aa6cea44))
* **api:** api update ([b13514f](https://github.com/context-dot-dev/context-ruby-sdk/commit/b13514f872498b08e54fc8b4264179201ee30311))


### Bug Fixes

* multipart encoding for file arrays ([105116f](https://github.com/context-dot-dev/context-ruby-sdk/commit/105116f48178f46bae721d32e987d684fc662dd0))

## 1.3.0 (2026-04-04)

Full Changelog: [v1.2.0...v1.3.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.2.0...v1.3.0)

### Features

* **api:** manual updates ([8e8fcc2](https://github.com/context-dot-dev/context-ruby-sdk/commit/8e8fcc26f2fbbb2bdcca9713fa3b9f8518303586))

## 1.2.0 (2026-04-03)

Full Changelog: [v1.1.0...v1.2.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.1.0...v1.2.0)

### Features

* **api:** api update ([5f00bc0](https://github.com/context-dot-dev/context-ruby-sdk/commit/5f00bc076f0081065bc274ce9f28cd26a7daa944))


### Bug Fixes

* align path encoding with RFC 3986 section 3.3 ([2c4072d](https://github.com/context-dot-dev/context-ruby-sdk/commit/2c4072df7df531933f5352c611183b1d152e3ec2))
* variable name typo ([10e1853](https://github.com/context-dot-dev/context-ruby-sdk/commit/10e185365b3196732fc5e0649975ab696f80e893))

## 1.1.0 (2026-03-28)

Full Changelog: [v1.0.0...v1.1.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v1.0.0...v1.1.0)

### Features

* **api:** api update ([9ae9b10](https://github.com/context-dot-dev/context-ruby-sdk/commit/9ae9b108ce2737b42574a6f781103410a546f704))
* **api:** api update ([58ed755](https://github.com/context-dot-dev/context-ruby-sdk/commit/58ed7551637936ea3c007e28af3358eb96a339ca))


### Bug Fixes

* **internal:** correct multipart form field name encoding ([221d059](https://github.com/context-dot-dev/context-ruby-sdk/commit/221d0598148243acddae6c9679c949c07e1dcd7a))


### Chores

* **ci:** support opting out of skipping builds on metadata-only commits ([aad82ac](https://github.com/context-dot-dev/context-ruby-sdk/commit/aad82ac90dd1c55ca4db05e63b70b46abded53e3))

## 1.0.0 (2026-03-25)

Full Changelog: [v0.4.0...v1.0.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v0.4.0...v1.0.0)

### Features

* **api:** api update ([4767618](https://github.com/context-dot-dev/context-ruby-sdk/commit/4767618765a8f15bde582bf35f78190649681453))

## 0.4.0 (2026-03-25)

Full Changelog: [v0.3.0...v0.4.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v0.3.0...v0.4.0)

### Features

* **api:** api update ([0891a8f](https://github.com/context-dot-dev/context-ruby-sdk/commit/0891a8f97fa7ca1b8e49dbc5d383763406ac85ae))

## 0.3.0 (2026-03-25)

Full Changelog: [v0.2.1...v0.3.0](https://github.com/context-dot-dev/context-ruby-sdk/compare/v0.2.1...v0.3.0)

### Features

* **api:** api update ([ff1db16](https://github.com/context-dot-dev/context-ruby-sdk/commit/ff1db1692a06315279532c93a05722223cb2c7ee))
* **api:** api update ([97eac17](https://github.com/context-dot-dev/context-ruby-sdk/commit/97eac17686bff356d4d5b6ad6438beb24c05b05a))
* **api:** manual updates ([d120a5d](https://github.com/context-dot-dev/context-ruby-sdk/commit/d120a5dde6665acced2c75394beb6910389e344e))
* **api:** manual updates ([fe32a5e](https://github.com/context-dot-dev/context-ruby-sdk/commit/fe32a5e431bf152d8b0966f9927efcd8ebc3b5c1))


### Chores

* configure new SDK language ([8d24989](https://github.com/context-dot-dev/context-ruby-sdk/commit/8d2498986b1358432204720208f1a9b18d0f53f0))
* **internal:** tweak CI branches ([2b124b9](https://github.com/context-dot-dev/context-ruby-sdk/commit/2b124b9fd6a5eeb81fa445afc448ce4819fc077e))
* sync repo ([663ae2b](https://github.com/context-dot-dev/context-ruby-sdk/commit/663ae2b31199fd8a6b7e37161111d2c37a8d76df))
* update SDK settings ([8a92059](https://github.com/context-dot-dev/context-ruby-sdk/commit/8a920591a4a5ef301d26d19ca2a985ac7c0d8efd))
* update SDK settings ([3c49703](https://github.com/context-dot-dev/context-ruby-sdk/commit/3c49703a25e8951d07f597cc16b1abc03b248d84))

## 0.2.1 (2026-03-25)

Full Changelog: [v0.2.0...v0.2.1](https://github.com/context-dot-dev/ruby-sdk/compare/v0.2.0...v0.2.1)

### Chores

* sync repo ([00fbb10](https://github.com/context-dot-dev/ruby-sdk/commit/00fbb10a2bf3f189e7e0da59238e1effcaf7b9eb))
* update SDK settings ([2effe2a](https://github.com/context-dot-dev/ruby-sdk/commit/2effe2a7cd8e7f7664590f5a094c6f9598b1866e))

## 0.2.1 (2026-03-25)

Full Changelog: [v0.2.0...v0.2.1](https://github.com/context-dot-dev/ruby-sdk/compare/v0.2.0...v0.2.1)

### Chores

* sync repo ([e3eb15b](https://github.com/context-dot-dev/ruby-sdk/commit/e3eb15bd44f41866d57904b62e4d3dc6c37772d3))
* update SDK settings ([84a6c7d](https://github.com/context-dot-dev/ruby-sdk/commit/84a6c7d4f5752a044f911caf99c20fbb3eb45240))

## 0.2.0 (2026-03-18)

Full Changelog: [v0.1.0...v0.2.0](https://github.com/brand-dot-dev/context-ruby-sdk/compare/v0.1.0...v0.2.0)

### Features

* **api:** api update ([ff1db16](https://github.com/brand-dot-dev/context-ruby-sdk/commit/ff1db1692a06315279532c93a05722223cb2c7ee))
* **api:** manual updates ([d120a5d](https://github.com/brand-dot-dev/context-ruby-sdk/commit/d120a5dde6665acced2c75394beb6910389e344e))
* **api:** manual updates ([fe32a5e](https://github.com/brand-dot-dev/context-ruby-sdk/commit/fe32a5e431bf152d8b0966f9927efcd8ebc3b5c1))

## 0.1.0 (2026-03-18)

Full Changelog: [v0.0.2...v0.1.0](https://github.com/brand-dot-dev/context-ruby-sdk/compare/v0.0.2...v0.1.0)

### Features

* **api:** api update ([97eac17](https://github.com/brand-dot-dev/context-ruby-sdk/commit/97eac17686bff356d4d5b6ad6438beb24c05b05a))


### Chores

* **internal:** tweak CI branches ([2b124b9](https://github.com/brand-dot-dev/context-ruby-sdk/commit/2b124b9fd6a5eeb81fa445afc448ce4819fc077e))

## 0.0.2 (2026-03-14)

Full Changelog: [v0.0.1...v0.0.2](https://github.com/brand-dot-dev/context-ruby-sdk/compare/v0.0.1...v0.0.2)

### Chores

* configure new SDK language ([8d24989](https://github.com/brand-dot-dev/context-ruby-sdk/commit/8d2498986b1358432204720208f1a9b18d0f53f0))
* update SDK settings ([3c49703](https://github.com/brand-dot-dev/context-ruby-sdk/commit/3c49703a25e8951d07f597cc16b1abc03b248d84))
