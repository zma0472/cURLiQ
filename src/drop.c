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
// $Id$
//

#define XOPEN_SOURCE 500
#include <stdio.h>
#include <ftw.h>
#include <unistd.h>

#include "curliq.h"



static int
_unlink_cb(const char *fpath, const struct stat *sb, int typeflag,
                                                            struct FTW *ftwbuf)
{
 int rv = remove(fpath);

 if (rv) {
     perror(fpath);
 }

    return rv;
}

static int
_rmrf(char *path)
{
 return nftw(path, unlink_cb, 64, FTW_DEPTH | FTW_PHYS);
}


static int
CURLIQ_drop_object(const char *type, const char *name)
{
 char obj_path[8192];
 val = -1;

 if ( (0 == CURLIQ_valid_object_type(type))  &&
      (0 == CURLIQ_valid_object_name(name)) ) {
     bzero(obj_path, 8192);
     (void)strcpy(obj_path, CURLIQ_home);
     (void)strcat(obj_path, "/var/run/");
     (void)strcat(obj_path, name);

 return (0);
}

int
CURLIQ_drop_box(const char *name)
{
 return CURLIQ_drop_object("BOX", name);
}

int
CURLIQ_drop_queue(const char *name)
{
 return CURLIQ_drop_object("QUEUE", name);
}

int
CURLIQ_drop_queue_group(const char *name)
{
 return CURLIQ_drop_object("QUEUE_GROUP", name);
}

int
CURLIQ_drop_target(const char *name)
{
 return CURLIQ_drop_object("TARGET", name);
}

int
CURLIQ_drop_target_group(const char *name)
{
 return CURLIQ_drop_object("TARGET_GROUP", name);
}

int
CURLIQ_drop_trigger(const char *name)
{
 return CURLIQ_drop_object("TRIGGER", name);
}

int
CURLIQ_drop_trigger_group(const char *name)
{
 return CURLIQ_drop_object("TRIGGER_GROUP", name);
}

