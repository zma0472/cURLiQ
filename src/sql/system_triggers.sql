
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
CREATE TRIGGER system_delete_tr BEFORE DELETE ON system
BEGIN
    SELECT CASE
    WHEN TRUE
    THEN
        RAISE(ABORT, "CQ: Permanent object: system record")
    END;
END;
--
CREATE TRIGGER system__update_tr BEFORE UPDATE ON system
BEGIN
    SELECT CASE
    WHEN NEW.creation_stamp <> OLD.creation_stamp OR
         NEW.version_major  <> OLD.version_major  OR
         NEW.version_minor  <> OLD.version_minor  OR
         NEW.version_patch  <> OLD.version_patch
    THEN
        RAISE(ABORT, "CQ: Permanent object: system record field")
    END;
END;
--
--
--  The	atomic_down trigger sets the opr_state to 0 whenever the adm_state is
--  set	to 0.  This is to avoid	race conditions.
--
--
CREATE TRIGGER system__atomic_down_tr BEFORE UPDATE of adm_state ON system
FOR EACH ROW
WHEN NEW.adm_state = 0
BEGIN
    UPDATE system
    SET    opr_state = 0;
END;

