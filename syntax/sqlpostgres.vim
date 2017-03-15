" Vim syntax file
" Language:	SQL, PGSQL (postgres 9.1)
" Last Change:	2012 May 21st
" Maintainer:   Grégoire Hubert <greg DOT hubert AT gmail DOT com>
" Based on the work of Paul Moore <pf_moore AT yahoo.co.uk>

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" postgresql reserved words, defined as keywords.

syn keyword sqlSpecial  false null true

syn keyword sqlKeyword	all analyse analyze any array as asc asymmetric
syn keyword sqlKeyword authorization binary both by case cast check collate
syn keyword sqlKeyword column concurrently constraint create cross
syn keyword sqlKeyword current_catalog current_date current_role
syn keyword sqlKeyword current_schema current_time current_timestamp current_user default
syn keyword sqlKeyword deferrable desc do each else end enum except execute fetch for
syn keyword sqlKeyword foreign from function grant group having initially
syn keyword sqlKeyword inner into is isnull join language leading left
syn keyword sqlKeyword limit localtime localtimestamp natural notnull offset
syn keyword sqlKeyword on only order outer over overlaps placing partition
syn keyword sqlKeyword primary recursive references returning right set
syn keyword sqlKeyword session_user similar some symmetric table then to
syn keyword sqlKeyword using variadic values verbose view when where window
syn keyword sqlKeyword with trailing trigger unique user

syn keyword sqlOperator	not and or escape
syn keyword sqlOperator	in any some every all between exists
syn keyword sqlOperator	like ilike document
syn keyword sqlOperator union intersect
syn keyword sqlOperator distinct

syn keyword sqlStatement alter analyze comment commit create
syn keyword sqlStatement delete drop execute explain grant insert lock noaudit
syn keyword sqlStatement rename revoke rollback savepoint select replace
syn keyword sqlStatement truncate update

syn keyword sqlType	boolean char character date float float4 float8 integer long
syn keyword sqlType	int4 int8 numeric serial money varying text bytea time
syn keyword sqlType	timestamp timestamptz interval point line circle lseg
syn keyword sqlType	box path polygon cidr inet macaddr bit bitvar tsvector uuid
syn keyword sqlType	xml json anyarray anyelement anyenum anynonarray cstring

syn keyword sqlFunc     abs avg cbrt ceil ceiling degrees div exp floor ln log mod
syn keyword sqlFunc     pi power radians random round setseed sign sqrt trunc
syn keyword sqlFunc     width_bucket cos cot sin tan acos asin atan atan2
syn keyword sqlFunc     bit_length char_length lower octet_length overlay position
syn keyword sqlFunc     substring substring substring trim upper ascii btrim
syn keyword sqlFunc     chr concat convert convert_from convert_to decode encode
syn keyword sqlFunc     format initcap left length lpad ltrim md5 pg_client_encoding
syn keyword sqlFunc     quote_ident quote_literal quote_nullable regexp_matches
syn keyword sqlFunc     regexp_replace regexp_split_to_array regexp_split_to_table
syn keyword sqlFunc     repeat reverse rpad rtrim split_part strpos substr to_ascii
syn keyword sqlFunc     to_hex translate get_bit get_byte set_bit set_byte to_char
syn keyword sqlFunc     to_timestamp to_date to_number age clock_timestamp
syn keyword sqlFunc     current_date current_time current_timestamp date_part
syn keyword sqlFunc     date_trunc extract isfinite justify_days justify_hours
syn keyword sqlFunc     justify_interval localtime localtimestamp now
syn keyword sqlFunc     statement_timestamp timeofday transaction_timestamp
syn keyword sqlFunc     enum_first enum_last enum_range enum_range area center
syn keyword sqlFunc     diameter height isclosed isopen npoints pclose popen
syn keyword sqlFunc     radius width abbrev abbrev broadcast family host
syn keyword sqlFunc     hostmask masklen netmask network set_masklen numnode
syn keyword sqlFunc     get_current_ts_config plainto_tsquery querytree setweight
syn keyword sqlFunc     strip to_tsquery to_tsvector ts_headline ts_rank ts_rank_cd
syn keyword sqlFunc     ts_rewrite ts_rewrite tsvector_update_trigger
syn keyword sqlFunc     tsvector_update_trigger_column ts_debug ts_lexize ts_parse
syn keyword sqlFunc     ts_parse ts_token_type ts_stat xmlcomment xmlconcat
syn keyword sqlFunc     xmlelement xmlforest xmlpi xmlroot xmlagg xmlexists
syn keyword sqlFunc     xml_is_well_formed xpath table_to_xml query_to_xml
syn keyword sqlFunc     cursor_to_xml currval lastval nextval setval array_append
syn keyword sqlFunc     array_cat array_ndims array_dims array_fill array_length
syn keyword sqlFunc     array_lower array_prepend array_to_string array_upper
syn keyword sqlFunc     string_to_array unnest array_agg bit_and bit_or bool_and
syn keyword sqlFunc     bool_or count max min string_agg sum corr covar_pop
syn keyword sqlFunc     covar_samp regr_avgx regr_avgy regr_count regr_intercept
syn keyword sqlFunc     regr_r2 regr_slope regr_sxx regr_sxy regr_syy stddev
syn keyword sqlFunc     stddev_pop stddev_samp variance var_pop var_samp row_number
syn keyword sqlFunc     rank dense_rank percent_rank cume_dist ntile lag lead
syn keyword sqlFunc     first_value last_value nth_value generate_series
syn keyword sqlFunc     current_catalog current_database current_query
syn keyword sqlFunc     current_schema current_user inet_client_addr
syn keyword sqlFunc     inet_client_port inet_server_addr inet_server_port
syn keyword sqlFunc     pg_backend_pid pg_conf_load_time pg_is_other_temp_schema
syn keyword sqlFunc     pg_listening_channels pg_my_temp_schema
syn keyword sqlFunc     pg_postmaster_start_time session_user version
syn keyword sqlFunc     current_setting


" Strings and characters:
syn region sqlString		start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region sqlString		start=+'+  skip=+\\\\\|\\'+  end=+'+

" Numbers:
syn match sqlNumber		"-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn region sqlComment    start="/\*"  end="\*/" contains=sqlTodo
syn match sqlComment	"--.*$" contains=sqlTodo

syn sync ccomment sqlComment

" Todo.
syn keyword sqlTodo contained TODO FIXME XXX DEBUG NOTE

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sql_syn_inits")
  if version < 508
    let did_sql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sqlComment	Comment
  HiLink sqlKeyword	sqlSpecial
  HiLink sqlNumber	Number
  HiLink sqlOperator	sqlStatement
  HiLink sqlSpecial	Special
  HiLink sqlStatement	Statement
  HiLink sqlString	String
  HiLink sqlType	Type
  HiLink sqlTodo	Todo
  HiLink sqlFunc        Function

  delcommand HiLink
endif

let b:current_syntax = "sql"

" vim: ts=8

