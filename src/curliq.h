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
// $Id: curliq.h,v 1.1 2022/02/14 19:54:20 curliq Exp curliq $
//

#ifndef CURLIQ_H
#define CURLIQ_H

#define VERSION_MAJOR 0
#define VERSION_MINOR 0
#define VERSION_PATCH 0

#define CURLIQ_MAX_OBJECT_NAME_LEN 15

#define CURLIQ_DEFAULT_HOME "/opt/curliq"
#define CURLIQ_DEFAULT_DEBUG 0

extern char CURLIQ_error[4096];

extern char *CURLIQ_home;
extern int CURLIQ_debug;

extern int CURLIQ_environment(void);
CURLIQ_drop_object(const char *type, const char *name);
#define ALTER_ARGS const char *name, const char *attr, const char *val

extern int CURLIQ_create_object(const char *type, const char *name);

extern int CURLIQ_alter_box( ALTER_ARGS );
extern int CURLIQ_alter_queue( ALTER_ARGS );
extern int CURLIQ_alter_queue_group( ALTER_ARGS );
extern int CURLIQ_alter_target( ALTER_ARGS );
extern int CURLIQ_alter_target_group( ALTER_ARGS );
extern int CURLIQ_alter_trigger( ALTER_ARGS );
extern int CURLIQ_alter_trigger_group( ALTER_ARGS );

extern int CURLIQ_create_box(const char *name);
extern int CURLIQ_create_queue(const char *name);
extern int CURLIQ_create_queue_group(const char *name);
extern int CURLIQ_create_target(const char *name);
extern int CURLIQ_create_target_group(const char *name);
extern int CURLIQ_create_trigger(const char *name);
extern int CURLIQ_create_trigger_group(const char *name);

extern int CURLIQ_drop_box(const char *name);
extern int CURLIQ_drop_queue(const char *name);
extern int CURLIQ_drop_queue_group(const char *name);
extern int CURLIQ_drop_target(const char *name);
extern int CURLIQ_drop_target_group(const char *name);
extern int CURLIQ_drop_trigger(const char *name);
extern int CURLIQ_drop_trigger_group(const char *name);

extern int CURLIQ_valid_object_name(const char *name);
extern int CURLIQ_valid_object_type(const char *type);


#endif // !defined CURLIQ_H
