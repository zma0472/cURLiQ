#!/usr/bin/env python3

import sqlite3
import yaml
import sys
import uuid
import argparse
import re
from datetime import datetime

_curliq_default_home = '/opt/curliq'
_curliq_interactive = False
_curliq_debug = False

_curliq_version_major = 0
_curliq_version_minor = 0
_curliq_version_patch = 0

_curliq_default_system_name = 'cURLiQ'
_curliq_default_system_description = 'cURLiQ Enterprise Messaging System'

_brokers = []
_queues = []
_targets = []
_triggers = []

_queue_groups = []
_target_groups = []
_trigger_groups = []

_system_name = _curliq_default_system_name
_system_description = _curliq_default_system_description
_system_creation_stamp = None
_system_adm_state = False
_system_opr_state = False
_system_version_major = _curliq_version_major
_system_version_minor = _curliq_version_minor
_system_version_patch = _curliq_version_patch
_system_id = None

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

        _brokers.append(self)

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

if __name__ == '__main__':
    b = Broker('SPAM')
    q = Queue('EGGS')
    b.add_queue(q)
    for q in _queues:
        print(q.name)
