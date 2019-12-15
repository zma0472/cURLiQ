
--
-- Copyright (C) 2019 Matthew Alton
--
-- This file is part of cURLiQ.
--
-- cURLiQ is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- cURLiQ is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with cURLiQ.  If not, see <http://www.gnu.org/licenses/>.
--

--
--
--  The system table stores information about the system instance's identity,
--  creation time, version, and state.  The table is constrained to contain at
--  most one record (CHECK value of the primary key), so attempted INSERTs
--  after the initial build will always fail.  The version information and
--  creation time stamp are protected from alteration by an UPDATE trigger.
--
--
CREATE TABLE system (
    uuid            VARCHAR(32) NOT NULL UNIQUE,
    name            VARCHAR(15) PRIMARY KEY,
    description     VARCHAR(31) NOT NULL DEFAULT 'cURLiQ System v.0.1.0',
    creation_stamp  VARCHAR(19) NOT NULL,
    online_lock     BOOLEAN NOT NULL DEFAULT FALSE,
    offline_lock    BOOLEAN NOT NULL DEFAULT TRUE,
    online          BOOLEAN NOT NULL DEFAULT FALSE,
    oper_on_off     BOOLEAN NOT NULL DEFAULT FALSE,
    version_major   INTEGER NOT NULL,
    version_minor   INTEGER NOT NULL,
    version_patch   INTEGER NOT NULL,
--
    CONSTRAINT system__uuid_type_ck CHECK (
        TYPEOF(uuid) IS 'text'
    ),
--
    CONSTRAINT system__uuid_rgx_ck CHECK (
        uuid REGEXP '^[a-f0-9]{32}$'
    ),
--
    CONSTRAINT system__name_type_ck CHECK (
        TYPEOF(name) IS 'text'
    ),
--
    CONSTRAINT system__name_rgx_ck CHECK (
        name REGEXP '^[A-Z_][A-Z0-9_]{0,14}$'
    ),
--
    CONSTRAINT system__name_ck CHECK (
        name = '@@NAME@@'
    ),
--
    CONSTRAINT system__online_lock_type_ck CHECK (
        TYPEOF(online_lock) IS 'integer'
    ),
--
    CONSTRAINT system__online_lock_value_ck CHECK (
        online_lock = 0 OR online_lock = 1
    ),
--
    CONSTRAINT system__offline_lock_type_ck CHECK (
        TYPEOF(offline_lock) IS 'integer'
    ),
--
    CONSTRAINT system__online_lock_value_ck CHECK (
        offline_lock = 0 OR offline_lock = 1
    ),
--
    CONSTRAINT system__online_type_ck CHECK (
        TYPEOF(online) IS 'integer'
    ),
--
    CONSTRAINT system__online_value_ck CHECK (
        online = 0 OR online = 1
    ),
--
    CONSTRAINT system__oper_on_off_type_ck CHECK (
        TYPEOF(oper_on_off) IS 'integer'
    ),
--
    CONSTRAINT system__oper_on_off_value_ck CHECK (
        online = 0 OR online = 1
    ),
--
    CONSTRAINT system__lock_ck CHECK (
        ( online_lock IS FALSE AND offline_lock IS FALSE )
        OR
        ( online_lock IS FALSE AND offline_lock IS TRUE AND online IS FALSE )
        OR
        ( online_lock IS TRUE  AND offline_lock IS FALSE AND online IS TRUE )
    )
--
);
--
--
