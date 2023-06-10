-- This file is part of itchychips-util.
--
-- itchychips-utils is free software: you can redistribute it and/or modify it
-- under the terms of the GNU Affero General Public License as published by the
-- Free Software Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- itchychips-utils is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public
-- License for more details.
--
-- You should have received a copy of the GNU Affero General Public License
-- along with itchychips-utils. If not, see <https://www.gnu.org/licenses/>.


-- mermaid_util_test.lua
--
-- Test mermaid_util.lua.  Run with:
--
--     luajit mermaid_util_test.lua
--
-- Within the same directory as mermaid_util.lua.

local mermaid_util = require("mermaid_util")

local test_results = {
    ["parentheses: &#40my_stuff is here&#41"] = mermaid_util.escape_for_mermaid("parentheses: (my_stuff is here)"),
    ["square: &#91my_stuff is here&#93"] = mermaid_util.escape_for_mermaid("square: [my_stuff is here]"),
    ["curly: &#123my_stuff is here&#125"] = mermaid_util.escape_for_mermaid("curly: {my_stuff is here}"),
    ["angle: &#60my_stuff is here&#62"] = mermaid_util.escape_for_mermaid("angle: <my_stuff is here>"),
    ["all: &#60my_stuff&#40&#41 &#91is &#123here&#62&#93&#125"] = mermaid_util.escape_for_mermaid("all: <my_stuff() [is {here>]}"),
}

local count = 0
local result = true
for expected,actual in pairs(test_results) do
    count = count + 1
    print("Test " .. count .. ":")
    print("    Expected: '" .. expected .. "'")
    print("    Actual:   '" .. actual .. "'")
    if expected ~= actual then
        print("    FAILURE")
        result = false
    else
        print("    PASS!")
    end
    print()
end

if not result then
    print("One or more of " .. count .. " tests failed.")
    os.exit(1)
else
    print("All " .. count .. " tests passed!")
    os.exit(0)
end
