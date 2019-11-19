
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
CREATE TABLE broker (
    name            VARCHAR(31) PRIMARY KEY,
    description     TEXT NOT NULL DEFAULT '',
    creation_stamp  TEXT NOT NULL,
    state           VARCHAR(8) NOT NULL DEFAULT 'OFFLINE',
--
    CONSTRAINT broker__name_type_ck CHECK (
        TYPEOF(name) IS 'text'
    ),
--
    CONSTRAINT broker__name_rgx_ck CHECK (
        name REGEXP '^[A-Z_][A-Z0-9_]{0,15}$'
    ),
--
    CONSTRAINT broker__name_ck CHECK (
        name = '@@NAME@@'
    ),
--
    CONSTRAINT broker__state_ck CHECK (
        state = 'OFFLINE'  -- Broker has paused generating new data transfers.
        OR
        state = 'ONLINE'   -- Broker is generating new data transfers.
    )
);
--
--
INSERT INTO broker (name, creation_stamp, state)
VALUES ('@@NAME@@', DATETIME('now'), 'OFFLINE');
--
--
SELECT * FROM broker;
