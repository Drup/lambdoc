(********************************************************************************)
(*	Ast.ml
	Copyright (c) 2009 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

(**	Definition of the document AST that all parsers are supposed to generate.
*)

open Lambdoc_core
open Basic
open Entity


(********************************************************************************)
(**	{2 Parsing data associated with command tags}				*)
(********************************************************************************)

type command_t =
	{
	comm_tag: tag_t option;
	comm_label: string option;
	comm_order: string option;
	comm_extra: string option;
	comm_linenum: int;
	}


(********************************************************************************)
(**	{2 Data types for inline context}					*)
(********************************************************************************)

type seq_t = inline_t list
 and inline_t = command_t * raw_inline_t
 and raw_inline_t =
	| Plain of plain_t
	| Entity of Entity.t
	| Linebreak
	| Mathtex_inl of raw_t
	| Mathml_inl of raw_t
	| Bold of seq_t
	| Emph of seq_t
	| Mono of seq_t
	| Caps of seq_t
	| Thru of seq_t
	| Sup of seq_t
	| Sub of seq_t
	| Mbox of seq_t
	| Link of raw_t * seq_t
	| See of raw_t	
	| Cite of raw_t
	| Ref of raw_t
	| Sref of raw_t
	| Mref of raw_t * seq_t


(********************************************************************************)
(**	{2 Data types for document blocks}					*)
(********************************************************************************)

type tabular_row_t = command_t * seq_t list

type tabular_group_t = command_t option * tabular_row_t list

type tabular_t =
	{
	thead: tabular_group_t option;
	tfoot: tabular_group_t option;
	tbodies: tabular_group_t list;
	}

type caption_t = command_t * seq_t

type bib_t =
	{
	author: command_t * seq_t;
	title: command_t * seq_t;
	resource: command_t * seq_t;
	}

type frag_t = block_t list
 and block_t = command_t * raw_block_t
 and raw_block_t =
	| Paragraph of seq_t
	| Itemize of (command_t * frag_t) list
	| Enumerate of (command_t * frag_t) list
	| Description of (command_t * seq_t * frag_t) list
	| Quote of frag_t
	| Pullquote of frag_t
	| Boxout of seq_t option * frag_t
	| Mathtex_blk of raw_t
	| Mathml_blk of raw_t
	| Code of raw_t
	| Tabular of raw_t * tabular_t
	| Verbatim of raw_t
	| Bitmap of raw_t * raw_t	(* (src, alt) *)
	| Subpage of frag_t
	| Equation of caption_t * block_t
	| Printout of caption_t * block_t
	| Table of caption_t * block_t
	| Figure of caption_t * block_t
	| Part of seq_t
	| Appendix
	| Section of hierarchical_level_t * seq_t
	| Bibliography
	| Notes
	| Toc
	| Title of title_level_t * seq_t
	| Abstract of frag_t
	| Rule
	| Bib of bib_t
	| Note of frag_t


(********************************************************************************)
(*	{2 The type {!t} itself}						*)
(********************************************************************************)

type t = frag_t

