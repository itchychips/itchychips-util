# This file is part of itchychips-util.
#
# itchychips-utils is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# itchychips-utils is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public
# License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with itchychips-utils. If not, see <https://www.gnu.org/licenses/>.


# This Makefile will initialize git submodules and download necessary files.
#
# This does not install system dependencies, such as `build-essential`.  See
# README.md for more details on how to get started.

lua-utf8.so: download_ucd
	gcc -g -fPIC $$(pkg-config --cflags lua5.1) submodules/luautf8/lutf8lib.c -shared -o lua-utf8.so

test: lua-utf8.so
	lua5.1 submodules/luautf8/test.lua

download_ucd: submodules/luautf8/UCD/CaseFolding.txt submodules/luautf8/UCD/DerivedCoreProperties.txt submodules/luautf8/UCD/EastAsianWidth.txt submodules/luautf8/UCD/PropList.txt submodules/luautf8/UCD/UnicodeData.txt

submodules/luautf8/lutf8lib.c: init_submodules

init_submodules:
	git submodule init submodules/luautf8

update_submodules: init_submodules
	git submodule update submodules/luautf8

submodules/luautf8/UCD/CaseFolding.txt:
	mkdir -p submodules/luautf8/UCD
	wget https://unicode.org/Public/UCD/latest/ucd/CaseFolding.txt -O $@

submodules/luautf8/UCD/DerivedCoreProperties.txt:
	mkdir -p submodules/luautf8/UCD
	wget https://unicode.org/Public/UCD/latest/ucd/DerivedCoreProperties.txt -O $@

submodules/luautf8/UCD/EastAsianWidth.txt:
	mkdir -p submodules/luautf8/UCD
	wget https://unicode.org/Public/UCD/latest/ucd/EastAsianWidth.txt -O $@

submodules/luautf8/UCD/PropList.txt:
	mkdir -p submodules/luautf8/UCD
	wget https://unicode.org/Public/UCD/latest/ucd/PropList.txt -O $@

submodules/luautf8/UCD/UnicodeData.txt:
	mkdir -p submodules/luautf8/UCD
	wget https://unicode.org/Public/UCD/latest/ucd/UnicodeData.txt -O $@

.PHONY: test download_ucd init_submodules update_submodules
