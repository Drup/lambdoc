(********************************************************************************)
(*	Book.ml
	Copyright (c) 2009-2010 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

(**	Definitions concerning books.
*)

(********************************************************************************)
(**	{1 Exceptions}								*)
(********************************************************************************)

exception Malformed_ISBN of string
exception Unknown_ISBN of string


(********************************************************************************)
(**	{1 Type definitions}							*)
(********************************************************************************)

type isbn_t = string with sexp

type rating_t = int with sexp

type data_t =
	{
	title: string;
	author: string;
	publisher: string;
	year: int;
	} with sexp

type cover_t =
	| Small
	| Medium
	| Large
	with sexp

type maker_t = isbn_t -> (isbn_t * data_t) Lwt.t
