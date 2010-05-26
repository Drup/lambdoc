(********************************************************************************)
(*	Features.mli
	Copyright (c) 2009-2010 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)


(********************************************************************************)
(**	{1 Type definitions}							*)
(********************************************************************************)

(********************************************************************************)
(**	{2 Auxiliary type definitions}						*)
(********************************************************************************)

type composition_inline_feature_t =
	[ `Feature_plain | `Feature_entity | `Feature_linebreak
	| `Feature_mathtex_inl | `Feature_mathml_inl | `Feature_glyph
	| `Feature_bold | `Feature_emph | `Feature_code | `Feature_caps
	| `Feature_ins | `Feature_del | `Feature_sup | `Feature_sub
	| `Feature_mbox | `Feature_span | `Feature_link ]


type manuscript_inline_feature_t =
	[ `Feature_see | `Feature_cite | `Feature_ref | `Feature_sref | `Feature_mref ]


type composition_block_feature_t =
	[ `Feature_paragraph
	| `Feature_itemize | `Feature_enumerate | `Feature_description
	| `Feature_qanda | `Feature_verse | `Feature_quote
	| `Feature_mathtex_blk | `Feature_mathml_blk | `Feature_source | `Feature_tabular
	| `Feature_console | `Feature_verbatim | `Feature_picture | `Feature_subpage ]


type manuscript_block_feature_t =
	[ `Feature_decor | `Feature_pullquote
	| `Feature_equation | `Feature_printout | `Feature_table | `Feature_figure 
	| `Feature_part | `Feature_appendix
	| `Feature_section1 | `Feature_section2 | `Feature_section3
	| `Feature_bibliography | `Feature_notes | `Feature_toc
	| `Feature_title1 | `Feature_title2
	| `Feature_abstract | `Feature_rule
	| `Feature_bib | `Feature_note
	| `Feature_macrodef | `Feature_boxoutdef | `Feature_theoremdef ]


(********************************************************************************)
(**	{2 Main type definitions}						*)
(********************************************************************************)

type composition_feature_t =
	[ composition_inline_feature_t
	| composition_block_feature_t ]


type manuscript_feature_t =
	[ composition_feature_t
	| manuscript_inline_feature_t
	| manuscript_block_feature_t ]


type internal_feature_t =
	[ `Feature_item | `Feature_question | `Feature_rquestion | `Feature_answer | `Feature_ranswer
	| `Feature_thead | `Feature_tbody | `Feature_tfoot
	| `Feature_bib_author | `Feature_bib_title | `Feature_bib_resource
	| `Feature_custom | `Feature_macrocall | `Feature_macroarg ]


type feature_t =
	[ manuscript_feature_t
	| internal_feature_t ]


type default_t = [ `Accept | `Deny ]


(********************************************************************************)
(**	{1 Functions and values}						*)
(********************************************************************************)

val available_composition_features: composition_feature_t list
val available_manuscript_features: manuscript_feature_t list
val available_internal_features: internal_feature_t list

val describe: feature_t -> string

