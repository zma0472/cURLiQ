--
--
       curlopt_verbose  BOOLEAN DEFAULT FALSE, -- Display verbose information.
--
       curlopt_header   BOOLEAN DEFAULT FALSE, -- Include the header in the
                                               -- body output.
--
       curlopt_nosignal BOOLEAN DEFAULT FALSE, -- Do not install signal
                                               -- handlers.
--
       curlopt_wildcardmatch BOOLEAN DEFAULT FALSE,
--
       curlopt_suppress_connect_headers  BOOLEAN DEFAULT FALSE,
--
       curlopt_stderr  TEXT, -- stderr replacement stream.
--
       curlopt_failonerror  BOOLEAN DEFAULT FALSE, -- Fail on HTTP 4xx errors.
--
       curlopt_keep_sending_on_error  BOOLEAN DEFAULT FALSE,
                                     -- Keep sending on   HTTP  >=  300  errors.
--
       curlopt_url  TEXT NOT NULL, -- URL to work on.
--
       curlopt_path_as_is  BOOLEAN DEFAULT FALSE,
--
       curlopt_protocols  VARCHAR(6)[], -- Allowed protocols.
--
       curlopt_redir_protocols  VARCHAR(6)[], -- Protocols to allow redirects
                                              -- to.
--
       curlopt_default_protocol  VARCHAR(6), -- Default protocol.
--
       curlopt_proxy  TEXT, -- Proxy to use.
--
       curlopt_pre_proxy  TEXT, -- Socks proxy to use.
--
       curlopt_proxyport  INTEGER, -- Proxy port to use.
--
       curlopt_proxytype  VARCHAR(15), -- Proxy type.
--
       curlopt_noproxy  TEXT, -- Filter out hosts from proxy use.
--
       curlopt_httpproxytunnel  BOOLEAN DEFAULT FALSE, -- Tunnel through the
                                                       -- HTTP proxy.
--
       curlopt_connect_to  TEXT[], -- Connect to a specific host and port.
--
       curlopt_socks5_auth  VARCHAR[16], -- Socks5 authentication methods.
--
       curlopt_socks5_gssapi_nec  BOOLEAN DEFAULT FALSE, -- Socks5 GSSAPI NEC
                                                         -- mode.
--
       curlopt_proxy_service_name  TEXT, -- Proxy authentication service name.
--
       curlopt_service_name TEXT, -- Authentication service name.
--
       curlopt_interface  TEXT, -- Bind connection locally to this.
--
       curlopt_localport  INTEGER, -- Bind connection locally to this port.
--
       curlopt_localportrange  INTEGER, -- Bind  connection  locally  to  port
                                        -- range.
--
       curlopt_dns_cache_timeout  INTEGER, -- Timeout for DNS cache.
--
       curlopt_dns_use_global_cache BOOLEAN,
--
       curlopt_buffersize  INTEGER, -- Ask for alternate buffer size.
--
       curlopt_port  INTEGER, -- Port number to connect to.
--
       curlopt_tcp_fastopen  BOOLEAN, -- Enable TFO, TCP Fast Open.
--
       curlopt_tcp_nodelay  BOOLEAN, -- Disable the Nagle algorithm.
--
       curlopt_address_scope  INTEGER, -- IPv6 scope for local addresses.
--
       curlopt_tcp_keepalive  BOOLEAN, -- Enable TCP keep-alive.
--
       curlopt_tcp_keepidle  INTEGER, -- Idle time before sending keep-alive.
--
       curlopt_tcp_keepintvl  INTEGER, -- Interval between keep-alive probes.
       curlopt_unix_socket_path  TEXT,  -- Path to a Unix domain socket.
--
       curlopt_abstract_unix_socket  TEXT,
--
       curlopt_netrc  TEXT, -- Enable .netrc parsing.
--
       curlopt_netrc_file  TEXT, -- .netrc file name.
--
       curlopt_userpwd  TEXT, -- User name and password.
--
       curlopt_proxyuserpwd  TEXT, -- Proxy user name and password.
--
       curlopt_username  TEXT, -- User name.
--
       curlopt_password  TEXT, -- Password.
--
       curlopt_login_options  TEXT, -- Login options.
--
       curlopt_proxyusername  TEXT, -- Proxy user name.
--
       curlopt_proxypassword  TEXT, -- Proxy password.
--
       curlopt_httpauth   TEXT,  -- HTTP server authentication methods.
--
       CURLOPT_TLSAUTH_USERNAME  -- TLS authentication user name.
