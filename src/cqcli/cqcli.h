
/*
 * Copyright (C) 2019 Matthew Alton
 *
 * This file is part of cURLiQ.
 *
 * cURLiQ is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * cURLiQ is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with cURLiQ.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _CURLIQ_H
#define _CURLIQ_H

#include <stdint.h>

extern void args(int argc, char **argv);
extern void copyright(void);

extern uint8_t interactive_session;

#ifndef CURLIQ_VERSION_MAJOR
#define CURLIQ_VERSION_MAJOR 0
#endif

#ifndef CURLIQ_VERSION_MINOR
#define CURLIQ_VERSION_MINOR 0
#endif

#ifndef CURLIQ_VERSION_PATCH
#define CURLIQ_VERSION_PATCH 0
#endif

#endif  /*  _CURLIQ_H  */
