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
       CURLOPT_NOPROXY
              Filter out hosts from proxy use. CURLOPT_NOPROXY(3)
       CURLOPT_HTTPPROXYTUNNEL
              Tunnel through the HTTP proxy. CURLOPT_HTTPPROXYTUNNEL(3)
       CURLOPT_CONNECT_TO
              Connect to a specific host and port. See CURLOPT_CONNECT_TO(3)
       CURLOPT_SOCKS5_AUTH
              Socks5 authentication methods. See CURLOPT_SOCKS5_AUTH(3)
       CURLOPT_SOCKS5_GSSAPI_SERVICE
              Socks5 GSSAPI service name. CURLOPT_SOCKS5_GSSAPI_SERVICE(3)
       CURLOPT_SOCKS5_GSSAPI_NEC
              Socks5 GSSAPI NEC mode. See CURLOPT_SOCKS5_GSSAPI_NEC(3)
       CURLOPT_PROXY_SERVICE_NAME
              Proxy authentication service name. CURLOPT_PROXY_SERVICE_NAME(3)
       CURLOPT_SERVICE_NAME
              Authentication service name. CURLOPT_SERVICE_NAME(3)
       CURLOPT_INTERFACE
              Bind connection locally to this. See CURLOPT_INTERFACE(3)
       CURLOPT_LOCALPORT
              Bind connection locally to this port. See CURLOPT_LOCALPORT(3)
       CURLOPT_LOCALPORTRANGE
              Bind  connection  locally  to  port range. See CURLOPT_LOCALPOR‐
       CURLOPT_DNS_CACHE_TIMEOUT
              Timeout for DNS cache. See CURLOPT_DNS_CACHE_TIMEOUT(3)
       CURLOPT_DNS_USE_GLOBAL_CACHE
       CURLOPT_BUFFERSIZE
              Ask for alternate buffer size. See CURLOPT_BUFFERSIZE(3)
       CURLOPT_PORT
              Port number to connect to. See CURLOPT_PORT(3)
       CURLOPT_TCP_FASTOPEN
              Enable TFO, TCP Fast Open. See CURLOPT_TCP_FASTOPEN(3)
       CURLOPT_TCP_NODELAY
              Disable the Nagle algorithm. See CURLOPT_TCP_NODELAY(3)
       CURLOPT_ADDRESS_SCOPE
              IPv6 scope for local addresses. See CURLOPT_ADDRESS_SCOPE(3)
       CURLOPT_TCP_KEEPALIVE
              Enable TCP keep-alive. See CURLOPT_TCP_KEEPALIVE(3)
       CURLOPT_TCP_KEEPIDLE
              Idle time before sending keep-alive. See CURLOPT_TCP_KEEPIDLE(3)
       CURLOPT_TCP_KEEPINTVL
              Interval between keep-alive probes. See CURLOPT_TCP_KEEPINTVL(3)
       CURLOPT_UNIX_SOCKET_PATH
              Path to a Unix domain socket. See CURLOPT_UNIX_SOCKET_PATH(3)
       CURLOPT_ABSTRACT_UNIX_SOCKET
       CURLOPT_NETRC
              Enable .netrc parsing. See CURLOPT_NETRC(3)
       CURLOPT_NETRC_FILE
              .netrc file name. See CURLOPT_NETRC_FILE(3)
       CURLOPT_USERPWD
              User name and password. See CURLOPT_USERPWD(3)
       CURLOPT_PROXYUSERPWD
              Proxy user name and password. See CURLOPT_PROXYUSERPWD(3)
       CURLOPT_USERNAME
              User name. See CURLOPT_USERNAME(3)
       CURLOPT_PASSWORD
              Password. See CURLOPT_PASSWORD(3)
       CURLOPT_LOGIN_OPTIONS
              Login options. See CURLOPT_LOGIN_OPTIONS(3)
       CURLOPT_PROXYUSERNAME
              Proxy user name. See CURLOPT_PROXYUSERNAME(3)
       CURLOPT_PROXYPASSWORD
              Proxy password. See CURLOPT_PROXYPASSWORD(3)
       CURLOPT_HTTPAUTH
              HTTP server authentication methods. See CURLOPT_HTTPAUTH(3)
       CURLOPT_TLSAUTH_USERNAME
              TLS authentication user name. See CURLOPT_TLSAUTH_USERNAME(3)
       CURLOPT_PROXY_TLSAUTH_USERNAME
       CURLOPT_TLSAUTH_PASSWORD
              TLS authentication password. See CURLOPT_TLSAUTH_PASSWORD(3)
       CURLOPT_PROXY_TLSAUTH_PASSWORD
       CURLOPT_TLSAUTH_TYPE
              TLS authentication methods. See CURLOPT_TLSAUTH_TYPE(3)
       CURLOPT_PROXY_TLSAUTH_TYPE
       CURLOPT_PROXYAUTH
              HTTP proxy authentication methods. See CURLOPT_PROXYAUTH(3)
       CURLOPT_SASL_IR
              Enable SASL initial response. See CURLOPT_SASL_IR(3)
       CURLOPT_XOAUTH2_BEARER
              OAuth2 bearer token. See CURLOPT_XOAUTH2_BEARER(3)
       CURLOPT_AUTOREFERER
              Automatically set Referer: header. See CURLOPT_AUTOREFERER(3)
       CURLOPT_ACCEPT_ENCODING
       CURLOPT_TRANSFER_ENCODING
              Request Transfer-Encoding. See CURLOPT_TRANSFER_ENCODING(3)
       CURLOPT_FOLLOWLOCATION
              Follow HTTP redirects. See CURLOPT_FOLLOWLOCATION(3)
       CURLOPT_UNRESTRICTED_AUTH
              Do not restrict authentication to original  host.  CURLOPT_UNRE‐
       CURLOPT_MAXREDIRS
              Maximum number of redirects to follow. See CURLOPT_MAXREDIRS(3)
       CURLOPT_POSTREDIR
              How to act on redirects after POST. See CURLOPT_POSTREDIR(3)
       CURLOPT_PUT
              Issue a HTTP PUT request. See CURLOPT_PUT(3)
       CURLOPT_POST
              Issue a HTTP POST request. See CURLOPT_POST(3)
       CURLOPT_POSTFIELDS
              Send a POST with this data. See CURLOPT_POSTFIELDS(3)
       CURLOPT_POSTFIELDSIZE
              The POST data is this big. See CURLOPT_POSTFIELDSIZE(3)
       CURLOPT_POSTFIELDSIZE_LARGE
              The POST data is this big. See CURLOPT_POSTFIELDSIZE_LARGE(3)
       CURLOPT_COPYPOSTFIELDS
              Send  a POST with this data - and copy it. See CURLOPT_COPYPOST‐
       CURLOPT_HTTPPOST
              Multipart formpost HTTP POST. See CURLOPT_HTTPPOST(3)
       CURLOPT_REFERER
              Referer: header. See CURLOPT_REFERER(3)
       CURLOPT_USERAGENT
              User-Agent: header. See CURLOPT_USERAGENT(3)
       CURLOPT_HTTPHEADER
              Custom HTTP headers. See CURLOPT_HTTPHEADER(3)
       CURLOPT_HEADEROPT
              Control custom headers. See CURLOPT_HEADEROPT(3)
       CURLOPT_PROXYHEADER
              Custom HTTP headers sent to proxy. See CURLOPT_PROXYHEADER(3)
       CURLOPT_HTTP200ALIASES
              Alternative versions of 200 OK. See CURLOPT_HTTP200ALIASES(3)
       CURLOPT_COOKIE
              Cookie(s) to send. See CURLOPT_COOKIE(3)
       CURLOPT_COOKIEFILE
              File to read cookies from. See CURLOPT_COOKIEFILE(3)
       CURLOPT_COOKIEJAR
              File to write cookies to. See CURLOPT_COOKIEJAR(3)
       CURLOPT_COOKIESESSION
              Start a new cookie session. See CURLOPT_COOKIESESSION(3)
       CURLOPT_COOKIELIST
              Add or control cookies. See CURLOPT_COOKIELIST(3)
       CURLOPT_HTTPGET
              Do a HTTP GET request. See CURLOPT_HTTPGET(3)
       CURLOPT_REQUEST_TARGET
              Set the request target. CURLOPT_REQUEST_TARGET(3)
       CURLOPT_HTTP_VERSION
              HTTP version to use. CURLOPT_HTTP_VERSION(3)
       CURLOPT_IGNORE_CONTENT_LENGTH
              Ignore Content-Length. See CURLOPT_IGNORE_CONTENT_LENGTH(3)
       CURLOPT_HTTP_CONTENT_DECODING
              Disable Content decoding. See CURLOPT_HTTP_CONTENT_DECODING(3)
       CURLOPT_HTTP_TRANSFER_DECODING
              Disable Transfer decoding. See CURLOPT_HTTP_TRANSFER_DECODING(3)
       CURLOPT_EXPECT_100_TIMEOUT_MS
              100-continue timeout. See CURLOPT_EXPECT_100_TIMEOUT_MS(3)
       CURLOPT_PIPEWAIT
              Wait on connection to pipeline on it. See CURLOPT_PIPEWAIT(3)
       CURLOPT_STREAM_DEPENDS
       CURLOPT_STREAM_DEPENDS_E
       CURLOPT_STREAM_WEIGHT
              Set this HTTP/2 stream's weight. See CURLOPT_STREAM_WEIGHT(3)
       CURLOPT_MAIL_FROM
              Address of the sender. See CURLOPT_MAIL_FROM(3)
       CURLOPT_MAIL_RCPT
              Address of the recipients. See CURLOPT_MAIL_RCPT(3)
       CURLOPT_MAIL_AUTH
              Authentication address. See CURLOPT_MAIL_AUTH(3)
       CURLOPT_TFTP_BLKSIZE
              TFTP block size. See CURLOPT_TFTP_BLKSIZE(3)
       CURLOPT_TFTP_NO_OPTIONS
       CURLOPT_FTPPORT
              Use active FTP. See CURLOPT_FTPPORT(3)
       CURLOPT_QUOTE
              Commands to run before transfer. See CURLOPT_QUOTE(3)
       CURLOPT_POSTQUOTE
              Commands to run after transfer. See CURLOPT_POSTQUOTE(3)
       CURLOPT_PREQUOTE
              Commands to run just before transfer. See CURLOPT_PREQUOTE(3)
       CURLOPT_APPEND
              Append to remote file. See CURLOPT_APPEND(3)
       CURLOPT_FTP_USE_EPRT
              Use EPTR. See CURLOPT_FTP_USE_EPRT(3)
       CURLOPT_FTP_USE_EPSV
              Use EPSV. See CURLOPT_FTP_USE_EPSV(3)
       CURLOPT_FTP_USE_PRET
              Use PRET. See CURLOPT_FTP_USE_PRET(3)
       CURLOPT_FTP_CREATE_MISSING_DIRS
       CURLOPT_FTP_RESPONSE_TIMEOUT
              Timeout for FTP responses. See CURLOPT_FTP_RESPONSE_TIMEOUT(3)
       CURLOPT_FTP_ALTERNATIVE_TO_USER
              Alternative to USER. See CURLOPT_FTP_ALTERNATIVE_TO_USER(3)
       CURLOPT_FTP_SKIP_PASV_IP
       CURLOPT_FTPSSLAUTH
              Control how to do TLS. See CURLOPT_FTPSSLAUTH(3)
       CURLOPT_FTP_SSL_CCC
       CURLOPT_FTP_ACCOUNT
              Send ACCT command. See CURLOPT_FTP_ACCOUNT(3)
       CURLOPT_FTP_FILEMETHOD
              Specify how to reach files. See CURLOPT_FTP_FILEMETHOD(3)
       CURLOPT_RTSP_REQUEST
              RTSP request. See CURLOPT_RTSP_REQUEST(3)
       CURLOPT_RTSP_SESSION_ID
              RTSP session-id. See CURLOPT_RTSP_SESSION_ID(3)
       CURLOPT_RTSP_STREAM_URI
              RTSP stream URI. See CURLOPT_RTSP_STREAM_URI(3)
       CURLOPT_RTSP_TRANSPORT
              RTSP Transport: header. See CURLOPT_RTSP_TRANSPORT(3)
       CURLOPT_RTSP_CLIENT_CSEQ
              Client CSEQ number. See CURLOPT_RTSP_CLIENT_CSEQ(3)
       CURLOPT_RTSP_SERVER_CSEQ
       CURLOPT_TRANSFERTEXT
              Use text transfer. See CURLOPT_TRANSFERTEXT(3)
       CURLOPT_PROXY_TRANSFER_MODE
              Add  transfer  mode  to URL over proxy. See CURLOPT_PROXY_TRANS‐
       CURLOPT_CRLF
              Convert newlines. See CURLOPT_CRLF(3)
       CURLOPT_RANGE
              Range requests. See CURLOPT_RANGE(3)
       CURLOPT_RESUME_FROM
              Resume a transfer. See CURLOPT_RESUME_FROM(3)
       CURLOPT_RESUME_FROM_LARGE
              Resume a transfer. See CURLOPT_RESUME_FROM_LARGE(3)
       CURLOPT_CUSTOMREQUEST
              Custom request/method. See CURLOPT_CUSTOMREQUEST(3)
       CURLOPT_FILETIME
              Request file modification date and time. See CURLOPT_FILETIME(3)
       CURLOPT_DIRLISTONLY
              List only. See CURLOPT_DIRLISTONLY(3)
       CURLOPT_NOBODY
              Do not get the body contents. See CURLOPT_NOBODY(3)
       CURLOPT_INFILESIZE
              Size of file to send. CURLOPT_INFILESIZE(3)
       CURLOPT_INFILESIZE_LARGE
              Size of file to send. CURLOPT_INFILESIZE_LARGE(3)
       CURLOPT_UPLOAD
              Upload data. See CURLOPT_UPLOAD(3)
       CURLOPT_MIMEPOST
              Post/send MIME data. See CURLOPT_MIMEPOST(3)
       CURLOPT_MAXFILESIZE
              Maximum file size to get. See CURLOPT_MAXFILESIZE(3)
       CURLOPT_MAXFILESIZE_LARGE
              Maximum file size to get. See CURLOPT_MAXFILESIZE_LARGE(3)
       CURLOPT_TIMECONDITION
              Make a time conditional request. See CURLOPT_TIMECONDITION(3)
       CURLOPT_TIMEVALUE
       CURLOPT_TIMEVALUE_LARGE
       CURLOPT_TIMEOUT
              Timeout for the entire request. See CURLOPT_TIMEOUT(3)
       CURLOPT_TIMEOUT_MS
              Millisecond timeout for the entire  request.  See  CURLOPT_TIME‐
       CURLOPT_LOW_SPEED_LIMIT
       CURLOPT_LOW_SPEED_TIME
       CURLOPT_MAX_SEND_SPEED_LARGE
       CURLOPT_MAX_RECV_SPEED_LARGE
       CURLOPT_MAXCONNECTS
       CURLOPT_FRESH_CONNECT
              Use a new connection. CURLOPT_FRESH_CONNECT(3)
       CURLOPT_FORBID_REUSE
       CURLOPT_CONNECTTIMEOUT
              Timeout for the connection phase. See CURLOPT_CONNECTTIMEOUT(3)
       CURLOPT_CONNECTTIMEOUT_MS
              Millisecond  timeout  for the connection phase. See CURLOPT_CON‐
       CURLOPT_IPRESOLVE
              IP version to resolve to. See CURLOPT_IPRESOLVE(3)
       CURLOPT_CONNECT_ONLY
              Only connect, nothing else. See CURLOPT_CONNECT_ONLY(3)
       CURLOPT_USE_SSL
              Use TLS/SSL. See CURLOPT_USE_SSL(3)
       CURLOPT_RESOLVE
              Provide fixed/fake name resolves. See CURLOPT_RESOLVE(3)
       CURLOPT_DNS_INTERFACE
              Bind name resolves to  this  interface.  See  CURLOPT_DNS_INTER‐
       CURLOPT_DNS_LOCAL_IP4
       CURLOPT_DNS_LOCAL_IP6
       CURLOPT_DNS_SERVERS
              Preferred DNS servers. See CURLOPT_DNS_SERVERS(3)
       CURLOPT_ACCEPTTIMEOUT_MS
              accepted. See CURLOPT_ACCEPTTIMEOUT_MS(3)
       CURLOPT_HAPPY_EYEBALLS_TIMEOUT_MS
              Timeout for  happy  eyeballs.  See  CURLOPT_HAPPY_EYEBALLS_TIME‐
       CURLOPT_SSLCERT
              Client cert. See CURLOPT_SSLCERT(3)
       CURLOPT_PROXY_SSLCERT
              Proxy client cert. See CURLOPT_PROXY_SSLCERT(3)
       CURLOPT_SSLCERTTYPE
              Client cert type.  See CURLOPT_SSLCERTTYPE(3)
       CURLOPT_PROXY_SSLCERTTYPE
              Proxy client cert type.  See CURLOPT_PROXY_SSLCERTTYPE(3)
       CURLOPT_SSLKEY
              Client key. See CURLOPT_SSLKEY(3)
       CURLOPT_PROXY_SSLKEY
              Proxy client key. See CURLOPT_PROXY_SSLKEY(3)
       CURLOPT_SSLKEYTYPE
              Client key type. See CURLOPT_SSLKEYTYPE(3)
       CURLOPT_PROXY_SSLKEYTYPE
              Proxy client key type. See CURLOPT_PROXY_SSLKEYTYPE(3)
       CURLOPT_KEYPASSWD
              Client key password. See CURLOPT_KEYPASSWD(3)
       CURLOPT_PROXY_KEYPASSWD
              Proxy client key password. See CURLOPT_PROXY_KEYPASSWD(3)
       CURLOPT_SSL_ENABLE_ALPN
              Enable use of ALPN. See CURLOPT_SSL_ENABLE_ALPN(3)
       CURLOPT_SSL_ENABLE_NPN
              Enable use of NPN. See CURLOPT_SSL_ENABLE_NPN(3)
       CURLOPT_SSLENGINE
              Use identifier with SSL engine. See CURLOPT_SSLENGINE(3)
       CURLOPT_SSLENGINE_DEFAULT
              Default SSL engine. See CURLOPT_SSLENGINE_DEFAULT(3)
       CURLOPT_SSL_FALSESTART
              Enable TLS False Start. See CURLOPT_SSL_FALSESTART(3)
       CURLOPT_SSLVERSION
              SSL version to use. See CURLOPT_SSLVERSION(3)
       CURLOPT_PROXY_SSLVERSION
              Proxy SSL version to use. See CURLOPT_PROXY_SSLVERSION(3)
       CURLOPT_SSL_VERIFYHOST
       CURLOPT_PROXY_SSL_VERIFYHOST
       CURLOPT_SSL_VERIFYPEER
              Verify the SSL certificate. See CURLOPT_SSL_VERIFYPEER(3)
       CURLOPT_PROXY_SSL_VERIFYPEER
              Verify  the  proxy  SSL certificate. See CURLOPT_PROXY_SSL_VERI‐
       CURLOPT_SSL_VERIFYSTATUS
              Verify the SSL certificate's status. See  CURLOPT_SSL_VERIFYSTA‐
       CURLOPT_CAINFO
              CA cert bundle. See CURLOPT_CAINFO(3)
       CURLOPT_PROXY_CAINFO
              Proxy CA cert bundle. See CURLOPT_PROXY_CAINFO(3)
       CURLOPT_ISSUERCERT
              Issuer certificate. See CURLOPT_ISSUERCERT(3)
       CURLOPT_CAPATH
              Path to CA cert bundle. See CURLOPT_CAPATH(3)
       CURLOPT_PROXY_CAPATH
              Path to proxy CA cert bundle. See CURLOPT_PROXY_CAPATH(3)
       CURLOPT_CRLFILE
              Certificate Revocation List. See CURLOPT_CRLFILE(3)
       CURLOPT_PROXY_CRLFILE
              Proxy Certificate Revocation List. See CURLOPT_PROXY_CRLFILE(3)
       CURLOPT_CERTINFO
              Extract certificate info. See CURLOPT_CERTINFO(3)
       CURLOPT_PINNEDPUBLICKEY
              Set pinned SSL public key . See CURLOPT_PINNEDPUBLICKEY(3)
       CURLOPT_PROXY_PINNEDPUBLICKEY
              Set the proxy's pinned SSL public key. See CURLOPT_PROXY_PINNED‐
       CURLOPT_RANDOM_FILE
              Provide  source  for  entropy  random  data.  See   CURLOPT_RAN‐
       CURLOPT_EGDSOCKET
              Identify EGD socket for entropy. See CURLOPT_EGDSOCKET(3)
       CURLOPT_SSL_CIPHER_LIST
              Ciphers to use. See CURLOPT_SSL_CIPHER_LIST(3)
       CURLOPT_PROXY_SSL_CIPHER_LIST
              Proxy ciphers to use. See CURLOPT_PROXY_SSL_CIPHER_LIST(3)
       CURLOPT_SSL_SESSIONID_CACHE
              Disable SSL session-id cache. See CURLOPT_SSL_SESSIONID_CACHE(3)
       CURLOPT_SSL_OPTIONS
              Control SSL behavior. See CURLOPT_SSL_OPTIONS(3)
       CURLOPT_PROXY_SSL_OPTIONS
              Control proxy SSL behavior. See CURLOPT_PROXY_SSL_OPTIONS(3)
       CURLOPT_KRBLEVEL
              Kerberos security level. See CURLOPT_KRBLEVEL(3)
       CURLOPT_GSSAPI_DELEGATION
              Disable GSS-API delegation. See CURLOPT_GSSAPI_DELEGATION(3)
       CURLOPT_SSH_AUTH_TYPES
              SSH authentication types. See CURLOPT_SSH_AUTH_TYPES(3)
       CURLOPT_SSH_COMPRESSION
              Enable SSH compression. See CURLOPT_SSH_COMPRESSION(3)
       CURLOPT_SSH_HOST_PUBLIC_KEY_MD5
              MD5 of host's public key. See CURLOPT_SSH_HOST_PUBLIC_KEY_MD5(3)
       CURLOPT_SSH_PUBLIC_KEYFILE
              File name of public key. See CURLOPT_SSH_PUBLIC_KEYFILE(3)
       CURLOPT_SSH_PRIVATE_KEYFILE
              File name of private key. See CURLOPT_SSH_PRIVATE_KEYFILE(3)
       CURLOPT_SSH_KNOWNHOSTS
              File name with known hosts. See CURLOPT_SSH_KNOWNHOSTS(3)
       CURLOPT_SSH_KEYFUNCTION
              Callback  for  known  hosts  handling.  See CURLOPT_SSH_KEYFUNC‐
       CURLOPT_SSH_KEYDATA
              Custom pointer to pass to ssh key callback. See CURLOPT_SSH_KEY‐
       CURLOPT_PRIVATE
              Private pointer to store. See CURLOPT_PRIVATE(3)
       CURLOPT_SHARE
              Share object to use. See CURLOPT_SHARE(3)
       CURLOPT_NEW_FILE_PERMS
       CURLOPT_NEW_DIRECTORY_PERMS
              Mode for creating new remote directories. See CURLOPT_NEW_DIREC‐
       CURLOPT_TELNETOPTIONS
              TELNET options. See CURLOPT_TELNETOPTIONS(3)
         curl_easy_setopt(curl, CURLOPT_URL, "http://example.com");
