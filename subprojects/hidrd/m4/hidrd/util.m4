dnl
dnl Utility macros.
dnl
dnl Copyright (C) 2010 Nikolai Kondrashov
dnl
dnl This file is part of hidrd.
dnl
dnl Hidrd is free software; you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation; either version 2 of the License, or
dnl (at your option) any later version.
dnl
dnl Hidrd is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU General Public License for more details.
dnl
dnl You should have received a copy of the GNU General Public License
dnl along with hidrd; if not, write to the Free Software
dnl Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
dnl
dnl
define(`capitalize_first',
       `translit(substr(`$1', 0, 1), `a-z', `A-Z')`'substr(`$1', 1)')dnl
dnl
define(`uppercase', `translit(`$1', `a-z', `A-Z')')dnl
dnl
define(`lowercase', `translit(`$1', `A-Z', `a-z')')dnl
dnl
changequote(`[', `]')dnl
define([xml_attvalue],
       [patsubst(
            patsubst(
                patsubst(
                    patsubst(
                        patsubst($1, &, &amp;),
                        ", &quot;),
                    ', &apos;),
                <, &lt;),
            >, &gt;)])dnl
define([xml_cdata],
       [patsubst(
            patsubst(
                patsubst($1, &, &amp;),
                <, &lt;),
            >, &gt;)])dnl
changequote([`], ['])dnl
