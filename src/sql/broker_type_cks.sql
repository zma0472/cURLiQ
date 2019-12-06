--
    CONSTRAINT broker__adm_state_bool_ck CHECK (
        typeof( adm_state ) = 'integer'
        AND
        ( adm_state = 0 OR adm_state = 1 )
    ),
--
    CONSTRAINT broker__opr_state_bool_ck CHECK (
        typeof( opr_state ) = 'integer'
        AND
        ( opr_state = 0 OR opr_state = 1 )
    ),
--
    CONSTRAINT broker__description_text_ck CHECK (
        typeof( description ) = 'text'
    ),
--
    CONSTRAINT broker__creation_stamp_text_ck CHECK (
        typeof( creation_stamp ) = 'text'
    )
);