--
       CURLOPT_PROXY_TLSAUTH_USERNAME
--
       CURLOPT_TLSAUTH_PASSWORD  -- TLS authentication password.
--
       CURLOPT_PROXY_TLSAUTH_PASSWORD
--
       CURLOPT_TLSAUTH_TYPE  -- TLS authentication methods.
--
       CURLOPT_PROXY_TLSAUTH_TYPE
--
       CURLOPT_PROXYAUTH -- HTTP proxy authentication methods.
--
       CURLOPT_SASL_IR -- Enable SASL initial response.
--
       CURLOPT_XOAUTH2_BEARER -- OAuth2 bearer token.
--
       CURLOPT_AUTOREFERER -- Automatically set Referer: header.
--
       CURLOPT_ACCEPT_ENCODING --
--
       CURLOPT_TRANSFER_ENCODING -- Request Transfer-Encoding.
--
       CURLOPT_FOLLOWLOCATION -- Follow HTTP redirects.
--
       CURLOPT_UNRESTRICTED_AUTH -- Do not restrict authentication to original
--
                                 -- host.
       CURLOPT_MAXREDIRS -- Maximum number of redirects to follow.
--
       CURLOPT_POSTREDIR -- How to act on redirects after POST.
--
       CURLOPT_PUT -- Issue a HTTP PUT request.
--
       CURLOPT_POST -- Issue a HTTP POST request.
--
       CURLOPT_POSTFIELDS -- Send a POST with this data.
--
       CURLOPT_POSTFIELDSIZE -- The POST data is this big.
--
       CURLOPT_POSTFIELDSIZE_LARGE -- The POST data is this big.
--
       CURLOPT_COPYPOSTFIELDS -- Send  a POST with this data - and copy it.
--
       CURLOPT_HTTPPOST -- Multipart formpost HTTP POST.
--
       CURLOPT_REFERER -- Referer: header.
--
       CURLOPT_USERAGENT -- User-Agent: header.
--
       CURLOPT_HTTPHEADER -- Custom HTTP headers.
--
       CURLOPT_HEADEROPT -- Control custom headers.
--
       CURLOPT_PROXYHEADER -- Custom HTTP headers sent to proxy.
--
       CURLOPT_HTTP200ALIASES -- Alternative versions of 200 OK.
--
       CURLOPT_COOKIE -- Cookie(s) to send.
--
       CURLOPT_COOKIEFILE -- File to read cookies from.
--
       CURLOPT_COOKIEJAR -- File to write cookies to.
--
       CURLOPT_COOKIESESSION -- Start a new cookie session.
--
       CURLOPT_COOKIELIST -- Add or control cookies.
--
       CURLOPT_HTTPGET -- Do a HTTP GET request.
--
       CURLOPT_REQUEST_TARGET -- Set the request target.
--
       CURLOPT_HTTP_VERSION -- HTTP version to use. CURLOPT_HTTP_VERSION(3)
--
       CURLOPT_IGNORE_CONTENT_LENGTH -- Ignore Content-Length.
--
       CURLOPT_HTTP_CONTENT_DECODING -- Disable Content decoding.
--
       CURLOPT_HTTP_TRANSFER_DECODING -- Disable Transfer decoding.
--
       CURLOPT_EXPECT_100_TIMEOUT_MS -- 100-continue timeout.
--
       CURLOPT_PIPEWAIT -- Wait on connection to pipeline on it.
--
       CURLOPT_STREAM_DEPENDS --
--
       CURLOPT_STREAM_DEPENDS_E --
--
       CURLOPT_STREAM_WEIGHT -- Set this HTTP/2 stream's weight.
--
       CURLOPT_MAIL_FROM -- Address of the sender.
--
       CURLOPT_MAIL_RCPT -- Address of the recipients.
--
       CURLOPT_MAIL_AUTH -- Authentication address.
--
       CURLOPT_TFTP_BLKSIZE -- TFTP block size.
--
       CURLOPT_TFTP_NO_OPTIONS --
--
       CURLOPT_FTPPORT -- Use active FTP.
--
       CURLOPT_QUOTE -- Commands to run before transfer.
--
       CURLOPT_POSTQUOTE -- Commands to run after transfer.
--
       CURLOPT_PREQUOTE -- Commands to run just before transfer.
--
       CURLOPT_APPEND -- Append to remote file.
--
       CURLOPT_FTP_USE_EPRT -- Use EPTR.
