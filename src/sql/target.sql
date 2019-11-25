
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
    password
--
    login_options
--
    proxyusername
--
    proxypassword
--
    httpauth
--
    tlsauth_username
--
    proxy_tlsauth_username
--
    tlsauth_password
--
    proxy_tlsauth_password
--
    tlsauth_type
--
    proxy_tlsauth_type
--
    proxyauth
--
    sasl_authzid
--
    sasl_ir
--
    xoauth2_bearer
--
    disallow_username_in_url
--
    autoreferer
--
    accept_encoding
--
    transfer_encoding
--
    followlocation
--
    unrestricted_auth
--
    maxredirs
--
    postredir
--
    put
--
    post
--
    postfields
--
    postfieldsize
--
    postfieldsize_large
--
    copypostfields
--
    httppost
--
    referer
--
    useragent
--
    httpheader
--
    headeropt
--
    proxyheader
--
    http200aliases
--
    cookie
--
    cookiefile
--
    cookiejar
--
    cookiesession
--
    cookielist
--
    altsvc
--
    altsvc_ctrl
--
    httpget
--
    request_target
--
    http_version
--
    http09_allowed
--
    ignore_content_length
--
    http_content_decoding
--
    http_transfer_decoding
--
    expect_100_timeout_ms
--
    pipewait
--
    stream_depends
--
    stream_depends_e
--
    stream_weight
--
    mail_from
--
    mail_rcpt
--
    mail_auth
--
    tftp_blksize
--
    tftp_no_options
--
    ftpport
--
    quote
--
    postquote
--
    prequote
--
    append
--
    ftp_use_eprt
--
    ftp_use_epsv
--
    ftp_use_pret
--
    ftp_create_missing_dirs
--
    ftp_response_timeout
--
    ftp_alternative_to_user
--
    ftp_skip_pasv_ip
--
    ftpsslauth
--
    ftp_ssl_ccc
--
    ftp_account
--
    ftp_filemethod
--
    rtsp_request
--
    rtsp_session_id
--
    rtsp_stream_uri
--
    rtsp_transport
--
    rtsp_client_cseq
--
    rtsp_server_cseq
--
    transfertext
--
    proxy_transfer_mode
--
    crlf
--
    range
--
    resume_from
--
    resume_from_large
--
    curlu
--
    customrequest
--
    filetime
--
    dirlistonly
--
    nobody
--
    infilesize
--
    infilesize_large
--
    upload
--
    upload_buffersize
--
    mimepost
--
    maxfilesize
--
    maxfilesize_large
--
    timecondition
--
    timevalue
--
    timevalue_large
--
    timeout
--
    timeout_ms
--
    low_speed_limit
--
    low_speed_time
--
    max_send_speed_large
--
    max_recv_speed_large
--
    maxconnects
--
    fresh_connect
--
    forbid_reuse
--
    maxage_conn
--
    connecttimeout
--
    connecttimeout_ms
--
    ipresolve
--
    connect_only
--
    use_ssl
--
    resolve
--
    dns_interface
--
    dns_local_ip4
--
    dns_local_ip6
--
    dns_servers
--
    dns_shuffle_addresses
--
    accepttimeout_ms
--
    happy_eyeballs_timeout_ms
--
    upkeep_interval_ms
--
    sslcert
--
    proxy_sslcert
--
    sslcerttype
--
    proxy_sslcerttype
--
    sslkey
--
    proxy_sslkey
--
    sslkeytype
--
    proxy_sslkeytype
--
    keypasswd
--
    proxy_keypasswd
--
    ssl_enable_alpn
--
    ssl_enable_npn
--
    sslengine
--
    sslengine_default
--
    ssl_falsestart
--
    sslversion
--
    proxy_sslversion
--
    ssl_verifyhost
--
    proxy_ssl_verifyhost
--
    ssl_verifypeer
--
    proxy_ssl_verifypeer
--
    ssl_verifystatus
--
    cainfo
--
    proxy_cainfo
--
    issuercert
--
    capath
--
    proxy_capath
--
    crlfile
--
    proxy_crlfile
--
    certinfo
--
    pinnedpublickey
--
    proxy_pinnedpublickey
--
    random_file
--
    egdsocket
--
    ssl_cipher_list
--
    proxy_ssl_cipher_list
--
    tls13_ciphers
--
    proxy_tls13_ciphers
--
    ssl_sessionid_cache
--
    ssl_options
--
    proxy_ssl_options
--
    krblevel
--
    gssapi_delegation
--
    ssh_auth_types
--
    ssh_compression
--
    ssh_host_public_key_md5
--
    ssh_public_keyfile
--
    ssh_private_keyfile
--
    ssh_knownhosts
--
    private
--
    share
--
    new_file_perms
--
    new_directory_perms
--
    telnetoptions
--

