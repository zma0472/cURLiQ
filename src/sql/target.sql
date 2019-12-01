
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
    suppress_connect_headers BOOLEAN, -- ALL
--
    stderr  TEXT, -- ALL
--
    failonerror  BOOLEAN,-- HTTP
--
    keep_sending_on_error  BOOLEAN, -- HTTP
--
    url  TEXT, -- ALL
--
    path_as_is  BOOLEAN, -- ALL
--
    protocols -- TEXT, -- ALL
--
    redir_protocols  TEXT, -- ALL except FILE, SCP, SMB, SMBS
--
    default_protocol TEXT, -- ALL
--
    proxy  TEXT, -- ALL except FILE
--
    pre_proxy TEXT, -- ALL except FILE
-- 
    proxyport  INTEGER, -- ALL
--
    proxytype  TEXT, -- MOST
--
    noproxy  TEXT, -- MOST
--
    httpproxytunnel  BOOLEAN, -- All network protocols
--
    socks5_auth  INTEGER, -- ALL
--
    socks5_gssapi_service  TEXT, -- All network protocols
--
    socks5_gssapi_nec  BOOLEAN, -- All network protocols
--
    proxy_service_name  TEXT, -- All network protocols
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
    port  INTEGER, -- All that use a port
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
    abstract_unix_socket TEXT, -- ALL
--
    netrc  INTEGER, -- MOST
--
    netrc_file  TEXT, -- ALL
--
    userpwd  TEXT, -- MOST
--
    proxyuserpwd  TEXT, -- All protocols that can use proxy
--
    username  TEXT, -- MOST
--
    password  CHAR, -- MOST
--
    login_options  CHAR, -- IMAP POP3 SMTP
--
    proxyusername  CHAR, -- MOST
--
    proxypassword  CHAR, -- MOST
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
    tlsauth_username  TEXT, -- All TLS-based protocols
--
    proxy_tlsauth_username  TEXT, -- ALL
--
    tlsauth_password  TEXT, -- All TLS-based protocols
--
    proxy_tlsauth_password  TEXT, -- All TLS-based protocols
--
    tlsauth_type  TEXT, -- All TLS-based protocols
--
    proxy_tlsauth_type  TEXT, -- All TLS-based protocols
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
    ftp_create_missing_dirs  TEXT -- FTP SFTP
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
    timevalue_large INTEGER, -- HTTP FTP RTSP FILE
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
    sslcert  TEXT -- All TLS-based protocols
--
    proxy_sslcert  TEXT, -- All TLS-based protocols
--
    sslcerttype  TEXT, -- All TLS-based protocols
--
    proxy_sslcerttype  TEXT, -- All TLS-based protocols
--
    sslkey  TEXT, -- All TLS-based protocols
--
    proxy_sslkey  TEXT, -- ALL
--
    sslkeytype  TEXT, -- All TLS-based protocols.
--
    proxy_sslkeytype  TEXT, -- All TLS-based protocols.
--
    keypasswd  TEXT, -- All TLS-based protocols.
--
    proxy_keypasswd  TEXT, -- Used with HTTP proxy
--
    ssl_enable_alpn  BOOLEAN, -- HTTP
--
    ssl_enable_npn  BOOLEAN, -- HTTP
--
    sslengine  TEXT, -- All TLS-based protocols.
--
    sslengine_default  BOOLEAN, -- All TLS-based protocols.
--
    ssl_falsestart  BOOLEAN, -- ALL TLS-based protocols
--
    sslversion  TEXT, -- All TLS-based protocols add CONSTRAINT
--
    proxy_sslversion  INTEGER, -- ALL using HTTPS proxy
--
    ssl_verifyhost  INTEGER, -- ALL TLS-based protocols 
--
    proxy_ssl_verifyhost  INTEGER, ALL using HTTPS proxy
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
    ssl_cipher_list TEXT, -- ALL  TLS-based protocols
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
--  curlsslopt_allow_beast  BOOLEAN, -- ALL TLS-based protocols
--
--  curlsslopt_no_revoke  BOOLEAN, -- ALL TLS-based protocols
--
--  proxy_allow_beast and proxy_no_revoke are used to set bits in the
--  curlopt_proxy_ssl_options mask
--
--  proxy_allow_beast  BOOLEAN, -- ALL
--
--  proxy_no_revoke  BOOLEAN, -- ALL
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
);

