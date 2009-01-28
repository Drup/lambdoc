(********************************************************************************)
(*	Interface file for Valid module.

	Copyright (c) 2007-2008 Dario Teixeira (dario.teixeira@yahoo.com)

	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

(**	Definition of valid documents.
*)


(********************************************************************************)
(**	{2 Type definitionss}							*)
(********************************************************************************)

type valid_t =
	{
	content: Block.frag_t;
	bibs: Bib.t list;
	notes: Note.t list;
	toc: Block.heading_block_t list;
	labelmap: Labelmap.t;
	} (*with sexp*)

type 'a t = private valid_t (*with sexp*)

type manuscript_t = [`Manuscript] t (*with sexp*)

type composition_t = [`Composition] t (*with sexp*)


(********************************************************************************)
(**	{2 Public functions and values}						*)
(********************************************************************************)

val make_manuscript:
	([< `Composition | `Manuscript ], _, _, _) Block.t list ->
	Bib.t list ->
	Note.t list ->
	Block.heading_block_t list ->
	Labelmap.t ->
	manuscript_t

val make_composition: ([< `Composition], _, _, _) Block.t list -> composition_t

(*
val serialize_manuscript: manuscript_t -> string
val serialize_composition: composition_t -> string
val deserialize_manuscript: string -> manuscript_t
val deserialize_composition: string -> composition_t
*)

