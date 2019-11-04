
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

DROP TABLE IF EXISTS target CASCADE;
DROP TABLE IF EXISTS target_group CASCADE;
DROP TABLE IF EXISTS contains_target CASCADE;
DROP TABLE IF EXISTS queue CASCADE;
DROP TABLE IF EXISTS queue_group CASCADE;
DROP TABLE IF EXISTS contains_queue CASCADE;
DROP TABLE IF EXISTS has_target CASCADE;
DROP TABLE IF EXISTS system CASCADE;
--
--
CREATE TABLE system (
    name  VARCHAR(31) PRIMARY KEY,
    state VARCHAR(8) NOT NULL DEFAULT 'DOWN',
--
    CONSTRAINT system__state_ck CHECK (
        state = 'OFFLINE'  -- curliqd is running.  System has paused generating
                           -- new data transfers.
        OR
        state = 'ONLINE'   -- curliqd is running.  System is generating new data
                           -- transfers.
        OR
        state = 'STARTING' -- curliqd is initializing.  System is not yet
                           -- generating new data transfers.
        OR
        state = 'STOPPING' -- curliqd is waiting for existing transfers to
                           -- complete before exiting.
        OR
        state = 'DOWN'     -- curliqd is not running.
    ),
-- 
--
    CONSTRAINT system__name_ck CHECK (
        name ~* '^[A-Z_][A-Z0-9_]{0,30}$'
    )
--
);
--
--
CREATE TABLE queue (
    id          UUID PRIMARY KEY,
    name        VARCHAR(31) NOT NULL UNIQUE,
    comment     VARCHAR(31) NOT NULL DEFAULT '',
    source_path TEXT NOT NULL UNIQUE,
    online      BOOLEAN NOT NULL DEFAULT FALSE,
-- 
--
    CONSTRAINT queue__name_ck CHECK (
        name ~* '^[A-Z_][A-Z0-9_]{0,30}$'
    ),
--
    CONSTRAINT queue__source_path_ck CHECK (
        name ~* '^/.*'
    )
);
--
--
CREATE TABLE http_target (
    id    UUID PRIMARY KEY,
    name  VARCHAR(32) NOT NULL,
    comment             VARCHAR(31) NOT NULL DEFAULT '',
    priority            INTEGER NOT NULL DEFAULT 0,
    online              BOOLEAN NOT NULL DEFAULT FALSE,
    uri_userinfo        TEXT,
    uri_host            TEXT NOT NULL,
    uri_port            SMALLINT,
    uri_path            TEXT NOT NULL,
    uri_query           TEXT,
    uri_fragment        TEXT,
--
  CONSTRAINT http_target__name_ck CHECK (
    name ~* '^[A-Z_][A-Z0-9_]{0,30}$'
  )
);
--
--
CREATE TABLE has_http_target (
  queue_id  UUID FOREIGN KEY REFERENCES queue.id,
  target_id UUID FOREIGN KEY REFERENCES http_target.id
);
--
--



    CONSTRAINT target__uri_port_ck CHECK (
        uri_port >= 0
    ),
--
    CONSTRAINT target__http_version_ck CHECK (
        http_version = '1.0'
        OR
        http_version = '1.1'
        OR
        http_version = '2'
    ),
--
    CONSTRAINT target__tls_version_ck CHECK (
        tls_version = '1.0'
        OR
        tls_version = '1.1'
        OR
        tls_version = '1.2'
    ),
--
    CONSTRAINT target__auth_method_ck CHECK (
        auth_method = 'any'
        OR
        auth_method = 'basic'
        OR
        auth_method = 'digest'
        OR
        auth_method = 'ntlm'
        OR
        auth_method = 'negotiate'
    ),
--
    CONSTRAINT target__continue_at_ck CHECK (
        continue_at > -1
    ),
--
    CONSTRAINT target__delegation_lvl_ck CHECK (
        delegation_lvl = 'none'
        OR
        delegation_lvl = 'policy'
        OR
        delegation_lvl = 'always'
    ),
