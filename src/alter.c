//
// Copyright (C) 2022 Matthew Alton
//
// This file is part of cURLiQ.
//
// cURLiQ is free software: you can redistribute it and/or modify it under the
// terms of the GNU General Public License as published by the Free Software
// Foundation, either version 3 of the License, or (at your option) any later
// version.
// 
// cURLiQ is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// cURLiQ. If not, see <https://www.gnu.org/licenses/>.
//
// $Id: alter.c,v 1.1 2022/02/14 19:54:20 curliq Exp curliq $
//

#include <stdio.h>

#include "curliq.h"

static int
_alter_object(const char *type, const char *name, const char *attr,
                                                               const char *val)
{
 return (0);
}

int
CURLIQ_alter_box(const char *name, const char *attr, const char *val)
{
 return _alter_object("BOX", name, attr, val);
}

int
CURLIQ_alter_queue(const char *name, const char *attr, const char *val)
{
 return _alter_object("QUEUE", name, attr, val);
}

int
CURLIQ_alter_queue_group(const char *name, const char *attr, const char *val)
{
 return _alter_object("QUEUE_GROUP", name, attr, val);
}

int
CURLIQ_alter_target(const char *name, const char *attr, const char *val)
{
 return _alter_object("TARGET", name, attr, val);
}

int
CURLIQ_alter_target_group(const char *name, const char *attr, const char *val)
{
 return _alter_object("TARGET_GROUP", name, attr, val);
}

int
CURLIQ_alter_trigger(const char *name, const char *attr, const char *val)
{
 return _alter_object("TRIGGER", name, attr, val);
}

int
CURLIQ_alter_trigger_group(const char *name, const char *attr, const char *val)
{
 return _alter_object("TRIGGER_GROUP", name, attr, val);
}

