
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

CREATE VIEW ftp_table (
    name,
    description,
    creation_stamp,
    adm_state,
    opr_state,
    verbose, -- ALL
    header, -- ALL
    noprogress, -- ALL
    nosignal, -- ALL
    wildcardmatch, -- FTP
    suppress_connect_headers, -- ALL
    stderr, -- ALL
    url, -- ALL
    path_as_is, -- ALL
    protocols, -- ALL
    redir_protocols, -- ALL except FILE, SCP, SMB, SMBS
    default_protocol, -- ALL
    proxy, -- ALL except FILE
    pre_proxy, -- ALL except FILE
    proxyport, -- ALL
    httpproxytunnel, -- ALL network protocols
    socks5_auth, -- ALL
    socks5_gssapi_service, -- ALL network protocols
    socks5_gssapi_nec, -- ALL network protocols
    proxy_service_name, -- ALL network protocols
    service_name, -- HTTP FTP IMAP POP SMTP
    interface, -- ALL
    localport, -- ALL
    localportrange, -- ALL
    dns_cache_timeout, -- ALL
    doh_url, -- ALL
    buffersize, -- ALL
    port, -- ALL that use a port
    tcp_fastopen, -- ALL
    tcp_nodelay, -- ALL
    address_scope, -- ALL when using IPv6
    tcp_keepalive, -- ALL
    tcp_keepidle, -- ALL
    tcp_keepintvl, -- ALL
    abstract_unix_socket, -- ALL
    netrc_file, -- ALL
    proxyuserpwd, -- ALL protocols that can use proxy
    proxy_tlsauth_username, -- ALL
    ftpport, -- FTP
    quote, -- FTP SFTP
    postquote, -- FTP SFTP
    prequote, -- FTP
    append, -- FTP
    ftp_use_eprt, -- FTP
    ftp_use_epsv, -- FTP
    ftp_use_pret, -- FTP
    ftp_create_missing_dirs, -- FTP SFTP
    ftp_response_timeout, -- FTP
    ftp_alternative_to_user, -- FTP
    ftp_skip_pasv_ip, -- FTP
    ftpsslauth, -- FTP
    ftp_ssl_ccc, -- FTP
    ftp_account, -- FTP
    ftp_filemethod, -- FTP
    transfertext, -- FTP
    proxy_transfer_mode, -- FTP
    crlf, -- FTP
    range, -- HTTP FTP FILE RTSP SFTP
    resume_from, -- HTTP FTP SFTP FILE
    resume_from_large, -- HTTP FTP SFTP FILE
    curlu, -- ALL
    customrequest, -- HTTP FTP IMAP POP3 SMTP
    filetime, -- HTTP FTP SFTP FILE
    dirlistonly, -- FTP SFTP POP3
    upload_buffersize, -- ALL
    timecondition, -- HTTP FTP RTSP FILE
    timevalue, -- HTTP FTP RTSP FILE
    timevalue_large, -- HTTP FTP RTSP FILE
    timeout, -- ALL
    timeout_ms, -- ALL
    low_speed_limit, -- ALL
    low_speed_time, -- ALL
    max_send_speed_large, -- ALL
    maxage_conn, -- ALL
    connecttimeout, -- ALL
    connecttimeout_ms, -- ALL
    ipresolve, -- ALL
    use_ssl, -- FTP SMTP POP3 IMAP
    resolve, -- ALL
    dns_interface, -- ALL
    dns_local_ip4, -- ALL
    dns_local_ip6, -- ALL
    dns_servers, -- ALL
    dns_shuffle_addresses, -- ALL
    accepttimeout_ms, -- FTP
    happy_eyeballs_timeout_ms, -- ALL
    upkeep_interval_ms, -- ALL
    proxy_sslkey, -- ALL
    proxy_sslkeytype, -- ALL TLS-based protocols.
    proxy_sslversion, -- ALL using HTTPS proxy
    proxy_ssl_verifyhost, -- ALL using HTTPS proxy
    proxy_cainfo, -- ALL protocols using HTTPS proxy
    proxy_capat, -- ALL protocols using HTTPS proxy
    proxy_crlfile, -- ALL protocols using HTTPS proxy
    random_file, -- ALL
    proxy_ssl_cipher_list, -- ALL
    proxy_allow_beast, -- ALL
    proxy_no_revoke, -- ALL
    krblevel -- FTP
) AS
SELECT 
    name,
    description,
    creation_stamp,
    adm_state,
    opr_state,
    verbose,
    header,
    noprogress,
    nosignal,
    wildcardmatch,
    suppress_connect_headers,
    stderr,
    url,
    path_as_is,
    protocols,
    redir_protocols,
    default_protocol,
    proxy,
    pre_proxy,
    proxyport,
    httpproxytunnel,
    socks5_auth,
    socks5_gssapi_service,
    socks5_gssapi_nec,
    proxy_service_name,
    service_name,
    interface,
    localport,
    localportrange,
    dns_cache_timeout,
    doh_url,
    buffersize,
    port,
    tcp_fastopen,
    tcp_nodelay,
    address_scope,
    tcp_keepalive,
    tcp_keepidle,
    tcp_keepintvl,
    abstract_unix_socket,
    netrc_file,
    proxyuserpwd,
    proxy_tlsauth_username,
    ftpport,
    quote,
    postquote,
    prequote,
    append,
    ftp_use_eprt,
    ftp_use_epsv,
    ftp_use_pret,
    ftp_create_missing_dirs,
    ftp_response_timeout,
    ftp_alternative_to_user,
    ftp_skip_pasv_ip,
    ftpsslauth,
    ftp_ssl_ccc,
    ftp_account,
    ftp_filemethod,
    transfertext,
    proxy_transfer_mode,
    crlf,
    range,
    resume_from,
    resume_from_large,
    curlu,
    customrequest,
    filetime,
    dirlistonly,
    upload_buffersize,
    timecondition,
    timevalue,
    timevalue_large,
    timeout,
    timeout_ms,
    low_speed_limit,
    low_speed_time,
    max_send_speed_large,
    maxage_conn,
    connecttimeout,
    connecttimeout_ms,
    ipresolve,
    use_ssl,
    resolve,
    dns_interface,
    dns_local_ip4,
    dns_local_ip6,
    dns_servers,
    dns_shuffle_addresses,
    accepttimeout_ms,
    happy_eyeballs_timeout_ms,
    upkeep_interval_ms,
    proxy_sslkey,
    proxy_sslkeytype,
    proxy_sslversion,
    proxy_ssl_verifyhost,
    proxy_cainfo,
    proxy_capat,
    proxy_crlfile,
    random_file,
    proxy_ssl_cipher_list,
    proxy_allow_beast,
    proxy_no_revoke,
    krblevel