--
       CURLOPT_FTP_USE_EPSV -- Use EPSV.
--
       CURLOPT_FTP_USE_PRET -- Use PRET.
--
       CURLOPT_FTP_CREATE_MISSING_DIRS --
--
       CURLOPT_FTP_RESPONSE_TIMEOUT -- Timeout for FTP responses.
--
       CURLOPT_FTP_ALTERNATIVE_TO_USER -- Alternative to USER.
--
       CURLOPT_FTP_SKIP_PASV_IP --
--
       CURLOPT_FTPSSLAUTH -- Control how to do TLS.
--
       CURLOPT_FTP_SSL_CCC --
--
       CURLOPT_FTP_ACCOUNT -- Send ACCT command.
--
       CURLOPT_FTP_FILEMETHOD -- Specify how to reach files.
--
       CURLOPT_RTSP_REQUEST -- RTSP request.
--
       CURLOPT_RTSP_SESSION_ID -- RTSP session-id.
--
       CURLOPT_RTSP_STREAM_URI -- RTSP stream URI.
--
       CURLOPT_RTSP_TRANSPORT -- RTSP Transport: header.
--
       CURLOPT_RTSP_CLIENT_CSEQ -- Client CSEQ number.
--
       CURLOPT_RTSP_SERVER_CSEQ --
--
       CURLOPT_TRANSFERTEXT -- Use text transfer.
--
       CURLOPT_PROXY_TRANSFER_MODE -- Add  transfer  mode  to URL over proxy.
--
       CURLOPT_CRLF -- Convert newlines.
--
       CURLOPT_RANGE -- Range requests.
--
       CURLOPT_RESUME_FROM -- Resume a transfer.
--
       CURLOPT_RESUME_FROM_LARGE -- Resume a transfer.
--
       CURLOPT_CUSTOMREQUEST -- Custom request/method.
--
       CURLOPT_FILETIME -- Request file modification date and time.
--
       CURLOPT_DIRLISTONLY -- List only.
--
       CURLOPT_NOBODY -- Do not get the body contents.
--
       CURLOPT_INFILESIZE -- Size of file to send.
--
       CURLOPT_INFILESIZE_LARGE -- Size of file to send.
--
       CURLOPT_UPLOAD -- Upload data.
--
       CURLOPT_MIMEPOST -- Post/send MIME data.
--
       CURLOPT_MAXFILESIZE -- Maximum file size to get.
--
       CURLOPT_MAXFILESIZE_LARGE -- Maximum file size to get.
--
       CURLOPT_TIMECONDITION -- Make a time conditional request.
--
       CURLOPT_TIMEVALUE --
--
       CURLOPT_TIMEVALUE_LARGE --
--
       CURLOPT_TIMEOUT -- Timeout for the entire request.
--
       CURLOPT_TIMEOUT_MS -- Millisecond timeout for the entire  request. 
--
       CURLOPT_LOW_SPEED_LIMIT --
--
       CURLOPT_LOW_SPEED_TIME --
--
       CURLOPT_MAX_SEND_SPEED_LARGE --
--
       CURLOPT_MAX_RECV_SPEED_LARGE --
--
       CURLOPT_MAXCONNECTS --
--
       CURLOPT_FRESH_CONNECT -- Use a new connection.
--
       CURLOPT_FORBID_REUSE --
--
       CURLOPT_CONNECTTIMEOUT -- Timeout for the connection phase.
--
       CURLOPT_CONNECTTIMEOUT_MS -- Millisecond  timeout  for the connection phase.
--
       CURLOPT_IPRESOLVE -- IP version to resolve to.
--
       CURLOPT_CONNECT_ONLY -- Only connect, nothing else.
--
       CURLOPT_USE_SSL -- Use TLS/SSL.
--
       CURLOPT_RESOLVE -- Provide fixed/fake name resolves.
--
       CURLOPT_DNS_INTERFACE -- Bind name resolves to  this  interface. 
--
       CURLOPT_DNS_LOCAL_IP4 --
--
       CURLOPT_DNS_LOCAL_IP6 --
--
       CURLOPT_DNS_SERVERS -- Preferred DNS servers.
--
       CURLOPT_ACCEPTTIMEOUT_MS -- accepted.
--
       CURLOPT_HAPPY_EYEBALLS_TIMEOUT_MS -- Timeout for  happy  eyeballs. 
--
       CURLOPT_SSLCERT -- Client cert.
--
       CURLOPT_PROXY_SSLCERT -- Proxy client cert.
