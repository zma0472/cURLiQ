--
    CONSTRAINT curliq__online_bool_ck CHECK (
        typeof( online ) = 'integer'
        AND
        ( online = 0 OR online = 1 )
    ),
--
    CONSTRAINT curliq__online_bool_ck CHECK (
        typeof( online ) = 'integer'
        AND
        ( online = 0 OR online = 1 )
    ),
--
    CONSTRAINT curliq__online_bool_ck CHECK (
        typeof( online ) = 'integer'
        AND
        ( online = 0 OR online = 1 )
    ),
--
    CONSTRAINT curliq__online_bool_ck CHECK (
        typeof( online ) = 'integer'
        AND
        ( online = 0 OR online = 1 )
    ),
--
    CONSTRAINT curliq__priority_int_ck CHECK (
        typeof( priority ) = 'integer'
    ),
--
    CONSTRAINT curliq__source_path_text_ck CHECK (
        typeof( source_path ) = 'text'
    ),
--
    CONSTRAINT curliq__uri_userinfo_text_ck CHECK (
        typeof( uri_userinfo ) = 'text'
    ),
--
    CONSTRAINT curliq__uri_host_text_ck CHECK (
        typeof( uri_host ) = 'text'
    ),
--
    CONSTRAINT curliq__uri_path_text_ck CHECK (
        typeof( uri_path ) = 'text'
    ),
--
    CONSTRAINT curliq__uri_query_text_ck CHECK (
        typeof( uri_query ) = 'text'
    ),
--
    CONSTRAINT curliq__uri_fragment_text_ck CHECK (
        typeof( uri_fragment ) = 'text'
    )
);
