
//
//  Copyright (C) 2021 Matthew Alton
//
//  This file is part of cURLiQ.
//
//  cURLiQ is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  cURLiQ is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with cURLiQ.  If not, see <http://www.gnu.org/licenses/>.
//

#ifndef _LIBCURLIQ_H

#define _LIBCURLIQ_H 1

#define LIBCURLIQ_VERSION_MAJOR 0
#define LIBCURLIQ_VERSION_MINOR 0
#define LIBCURLIQ_VERSION_PATCH 0

#define CURLIQ_HOME_DEFAULT "/opt/curliq"

extern char *curliq_home;

extern int curliq_create_broker(const char *name);
extern int curliq_alter_broker(const char *name, const char *attribute,
                               void *value);
extern int curliq_drop_broker(const char *name);

extern int curliq_create_queue(const char *name);
extern int curliq_alter_queue(const char *name, const char *attribute,
                               void *value);
extern int curliq_drop_queue(const char *name);

extern int curliq_create_trigger(const char *name);
extern int curliq_alter_trigger(const char *name, const char *attribute,
                               void *value);
extern int curliq_drop_trigger(const char *name);

extern int curliq_create_queue_group(const char *name);
extern int curliq_alter_queue_group(const char *name, const char *attribute,
                               void *value);
extern int curliq_drop_queue_group(const char *name);

extern int curliq_create_target(const char *name);
extern int curliq_alter_target(const char *name, const char *attribute,
                               void *value);
extern int curliq_drop_target(const char *name);

extern int curliq_create_target_group(const char *name);
extern int curliq_alter_target_group(const char *name, const char *attribute,
                                     void *value);
extern int curliq_drop_target_group(const char *name);

extern int curliq_create_trigger_group(const char *name);
extern int curliq_alter_trigger_group(const char *name, const char *attribute,
                                      void *value);
extern int curliq_drop_trigger_group(const char *name);

#endif // !defined _CURLIQ_H

