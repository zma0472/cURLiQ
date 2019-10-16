
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
CREATE TABLE target (
    id                  UUID PRIMARY KEY,
    name                VARCHAR(31) NOT NULL UNIQUE,
    comment             VARCHAR(31) NOT NULL DEFAULT '',
    queue_id            UUID REFERENCES queue(id),
    priority            INTEGER NOT NULL DEFAULT 0,
    online              BOOLEAN NOT NULL DEFAULT FALSE,
    uri_scheme          VARCHAR(6) NOT NULL,
    uri_userinfo        TEXT,
    uri_host            TEXT NOT NULL,
    uri_port            SMALLINT,
    uri_path            TEXT NOT NULL,
    uri_query           TEXT,
    uri_fragment        TEXT,
--
    http_version        VARCHAR(3),
    no_npn              BOOLEAN,
    no_alpn             BOOLEAN,
    tls_version         VARCHAR(3),
    sslv2               BOOLEAN,
    sslv3               BOOLEAN,
    ipv4                BOOLEAN,
    ipv6                BOOLEAN,
    user_agent          TEXT,
    abstract_unix_soc   TEXT,
    append              TEXT,
    auth_method         VARCHAR(9),
    cookie              TEXT,
    use_ascii           BOOLEAN,
    cookie_jar          TEXT,
    continue_at         INTEGER,
    ciphers             TEXT,
    compressed          BOOLEAN,
    compressed_ssh      BOOLEAN,
    connect_timeout     INTEGER,
    connect_to          TEXT,
    config              TEXT,
    create_dirs         BOOLEAN,
    crlf                BOOLEAN,
    crlfile             TEXT,
    data                TEXT,
    dump_header         BOOLEAN,
    data_ascii          TEXT,
    data_binary         TEXT,
    data_raw            TEXT,
    data_urlencode      TEXT,
    delegation_lvl      VARCHAR(6),
    digest              BOOLEAN,
    disable_eprt        BOOLEAN,
    disable_epsv        BOOLEAN,
    disable             BOOLEAN,
    disallow_un_in_url  BOOLEAN,
    dns_interface       TEXT,
    dns_ipv4_addr       TEXT, /* Add validity check */
    dns_ipv6_addr       TEXT, /* Add validity check */
    dns_servers         TEXT, /* Add validity check */
    doh_url             TEXT,
    referer             TEXT,
    cert                TEXT,
    engine              TEXT,
    egd_file            TEXT,
    expect100_timeout   INTEGER,
    fail_early          BOOLEAN,
    fail                BOOLEAN,
    cert_type           VARCHAR(3) DEFAULT 'PEM',
    cacert              TEXT,
    capath              TEXT,
    pinnedpubkey        TEXT,
    cert_status         BOOLEAN,
    false_start         BOOLEAN,
    form                TEXT,
    form_string         TEXT,
    ftp_account         TEXT,
    ftp_alt_to_user     TEXT,
    ftp_create_dirs     BOOLEAN,
    ftp_method          VARCHAR(9),
    ftp_pasv            BOOLEAN,
    ftp_skip_pasv_ip    BOOLEAN,
    ftp_port            TEXT,
    ftp_pret            BOOLEAN,
    ftp_ssl_ccc_mode    VARCHAR(7),
    ftp_ssl_ccc         BOOLEAN,
    ftp_ssl_ccontrol    VARCHAR(7),
    ftp_form_string     TEXT,
    globoff             BOOLEAN,
    get                 BOOLEAN,
    header              TEXT,
    hostpubmd5          VARCHAR(32),
    he_timeout_ms       INTEGER,
    haproxy_protocol    BOOLEAN,
    hpy_eye_tmout_ms    INTEGER,
    head                BOOLEAN,
    http0_9             BOOLEAN,
    http1_0             BOOLEAN,
    http1_1             BOOLEAN,
    http2_prior         BOOLEAN,
    http2               BOOLEAN,
    ignore_cnt_len      BOOLEAN,
    include             BOOLEAN,
    insecure            BOOLEAN,
    interface           TEXT,
    junk_ssn_cookies    BOOLEAN,
    keepalive_time      INTEGER,
    key_type            TEXT,
    key                 TEXT,
    krb_level           VARCHAR(12),
    libcurl             TEXT,
    limit_rate          TEXT,
    local_port          TEXT,
    location_trusted    BOOLEAN,
    location            BOOLEAN,
    login_options       TEXT,
    mail_auth           TEXT,
    mail_from           TEXT,
    mail_rcpt           TEXT,
    max_filesize        INTEGER,
    max_redirs          INTEGER,
    metalink            BOOLEAN,
    negotiate           BOOLEAN,
    netrc_file          TEXT,
    netrc_optional      BOOLEAN,
    netrc               BOOLEAN,
    next                BOOLEAN,
    no_buffer           BOOLEAN,
    no_keepalive        BOOLEAN,
    no_sessionid        BOOLEAN,
    noproxy             TEXT,
    ntlm_wb             BOOLEAN,
    ntlm                BOOLEAN,
    oauth2_bearer       TEXT,
    parallel_max        INTEGER,
    parallel            BOOLEAN,
    path_as_is          BOOLEAN,
    post301             BOOLEAN,
    post302             BOOLEAN,
    post303             BOOLEAN,
    preproxy            TEXT,
    proto_default       TEXT,
    proto_redir         TEXT,
    proto               TEXT,
    proxy_anyauth       BOOLEAN,
    proxy_basic         BOOLEAN,
    proxy_cacert        BOOLEAN,
    proxy_capath        TEXT,
    proxy_cert_type     VARCHAR(3) DEFAULT 'PEM',
    proxy_cert          TEXT,
    proxy_ciphers       TEXT,
    proxy_crlfile       TEXT,
    proxy_digest        BOOLEAN,
    proxy_header        TEXT,
    proxy_insecure      BOOLEAN,
    proxy_key_type      TEXT,
    proxy_key           TEXT,
    proxy_negotiate     BOOLEAN,
    proxy_ntlm          BOOLEAN,
    proxy_pass          TEXT,
    proxy_pinnedpubkey  TEXT,
    proxy_service_name  TEXT,
    proxy_ssl_al_beast  BOOLEAN,
    proxy_tls13_ciphers TEXT,
    proxy_tlsauthtype   TEXT,
    proxy_tlspassword   TEXT,
    proxy_tlsuser       TEXT,
    proxy_tlsv1         BOOLEAN,
    proxy_user          TEXT,
    proxy               TEXT,
    proxy1_0            TEXT,
    proxytunnel         BOOLEAN,
    pubkey              TEXT,
    quote               BOOLEAN,
    random_file         TEXT,
    range               INTEGER,
    raw                 BOOLEAN,
    remote_header_name  BOOLEAN,
    remote_name_all     BOOLEAN,
    remote_name         BOOLEAN,
    remote_time         BOOLEAN,
    request_target      BOOLEAN,
    request             TEXT,
    resolve             TEXT,
    retry_connrefused   BOOLEAN,
    retry_delay         INTEGER,
    retry_max_time      INTEGER,
    retry               INTEGER,
    sasl_authzid        BOOLEAN,
    sasl_ir             BOOLEAN,
    service_name        TEXT,
    show_error          BOOLEAN,
    silent              BOOLEAN,
    socks4              TEXT,
    socks4a             TEXT,
    socks5_basic        BOOLEAN,
    socks5_gssapi_nec   BOOLEAN,
    socks5_gssapi_svc   TEXT,
    socks5_gssapi       BOOLEAN,
    socks5_hostname     TEXT,
    socks5              TEXT,
    speed_limit         INTEGER,
    speed_time          INTEGER,
    ssl_allow_beast     BOOLEAN,
    ssl_no_revoke       BOOLEAN,
    ssl                 BOOLEAN,
    ssl_reqd            BOOLEAN,
    suppress_con_hdrs   BOOLEAN,
    tcp_fastopen        BOOLEAN,
    tcp_nodelay         BOOLEAN,
    telnet_option       TEXT,
    tftp_blksize        INTEGER,
    tftp_no_options     BOOLEAN,
    time_cond           INTEGER,
    tls_max             VARCHAR(3),
    tls13_ciphers       TEXT,
    tlsauthtype         VARCHAR(3),
    tlspassword         TEXT,
    tlsuser             TEXT,
    tlsv1_0             BOOLEAN,
    tlsv1_1             BOOLEAN,
    tlsv1_2             BOOLEAN,
    tlsv1_3             BOOLEAN,
    tlsv1               BOOLEAN,
    tr_encoding         BOOLEAN,
    trace_acsii         TEXT,
    trace_time          BOOLEAN,
    trace               TEXT,
    unix_socket         TEXT,
    upload_file         TEXT,
    url                 TEXT,
    _user               TEXT,
    xattr               BOOLEAN,
-- 
--
    CONSTRAINT target__name_ck CHECK (
        name ~* '^[A-Z_][A-Z0-9_]{0,30}$'
    ),
--
    CONSTRAINT target__uri_scheme_ck CHECK (
        UPPER(uri_scheme) = 'DICT'   OR
        UPPER(uri_scheme) = 'FILE'   OR
        UPPER(uri_scheme) = 'FTP'    OR
        UPPER(uri_scheme) = 'FTPS'   OR
        UPPER(uri_scheme) = 'GOPHER' OR
        UPPER(uri_scheme) = 'HTTP'   OR
        UPPER(uri_scheme) = 'HTTPS'  OR
        UPPER(uri_scheme) = 'IMAP'   OR
        UPPER(uri_scheme) = 'IMAPS'  OR
        UPPER(uri_scheme) = 'LDAP'   OR
        UPPER(uri_scheme) = 'LDAPS'  OR
        UPPER(uri_scheme) = 'POP3'   OR
        UPPER(uri_scheme) = 'POP3S'  OR
        UPPER(uri_scheme) = 'RTMP'   OR
        UPPER(uri_scheme) = 'RTSP'   OR
        UPPER(uri_scheme) = 'SCP'    OR
        UPPER(uri_scheme) = 'SFTP'   OR
        UPPER(uri_scheme) = 'SMB'    OR
        UPPER(uri_scheme) = 'SMBS'   OR
        UPPER(uri_scheme) = 'SMTP'   OR
        UPPER(uri_scheme) = 'SMTPS'  OR
        UPPER(uri_scheme) = 'TELNET' OR
        UPPER(uri_scheme) = 'TFTP'
    ),
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
CREATE TABLE target_group (
    id      UUID PRIMARY KEY,
    name    VARCHAR(31) NOT NULL,
    comment VARCHAR(31) NOT NULL DEFAULT '',
    online  BOOLEAN NOT NULL DEFAULT FALSE
);
--
--
CREATE TABLE contains_target (
    id              UUID PRIMARY KEY,
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
