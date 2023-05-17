dnl
dnl lib/usage/page_desc_list.c template.
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
include(`m4/hidrd/util.m4')dnl
dnl
`/*
 * vim:nomodifiable
 *
 * ****************** DO NOT EDIT ********************
 * This file is autogenerated from page_desc_list.c.m4
 * ***************************************************
 */
/** @file
 * @brief HID report descriptor - usage ID description lists
 *
 * Copyright (C) 2010 Nikolai Kondrashov
 *
 * This file is part of hidrd.
 *
 * Hidrd is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * Hidrd is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with hidrd; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * @author Nikolai Kondrashov <spbnick@gmail.com>
 */

#include <strings.h>
#include "hidrd/cfg.h"
#include "hidrd/util/str.h"
#include "hidrd/util/tkn.h"
#include "hidrd/usage/id_desc_list.h"
#include "hidrd/usage/page_desc_list.h"

const hidrd_usage_page_desc hidrd_usage_page_desc_list['dnl
pushdef(`page_num', `1')dnl
pushdef(`PAGE', `define(`page_num', incr(page_num))')dnl
include(`db/usage/page.m4')dnl
popdef(`PAGE')dnl
page_num`'dnl
popdef(`page_num')dnl
`] = {
#ifdef HIDRD_WITH_TOKENS
#define _P_TOKEN(_token)    .token = _token,
#else
#define _P_TOKEN(_token)
#endif

#ifdef HIDRD_WITH_NAMES
#define _P_NAME(_name)      .name = _name,
#else
#define _P_NAME(_name)
#endif

#define _P(_TOKEN, _Token, _token, _name) \
    {.value = HIDRD_USAGE_PAGE_##_TOKEN,                    \
     _P_TOKEN(#_Token) _P_NAME(_name)                       \
     .id_list = hidrd_usage_id_desc_list_##_token,          \
     .id_num = sizeof(hidrd_usage_id_desc_list_##_token) /  \
              sizeof(*hidrd_usage_id_desc_list_##_token)}

    _P(UNDEFINED, undefined, undefined, "undefined"),

'dnl
pushdef(`PAGE',
`    _P(uppercase($2), $2, lowercase($2),
       "$3"),
')dnl
include(`db/usage/page.m4')dnl
popdef(`PAGE')dnl
`
#undef _P

#undef _P_NAME
#undef _P_TOKEN
};


const hidrd_usage_page_desc *
hidrd_usage_page_desc_list_lkp_by_value(hidrd_usage_page value)
{
    const hidrd_usage_page_desc    *p = hidrd_usage_page_desc_list;
    size_t                          i = sizeof(hidrd_usage_page_desc_list) /
                                        sizeof(*hidrd_usage_page_desc_list);

    assert(hidrd_usage_page_valid(value));

    for (; i > 0; i--, p++)
        if (p->value == value)
            return p;

    return NULL;
}


#ifdef HIDRD_WITH_TOKENS
const hidrd_usage_page_desc *
hidrd_usage_page_desc_list_lkp_by_token(const char *token)
{
    const hidrd_usage_page_desc    *p = hidrd_usage_page_desc_list;
    size_t                          i = sizeof(hidrd_usage_page_desc_list) /
                                        sizeof(*hidrd_usage_page_desc_list);

    assert(hidrd_tkn_valid(token));

    for (; i > 0; i--, p++)
        if (strcasecmp(p->token, token) == 0)
            return p;

    return NULL;
}
#endif /* HIDRD_WITH_TOKENS */


'dnl
