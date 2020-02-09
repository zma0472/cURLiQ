#!/usr/bin/env python3

import sqlite3
import yaml
import sys
import uuid

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


class System:
    '''cURLiQ system object.'''

    def __init__(self,
                 name=_curliq_default_system_name,
                 description=_curliq_default_system_description):

        self.creation_stamp = str(datetime.utcnow())
        self.adm_state = False
        self.opr_state = False
        self.version_major = _curliq_version_major
        self.version_minor = _curliq_version_minor
        self.version_patch = _curliq_version_patch
        self.name = name
        self.description = description
        self.id = str(uuid.uuid4())
        self.brokers = []
        self.queues = []
        self.targets = []
        self.triggers = []
        self.queue_groups = []
        self.target_groups = []
        self.trigger_groups = []

    def version(self):
        return (self.version_major, self.version_minor, self.version_patch)

class Broker:
    '''cURLiQ broker object.'''

    def __init__(self):
        pass

class Queue:
    '''cURLiQ queue object.'''

    def __init__(self):
        pass

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

