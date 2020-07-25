#!/usr/bin/env python3

import os
import sqlite3
import yaml
import sys
import uuid
import argparse
import re
import readline

from datetime import datetime

_curliq_default_home = '/opt/cq'
_curliq_interactive = False
_curliq_debug = False

_curliq_version_major = 0
_curliq_version_minor = 0
_curliq_version_patch = 0

_curliq_default_system_name = 'cURLiQ'
_curliq_default_system_description = 'cURLiQ Enterprise Messaging System'

_curliq_default_sod_dir = _curliq_default_home + '/sys/sod/'
_curliq_default_sod_path=_curliq_default_sod_dir + _curliq_default_system_name

_curliq_default_schema_dir = _curliq_default_home + '/sql/'
_curliq_default_schema_path = _curliq_default_schema_dir + \
                                            _curliq_default_system_name + '.sql'

_system_home = _curliq_default_home
_system_name = _curliq_default_system_name
_system_description = _curliq_default_system_description
_system_creation_stamp = None
_system_adm_state = False
_system_opr_state = False
_system_version_major = _curliq_version_major
_system_version_minor = _curliq_version_minor
_system_version_patch = _curliq_version_patch
_system_id = None
_system_sod_path = _curliq_default_sod_path
_system_sod = None

_valid_object_name = re.compile('^[A-Z][A-Z0-9_]{0,14}$')


def version():
    return "cURLiQ v.%i.%i.%i" % (_curliq_version_major,
                                  _curliq_version_minor,
                                  _curliq_version_patch)

def validate_object_name(name):
    if _valid_object_name.fullmatch(name) is None:
        return False
    else:
        return True


class SOD:
    '''cURLiQ System Object Database.'''

    def __init__(self,
                 pathname=_system_sod_path,
                 schema_pathname=_curliq_default_schema_path):

        if isinstance(pathname, str) is False:
            raise(TypeError)
        elif isinstance(schema_pathname, str) is False:
            raise(TypeError)

        self.connectioon = None

    def set_defaults(self):
        self.pathname = _curliq_default_sod_path
        self.schema_pathname = _curliq_default_schema_path

    def connect(self):
        self.connection = sqlite3.connect(self.pathname)


class Broker:
    '''cURLiQ broker object.'''

    def __init__(self,
                 name,
                 description=''):

        self.adm_state=False
        self.opr_state=False

        if isinstance(name, str) is False:
            raise(TypeError)
        elif validate_object_name(name) is False:
            raise(ValueError)

        if description is not None:
            if isinstance(description, str) is False:
                raise(TypeError)

        self.queues = []
        self.targets = []
        self.triggers = []
        self.queue_groups = []
        self.target_groups = []
        self.trigger_groups = []
        self.name = name
        self.description = description

        self._uuid = str(uuid.uuid4())

    def add_queue(self, queue):
        if isinstance(queue, Queue) is False:
            raise(TypeError)
        elif queue not in self.queues:
            self.queues.append(queue)

    def add_target(self, target):
        if isinstance(target, Target) is False:
            raise(TypeError)
        elif target not in self.targets:
            self.targets.append(target)

    def add_trigger(self, trigger):
        if isinstance(trigger, Trigger) is False:
            raise(TypeError)
        elif trigger not in self.triggers:
            self.triggers.append(trigger)

    def add_queue_group(self, queue_group):
        if isinstance(queue_group, QueueGroup) is False:
            raise(TypeError)
        elif gueue_qroup not in self.queue_groups:
            self.queue_groups.append(queue_group)

    def add_target_group(self, target_group):
        if isinstance(target_group, TargetGroup) is False:
            raise(TypeError)
        elif target_qroup not in self.target_groups:
            self.target_groups.append(target_group)

    def add_trigger_group(self, trigger_group):
        if isinstance(trigger_group, TriggerGroup) is False:
            raise(TypeError)
        elif trigger_group not in self.trigger_groups:
            self.trigger_groups.append(trigger_group)

    def remove_queue(self, queue):
        if isinstance(queue, Queue) is False:
            raise(TypeError)
        elif queue not in self.queues:
            self.queues.remove(queue)

    def remove_target(self, target):
        if isinstance(target, Target) is False:
            raise(TypeError)
        elif target not in self.targets:
            self.targets.remove(target)

    def remove_trigger(self, trigger):
        if isinstance(trigger, Trigger) is False:
            raise(TypeError)
        elif trigger not in self.triggers:
            self.triggers.remove(trigger)

    def remove_queue_group(self, queue_group):
        if isinstance(queue_group, QueueGroup) is False:
            raise(TypeError)
        elif gueue_qroup not in self.queue_groups:
            self.queue_groups.remove(queue_group)

    def remove_target_group(self, target_group):
        if isinstance(target_group, TargetGroup) is False:
            raise(TypeError)
        elif target_qroup not in self.target_groups:
            self.target_groups.remove(target_group)

    def remove_trigger_group(self, trigger_group):
        if isinstance(trigger_group, TriggerGroup) is False:
            raise(TypeError)
        elif trigger_group not in self.trigger_groups:
            self.trigger_groups.remove(trigger_group)


class Queue:
    '''cURLiQ queue object.'''

    def __init__(self, name, description=None):
        self.name = name
        self.description = description


class Target:
    '''cURLiQ target object.'''

    def __init__(self):
        pass

class Message:
    '''cURLiQ message object.'''

    def __init__(self):
        pass

class QueueGroup:
    '''cURLiQ queue group object.'''

    def __init__(self):
        pass

class TargetGroup:
    '''cURLiQ target group object.'''

    def __init__(self):
        pass

class Trigger:
    '''cURLiQ trigger object.'''

    def __init__(self):
        pass

class TriggerGroup:
    '''cURLiQ trigger group object.'''

    def __init__(self):
        pass

def _curliq_command_loop(prompt='QCL> '):
    while True:
        try:
            line = input(prompt).strip().upper()
            if 'EXIT' == line:
                return
        except EOFError:
            print('EXIT')
            return

def _curliq_copyleft():
    print('''
cURLiQ v.{}.{}.{}
Copyright (C) 2020 Matthew Alton
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
For help, type "help".
'''.format(_curliq_version_major, \
           _curliq_version_minor, \
           _curliq_version_patch))


def _curliq_cl_args():
    desc = "cURLiQ Enterprise Messaging System"
    parser = argparse.ArgumentParser(description=desc)
    parser.add_argument('--home',
                        type=str,
                        dest="home",
                        action='store',
                        help="cURLiQ home directory")
    args = parser.parse_args()
    if args.home is not None:
        _system_home = args.home


def _curliq_env_vars():
    if os.getenv('CURLIQ_HOME') is not None:
        _system_home = os.environ['CURLIQ_HOME']

def _curliq_initialize():
    _curliq_env_vars()
    _curliq_cl_args()
    _curliq_copyleft()


if __name__ == '__main__':
    _curliq_interactive = True
    _curliq_initialize()
    _system_sod = SOD()
    _system_sod.connect()
    _curliq_command_loop('QCL> ')
    _system_sod.close()
    sys.exit(0)


