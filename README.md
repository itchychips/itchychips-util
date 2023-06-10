# itchychips-util

This is a collection of basic utilities, primarily for usage with luajit, but
may in the future include other utilities in other languages that have a simple
FFI.

# License

This work is under the terms of the GNU Affero General Public License.  For the
license text, please see the file COPYING.  All individual pieces of the
combined work's source files should also have pertinent notices.

# Requirements

On Debian, use this command, as root, to install the compiler suite and lua
dependencies:

```
apt install build-essential lua5.1 liblua5.1-0-dev
```

# Building

Run `make` in the repository tree root.  This will automatically initialize
submodules, and build dependencies.

# Testing

Utilities that have automated tests will likely have a source file with its
filename suffixed with `_test`, keeping either the original extension, or may
have a new extension if the test is written in an alternate langauge.

# Contributing

Contributions are welcome, but may not always be accepted.

This project is not corporate.  We do not require copyright transfer.  The only
contribution requirement is that the license must be compatible with the AGPL
license.  If you wish to have your contributions under a different license,
such as MIT, please ensure that it can be cleanly dilineated from other code
with different licensing, such as the code being placed in its own source
files.
