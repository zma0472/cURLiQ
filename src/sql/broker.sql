
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
--
--  The adm_state and opr_state booleans define three possible broker states.
--  If adm_state=TRUE and opr_state=TRUE then the broker is in the ON state.
--  If adm_state=TRUE and opr_state=FALSE then the broker is in the OFF state.
--  If adm_state=FALSE and opr_state=FALSE then the broker is in the DOWN
--  state.  The opr_state is prohibited from being TRUE while the adm_state is
--  FALSE.  This is to allow administrators to shut the broker down in a manner
--  that will prevent operators from being able to bring it back up.
--
--  The version and creation time fields are protected from alteration by
--  triggers.
--
--

--
--
CREATE TABLE broker (
    name            VARCHAR(31) PRIMARY KEY,
    description     TEXT NOT NULL DEFAULT '',
    creation_stamp  TEXT NOT NULL,
    adm_state       BOOLEAN NOT NULL DEFAULT FALSE,
    opr_state       BOOLEAN NOT NULL DEFAULT FALSE,
--
    CONSTRAINT broker__name_type_ck CHECK (
        TYPEOF(name) IS 'text'
    ),
--
    CONSTRAINT broker__name_rgx_ck CHECK (
        name REGEXP '^[A-Z_][A-Z0-9_]{0,15}$'
    ),
--
    CONSTRAINT broker__adm_state_type_ck CHECK (
        TYPEOF(adm_state) IS 'integer'
    ),
--
    CONSTRAINT broker__adm_state_value_ck CHECK (
        adm_state = 0 OR adm_state = 1
    ),
--
    CONSTRAINT broker__opr_state_type_ck CHECK (
        TYPEOF(opr_state) IS 'integer'
    ),
--
    CONSTRAINT broker__opr_state_value_ck CHECK (
        opr_state = 0 OR opr_state = 1
    ),
--
    CONSTRAINT broker__exclude_soft_up_ck CHECK (
        (adm_state IS TRUE) OR (opr_state IS FALSE)
    )
);
--
--
--  The atomic_down trigger sets the opr_state to 0 whenever the adm_state is
--  set to 0.  This is to avoid race conditions.
--
--
CREATE TRIGGER broker__atomic_down_tr BEFORE UPDATE of adm_state ON broker
FOR EACH ROW
WHEN NEW.adm_state = 0
BEGIN
    UPDATE broker
    SET    opr_state = 0;
END;