--
    CONSTRAINT target__expect100_timeout_ck CHECK (
        expect100_timeout > 0
    ),
--
    CONSTRAINT target__cert_type_ck CHECK (
        cert_type = 'PEM'
        OR
        cert_type = 'DER'
        OR
        cert_type = 'ENG'
        OR
        cert_type = 'P12'
    ),

--
    CONSTRAINT target__proxy_cert_type_ck CHECK (
        proxy_cert_type = 'PEM'
        OR
        proxy_cert_type = 'DER'
        OR
        proxy_cert_type = 'ENG'
        OR
        proxy_cert_type = 'P12'
    ),
    CONSTRAINT target__ftp_method_ck CHECK (
        ftp_method IS NULL
        OR
        ftp_method = 'multicwd'
        OR
        ftp_method = 'nocwd'
        OR
        ftp_method = 'singlecwd'
    ),
--
    CONSTRAINT target__ftp_ssl_ccc_mode_ck CHECK (
        ftp_ssl_ccc_mode IS NULL
        OR
        ftp_ssl_ccc_mode = 'active'
        OR
        ftp_ssl_ccc_mode = 'passive'
    ),
--
    CONSTRAINT target__hostpubmd5_ck CHECK (
        hostpubmd5 IS NULL
        OR
        hostpubmd5 ~* '[0-9a-f]{32}'
    ),
--
    CONSTRAINT target__krb_level_ck CHECK (
        krb_level IS NULL
        OR
        krb_level = 'clear'
        OR
        krb_level = 'safe'
        OR
        krb_level = 'confidential'
        OR
        krb_level = 'private'
    ),
--
    CONSTRAINT target__proxy_tlsauthtype_ck CHECK (
        proxy_tlsauthtype IS NULL
        OR
        proxy_tlsauthtype = 'SRP'
    ),
--
    CONSTRAINT target__proxy_tlspassword_ck CHECK (
        proxy_tlsuser IS NOT NULL
    ),
--
    CONSTRAINT target__proxy_tlsuser_ck CHECK (
        proxy_tlspassword IS NOT NULL
    ),
--
    CONSTRAINT target__tlspassword_ck CHECK (
        proxy_tlsuser IS NOT NULL
    ),
--
    CONSTRAINT target__tlsuser_ck CHECK (
        proxy_tlspassword IS NOT NULL
    ),
--
    CONSTRAINT target__tlsmax_ck CHECK (
        tls_max is NULL
        OR
        tls_max = '1.0'
        OR
        tls_max = '1.1'
        OR
        tls_max = '1.2'
        OR
        tls_max = '1.3'
    ),
--
    CONSTRAINT target__tlsauthtype_ck CHECK (
        tlsauthtype IS NULL
        OR
        tlsauthtype = 'SRP'
    ) 
);
--
--
CREATE TABLE has_target (
    queue_id  UUID REFERENCES queue(id),
    target_id UUID REFERENCES target(id),
--
    UNIQUE (target_id, queue_id)
);
--
--
CREATE TABLE target_group (
    id      UUID PRIMARY KEY,
    name    VARCHAR(31) NOT NULL,
    comment VARCHAR(31) NOT NULL DEFAULT '',
    online  BOOLEAN NOT NULL DEFAULT FALSE
);
--
--
CREATE TABLE contains_target (
    target_id       UUID REFERENCES target(id),
    target_group_id UUID REFERENCES target_group(id),
--
    UNIQUE (target_id, target_group_id)
);
--
--
CREATE TABLE queue_group (
    id      UUID PRIMARY KEY,
    name    VARCHAR(31) NOT NULL,
    comment VARCHAR(31) NOT NULL DEFAULT '',
    online  BOOLEAN NOT NULL DEFAULT FALSE
);
--
--
CREATE TABLE contains_queue (
    id             UUID PRIMARY KEY,
    queue_id       UUID REFERENCES queue(id),
    queue_group_id UUID REFERENCES queue_group(id),
--
    UNIQUE (queue_id, queue_group_id)
);
