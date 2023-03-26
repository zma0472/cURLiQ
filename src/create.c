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

#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>

#include "curliq.h"

int
CURLIQ_create_object(const char *type, const char *name)
{
 char obj_path[8192], attr_path[8192], value_path[8192];
 int fd = -1, val = -1;

 if ( (0 == CURLIQ_valid_object_type(type))  &&
      (0 == CURLIQ_valid_object_name(name)) ) {
     bzero(obj_path, 8192); bzero(attr_path, 8192); bzero(value_path, 8192);
     (void)strcpy(obj_path, CURLIQ_home);
     (void)strcat(obj_path, "/var/run/");
     (void)strcat(obj_path, name);

     if ( 0 == mkdir(obj_path, 0777) ) {
         (void)strcpy(attr_path, obj_path);
         (void)strcat(attr_path, "/.attr");
         if ( 0 == mkdir(attr_path, 0777) ) {
             (void)strcpy(value_path, attr_path);
             (void)strcat(value_path, "/type__");
             (void)strcat(value_path, type);
             if ( -1 != (fd = creat(value_path, 0644)) ) {
                 val = 0; (void)close(fd);
             } else {
                 strcpy(CURLIQ_error, strerror(errno));
                 (void)rmdir(attr_path); (void)rmdir(obj_path);
             }
         } else {
             strcpy(CURLIQ_error, strerror(errno));
             (void)rmdir(obj_path);
         }
     }
 }
 return val;
}

int
CURLIQ_create_box(const char *name)
{
 return CURLIQ_create_object("BOX", name);
}

int
CURLIQ_create_queue(const char *name)
{
 return CURLIQ_create_object("QUEUE", name);
}

int
CURLIQ_create_queue_group(const char *name)
{
 return CURLIQ_create_object("QUEUE_GROUP", name);
}

int
CURLIQ_create_target(const char *name)
{
 return CURLIQ_create_object("TARGET", name);
}

int
CURLIQ_create_target_group(const char *name)
{
 return CURLIQ_create_object("TARGET_GROUP", name);
}

int
CURLIQ_create_trigger(const char *name)
{
 return CURLIQ_create_object("TRIGGER", name);
}

int
CURLIQ_create_trigger_group(const char *name)
{
 return CURLIQ_create_object("TRIGGER_GROUP", name);
}

