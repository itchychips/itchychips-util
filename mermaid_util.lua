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


-- mermaid_util.lua
--
-- Escape a string using the lua-utf8 module for mermaid.
--
-- To use, adapt the following code snippet:
--
--     local mermaid_util = require("mermaid_util")
--     local utf8 = require("lua-utf8")
--     local u = utf8.escape
--
--     local my_variable = mermaid_util.escape_for_mermaid(u"my_string()")
--     assert(u"my_string&#40&#41" == my_variable)

local mod = {}

local utf8 = require("lua-utf8")
local u = utf8.escape

local function mermaid_escape_match(match)
    for _,code in utf8.codes(match) do
        return "&#" .. code
    end
end

function mod.escape_for_mermaid(value)
    -- Not entirely sure why u"[%[%](){}<>]" doesn't work...  Ah well.  We can
    -- double up the matches.
    value = utf8.gsub(value, u"[(){}<>]", mermaid_escape_match)
    value = utf8.gsub(value, u"[%]%[]", mermaid_escape_match)
    return value
end

return mod
