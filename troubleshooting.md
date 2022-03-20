# Troubleshooting

## Warning: Do not use pod install from inside Rosetta2 (x86_64 emulation on arm64).

**When?**

When trying to install pods using `pod install`.

**Warning output:**

```sh
[!] Do not use "pod install" from inside Rosetta2 (x86_64 emulation on arm64).

[!]  - Emulated x86_64 is slower than native arm64

[!]  - May result in mixed architectures in rubygems (eg: ffi_c.bundle files may be x86_64 with an arm64 interpreter)

[!] Run "env /usr/bin/arch -arm64 /bin/bash --login" then try again.
```

**Solution:**

> [Source](https://github.com/facebook/react-native/issues/33017)

Uninstall gem cocoapods:

```sh
sudo gem uninstall cocoapods
```

Then re-install using brew:

```sh
arch -arm64 brew install cocoapods
```

Finally, install pods:

```sh
pod install
```

## Warning: Your project does not

**When?**

When installing the pods via `pod install`

**Warning output:**

```sh
[!] Your project does not explicitly specify the CocoaPods master specs repo. Since CDN is now used as the default, you may safely remove it from your repos directory via `pod repo remove master`. To suppress this warning please add `warn_for_unused_master_specs_repo => false` to your Podfile.
```

**Solution:**

> [Source](https://stackoverflow.com/questions/65407287/your-project-does-not-explicitly-specify-the-cocoapods-master-specs-repo-warni)

List the pod repos:

```sh
pod repo list
```

That should output the following:

```sh
# cocoapods
# - Type: git (remotes/origin/master)
# - URL:  https://github.com/CocoaPods/Specs.git
# - Path: /Users/<user>/.cocoapods/repos/cocoapods
# 
# goinstant
# - Type: git (master)
# - URL:  https://github.com/goinstant/pods-specs-public
# - Path: /Users/<user>/.cocoapods/repos/goinstant
# 
# trunk
# - Type: CDN
# - URL:  https://cdn.cocoapods.org/
# - Path: /Users/<user>/.cocoapods/repos/trunk
# 
# 3 repos
```

Then, remove the `master` or `cocoapods` repos:

```sh
pod repo remove master

# or

pod repo remove cocoapods
```

Try again:

```sh
pod install
```
