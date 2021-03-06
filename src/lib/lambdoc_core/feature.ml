(********************************************************************************)
(*	Feature.ml
	Copyright (c) 2009-2014 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)


(********************************************************************************)
(**	{1 Type definitions}							*)
(********************************************************************************)

type inline_feature_t =
	[ `Feature_plain | `Feature_entity | `Feature_linebreak
	| `Feature_mathtex_inl | `Feature_mathml_inl | `Feature_glyph
	| `Feature_bold | `Feature_emph | `Feature_code | `Feature_caps
	| `Feature_ins | `Feature_del | `Feature_sup | `Feature_sub
	| `Feature_mbox | `Feature_span | `Feature_link
	| `Feature_see | `Feature_cite | `Feature_dref | `Feature_sref | `Feature_mref ]

type block_feature_t =
	[ `Feature_paragraph
	| `Feature_itemize | `Feature_enumerate | `Feature_description
	| `Feature_qanda | `Feature_verse | `Feature_quote
	| `Feature_mathtex_blk | `Feature_mathml_blk 
	| `Feature_source | `Feature_tabular 
	| `Feature_subpage | `Feature_verbatim | `Feature_picture | `Feature_extern | `Feature_pullquote
	| `Feature_equation | `Feature_printout | `Feature_table | `Feature_figure 
	| `Feature_part | `Feature_appendix
	| `Feature_section1 | `Feature_section2 | `Feature_section3 | `Feature_section4 | `Feature_section5 | `Feature_section6
	| `Feature_bibliography | `Feature_notes | `Feature_toc
	| `Feature_title1 | `Feature_title2
	| `Feature_abstract | `Feature_rule | `Feature_extern
	| `Feature_bib | `Feature_note
	| `Feature_macrodef | `Feature_boxoutdef | `Feature_theoremdef ]

type internal_feature_t =
	[ `Feature_item | `Feature_question | `Feature_rquestion | `Feature_answer | `Feature_ranswer
	| `Feature_thead | `Feature_tbody | `Feature_tfoot
	| `Feature_bib_author | `Feature_bib_title | `Feature_bib_resource
	| `Feature_custom | `Feature_macrocall | `Feature_macroarg ]

type public_feature_t = [ inline_feature_t | block_feature_t ]

type t = [ public_feature_t | internal_feature_t ]


(********************************************************************************)
(**	{1 Private functions and values}					*)
(********************************************************************************)

let describe_inline_feature = function
	| `Feature_plain	-> "plain text"
	| `Feature_entity	-> "HTML entities"
	| `Feature_linebreak	-> "line break within paragraph"
	| `Feature_mathtex_inl	-> "inline TeX math"
	| `Feature_mathml_inl	-> "inline MathML math"
	| `Feature_glyph	-> "inline image"
	| `Feature_bold		-> "bold text"
	| `Feature_emph		-> "emphasised text"
	| `Feature_code		-> "code (monospaced) text"
	| `Feature_caps		-> "small caps text"
	| `Feature_ins		-> "corrected text"
	| `Feature_del		-> "deleted text"
	| `Feature_sup		-> "superscript text"
	| `Feature_sub		-> "subscript text"
	| `Feature_mbox		-> "non-breakable text"
	| `Feature_span		-> "custom span"
	| `Feature_link		-> "link to external resource"
	| `Feature_see		-> "link to note"
	| `Feature_cite		-> "bibliography citation"
	| `Feature_dref		-> "dumb internal link"
	| `Feature_sref		-> "smart internal link"
	| `Feature_mref		-> "manual internal link"

let describe_block_feature = function
	| `Feature_paragraph	-> "paragraph block"
	| `Feature_itemize	-> "itemize block"
	| `Feature_enumerate	-> "enumerate block"
	| `Feature_description	-> "description block"
	| `Feature_qanda	-> "Q&A block"
	| `Feature_verse	-> "verse block"
	| `Feature_quote	-> "quote block"
	| `Feature_mathtex_blk	-> "TeX math block"
	| `Feature_mathml_blk	-> "MathML block"
	| `Feature_source	-> "source-code block"
	| `Feature_tabular	-> "tabular"
	| `Feature_subpage	-> "subpage block"
	| `Feature_verbatim	-> "verbatim block"
	| `Feature_picture	-> "image block"
	| `Feature_extern	-> "externally defined block"
	| `Feature_pullquote	-> "pull-quote block"
	| `Feature_equation	-> "equation wrapper"
	| `Feature_printout	-> "printout wrapper"
	| `Feature_table	-> "table wrapper"
	| `Feature_figure	-> "figure wrapper"
	| `Feature_part		-> "document part"
	| `Feature_appendix	-> "appendix"
	| `Feature_section1	-> "Level 1 sectioning"
	| `Feature_section2	-> "Level 2 sectioning"
	| `Feature_section3	-> "Level 3 sectioning"
	| `Feature_section4	-> "Level 4 sectioning"
	| `Feature_section5	-> "Level 5 sectioning"
	| `Feature_section6	-> "Level 6 sectioning"
	| `Feature_bibliography	-> "bibliography"
	| `Feature_notes	-> "notes"
	| `Feature_toc		-> "table of contents"
	| `Feature_title1	-> "Level 1 title"
	| `Feature_title2	-> "Level 2 title"
	| `Feature_abstract	-> "abstract"
	| `Feature_rule		-> "rule"
	| `Feature_bib		-> "bibliography entry"
	| `Feature_note		-> "note"
	| `Feature_macrodef	-> "definition of macro"
	| `Feature_boxoutdef	-> "definition of boxout environment"
	| `Feature_theoremdef	-> "definition of theorem environment"

let describe_internal_feature = function
        | `Feature_item		-> "item separator for lists"
	| `Feature_question	-> "question in a Q&A block"
	| `Feature_rquestion	-> "repeat question in a Q&A block"
	| `Feature_answer	-> "answer in a Q&A block"
	| `Feature_ranswer	-> "repeat answer in a Q&A block"
        | `Feature_thead	-> "start of a header group in a tabular block"
	| `Feature_tbody	-> "start of a block group in a tabular block"
	| `Feature_tfoot	-> "start of a footer group in a tabular block"
        | `Feature_bib_author	-> "author of a bibliography entry"
	| `Feature_bib_title	-> "title of a bibliography entry"
	| `Feature_bib_resource	-> "location of a bibliography entry"
        | `Feature_custom	-> "custom environment"
	| `Feature_macrocall	-> "invocation of macro"
	| `Feature_macroarg	-> "reference to the argument of macro"


(********************************************************************************)
(**	{1 Public functions and values}						*)
(********************************************************************************)

let inline_features =
	[
	`Feature_plain; `Feature_entity; `Feature_linebreak;
	`Feature_mathtex_inl; `Feature_mathml_inl; `Feature_glyph;
	`Feature_bold; `Feature_emph; `Feature_code; `Feature_caps;
	`Feature_ins; `Feature_del; `Feature_sup; `Feature_sub;
	`Feature_mbox; `Feature_span; `Feature_link;
	`Feature_see; `Feature_cite; `Feature_dref; `Feature_sref; `Feature_mref;
	]

let block_features =
	[
	`Feature_paragraph;
	`Feature_itemize; `Feature_enumerate; `Feature_description;
	`Feature_qanda; `Feature_verse; `Feature_quote;
	`Feature_mathtex_blk; `Feature_mathml_blk;
	`Feature_source; `Feature_tabular;
	`Feature_subpage; `Feature_verbatim; `Feature_picture; `Feature_extern; `Feature_pullquote;
	`Feature_equation; `Feature_printout; `Feature_table; `Feature_figure;
	`Feature_part; `Feature_appendix;
	`Feature_section1; `Feature_section2; `Feature_section3; `Feature_section4; `Feature_section5; `Feature_section6;
	`Feature_bibliography; `Feature_notes; `Feature_toc;
	`Feature_title1; `Feature_title2;
	`Feature_abstract; `Feature_rule;
	`Feature_bib; `Feature_note;
	`Feature_macrodef; `Feature_boxoutdef; `Feature_theoremdef;
	]

let internal_features =
	[
	`Feature_item; `Feature_question; `Feature_rquestion; `Feature_answer; `Feature_ranswer;
	`Feature_thead; `Feature_tbody; `Feature_tfoot;
	`Feature_bib_author; `Feature_bib_title; `Feature_bib_resource;
	`Feature_custom; `Feature_macrocall; `Feature_macroarg;
	]

let public_features =
	inline_features @ block_features

let features =
	public_features @ internal_features

let describe = function
	| #inline_feature_t as x   -> describe_inline_feature x
	| #block_feature_t as x	   -> describe_block_feature x
	| #internal_feature_t as x -> describe_internal_feature x

