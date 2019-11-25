
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
--  The system table stores information about the system identity, creation
--  time, version, and state.  The table is constrained to contain at most one
--  record (CHECK value of the primary key), so attempted INSERTs after the
--  initial build will always fail.  The version information and creation
--  time stamp are protected from alteration by an UPDATE trigger.
--
--  The adm_state and opr_state booleans define three possible system states.
--  If adm_state=TRUE and opr_state=TRUE then the system is in the ON state.
--  If adm_state=TRUE and opr_state=FALSE then the system is in the OFF state.
--  If adm_state=FALSE and opr_state=FALSE then the system is in the DOWN
--  state.  A trigger prohibits the opr_state from being TRUE while the
--  adm_state is FALSE.  This is to allow administrators to shut the system
--  down in a manner that will prevent operators from being able to bring it
--  back up.
--
--
CREATE TABLE system (
    name            VARCHAR(31) PRIMARY KEY,
    description     TEXT NOT NULL DEFAULT '',
    creation_stamp  TEXT NOT NULL ,
    adm_state       BOOLEAN NOT NULL DEFAULT FALSE,
    opr_state       BOOLEAN NOT NULL DEFAULT FALSE,
    version_major   INTEGER NOT NULL DEFAULT 0,
    version_minor   INTEGER NOT NULL DEFAULT 0,
    version_patch   INTEGER NOT NULL DEFAULT 0,
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
    CONSTRAINT system__adm_state_type_ck CHECK (
        TYPEOF(adm_state) IS 'integer'
    ),
--
    CONSTRAINT system__adm_state_value_ck CHECK (
        adm_state = 0 OR adm_state = 1
    ),
--
    CONSTRAINT system__opr_state_type_ck CHECK (
        TYPEOF(opr_state) IS 'integer'
    ),
--
    CONSTRAINT system__opr_state_value_ck CHECK (
        opr_state = 0 OR opr_state = 1
    ),
--
    CONSTRAINT system__exclude_soft_up_ck CHECK (
        (adm_state IS TRUE) OR (opr_state IS FALSE)
    )
);
--
--
