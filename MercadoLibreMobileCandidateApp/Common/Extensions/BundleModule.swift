#if !SPM

import class Foundation.Bundle

private class BundleFinder {}

extension Foundation.Bundle {
    static var module: Bundle { Bundle(for: BundleFinder.self)}
}

#endif
