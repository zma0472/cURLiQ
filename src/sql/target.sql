
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

CREATE TABLE target (
--
    name  TEXT PRIMARY KEY,
    description  TEXT NOT NULL DEFAULT '',
    creation_stamp  TEXT NOT NULL,
    adm_state  BOOLEAN NOT NULL DEFAULT FALSE,
    opr_state  BOOLEAN NOT NULL DEFAULT FALSE,
--
    verbose  BOOLEAN, -- ALL
--
    header  BOOLEAN, -- ALL
--
    noprogress  BOOLEAN, -- ALL
--
    nosignal  BOOLEAN, -- ALL
--
    wildcardmatch  BOOLEAN, -- FTP
--
    suppress_connect_headers  BOOLEAN, -- ALL
--
    stderr  TEXT, -- ALL
--
    failonerror  BOOLEAN, -- HTTP
--
    keep_sending_on_error  BOOLEAN, -- HTTP
--
    url  TEXT, -- ALL
--
    path_as_is  BOOLEAN, -- ALL
--
    protocols  TEXT, -- ALL
--
    redir_protocols  TEXT, -- ALL except FILE, SCP, SMB, SMBS
--
    default_protocol  TEXT, -- ALL
--
    proxy  TEXT, -- ALL except FILE
--
    pre_proxy  TEXT, -- ALL except FILE
-- 
    proxyport  INTEGER, -- ALL
--
    proxytype  TEXT, -- MOST
--
    noproxy  TEXT, -- MOST
--
    httpproxytunnel  BOOLEAN, -- ALL network protocols
--
    socks5_auth  INTEGER, -- ALL
--
    socks5_gssapi_service  TEXT, -- ALL network protocols
--
    socks5_gssapi_nec  BOOLEAN, -- ALL network protocols
--
    proxy_service_name  TEXT, -- ALL network protocols
--
    haproxyprotocol  BOOLEAN, -- HTTP
--
    service_name  TEXT, -- HTTP FTP IMAP POP SMTP
--
    interface  TEXT, -- ALL
--
    localport  INTEGER, -- ALL
--
    localportrange  INTEGER, -- ALL
--
    dns_cache_timeout  INTEGER, -- ALL
--
    doh_url  TEXT, -- ALL
--
    buffersize  INTEGER, -- ALL
--
    port  INTEGER, -- ALL that use a port
--
    tcp_fastopen  BOOLEAN, -- ALL
--
    tcp_nodelay  BOOLEAN, -- ALL
--
    address_scope  INTEGER, -- ALL when using IPv6
--
    tcp_keepalive  INTEGER, -- ALL
--
    tcp_keepidle  INTEGER, -- ALL
--
    tcp_keepintvl  INTEGER, -- ALL
--
    unix_socket_path  TEXT, -- ALL except FILE FTP
--
    abstract_unix_socket  TEXT, -- ALL
--
    netrc  INTEGER, -- MOST
--
    netrc_file  TEXT, -- ALL
--
    userpwd  TEXT, -- MOST
--
    proxyuserpwd  TEXT, -- ALL protocols that can use proxy
--
    username  TEXT, -- MOST
--
    password  TEXT, -- MOST
--
    login_options  TEXT, -- IMAP POP3 SMTP
--
    proxyusername  TEXT, -- MOST
--
    proxypassword  TEXT, -- MOST
--
--  curlauth_* are used to set bits in the CURLOPT_HTTPAUTH bitmask 
--
    curlauth_basic  BOOLEAN, -- HTTP
--
    curlauth_digest  BOOLEAN, -- HTTP
--
    curlauth_digest_ie  BOOLEAN, -- HTTP
--
    curlauth_bearer  BOOLEAN, -- HTTP
--
    curlopt_xoauth2_bearer  TEXT, -- HTTP IMAP POP3 SMTP
--
    curlauth_negotiate  BOOLEAN, -- HTTP
--
    curlauth_ntlm  BOOLEAN, -- HTTP
--
    curauth_ntlm_wb  BOOLEAN, -- HTTP
--
    curauth_any  BOOLEAN, -- HTTP
--
    curauth_anysafe  BOOLEAN, -- HTTP
--
    curauth_only  BOOLEAN, -- HTTP
--
    tlsauth_username  TEXT, -- ALL TLS-based protocols
--
    proxy_tlsauth_username  TEXT, -- ALL
--
    tlsauth_password  TEXT, -- ALL TLS-based protocols
--
    proxy_tlsauth_password  TEXT, -- ALL TLS-based protocols
--
    tlsauth_type  TEXT, -- ALL TLS-based protocols
--
    proxy_tlsauth_type  TEXT, -- ALL TLS-based protocols
--
--  proxyauth_curlauth_basic is used to set the CURLOPT_PROXYAUTH bitmask
    proxyauth_curlauth_basic  BOOLEAN, -- HTTP
--
    sasl_authzid  TEXT, -- IMAP POP3 SMTP
--
    sasl_ir  BOOLEAN, -- IMAP POP3 SMTP
--
    disallow_username_in_url  BOOLEAN, -- Several
--
    autoreferer  BOOLEAN, -- HTTP
--
    accept_encoding  TEXT, -- HTTP
--
    transfer_encoding  BOOLEAN, -- HTTP
--
    followlocation  BOOLEAN, -- HTTP HTTPS
--
    unrestricted_auth  BOOLEAN, -- HTTP
--
    maxredirs  INTEGER, -- HTTP HTTPS
--
--  redir_post_* are booleans used to set bits in CURLOPT_POSTREDIR bitmask
--
    redir_post_301  BOOLEAN, -- HTTP HTTPS
--
    redir_post_302  BOOLEAN, -- HTTP HTTPS
--
    redir_post_303  BOOLEAN, -- HTTP HTTPS
--
    redir_post_all  BOOLEAN, -- HTTP HTTPS
--
    put  BOOLEAN, -- HTTP HTTPS
--
    post  BOOLEAN, -- HTTP
--
    postfields  TEXT, -- HTTP
--
    postfieldsize  INTEGER, -- HTTP
--
    postfieldsize_large  INTEGER, -- HTTP HTTPS
--
    copypostfields  TEXT, -- HTTP HTTPS
--
    referer  TEXT, -- HTTP
--
    useragent  TEXT, -- HTTP HTTPS
--
    httpheader  TEXT, -- HTTP
--
--  curlheader_* are used to set bits in CURLOPT_HEADEROPT bitmask
--
    curlheader_unified  BOOLEAN, -- HTTP
--
    curlheader_separate  BOOLEAN, -- HTTP
--
    proxyheader  TEXT, -- HTTP
--
    http200aliases  TEXT, -- HTTP
--
    cookie  TEXT, -- HTTP
--
    cookiefile  TEXT, -- HTTP
--
    cookiejar  TEXT, -- HTTP
--
    cookiesession  BOOLEAN, -- HTTP
--
    cookielist  TEXT, -- HTTP
--
    altsvc  TEXT, -- HTTPS
--
--  curlaltsvc_* are booleans used to set bits in the  CURLOPT_ALTSVC_CTRL mask
--
    curlaltsvc_immediately  BOOLEAN, -- HTTPS
--
    curlaltsvc_readonlyfile  BOOLEAN, -- HTTPS
--
    curlaltsvc_h1  BOOLEAN, -- HTTPS
--
    curlaltsvc_h2  BOOLEAN, -- HTTPS
--
    curlaltsvc_h3  BOOLEAN, -- HTTPS
--
    httpget  BOOLEAN, -- HTTP HTTPS
--
    request_target  TEXT, -- HTTP
--
--  http_version must be one of CURL_HTTP_VERSION_NONE, CURL_HTTP_VERSION_1_0,
--  CURL_HTTP_VERSION_1_1, CURL_HTTP_VERSION_2_0, CURL_HTTP_VERSION_2TLS,
--  CURL_HTTP_VERSION_PRIOR_KNOWLEDGE, CURL_HTTP_VERSION_3
--
    http_version  TEXT, -- HTTP
--
    http09_allowed  BOOLEAN, -- HTTP
--
    ignore_content_length  BOOLEAN, -- HTTP
--
    http_content_decoding  BOOLEAN, -- HTTP
--
    http_transfer_decoding  BOOLEAN, -- HTTP
--
    expect_100_timeout_ms  INTEGER, -- HTTP
--
    pipewait  BOOLEAN, -- HTTP HTTPS
--
    stream_weight  INTEGER, -- HTTP/2  Constraint to [1 - 256]
--
    mail_from  TEXT, -- SMTP
--
    mail_rcpt  TEXT, -- SMTP
--
    mail_auth  TEXT, -- SMTP
--
    tftp_blksize  INTEGER, -- TFTP
--
    tftp_no_options  BOOLEAN, -- TFTP
--
    ftpport  TEXT, -- FTP
--
    quote  TEXT, -- FTP SFTP
--
    postquote  TEXT, -- FTP SFTP
--
    prequote  TEXT, -- FTP
--
    append  BOOLEAN, -- FTP
--
    ftp_use_eprt  BOOLEAN, -- FTP
--
    ftp_use_epsv  BOOLEAN, -- FTP
--
    ftp_use_pret  BOOLEAN, -- FTP
--
    ftp_create_missing_dirs  TEXT, -- FTP SFTP
--  ftp_create_missing_dirs must be one of CURLFTP_CREATE_DIR_NONE,
--  CURLFTP_CREATE_DIR, or CURLFTP_CREATE_DIR_RETRY
--
    ftp_response_timeout  INTEGER, -- FTP
--
    ftp_alternative_to_user  TEXT, -- FTP
--
    ftp_skip_pasv_ip  BOOLEAN, -- FTP
--
    ftpsslauth  TEXT, -- FTP
--  ftpsslauth must be one of CURLFTPAUTH_DEFAULT, CURLFTPAUTH_SSL, or
--  CURLFTPAUTH_TLS
--
    ftp_ssl_ccc  TEXT, -- FTP
--  ftp_ssl_ccc must be one of CURLFTPSSL_CCC_NONE, CURLFTPSSL_CCC_PASSIVE, or
--  CURLFTPSSL_CCC_ACTIVE
--
    ftp_account  TEXT, -- FTP
--
    ftp_filemethod  TEXT, -- FTP
--  ftp_filemethod must be one of CURLFTPMETHOD_MULTICWD, CURLFTPMETHOD_NOCWD,
--  or CURLFTPMETHOD_SINGLECWD
--
--  rtsp_request must be one of CURL_RTSPREQ_OPTIONS, CURL_RTSPREQ_DESCRIBE,
--  CURL_RTSPREQ_ANNOUNCE, CURL_RTSPREQ_SETUP, CURL_RTSPREQ_PLAY,
--  CURL_RTSPREQ_PAUSE, CURL_RTSPREQ_TEARDOWN, CURL_RTSPREQ_GET_PARAMETER,
--  CURL_RTSPREQ_SET_PARAMETER, CURL_RTSPREQ_RECORD, CURL_RTSPREQ_RECEIVE
    rtsp_request  TEXT, -- RTSP
--
    rtsp_session_id  TEXT, -- RTSP
--
    rtsp_stream_uri  TEXT, -- RTSP
--
    rtsp_transport  TEXT, -- RTSP
--
    rtsp_client_cseq  INTEGER, -- RTSP
--
    rtsp_server_cseq  INTEGER, -- RTSP
--
    transfertext  BOOLEAN, -- FTP
--
    proxy_transfer_mode  BOOLEAN, -- FTP
--
    crlf  BOOLEAN, -- FTP
--
    range  TEXT, -- HTTP FTP FILE RTSP SFTP
--
    resume_from  INTEGER, -- HTTP FTP SFTP FILE
--
    resume_from_large  INTEGER, -- HTTP FTP SFTP FILE
--
    curlu  TEXT, -- ALL
--
    customrequest  TEXT, -- HTTP FTP IMAP POP3 SMTP
--
    filetime  BOOLEAN, -- HTTP FTP SFTP FILE
--
    dirlistonly  BOOLEAN, -- FTP SFTP POP3
--
    nobody  BOOLEAN, -- MOST
--
    infilesize  INTEGER, -- MANY
--
    infilesize_large  INTEGER, -- MANY
--
    upload  BOOLEAN, -- MOST
--
    upload_buffersize  INTEGER, -- ALL
--
    timecondition  TEXT, -- HTTP FTP RTSP FILE
--  timecondition must be one of CURL_TIMECOND_IFMODSINCE or
--  CURL_TIMECOND_IFUNMODSINCE.
--
    timevalue  INTEGER, -- HTTP FTP RTSP FILE
--
    timevalue_large  INTEGER, -- HTTP FTP RTSP FILE
--
    timeout  INTEGER, -- ALL
--
    timeout_ms  INTEGER, -- ALL
--
    low_speed_limit  INTEGER, -- ALL
--
    low_speed_time  INTEGER, -- ALL
--
    max_send_speed_large  INTEGER, -- ALL
--
    maxconnects  INTEGER, -- MOST
--
    fresh_connect  BOOLEAN, -- MOST
--
    forbid_reuse  BOOLEAN, -- MOST
--
    maxage_conn  INTEGER, -- ALL
--
    connecttimeout  INTEGER, -- ALL
--
    connecttimeout_ms  INTEGER, -- ALL
--
    ipresolve  TEXT, -- ALL
--  ipresolve must be one of CURL_IPRESOLVE_WHATEVER CURL_IPRESOLVE_V4
--  CURL_IPRESOLVE_V6
--
    connect_only  BOOLEAN, -- HTTP SMTP POP3 IMAP
--
    use_ssl  TEXT, -- FTP SMTP POP3 IMAP
--  use_ssl must be one of CURLUSESSL_NONE CURLUSESSL_TRY CURLUSESSL_CONTROL
--  CURLUSESSL_ALL
--
    resolve  TEXT, -- ALL
--
    dns_interface  TEXT, -- ALL
--
    dns_local_ip4  TEXT, -- ALL
--
    dns_local_ip6  TEXT, -- ALL
--
    dns_servers  TEXT, -- ALL
--
    dns_shuffle_addresses  BOOLEAN, -- ALL
--
    accepttimeout_ms  INTEGER, -- FTP
--
    happy_eyeballs_timeout_ms  INTEGER, -- ALL
--
    upkeep_interval_ms  INTEGER, -- ALL
--
    sslcert  TEXT, -- ALL TLS-based protocols
--
    proxy_sslcert  TEXT, -- ALL TLS-based protocols
--
    sslcerttype  TEXT, -- ALL TLS-based protocols
--
    proxy_sslcerttype  TEXT, -- ALL TLS-based protocols
--
    sslkey  TEXT, -- ALL TLS-based protocols
--
    proxy_sslkey  TEXT, -- ALL
--
    sslkeytype  TEXT, -- ALL TLS-based protocols.
--
    proxy_sslkeytype  TEXT, -- ALL TLS-based protocols.
--
    keypasswd  TEXT, -- ALL TLS-based protocols.
--
    proxy_keypasswd  TEXT, -- Used with HTTP proxy
--
    ssl_enable_alpn  BOOLEAN, -- HTTP
--
    ssl_enable_npn  BOOLEAN, -- HTTP
--
    sslengine  TEXT, -- ALL TLS-based protocols.
--
    sslengine_default  BOOLEAN, -- ALL TLS-based protocols.
--
    ssl_falsestart  BOOLEAN, -- ALL TLS-based protocols
--
    sslversion  TEXT, -- ALL TLS-based protocols add CONSTRAINT
--
    proxy_sslversion  INTEGER, -- ALL using HTTPS proxy
--
    ssl_verifyhost  INTEGER, -- ALL TLS-based protocols 
--
    proxy_ssl_verifyhost  INTEGER, -- ALL using HTTPS proxy
--
    ssl_verifypeer  BOOLEAN, -- ALL TLS-based protocols
--
    proxy_ssl_verifypeer  BOOLEAN, -- ALL TLS-based protocols
--
    ssl_verifystatus  BOOLEAN, -- ALL TLS-based protocols
--
    cainfo  TEXT, -- ALL TLS-based protocols
--
    proxy_cainfo  TEXT, -- ALL protocols using HTTPS proxy
--
    issuercert  TEXT, -- ALL TLS-based protocols
--
    capath  TEXT, -- ALL TLS-based protocols
--
    proxy_capat  TEXT, -- ALL protocols using HTTPS proxy
--
    crlfile  TEXT, -- ALL TLS-based protocols
--
    proxy_crlfile  TEXT, -- ALL protocols using HTTPS proxy
--
    certinfo  BOOLEAN, -- ALL TLS-based protocols
--
    pinnedpublickey  TEXT, -- ALL TLS-based protocols
--
    proxy_pinnedpublickey  TEXT, -- ALL TLS-based protocols
--
    random_file  TEXT, -- ALL
--
    egdsocket  TEXT, -- ALL TLS-based protocols
--
    ssl_cipher_list  TEXT, -- ALL  TLS-based protocols
--
    proxy_ssl_cipher_list  TEXT, -- ALL
--
    tls13_ciphers  TEXT, -- ALL TLS-based protocols
--
    proxy_tls13_ciphers  TEXT, -- ALL TLS-based protocols
--
    ssl_sessionid_cache  BOOLEAN, -- ALL TLS-based protocols
--
--  curlsslopt_allow_beast and curlsslopt_no_revoke are used to set bits in the
--  curlopt_ssl_options mask
--
    curlsslopt_allow_beast  BOOLEAN, -- ALL TLS-based protocols
--
    curlsslopt_no_revoke  BOOLEAN, -- ALL TLS-based protocols
--
--  proxy_allow_beast and proxy_no_revoke are used to set bits in the
--  curlopt_proxy_ssl_options mask
--
    proxy_allow_beast  BOOLEAN, -- ALL
  
    proxy_no_revoke  BOOLEAN, -- ALL
--
    krblevel  TEXT, -- FTP
--
    gssapi_delegation  TEXT, -- HTTP
--  gssapi_delegation must be one of CURLGSSAPI_DELEGATION_FLAG or
--  CURLGSSAPI_DELEGATION_POLICY_FLAG  or CURLGSSAPI_DELEGATION_NONE
--
--  curlssh_auth_publickey, curlssh_auth_password, curlssh_auth_host,
--  curlssh_auth_keyboard, curlssh_auth_agent, and curlssh_auth_any are used to
--  set bits in the curlopt_ssh_auth_types mask
--
    curlssh_auth_publickey  BOOLEAN, -- SFTP SCP
--
    curlssh_auth_password  BOOLEAN, -- SFTP SCP
--
    curlssh_auth_host  BOOLEAN, -- SFTP SCP
--
    curlssh_auth_keyboard  BOOLEAN, -- SFTP SCP
--
    curlssh_auth_agent  BOOLEAN, -- SFTP SCP
--
    curlssh_auth_any  BOOLEAN, -- SFTP SCP
--
    ssh_compression  BOOLEAN, -- SFTP SCP
--
    ssh_host_public_key_md5  TEXT, -- SFTP SCP
--
    ssh_public_keyfile  TEXT, -- SFTP SCP
--
    ssh_private_keyfile  TEXT, -- SFTP SCP
--
    ssh_knownhosts  TEXT, -- SFTP SCP
--
    new_file_perms  INTEGER, -- SFTP SCP FILE
--
    new_directory_perms  INTEGER, -- SFTP SCP FILE
--
    telnetoptions  TEXT, -- TELNET
--
--
--
    CONSTRAINT target__name_type_ck CHECK (
        TYPEOF(name) IS 'text'
    ),
--
    CONSTRAINT target__name_rgx_ck CHECK (
        name REGEXP '^[A-Z_][A-Z0-9_]{0,14}$'
    ),
--
    CONSTRAINT target__adm_state_type_ck CHECK (
        TYPEOF(adm_state) IS 'integer'
    ),
--
    CONSTRAINT target__adm_state_value_ck CHECK (
        adm_state = 0 OR adm_state = 1
    ),
--
    CONSTRAINT target__opr_state_type_ck CHECK (
        TYPEOF(opr_state) IS 'integer'
    ),
--
    CONSTRAINT target__opr_state_value_ck CHECK (
        opr_state = 0 OR opr_state = 1
    ),
--
    CONSTRAINT target__exclude_soft_up_ck CHECK (
        (adm_state IS TRUE) OR (opr_state IS FALSE)
    )
--
    CONSTRAINT target__verbose_bool_ck CHECK (
        typeof( verbose ) = 'integer'
        AND
        ( verbose = 0 OR verbose = 1 )
    ),
--
    CONSTRAINT target__header_bool_ck CHECK (
        typeof( header ) = 'integer'
        AND
        ( header = 0 OR header = 1 )
    ),
--
    CONSTRAINT target__noprogress_bool_ck CHECK (
        typeof( noprogress ) = 'integer'
        AND
        ( noprogress = 0 OR noprogress = 1 )
    ),
--
    CONSTRAINT target__nosignal_bool_ck CHECK (
        typeof( nosignal ) = 'integer'
        AND
        ( nosignal = 0 OR nosignal = 1 )
    ),
--
    CONSTRAINT target__wildcardmatch_bool_ck CHECK (
        typeof( wildcardmatch ) = 'integer'
        AND
        ( wildcardmatch = 0 OR wildcardmatch = 1 )
    ),
--
    CONSTRAINT target__suppress_connect_headers_bool_ck CHECK (
        typeof( suppress_connect_headers ) = 'integer'
        AND
        ( suppress_connect_headers = 0 OR suppress_connect_headers = 1 )
    ),
--
    CONSTRAINT target__failonerror_bool_ck CHECK (
        typeof( failonerror ) = 'integer'
        AND
        ( failonerror = 0 OR failonerror = 1 )
    ),
--
    CONSTRAINT target__keep_sending_on_error_bool_ck CHECK (
        typeof( keep_sending_on_error ) = 'integer'
        AND
        ( keep_sending_on_error = 0 OR keep_sending_on_error = 1 )
    ),
--
    CONSTRAINT target__path_as_is_bool_ck CHECK (
        typeof( path_as_is ) = 'integer'
        AND
        ( path_as_is = 0 OR path_as_is = 1 )
    ),
--
    CONSTRAINT target__httpproxytunnel_bool_ck CHECK (
        typeof( httpproxytunnel ) = 'integer'
        AND
        ( httpproxytunnel = 0 OR httpproxytunnel = 1 )
    ),
--
    CONSTRAINT target__socks5_gssapi_nec_bool_ck CHECK (
        typeof( socks5_gssapi_nec ) = 'integer'
        AND
        ( socks5_gssapi_nec = 0 OR socks5_gssapi_nec = 1 )
    ),
--
    CONSTRAINT target__haproxyprotocol_bool_ck CHECK (
        typeof( haproxyprotocol ) = 'integer'
        AND
        ( haproxyprotocol = 0 OR haproxyprotocol = 1 )
    ),
--
    CONSTRAINT target__tcp_fastopen_bool_ck CHECK (
        typeof( tcp_fastopen ) = 'integer'
        AND
        ( tcp_fastopen = 0 OR tcp_fastopen = 1 )
    ),
--
    CONSTRAINT target__tcp_nodelay_bool_ck CHECK (
        typeof( tcp_nodelay ) = 'integer'
        AND
        ( tcp_nodelay = 0 OR tcp_nodelay = 1 )
    ),
--
    CONSTRAINT target__curlauth_basic_bool_ck CHECK (
        typeof( curlauth_basic ) = 'integer'
        AND
        ( curlauth_basic = 0 OR curlauth_basic = 1 )
    ),
--
    CONSTRAINT target__curlauth_digest_bool_ck CHECK (
        typeof( curlauth_digest ) = 'integer'
        AND
        ( curlauth_digest = 0 OR curlauth_digest = 1 )
    ),
--
    CONSTRAINT target__curlauth_digest_ie_bool_ck CHECK (
        typeof( curlauth_digest_ie ) = 'integer'
        AND
        ( curlauth_digest_ie = 0 OR curlauth_digest_ie = 1 )
    ),
--
    CONSTRAINT target__curlauth_bearer_bool_ck CHECK (
        typeof( curlauth_bearer ) = 'integer'
        AND
        ( curlauth_bearer = 0 OR curlauth_bearer = 1 )
    ),
--
    CONSTRAINT target__curlauth_negotiate_bool_ck CHECK (
        typeof( curlauth_negotiate ) = 'integer'
        AND
        ( curlauth_negotiate = 0 OR curlauth_negotiate = 1 )
    ),
--
    CONSTRAINT target__curlauth_ntlm_bool_ck CHECK (
        typeof( curlauth_ntlm ) = 'integer'
        AND
        ( curlauth_ntlm = 0 OR curlauth_ntlm = 1 )
    ),
--
    CONSTRAINT target__curauth_ntlm_wb_bool_ck CHECK (
        typeof( curauth_ntlm_wb ) = 'integer'
        AND
        ( curauth_ntlm_wb = 0 OR curauth_ntlm_wb = 1 )
    ),
--
    CONSTRAINT target__curauth_any_bool_ck CHECK (
        typeof( curauth_any ) = 'integer'
        AND
        ( curauth_any = 0 OR curauth_any = 1 )
    ),
--
    CONSTRAINT target__curauth_anysafe_bool_ck CHECK (
        typeof( curauth_anysafe ) = 'integer'
        AND
        ( curauth_anysafe = 0 OR curauth_anysafe = 1 )
    ),
--
    CONSTRAINT target__curauth_only_bool_ck CHECK (
        typeof( curauth_only ) = 'integer'
        AND
        ( curauth_only = 0 OR curauth_only = 1 )
    ),
--
    CONSTRAINT target__proxyauth_curlauth_basic_bool_ck CHECK (
        typeof( proxyauth_curlauth_basic ) = 'integer'
        AND
        ( proxyauth_curlauth_basic = 0 OR proxyauth_curlauth_basic = 1 )
    ),
--
    CONSTRAINT target__sasl_ir_bool_ck CHECK (
        typeof( sasl_ir ) = 'integer'
        AND
        ( sasl_ir = 0 OR sasl_ir = 1 )
    ),
--
    CONSTRAINT target__disallow_username_in_url_bool_ck CHECK (
        typeof( disallow_username_in_url ) = 'integer'
        AND
        ( disallow_username_in_url = 0 OR disallow_username_in_url = 1 )
    ),
--
    CONSTRAINT target__autoreferer_bool_ck CHECK (
        typeof( autoreferer ) = 'integer'
        AND
        ( autoreferer = 0 OR autoreferer = 1 )
    ),
--
    CONSTRAINT target__transfer_encoding_bool_ck CHECK (
        typeof( transfer_encoding ) = 'integer'
        AND
        ( transfer_encoding = 0 OR transfer_encoding = 1 )
    ),
--
    CONSTRAINT target__followlocation_bool_ck CHECK (
        typeof( followlocation ) = 'integer'
        AND
        ( followlocation = 0 OR followlocation = 1 )
    ),
--
    CONSTRAINT target__unrestricted_auth_bool_ck CHECK (
        typeof( unrestricted_auth ) = 'integer'
        AND
        ( unrestricted_auth = 0 OR unrestricted_auth = 1 )
    ),
--
    CONSTRAINT target__redir_post_301_bool_ck CHECK (
        typeof( redir_post_301 ) = 'integer'
        AND
        ( redir_post_301 = 0 OR redir_post_301 = 1 )
    ),
--
    CONSTRAINT target__redir_post_302_bool_ck CHECK (
        typeof( redir_post_302 ) = 'integer'
        AND
        ( redir_post_302 = 0 OR redir_post_302 = 1 )
    ),
--
    CONSTRAINT target__redir_post_303_bool_ck CHECK (
        typeof( redir_post_303 ) = 'integer'
        AND
        ( redir_post_303 = 0 OR redir_post_303 = 1 )
    ),
--
    CONSTRAINT target__redir_post_all_bool_ck CHECK (
        typeof( redir_post_all ) = 'integer'
        AND
        ( redir_post_all = 0 OR redir_post_all = 1 )
    ),
--
    CONSTRAINT target__put_bool_ck CHECK (
        typeof( put ) = 'integer'
        AND
        ( put = 0 OR put = 1 )
    ),
--
    CONSTRAINT target__post_bool_ck CHECK (
        typeof( post ) = 'integer'
        AND
        ( post = 0 OR post = 1 )
    ),
--
    CONSTRAINT target__curlheader_unified_bool_ck CHECK (
        typeof( curlheader_unified ) = 'integer'
        AND
        ( curlheader_unified = 0 OR curlheader_unified = 1 )
    ),
--
    CONSTRAINT target__curlheader_separate_bool_ck CHECK (
        typeof( curlheader_separate ) = 'integer'
        AND
        ( curlheader_separate = 0 OR curlheader_separate = 1 )
    ),
--
    CONSTRAINT target__cookiesession_bool_ck CHECK (
        typeof( cookiesession ) = 'integer'
        AND
        ( cookiesession = 0 OR cookiesession = 1 )
    ),
--
    CONSTRAINT target__curlaltsvc_immediately_bool_ck CHECK (
        typeof( curlaltsvc_immediately ) = 'integer'
        AND
        ( curlaltsvc_immediately = 0 OR curlaltsvc_immediately = 1 )
    ),
--
    CONSTRAINT target__curlaltsvc_readonlyfile_bool_ck CHECK (
        typeof( curlaltsvc_readonlyfile ) = 'integer'
        AND
        ( curlaltsvc_readonlyfile = 0 OR curlaltsvc_readonlyfile = 1 )
    ),
--
    CONSTRAINT target__curlaltsvc_h1_bool_ck CHECK (
        typeof( curlaltsvc_h1 ) = 'integer'
        AND
        ( curlaltsvc_h1 = 0 OR curlaltsvc_h1 = 1 )
    ),
--
    CONSTRAINT target__curlaltsvc_h2_bool_ck CHECK (
        typeof( curlaltsvc_h2 ) = 'integer'
        AND
        ( curlaltsvc_h2 = 0 OR curlaltsvc_h2 = 1 )
    ),
--
    CONSTRAINT target__curlaltsvc_h3_bool_ck CHECK (
        typeof( curlaltsvc_h3 ) = 'integer'
        AND
        ( curlaltsvc_h3 = 0 OR curlaltsvc_h3 = 1 )
    ),
--
    CONSTRAINT target__httpget_bool_ck CHECK (
        typeof( httpget ) = 'integer'
        AND
        ( httpget = 0 OR httpget = 1 )
    ),
--
    CONSTRAINT target__http09_allowed_bool_ck CHECK (
        typeof( http09_allowed ) = 'integer'
        AND
        ( http09_allowed = 0 OR http09_allowed = 1 )
    ),
--
    CONSTRAINT target__ignore_content_length_bool_ck CHECK (
        typeof( ignore_content_length ) = 'integer'
        AND
        ( ignore_content_length = 0 OR ignore_content_length = 1 )
    ),
--
    CONSTRAINT target__http_content_decoding_bool_ck CHECK (
        typeof( http_content_decoding ) = 'integer'
        AND
        ( http_content_decoding = 0 OR http_content_decoding = 1 )
    ),
--
    CONSTRAINT target__http_transfer_decoding_bool_ck CHECK (
        typeof( http_transfer_decoding ) = 'integer'
        AND
        ( http_transfer_decoding = 0 OR http_transfer_decoding = 1 )
    ),
--
    CONSTRAINT target__pipewait_bool_ck CHECK (
        typeof( pipewait ) = 'integer'
        AND
        ( pipewait = 0 OR pipewait = 1 )
    ),
--
    CONSTRAINT target__tftp_no_options_bool_ck CHECK (
        typeof( tftp_no_options ) = 'integer'
        AND
        ( tftp_no_options = 0 OR tftp_no_options = 1 )
    ),
--
    CONSTRAINT target__append_bool_ck CHECK (
        typeof( append ) = 'integer'
        AND
        ( append = 0 OR append = 1 )
    ),
--
    CONSTRAINT target__ftp_use_eprt_bool_ck CHECK (
        typeof( ftp_use_eprt ) = 'integer'
        AND
        ( ftp_use_eprt = 0 OR ftp_use_eprt = 1 )
    ),
--
    CONSTRAINT target__ftp_use_epsv_bool_ck CHECK (
        typeof( ftp_use_epsv ) = 'integer'
        AND
        ( ftp_use_epsv = 0 OR ftp_use_epsv = 1 )
    ),
--
    CONSTRAINT target__ftp_use_pret_bool_ck CHECK (
        typeof( ftp_use_pret ) = 'integer'
        AND
        ( ftp_use_pret = 0 OR ftp_use_pret = 1 )
    ),
--
    CONSTRAINT target__ftp_skip_pasv_ip_bool_ck CHECK (
        typeof( ftp_skip_pasv_ip ) = 'integer'
        AND
        ( ftp_skip_pasv_ip = 0 OR ftp_skip_pasv_ip = 1 )
    ),
--
    CONSTRAINT target__transfertext_bool_ck CHECK (
        typeof( transfertext ) = 'integer'
        AND
        ( transfertext = 0 OR transfertext = 1 )
    ),
--
    CONSTRAINT target__proxy_transfer_mode_bool_ck CHECK (
        typeof( proxy_transfer_mode ) = 'integer'
        AND
        ( proxy_transfer_mode = 0 OR proxy_transfer_mode = 1 )
    ),
--
    CONSTRAINT target__crlf_bool_ck CHECK (
        typeof( crlf ) = 'integer'
        AND
        ( crlf = 0 OR crlf = 1 )
    ),
--
    CONSTRAINT target__filetime_bool_ck CHECK (
        typeof( filetime ) = 'integer'
        AND
        ( filetime = 0 OR filetime = 1 )
    ),
--
    CONSTRAINT target__dirlistonly_bool_ck CHECK (
        typeof( dirlistonly ) = 'integer'
        AND
        ( dirlistonly = 0 OR dirlistonly = 1 )
    ),
--
    CONSTRAINT target__nobody_bool_ck CHECK (
        typeof( nobody ) = 'integer'
        AND
        ( nobody = 0 OR nobody = 1 )
    ),
--
    CONSTRAINT target__upload_bool_ck CHECK (
        typeof( upload ) = 'integer'
        AND
        ( upload = 0 OR upload = 1 )
    ),
--
    CONSTRAINT target__fresh_connect_bool_ck CHECK (
        typeof( fresh_connect ) = 'integer'
        AND
        ( fresh_connect = 0 OR fresh_connect = 1 )
    ),
--
    CONSTRAINT target__forbid_reuse_bool_ck CHECK (
        typeof( forbid_reuse ) = 'integer'
        AND
        ( forbid_reuse = 0 OR forbid_reuse = 1 )
    ),
--
    CONSTRAINT target__connect_only_bool_ck CHECK (
        typeof( connect_only ) = 'integer'
        AND
        ( connect_only = 0 OR connect_only = 1 )
    ),
--
    CONSTRAINT target__dns_shuffle_addresses_bool_ck CHECK (
        typeof( dns_shuffle_addresses ) = 'integer'
        AND
        ( dns_shuffle_addresses = 0 OR dns_shuffle_addresses = 1 )
    ),
--
    CONSTRAINT target__ssl_enable_alpn_bool_ck CHECK (
        typeof( ssl_enable_alpn ) = 'integer'
        AND
        ( ssl_enable_alpn = 0 OR ssl_enable_alpn = 1 )
    ),
--
    CONSTRAINT target__ssl_enable_npn_bool_ck CHECK (
        typeof( ssl_enable_npn ) = 'integer'
        AND
        ( ssl_enable_npn = 0 OR ssl_enable_npn = 1 )
    ),
--
    CONSTRAINT target__sslengine_default_bool_ck CHECK (
        typeof( sslengine_default ) = 'integer'
        AND
        ( sslengine_default = 0 OR sslengine_default = 1 )
    ),
--
    CONSTRAINT target__ssl_falsestart_bool_ck CHECK (
        typeof( ssl_falsestart ) = 'integer'
        AND
        ( ssl_falsestart = 0 OR ssl_falsestart = 1 )
    ),
--
    CONSTRAINT target__ssl_verifypeer_bool_ck CHECK (
        typeof( ssl_verifypeer ) = 'integer'
        AND
        ( ssl_verifypeer = 0 OR ssl_verifypeer = 1 )
    ),
--
    CONSTRAINT target__proxy_ssl_verifypeer_bool_ck CHECK (
        typeof( proxy_ssl_verifypeer ) = 'integer'
        AND
        ( proxy_ssl_verifypeer = 0 OR proxy_ssl_verifypeer = 1 )
    ),
--
    CONSTRAINT target__ssl_verifystatus_bool_ck CHECK (
        typeof( ssl_verifystatus ) = 'integer'
        AND
        ( ssl_verifystatus = 0 OR ssl_verifystatus = 1 )
    ),
--
    CONSTRAINT target__certinfo_bool_ck CHECK (
        typeof( certinfo ) = 'integer'
        AND
        ( certinfo = 0 OR certinfo = 1 )
    ),
--
    CONSTRAINT target__ssl_sessionid_cache_bool_ck CHECK (
        typeof( ssl_sessionid_cache ) = 'integer'
        AND
        ( ssl_sessionid_cache = 0 OR ssl_sessionid_cache = 1 )
    ),
--
    CONSTRAINT target__curlsslopt_allow_beast_bool_ck CHECK (
        typeof( curlsslopt_allow_beast ) = 'integer'
        AND
        ( curlsslopt_allow_beast = 0 OR curlsslopt_allow_beast = 1 )
    ),
--
    CONSTRAINT target__curlsslopt_no_revoke_bool_ck CHECK (
        typeof( curlsslopt_no_revoke ) = 'integer'
        AND
        ( curlsslopt_no_revoke = 0 OR curlsslopt_no_revoke = 1 )
    ),
--
    CONSTRAINT target__proxy_allow_beast_bool_ck CHECK (
        typeof( proxy_allow_beast ) = 'integer'
        AND
        ( proxy_allow_beast = 0 OR proxy_allow_beast = 1 )
    ),
--
    CONSTRAINT target__proxy_no_revoke_bool_ck CHECK (
        typeof( proxy_no_revoke ) = 'integer'
        AND
        ( proxy_no_revoke = 0 OR proxy_no_revoke = 1 )
    ),
--
    CONSTRAINT target__curlssh_auth_publickey_bool_ck CHECK (
        typeof( curlssh_auth_publickey ) = 'integer'
        AND
        ( curlssh_auth_publickey = 0 OR curlssh_auth_publickey = 1 )
    ),
--
    CONSTRAINT target__curlssh_auth_password_bool_ck CHECK (
        typeof( curlssh_auth_password ) = 'integer'
        AND
        ( curlssh_auth_password = 0 OR curlssh_auth_password = 1 )
    ),
--
    CONSTRAINT target__curlssh_auth_host_bool_ck CHECK (
        typeof( curlssh_auth_host ) = 'integer'
        AND
        ( curlssh_auth_host = 0 OR curlssh_auth_host = 1 )
    ),
--
    CONSTRAINT target__curlssh_auth_keyboard_bool_ck CHECK (
        typeof( curlssh_auth_keyboard ) = 'integer'
        AND
        ( curlssh_auth_keyboard = 0 OR curlssh_auth_keyboard = 1 )
    ),
--
    CONSTRAINT target__curlssh_auth_agent_bool_ck CHECK (
        typeof( curlssh_auth_agent ) = 'integer'
        AND
        ( curlssh_auth_agent = 0 OR curlssh_auth_agent = 1 )
    ),
--
    CONSTRAINT target__curlssh_auth_any_bool_ck CHECK (
        typeof( curlssh_auth_any ) = 'integer'
        AND
        ( curlssh_auth_any = 0 OR curlssh_auth_any = 1 )
    ),
--
    CONSTRAINT target__ssh_compression_bool_ck CHECK (
        typeof( ssh_compression ) = 'integer'
        AND
        ( ssh_compression = 0 OR ssh_compression = 1 )
    ),
--
    CONSTRAINT target__proxyport_int_ck CHECK (
        typeof( proxyport ) = 'integer'
    ),
--
    CONSTRAINT target__socks5_auth_int_ck CHECK (
        typeof( socks5_auth ) = 'integer'
    ),
--
    CONSTRAINT target__localport_int_ck CHECK (
        typeof( localport ) = 'integer'
    ),
--
    CONSTRAINT target__localportrange_int_ck CHECK (
        typeof( localportrange ) = 'integer'
    ),
--
    CONSTRAINT target__dns_cache_timeout_int_ck CHECK (
        typeof( dns_cache_timeout ) = 'integer'
    ),
--
    CONSTRAINT target__buffersize_int_ck CHECK (
        typeof( buffersize ) = 'integer'
    ),
--
    CONSTRAINT target__port_int_ck CHECK (
        typeof( port ) = 'integer'
    ),
--
    CONSTRAINT target__address_scope_int_ck CHECK (
        typeof( address_scope ) = 'integer'
    ),
--
    CONSTRAINT target__tcp_keepalive_int_ck CHECK (
        typeof( tcp_keepalive ) = 'integer'
    ),
--
    CONSTRAINT target__tcp_keepidle_int_ck CHECK (
        typeof( tcp_keepidle ) = 'integer'
    ),
--
    CONSTRAINT target__tcp_keepintvl_int_ck CHECK (
        typeof( tcp_keepintvl ) = 'integer'
    ),
--
    CONSTRAINT target__netrc_int_ck CHECK (
        typeof( netrc ) = 'integer'
    ),
--
    CONSTRAINT target__maxredirs_int_ck CHECK (
        typeof( maxredirs ) = 'integer'
    ),
--
    CONSTRAINT target__postfieldsize_int_ck CHECK (
        typeof( postfieldsize ) = 'integer'
    ),
--
    CONSTRAINT target__postfieldsize_large_int_ck CHECK (
        typeof( postfieldsize_large ) = 'integer'
    ),
--
    CONSTRAINT target__expect_100_timeout_ms_int_ck CHECK (
        typeof( expect_100_timeout_ms ) = 'integer'
    ),
--
    CONSTRAINT target__stream_weight_int_ck CHECK (
        typeof( stream_weight ) = 'integer'
    ),
--
    CONSTRAINT target__tftp_blksize_int_ck CHECK (
        typeof( tftp_blksize ) = 'integer'
    ),
--
    CONSTRAINT target__ftp_response_timeout_int_ck CHECK (
        typeof( ftp_response_timeout ) = 'integer'
    ),
--
    CONSTRAINT target__rtsp_client_cseq_int_ck CHECK (
        typeof( rtsp_client_cseq ) = 'integer'
    ),
--
    CONSTRAINT target__rtsp_server_cseq_int_ck CHECK (
        typeof( rtsp_server_cseq ) = 'integer'
    ),
--
    CONSTRAINT target__resume_from_int_ck CHECK (
        typeof( resume_from ) = 'integer'
    ),
--
    CONSTRAINT target__resume_from_large_int_ck CHECK (
        typeof( resume_from_large ) = 'integer'
    ),
--
    CONSTRAINT target__infilesize_int_ck CHECK (
        typeof( infilesize ) = 'integer'
    ),
--
    CONSTRAINT target__infilesize_large_int_ck CHECK (
        typeof( infilesize_large ) = 'integer'
    ),
--
    CONSTRAINT target__upload_buffersize_int_ck CHECK (
        typeof( upload_buffersize ) = 'integer'
    ),
--
    CONSTRAINT target__timevalue_int_ck CHECK (
        typeof( timevalue ) = 'integer'
    ),
--
    CONSTRAINT target__timevalue_large_int_ck CHECK (
        typeof( timevalue_large ) = 'integer'
    ),
--
    CONSTRAINT target__timeout_int_ck CHECK (
        typeof( timeout ) = 'integer'
    ),
--
    CONSTRAINT target__timeout_ms_int_ck CHECK (
        typeof( timeout_ms ) = 'integer'
    ),
--
    CONSTRAINT target__low_speed_limit_int_ck CHECK (
        typeof( low_speed_limit ) = 'integer'
    ),
--
    CONSTRAINT target__low_speed_time_int_ck CHECK (
        typeof( low_speed_time ) = 'integer'
    ),
--
    CONSTRAINT target__max_send_speed_large_int_ck CHECK (
        typeof( max_send_speed_large ) = 'integer'
    ),
--
    CONSTRAINT target__maxconnects_int_ck CHECK (
        typeof( maxconnects ) = 'integer'
    ),
--
    CONSTRAINT target__maxage_conn_int_ck CHECK (
        typeof( maxage_conn ) = 'integer'
    ),
--
    CONSTRAINT target__connecttimeout_int_ck CHECK (
        typeof( connecttimeout ) = 'integer'
    ),
--
    CONSTRAINT target__connecttimeout_ms_int_ck CHECK (
        typeof( connecttimeout_ms ) = 'integer'
    ),
--
    CONSTRAINT target__accepttimeout_ms_int_ck CHECK (
        typeof( accepttimeout_ms ) = 'integer'
    ),
--
    CONSTRAINT target__happy_eyeballs_timeout_ms_int_ck CHECK (
        typeof( happy_eyeballs_timeout_ms ) = 'integer'
    ),
--
    CONSTRAINT target__upkeep_interval_ms_int_ck CHECK (
        typeof( upkeep_interval_ms ) = 'integer'
    ),
--
    CONSTRAINT target__proxy_sslversion_int_ck CHECK (
        typeof( proxy_sslversion ) = 'integer'
    ),
--
    CONSTRAINT target__ssl_verifyhost_int_ck CHECK (
        typeof( ssl_verifyhost ) = 'integer'
    ),
--
    CONSTRAINT target__proxy_ssl_verifyhost_int_ck CHECK (
        typeof( proxy_ssl_verifyhost ) = 'integer'
    ),
--
    CONSTRAINT target__new_file_perms_int_ck CHECK (
        typeof( new_file_perms ) = 'integer'
    ),
--
    CONSTRAINT target__new_directory_perms_int_ck CHECK (
        typeof( new_directory_perms ) = 'integer'
    ),
--
    CONSTRAINT target__stderr_text_ck CHECK (
        typeof( stderr ) = 'text'
    ),
--
    CONSTRAINT target__url_text_ck CHECK (
        typeof( url ) = 'text'
    ),
--
    CONSTRAINT target__protocols_text_ck CHECK (
        typeof( protocols ) = 'text'
    ),
--
    CONSTRAINT target__redir_protocols_text_ck CHECK (
        typeof( redir_protocols ) = 'text'
    ),
--
    CONSTRAINT target__default_protocol_text_ck CHECK (
        typeof( default_protocol ) = 'text'
    ),
--
    CONSTRAINT target__proxy_text_ck CHECK (
        typeof( proxy ) = 'text'
    ),
--
    CONSTRAINT target__pre_proxy_text_ck CHECK (
        typeof( pre_proxy ) = 'text'
    ),
--
    CONSTRAINT target__proxytype_text_ck CHECK (
        typeof( proxytype ) = 'text'
    ),
--
    CONSTRAINT target__noproxy_text_ck CHECK (
        typeof( noproxy ) = 'text'
    ),
--
    CONSTRAINT target__socks5_gssapi_service_text_ck CHECK (
        typeof( socks5_gssapi_service ) = 'text'
    ),
--
    CONSTRAINT target__proxy_service_name_text_ck CHECK (
        typeof( proxy_service_name ) = 'text'
    ),
--
    CONSTRAINT target__service_name_text_ck CHECK (
        typeof( service_name ) = 'text'
    ),
--
    CONSTRAINT target__interface_text_ck CHECK (
        typeof( interface ) = 'text'
    ),
--
    CONSTRAINT target__doh_url_text_ck CHECK (
        typeof( doh_url ) = 'text'
    ),
--
    CONSTRAINT target__unix_socket_path_text_ck CHECK (
        typeof( unix_socket_path ) = 'text'
    ),
--
    CONSTRAINT target__abstract_unix_socket_text_ck CHECK (
        typeof( abstract_unix_socket ) = 'text'
    ),
--
    CONSTRAINT target__netrc_file_text_ck CHECK (
        typeof( netrc_file ) = 'text'
    ),
--
    CONSTRAINT target__userpwd_text_ck CHECK (
        typeof( userpwd ) = 'text'
    ),
--
    CONSTRAINT target__proxyuserpwd_text_ck CHECK (
        typeof( proxyuserpwd ) = 'text'
    ),
--
    CONSTRAINT target__username_text_ck CHECK (
        typeof( username ) = 'text'
    ),
--
    CONSTRAINT target__password_text_ck CHECK (
        typeof( password ) = 'text'
    ),
--
    CONSTRAINT target__login_options_text_ck CHECK (
        typeof( login_options ) = 'text'
    ),
--
    CONSTRAINT target__proxyusername_text_ck CHECK (
        typeof( proxyusername ) = 'text'
    ),
--
    CONSTRAINT target__proxypassword_text_ck CHECK (
        typeof( proxypassword ) = 'text'
    ),
--
    CONSTRAINT target__curlopt_xoauth2_bearer_text_ck CHECK (
        typeof( curlopt_xoauth2_bearer ) = 'text'
    ),
--
    CONSTRAINT target__tlsauth_username_text_ck CHECK (
        typeof( tlsauth_username ) = 'text'
    ),
--
    CONSTRAINT target__proxy_tlsauth_username_text_ck CHECK (
        typeof( proxy_tlsauth_username ) = 'text'
    ),
--
    CONSTRAINT target__tlsauth_password_text_ck CHECK (
        typeof( tlsauth_password ) = 'text'
    ),
--
    CONSTRAINT target__proxy_tlsauth_password_text_ck CHECK (
        typeof( proxy_tlsauth_password ) = 'text'
    ),
--
    CONSTRAINT target__tlsauth_type_text_ck CHECK (
        typeof( tlsauth_type ) = 'text'
    ),
--
    CONSTRAINT target__proxy_tlsauth_type_text_ck CHECK (
        typeof( proxy_tlsauth_type ) = 'text'
    ),
--
    CONSTRAINT target__sasl_authzid_text_ck CHECK (
        typeof( sasl_authzid ) = 'text'
    ),
--
    CONSTRAINT target__accept_encoding_text_ck CHECK (
        typeof( accept_encoding ) = 'text'
    ),
--
    CONSTRAINT target__postfields_text_ck CHECK (
        typeof( postfields ) = 'text'
    ),
--
    CONSTRAINT target__copypostfields_text_ck CHECK (
        typeof( copypostfields ) = 'text'
    ),
--
    CONSTRAINT target__referer_text_ck CHECK (
        typeof( referer ) = 'text'
    ),
--
    CONSTRAINT target__useragent_text_ck CHECK (
        typeof( useragent ) = 'text'
    ),
--
    CONSTRAINT target__httpheader_text_ck CHECK (
        typeof( httpheader ) = 'text'
    ),
--
    CONSTRAINT target__proxyheader_text_ck CHECK (
        typeof( proxyheader ) = 'text'
    ),
--
    CONSTRAINT target__http200aliases_text_ck CHECK (
        typeof( http200aliases ) = 'text'
    ),
--
    CONSTRAINT target__cookie_text_ck CHECK (
        typeof( cookie ) = 'text'
    ),
--
    CONSTRAINT target__cookiefile_text_ck CHECK (
        typeof( cookiefile ) = 'text'
    ),
--
    CONSTRAINT target__cookiejar_text_ck CHECK (
        typeof( cookiejar ) = 'text'
    ),
--
    CONSTRAINT target__cookielist_text_ck CHECK (
        typeof( cookielist ) = 'text'
    ),
--
    CONSTRAINT target__altsvc_text_ck CHECK (
        typeof( altsvc ) = 'text'
    ),
--
    CONSTRAINT target__request_target_text_ck CHECK (
        typeof( request_target ) = 'text'
    ),
--
    CONSTRAINT target__http_version_text_ck CHECK (
        typeof( http_version ) = 'text'
    ),
--
    CONSTRAINT target__mail_from_text_ck CHECK (
        typeof( mail_from ) = 'text'
    ),
--
    CONSTRAINT target__mail_rcpt_text_ck CHECK (
        typeof( mail_rcpt ) = 'text'
    ),
--
    CONSTRAINT target__mail_auth_text_ck CHECK (
        typeof( mail_auth ) = 'text'
    ),
--
    CONSTRAINT target__ftpport_text_ck CHECK (
        typeof( ftpport ) = 'text'
    ),
--
    CONSTRAINT target__quote_text_ck CHECK (
        typeof( quote ) = 'text'
    ),
--
    CONSTRAINT target__postquote_text_ck CHECK (
        typeof( postquote ) = 'text'
    ),
--
    CONSTRAINT target__prequote_text_ck CHECK (
        typeof( prequote ) = 'text'
    ),
--
    CONSTRAINT target__ftp_create_missing_dirs_text_ck CHECK (
        typeof( ftp_create_missing_dirs ) = 'text'
    ),
--
    CONSTRAINT target__ftp_alternative_to_user_text_ck CHECK (
        typeof( ftp_alternative_to_user ) = 'text'
    ),
--
    CONSTRAINT target__ftpsslauth_text_ck CHECK (
        typeof( ftpsslauth ) = 'text'
    ),
--
    CONSTRAINT target__ftp_ssl_ccc_text_ck CHECK (
        typeof( ftp_ssl_ccc ) = 'text'
    ),
--
    CONSTRAINT target__ftp_account_text_ck CHECK (
        typeof( ftp_account ) = 'text'
    ),
--
    CONSTRAINT target__ftp_filemethod_text_ck CHECK (
        typeof( ftp_filemethod ) = 'text'
    ),
--
    CONSTRAINT target__rtsp_request_text_ck CHECK (
        typeof( rtsp_request ) = 'text'
    ),
--
    CONSTRAINT target__rtsp_session_id_text_ck CHECK (
        typeof( rtsp_session_id ) = 'text'
    ),
--
    CONSTRAINT target__rtsp_stream_uri_text_ck CHECK (
        typeof( rtsp_stream_uri ) = 'text'
    ),
--
    CONSTRAINT target__rtsp_transport_text_ck CHECK (
        typeof( rtsp_transport ) = 'text'
    ),
--
    CONSTRAINT target__range_text_ck CHECK (
        typeof( range ) = 'text'
    ),
--
    CONSTRAINT target__curlu_text_ck CHECK (
        typeof( curlu ) = 'text'
    ),
--
    CONSTRAINT target__customrequest_text_ck CHECK (
        typeof( customrequest ) = 'text'
    ),
--
    CONSTRAINT target__timecondition_text_ck CHECK (
        typeof( timecondition ) = 'text'
    ),
--
    CONSTRAINT target__ipresolve_text_ck CHECK (
        typeof( ipresolve ) = 'text'
    ),
--
    CONSTRAINT target__use_ssl_text_ck CHECK (
        typeof( use_ssl ) = 'text'
    ),
--
    CONSTRAINT target__resolve_text_ck CHECK (
        typeof( resolve ) = 'text'
    ),
--
    CONSTRAINT target__dns_interface_text_ck CHECK (
        typeof( dns_interface ) = 'text'
    ),
--
    CONSTRAINT target__dns_local_ip4_text_ck CHECK (
        typeof( dns_local_ip4 ) = 'text'
    ),
--
    CONSTRAINT target__dns_local_ip6_text_ck CHECK (
        typeof( dns_local_ip6 ) = 'text'
    ),
--
    CONSTRAINT target__dns_servers_text_ck CHECK (
        typeof( dns_servers ) = 'text'
    ),
--
    CONSTRAINT target__sslcert_text_ck CHECK (
        typeof( sslcert ) = 'text'
    ),
--
    CONSTRAINT target__proxy_sslcert_text_ck CHECK (
        typeof( proxy_sslcert ) = 'text'
    ),
--
    CONSTRAINT target__sslcerttype_text_ck CHECK (
        typeof( sslcerttype ) = 'text'
    ),
--
    CONSTRAINT target__proxy_sslcerttype_text_ck CHECK (
        typeof( proxy_sslcerttype ) = 'text'
    ),
--
    CONSTRAINT target__sslkey_text_ck CHECK (
        typeof( sslkey ) = 'text'
    ),
--
    CONSTRAINT target__proxy_sslkey_text_ck CHECK (
        typeof( proxy_sslkey ) = 'text'
    ),
--
    CONSTRAINT target__sslkeytype_text_ck CHECK (
        typeof( sslkeytype ) = 'text'
    ),
--
    CONSTRAINT target__proxy_sslkeytype_text_ck CHECK (
        typeof( proxy_sslkeytype ) = 'text'
    ),
--
    CONSTRAINT target__keypasswd_text_ck CHECK (
        typeof( keypasswd ) = 'text'
    ),
--
    CONSTRAINT target__proxy_keypasswd_text_ck CHECK (
        typeof( proxy_keypasswd ) = 'text'
    ),
--
    CONSTRAINT target__sslengine_text_ck CHECK (
        typeof( sslengine ) = 'text'
    ),
--
    CONSTRAINT target__sslversion_text_ck CHECK (
        typeof( sslversion ) = 'text'
    ),
--
    CONSTRAINT target__cainfo_text_ck CHECK (
        typeof( cainfo ) = 'text'
    ),
--
    CONSTRAINT target__proxy_cainfo_text_ck CHECK (
        typeof( proxy_cainfo ) = 'text'
    ),
--
    CONSTRAINT target__issuercert_text_ck CHECK (
        typeof( issuercert ) = 'text'
    ),
--
    CONSTRAINT target__capath_text_ck CHECK (
        typeof( capath ) = 'text'
    ),
--
    CONSTRAINT target__proxy_capat_text_ck CHECK (
        typeof( proxy_capat ) = 'text'
    ),
--
    CONSTRAINT target__crlfile_text_ck CHECK (
        typeof( crlfile ) = 'text'
    ),
--
    CONSTRAINT target__proxy_crlfile_text_ck CHECK (
        typeof( proxy_crlfile ) = 'text'
    ),
--
    CONSTRAINT target__pinnedpublickey_text_ck CHECK (
        typeof( pinnedpublickey ) = 'text'
    ),
--
    CONSTRAINT target__proxy_pinnedpublickey_text_ck CHECK (
        typeof( proxy_pinnedpublickey ) = 'text'
    ),
--
    CONSTRAINT target__random_file_text_ck CHECK (
        typeof( random_file ) = 'text'
    ),
--
    CONSTRAINT target__egdsocket_text_ck CHECK (
        typeof( egdsocket ) = 'text'
    ),
--
    CONSTRAINT target__ssl_cipher_list_text_ck CHECK (
        typeof( ssl_cipher_list ) = 'text'
    ),
--
    CONSTRAINT target__proxy_ssl_cipher_list_text_ck CHECK (
        typeof( proxy_ssl_cipher_list ) = 'text'
    ),
--
    CONSTRAINT target__tls13_ciphers_text_ck CHECK (
        typeof( tls13_ciphers ) = 'text'
    ),
--
    CONSTRAINT target__proxy_tls13_ciphers_text_ck CHECK (
        typeof( proxy_tls13_ciphers ) = 'text'
    ),
--
    CONSTRAINT target__krblevel_text_ck CHECK (
        typeof( krblevel ) = 'text'
    ),
--
    CONSTRAINT target__gssapi_delegation_text_ck CHECK (
        typeof( gssapi_delegation ) = 'text'
    ),
--
    CONSTRAINT target__ssh_host_public_key_md5_text_ck CHECK (
        typeof( ssh_host_public_key_md5 ) = 'text'
    ),
--
    CONSTRAINT target__ssh_public_keyfile_text_ck CHECK (
        typeof( ssh_public_keyfile ) = 'text'
    ),
--
    CONSTRAINT target__ssh_private_keyfile_text_ck CHECK (
        typeof( ssh_private_keyfile ) = 'text'
    ),
--
    CONSTRAINT target__ssh_knownhosts_text_ck CHECK (
        typeof( ssh_knownhosts ) = 'text'
    ),
--
    CONSTRAINT target__telnetoptions_text_ck CHECK (
        typeof( telnetoptions ) = 'text'
    )
);
--
--
--  The atomic_down trigger sets the opr_state to 0 whenever the adm_state is
--  set to 0.  This is to avoid race conditions.
--
--
CREATE TRIGGER target__atomic_down_tr BEFORE UPDATE of adm_state ON target
FOR EACH ROW
WHEN NEW.adm_state = 0
BEGIN
    UPDATE target
    SET    opr_state = 0;
END;

