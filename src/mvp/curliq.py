#!/usr/bin/env python3

import sqlite3
import yaml
import sys
import uuid
import argparse


from datetime import datetime

# _curliq_default_home contains the pathname of the cURLiQ installation home
# directory.

_curliq_default_home = '/opt/curliq'
_curliq_interactive = False
_curliq_debug = False

_curliq_version_major = 0
_curliq_version_minor = 0
_curliq_version_patch = 0

_curliq_default_system_name = 'cURLiQ'
_curliq_default_system_description = 'cURLiQ Enterprise Messaging System'

brokers = []
queues = []
targets = []
triggers = []

broker_groups = []
queue_groups = []
target_groups = []
trigger_groups = []

class System:
    '''cURLiQ system object.'''

    def __init__(self,
                 name=_curliq_default_system_name,
                 description=_curliq_default_system_description):

#        self.creation_stamp = str(datetime.utcnow())
        self.adm_state = False
        self.opr_state = False
        self.version_major = _curliq_version_major
        self.version_minor = _curliq_version_minor
        self.version_patch = _curliq_version_patch
        self.name = name
        self.description = description
#        self.id = str(uuid.uuid4())

    def version(self):
        return (self.version_major, self.version_minor, self.version_patch)

class Broker:
    '''cURLiQ broker object.'''

    def __init__(self, name, description=None):
        if isinstance(name, str) is False:
            raise(TypeError)
        elif description is not None:
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

        brokers.append(self)

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
    cq = System()
    b = Broker('spam')
    q = Queue('eggs')
    b.add_queue(q)
    for q in queues:
        print(q.name)
