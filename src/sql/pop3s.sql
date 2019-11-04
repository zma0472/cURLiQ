
/*
 * Copyright (C) 2019 Matthew Alton
 *
 * This file is part of cURLiQ.
 *
 * cURLiQ is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * cURLiQ is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with cURLiQ.  If not, see <http://www.gnu.org/licenses/>.
 */


CREATE TABLE pop3s_target (
    id            UUID PRIMARY KEY,
    name          VARCHAR(32) NOT NULL,
    comment       VARCHAR(31) NOT NULL DEFAULT '',
    priority      INTEGER NOT NULL DEFAULT 0,
    online        BOOLEAN NOT NULL DEFAULT FALSE,
    uri_scheme    VARCHAR(6) NOT NULL,
    uri_userinfo  TEXT,
    uri_host      TEXT NOT NULL,
    uri_port      SMALLINT,
    uri_path      TEXT NOT NULL,
    uri_query     TEXT,
    uri_fragment  TEXT,
--
    CONSTRAINT pop3s_target__name_ck CHECK (
        name ~* '^[A-Z_][A-Z0-9_]{0,30}$'
    )
);
--
--
CREATE TABLE has_pop3s_target (
    queue_id  UUID FOREIGN KEY REFERENCES queue.id,
    target_id UUID FOREIGN KEY REFERENCES pop3s_target.id
);
--
--