FROM targets;
--
--
CREATE TRIGGER ftp_target__insert_tr
INSTEAD OF INSERT ON ftp_target
BEGIN
    INSERT INTO target (
        name,
        description,
        creation_stamp,
        adm_state,
        opr_state,
        verbose,
        header,
        noprogress,
        nosignal,
        wildcardmatch,
        suppress_connect_headers,
        stderr,
        url,
        path_as_is,
        protocols,
        redir_protocols,
        default_protocol,
        proxy,
        pre_proxy,
        proxyport,
        httpproxytunnel,
        socks5_auth,
        socks5_gssapi_service,
        socks5_gssapi_nec,
        proxy_service_name,
        service_name,
        interface,
        localport,
        localportrange,
        dns_cache_timeout,
        doh_url,
        buffersize,
        port,
        tcp_fastopen,
        tcp_nodelay,
        address_scope,
        tcp_keepalive,
        tcp_keepidle,
        tcp_keepintvl,
        abstract_unix_socket,
        netrc_file,
        proxyuserpwd,
        proxy_tlsauth_username,
        ftpport,
        quote,
        postquote,
        prequote,
        append,
        ftp_use_eprt,
        ftp_use_epsv,
        ftp_use_pret,
        ftp_create_missing_dirs,
        ftp_response_timeout,
        ftp_alternative_to_user,
        ftp_skip_pasv_ip,
        ftpsslauth,
        ftp_ssl_ccc,
        ftp_account,
        ftp_filemethod,
        transfertext,
        proxy_transfer_mode,
        crlf,
        range,
        resume_from,
        resume_from_large,
        curlu,
        customrequest,
        filetime,
        dirlistonly,
        upload_buffersize,
        timecondition,
        timevalue,
        timevalue_large,
        timeout,
        timeout_ms,
        low_speed_limit,
        low_speed_time,
        max_send_speed_large,
        maxage_conn,
        connecttimeout,
        connecttimeout_ms,
        ipresolve,
        use_ssl,
        resolve,
        dns_interface,
        dns_local_ip4,
        dns_local_ip6,
        dns_servers,
        dns_shuffle_addresses,
        accepttimeout_ms,
        happy_eyeballs_timeout_ms,
        upkeep_interval_ms,
        proxy_sslkey,
        proxy_sslkeytype,
        proxy_sslversion,
        proxy_ssl_verifyhost,
        proxy_cainfo,
        proxy_capat,
        proxy_crlfile,
        random_file,
        proxy_ssl_cipher_list,
        proxy_allow_beast,
        proxy_no_revoke,
        krblevel
) VALUES (
        :new.name,
        :new.description,
        :new.creation_stamp,
        :new.adm_state,
        :new.opr_state,
        :new.verbose,
        :new.header,
        :new.noprogress,
        :new.nosignal,
        :new.wildcardmatch,
        :new.suppress_connect_headers,
        :new.stderr,
        :new.url,
        :new.path_as_is,
        :new.protocols,
        :new.redir_protocols,
        :new.default_protocol,
        :new.proxy,
        :new.pre_proxy,
        :new.proxyport,
        :new.httpproxytunnel,
        :new.socks5_auth,
        :new.socks5_gssapi_service,
        :new.socks5_gssapi_nec,
        :new.proxy_service_name,
        :new.service_name,
        :new.interface,
        :new.localport,
        :new.localportrange,
        :new.dns_cache_timeout,
        :new.doh_url,
        :new.buffersize,
        :new.port,
        :new.tcp_fastopen,
        :new.tcp_nodelay,
        :new.address_scope,
        :new.tcp_keepalive,
        :new.tcp_keepidle,
        :new.tcp_keepintvl,
        :new.abstract_unix_socket,
        :new.netrc_file,
        :new.proxyuserpwd,
        :new.proxy_tlsauth_username,
        :new.ftpport,
        :new.quote,
        :new.postquote,
        :new.prequote,
        :new.append,
        :new.ftp_use_eprt,
        :new.ftp_use_epsv,
        :new.ftp_use_pret,
        :new.ftp_create_missing_dirs,
        :new.ftp_response_timeout,
        :new.ftp_alternative_to_user,
        :new.ftp_skip_pasv_ip,
        :new.ftpsslauth,
        :new.ftp_ssl_ccc,
        :new.ftp_account,
        :new.ftp_filemethod,
        :new.transfertext,
        :new.proxy_transfer_mode,
        :new.crlf,
        :new.range,
        :new.resume_from,
        :new.resume_from_large,
        :new.curlu,
        :new.customrequest,
        :new.filetime,
        :new.dirlistonly,
        :new.upload_buffersize,
        :new.timecondition,
        :new.timevalue,
        :new.timevalue_large,
        :new.timeout,
        :new.timeout_ms,
        :new.low_speed_limit,
        :new.low_speed_time,
        :new.max_send_speed_large,
        :new.maxage_conn,
        :new.connecttimeout,
        :new.connecttimeout_ms,
        :new.ipresolve,
        :new.use_ssl,
        :new.resolve,
        :new.dns_interface,
        :new.dns_local_ip4,
        :new.dns_local_ip6,
        :new.dns_servers,
        :new.dns_shuffle_addresses,
        :new.accepttimeout_ms,
        :new.happy_eyeballs_timeout_ms,
        :new.upkeep_interval_ms,
        :new.proxy_sslkey,
        :new.proxy_sslkeytype,
        :new.proxy_sslversion,
        :new.proxy_ssl_verifyhost,
        :new.proxy_cainfo,
        :new.proxy_capat,
        :new.proxy_crlfile,
        :new.random_file,
        :new.proxy_ssl_cipher_list,
        :new.proxy_allow_beast,
        :new.proxy_no_revoke,
        :new.krblevel
    );
END
--
--