--
       CURLOPT_SSLCERTTYPE -- Client cert type. 
--
       CURLOPT_PROXY_SSLCERTTYPE -- Proxy client cert type. 
--
       CURLOPT_SSLKEY -- Client key.
--
       CURLOPT_PROXY_SSLKEY -- Proxy client key.
--
       CURLOPT_SSLKEYTYPE -- Client key type.
--
       CURLOPT_PROXY_SSLKEYTYPE -- Proxy client key type.
--
       CURLOPT_KEYPASSWD -- Client key password.
--
       CURLOPT_PROXY_KEYPASSWD -- Proxy client key password.
--
       CURLOPT_SSL_ENABLE_ALPN -- Enable use of ALPN.
--
       CURLOPT_SSL_ENABLE_NPN -- Enable use of NPN.
--
       CURLOPT_SSLENGINE -- Use identifier with SSL engine.
--
       CURLOPT_SSLENGINE_DEFAULT -- Default SSL engine.
--
       CURLOPT_SSL_FALSESTART -- Enable TLS False Start.
--
       CURLOPT_SSLVERSION -- SSL version to use.
--
       CURLOPT_PROXY_SSLVERSION -- Proxy SSL version to use.
--
       CURLOPT_SSL_VERIFYHOST --
--
       CURLOPT_PROXY_SSL_VERIFYHOST --
--
       CURLOPT_SSL_VERIFYPEER -- Verify the SSL certificate.
--
       CURLOPT_PROXY_SSL_VERIFYPEER -- Verify  the  proxy  SSL certificate.
--
       CURLOPT_SSL_VERIFYSTATUS -- Verify the SSL certificate's status.
--
       CURLOPT_CAINFO -- CA cert bundle.
--
       CURLOPT_PROXY_CAINFO -- Proxy CA cert bundle.
--
       CURLOPT_ISSUERCERT -- Issuer certificate.
--
       CURLOPT_CAPATH -- Path to CA cert bundle.
--
       CURLOPT_PROXY_CAPATH -- Path to proxy CA cert bundle.
--
       CURLOPT_CRLFILE -- Certificate Revocation List.
--
       CURLOPT_PROXY_CRLFILE -- Proxy Certificate Revocation List.
--
       CURLOPT_CERTINFO -- Extract certificate info.
--
       CURLOPT_PINNEDPUBLICKEY -- Set pinned SSL public key .
--
       CURLOPT_PROXY_PINNEDPUBLICKEY -- Set the proxy's pinned SSL public key.
--
       CURLOPT_RANDOM_FILE -- Provide  source  for  entropy  random  data. 
--
       CURLOPT_EGDSOCKET -- Identify EGD socket for entropy.
--
       CURLOPT_SSL_CIPHER_LIST -- Ciphers to use.
--
       CURLOPT_PROXY_SSL_CIPHER_LIST -- Proxy ciphers to use.
--
       CURLOPT_SSL_SESSIONID_CACHE -- Disable SSL session-id cache.
--
       CURLOPT_SSL_OPTIONS -- Control SSL behavior.
--
       CURLOPT_PROXY_SSL_OPTIONS -- Control proxy SSL behavior.
--
       CURLOPT_KRBLEVEL -- Kerberos security level.
--
       CURLOPT_GSSAPI_DELEGATION -- Disable GSS-API delegation.
--
       CURLOPT_SSH_AUTH_TYPES -- SSH authentication types.
--
       CURLOPT_SSH_COMPRESSION -- Enable SSH compression.
--
       CURLOPT_SSH_HOST_PUBLIC_KEY_MD5 -- MD5 of host's public key.
--
       CURLOPT_SSH_PUBLIC_KEYFILE -- File name of public key.
--
       CURLOPT_SSH_PRIVATE_KEYFILE -- File name of private key.
--
       CURLOPT_SSH_KNOWNHOSTS -- File name with known hosts.
--
       CURLOPT_SSH_KEYFUNCTION -- Callback  for  known  hosts  handling. 
--
       CURLOPT_SSH_KEYDATA -- Custom pointer to pass to ssh key callback.
--
       CURLOPT_PRIVATE -- Private pointer to store.
--
       CURLOPT_SHARE -- Share object to use.
--
       CURLOPT_NEW_FILE_PERMS --
--
       CURLOPT_NEW_DIRECTORY_PERMS -- Mode for creating new remote directories.
--
       CURLOPT_TELNETOPTIONS -- TELNET options.
--
