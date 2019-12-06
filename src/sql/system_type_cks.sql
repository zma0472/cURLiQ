--
    CONSTRAINT system__adm_state_bool_ck CHECK (
        typeof( adm_state ) = 'integer'
        AND
        ( adm_state = 0 OR adm_state = 1 )
    ),
--
    CONSTRAINT system__opr_state_bool_ck CHECK (
        typeof( opr_state ) = 'integer'
        AND
        ( opr_state = 0 OR opr_state = 1 )
    ),
--
    CONSTRAINT system__version_major_int_ck CHECK (
        typeof( version_major ) = 'integer'
    ),
--
    CONSTRAINT system__version_minor_int_ck CHECK (
        typeof( version_minor ) = 'integer'
    ),
--
    CONSTRAINT system__version_patch_int_ck CHECK (
        typeof( version_patch ) = 'integer'
    ),
--
    CONSTRAINT system__description_text_ck CHECK (
        typeof( description ) = 'text'
    ),
--
    CONSTRAINT system__creation_stamp_text_ck CHECK (
        typeof( creation_stamp ) = 'text'
    )
);
